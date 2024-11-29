#!/usr/bin/env node

const info = require('../info.json');
const archiveName = `RailLogisticsDispatcher_${info.version}`;

function trimIndent(str) {
    str = str.trimEnd()
    let skipFirstLine = false
    if (str.startsWith("\n") || str.startsWith("^")) {
        str = str.substring(1)
    } else {
        skipFirstLine = true
    }
    let lines = str.split(/\n/)
    let minIndent = null
    for (let i = 0; i < lines.length; i++){
        let line = lines[i];
        if (skipFirstLine && i === 0) {
            continue
        }
        if (line.trim()) {
            let m = /^( *)/.exec(line)
            if (m) {
                let indent = m[1].length
                if (minIndent === null || indent < minIndent) {
                    minIndent = indent
                }
            }
        }
    }
    if (minIndent === null) {
        return str
    }
    let r = new RegExp(`^ {${minIndent}}`, 'g')
    return lines.map(line => line.replace(r, '')).join("\n")
}


const fileList = [
    'locale/all.cfg.js',

    'graphics/connector.png',

    'migrations/00020_removeOutPort.lua',
    'migrations/00030_refreshOrgProvides.lua',
    'migrations/00040_refreshDepots.lua',

    'script/config.lua',
    'script/const.lua',
    'script/entity.lua',
    'script/gui.lua',
    'script/gui_disp.lua',
    'script/org.lua',
    'script/storage.lua',
    'script/train.lua',
    'script/units.lua',
    'script/utils.lua',

    'changelog.txt',
    'control.lua',
    'data.lua',
    // 'data-updates.lua',
    // 'data-final-fixes.lua',
    'info.json',
    'LICENSE',
    // 'README.md',
    'settings.lua',
    'thumbnail.png',
]

const fs = require('fs')
const path = require('path')
const archiver = require('archiver')
const zipFile = `out/${archiveName}.zip`

if (fs.existsSync(zipFile)) {
    fs.unlinkSync(zipFile)
}
const output = fs.createWriteStream(zipFile);
const archive = archiver('zip', {decodeStrings: false, zlib: {level: 9}});
const parsedTxtFiles = {}

archive.on('error', function (err) {
    throw err;
});

archive.pipe(output);

for (let fn of fileList) {
    if (/^locale\/.*\.cfg$/.test(fn)) {
        prepareLocaleCfg('../' + fn)
    }
    if (/^locale\/all\.cfg\.js$/.test(fn)) {
        fn = prepareLocaleAllCfgJs('../' + fn)
    } else if (/^locale\/.*\.cfg\.js$/.test(fn)) {
        let targetFileName = fn.replace(/\.js$/, '')
        prepareLocaleCfgJs('../' + fn, '../' + targetFileName)
        fn = targetFileName
    }
    if (Array.isArray(fn)) {
        for (let fnElement of fn) {
            console.log("Adding file: ", fnElement)
            if (/\.lua$/.test(fnElement)) {
                archive.append(getLuaContent('../' + fnElement), {name: `${archiveName}/${fnElement}`})
            } else {
                archive.file('../' + fnElement, {name: `${archiveName}/${fnElement}`})
            }
        }
    } else {
        if (/\.lua$/.test(fn)) {
            archive.append(getLuaContent('../' + fn), {name: `${archiveName}/${fn}`})
        } else {
            archive.file('../' + fn, {name: `${archiveName}/${fn}`})
        }
    }
}
archive.finalize();

function parseTxtFile(fileName) {
    if (parsedTxtFiles.hasOwnProperty(fileName)) {
        return parsedTxtFiles[fileName]
    }
    let parsed = {}
    let lines = fs.readFileSync(fileName).toString("utf8").split(/\n/g)
    let head = null
    for (let line of lines) {
        let r = /^#####\s*([^#]+)$/.exec(line)
        if (r) {
            head = r[1].trim()
        } else if (head) {
            if (!parsed[head]) {
                parsed[head] = line.trim()
            } else {
                parsed[head] = parsed[head] + "\n" + line.trim()
            }
        }
    }
    for (let key in parsed) {
        if (parsed.hasOwnProperty(key)) {
            parsed[key] = parsed[key].trim().replace(/\n/g, "\\n")
        }
    }
    for (let key in parsed) {
        if (parsed.hasOwnProperty(key)) {
            parsed[key] = parsed[key].replace(/##([^#]+)##/g, (_, r) => parsed[r])
        }
    }
    parsedTxtFiles[fileName] = parsed
    return parsed
}

function prepareLocaleCfg(fileName) {
    let oldContents = fs.readFileSync(fileName).toString("utf8")
    let contents = oldContents.split('\n')
    let newValue = null
    for (let i = 0; i < contents.length; i++) {
        let line = contents[i];
        let r = /^#from:(.*)#(.*)$/.exec(line)
        if (r) {
            newValue = (parseTxtFile(fileName.replace(/[^/]+$/, '') + r[1])[r[2]] || "?").replace(/\n/g, "\\n")
        } else if (newValue) {
            contents[i] = line.replace(/^([^=]+)=.*$/, (_, n) => n + "=" + newValue)
            newValue = null
        }
    }
    let newContents = contents.join('\n')
    if (oldContents !== newContents) {
        fs.writeFileSync(fileName, newContents)
        console.log("File updated: ", fileName)
    }
}

function evalLang() {
    const lang = {}
    eval(arguments[0])
    return lang
}

function prepareLocaleAllCfgJs(fileName) {
    let js = fs.readFileSync(fileName).toString("utf8")
    let lang = evalLang(js)
    for (const lk in lang) {
        if (lang.hasOwnProperty(lk) && typeof lang[lk] === 'function') {
            lang[lk] = lang[lk]()
        }
    }
    let languages = lang._languages
    let defaultLanguage = languages[0]
    delete lang._languages

    for (const lk of Object.keys(lang)) {
        if (typeof lang[lk] === 'string') {
            [key, lng] = lk.split("/")
            if (lng) {
                lang[key] = lang[key] || {}
                lang[key][lng] = lang[lk]
                delete lang[lk]
            } else {
                lang[lk] = {
                    [defaultLanguage]: lang[lk],
                }
            }
        }
    }

    for (const lk of Object.keys(lang)) {
        for (let lng of Object.keys(lang[lk])) {
            if (typeof lang[lk][lng] === 'function') {
                lang[lk][lng] = lang[lk][lng]()
            }
        }
    }

    let langKeys = Object.keys(lang).sort()

    let files = []
    for (let lng of languages) {
        let divs = []
        {
            let div = null
            for (let lk of langKeys) {
                let r = /^([^.]+)\.([^.]+)$/.exec(lk)
                if (!r) {
                    console.warn("Lang key has not dot: ", lk, " File: ", fileName)
                    continue;
                }
                if (!div || div.name !== r[1]) {
                    div = {
                        name: r[1],
                        items: []
                    }
                    divs.push(div)
                }
                let text = lang[lk][lng] ?? lang[lk][defaultLanguage]
                if (text) {
                    div.items.push({
                        name: r[2],
                        text: trimIndent(text)
                    })
                }
            }
        }
        let contents = ["# Auto generated file. Use build.js to update"]
        for (let div of divs) {
            contents.push(``)
            contents.push(`[${div.name}]`)
            for (let item of div.items) {
                contents.push(`${item.name}=${item.text.replace(/\n/g, "\\n")}`)
            }
        }
        let newContents = contents.join('\n')
        let targetDir = path.join(path.dirname(fileName), lng)
        fs.mkdirSync(targetDir, {recursive: true})
        let targetFileName = path.join(targetDir, `${lng}.cfg`)
        let oldContents = fs.existsSync(targetFileName) ? fs.readFileSync(targetFileName).toString("utf8") : ""
        if (oldContents !== newContents) {
            fs.writeFileSync(targetFileName, newContents)
            console.log("File updated: ", targetFileName)
        }
        files.push(targetFileName.replace(/^\.\.\//, ""))
    }
    return files
}

function prepareLocaleCfgJs(fileName, targetFileName) {
    let js = fs.readFileSync(fileName).toString("utf8")
    let lang = evalLang(js)
    for (const lk in lang) {
        if (lang.hasOwnProperty(lk) && typeof lang[lk] === 'function') {
            lang[lk] = lang[lk]()
        }
    }
    let langKeys = Object.keys(lang).sort()
    let divs = []
    {
        let div = null
        for (let lk of langKeys) {
            let r = /^([^.]+)\.([^.]+)$/.exec(lk)
            if (!r) {
                console.warn("Lang key has not dot: ", lk, " File: ", fileName)
                continue;
            }
            if (!div || div.name !== r[1]) {
                div = {
                    name: r[1],
                    items: []
                }
                divs.push(div)
            }
            div.items.push({
                name: r[2],
                text: lang[lk]
            })
        }
    }
    let contents = ["# Auto generated file. Use build.js to update"]
    for (let div of divs) {
        contents.push(``)
        contents.push(`[${div.name}]`)
        for (let item of div.items) {
            contents.push(`${item.name}=${item.text.trim().replace(/^\^/,'').replace(/\n/g, "\\n")}`)
        }
    }
    let newContents = contents.join('\n')
    let oldContents = fs.existsSync(targetFileName) ? fs.readFileSync(targetFileName).toString("utf8") : ""
    if (oldContents !== newContents) {
        fs.writeFileSync(targetFileName, newContents)
        console.log("File updated: ", targetFileName)
    }
}

function getLuaContent(fileName) {
    return fs.readFileSync(fileName).toString("utf8")
        .replace(/--\[\[DEBUG]]/gsi, '-- [[DEBUG]]') // Comment --[[DEBUG]]-s
        .replace(/--\[\[DEBUG_BEGIN]](.*?)--\[\[DEBUG_END]]/gsi, (_, m1) => '--[[DEBUG_START] ]' + m1.replace(/]]/g, '] ]') + '--[[DEBUG_END]]')
}
