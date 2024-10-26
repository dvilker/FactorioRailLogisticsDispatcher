const archiveName = 'Viirld'

const fileList = [
    'locale/ru/ru.cfg.js',
    'locale/ru/ruV1.cfg.js',
    'locale/ru/ruV2.cfg.js',
    'locale/en/en.cfg',
    'migrations/toTypeAndName.lua',
    'migrations/priorities.lua',

    'v1/script/informatron.lua',
    'v1/script/compositions.lua',
    'v1/script/config.lua',
    'v1/script/const.lua',
    'v1/script/DeliveryClass.lua',
    'v1/script/DispClass.lua',
    'v1/script/DispGui.lua',
    'v1/script/gui.lua',
    'v1/script/networks.lua',
    'v1/script/StopClass.lua',
    'v1/script/SurClass.lua',
    'v1/script/TrainClass.lua',
    'v1/script/units.lua',
    'v1/script/utils.lua',
    'v1/control.lua',
    'v1/data.lua',
    'v1/data-updates.lua',
    'v1/data-final-fixes.lua',

    'v2/script/compositions.lua',
    'v2/script/config.lua',
    'v2/script/const.lua',
    'v2/script/DeliveryClass.lua',
    'v2/script/DispClass.lua',
    'v2/script/DispGui.lua',
    'v2/script/global.lua',
    'v2/script/gui.lua',
    'v2/script/informatron.lua',
    'v2/script/NetClass.lua',
    'v2/script/MoverClass.lua',
    'v2/script/units.lua',
    'v2/script/utils.lua',
    'v2/control.lua',
    'v2/data.lua',
    'v2/data-updates.lua',
    'v2/data-final-fixes.lua',

    'changelog.txt',
    'control.lua',
    'data.lua',
    'data-updates.lua',
    'data-final-fixes.lua',
    'info.json',
    'LICENSE',
    'README.md',
    'settings.lua',
    'thumbnail.png',
]

const fs = require('fs')
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
    if (/^locale\/.*\.cfg\.js$/.test(fn)) {
        let targetFileName = fn.replace(/\.js$/, '')
        prepareLocaleCfgJs('../' + fn, '../' + targetFileName)
        fn = targetFileName
    }
    if (/\.lua$/.test(fn)) {
        archive.append(getLuaContent('../' + fn), {name: `${archiveName}/${fn}`})
    } else {
        archive.file('../' + fn, {name: `${archiveName}/${fn}`})
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
