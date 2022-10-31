const archiveName = 'Yatm'

const fileList = [
    'gfx/disp.png',
    'locale/ru/locale.cfg',

    'script/compositions.lua',
    'script/config.lua',
    'script/const.lua',
    'script/DeliveryClass.lua',
    'script/DispClass.lua',
    'script/DispGui.lua',
    'script/gui.lua',
    'script/networks.lua',
    'script/StopClass.lua',
    'script/SurClass.lua',
    'script/TrainClass.lua',
    'script/units.lua',
    'script/utils.lua',

    'changelog.txt',
    'control.lua',
    'data.lua',
    'data-updates.lua',
    'info.json',
    'LICENSE',
    'README.md',
    'settings.lua',
]

const fs = require('fs')
const archiver = require('archiver');

const output = fs.createWriteStream(`out/${archiveName}.zip`);
const archive = archiver('zip');

archive.on('error', function (err) {
    throw err;
});

archive.pipe(output);

for (let fn of fileList) {
    if (/^locale\/.*\.cfg$/) {
        prepareLocaleCfg('../' + fn)
    }
    if (/\.lua$/) {
        archive.append(getLuaContent('../' + fn), {name: `${archiveName}/${fn}`})
    } else {
        archive.file('../' + fn, {name: `${archiveName}/${fn}`})
    }
}
archive.finalize();


function prepareLocaleCfg(fileName) {
    let oldContents = fs.readFileSync(fileName).toString("utf8")
    let contents = oldContents.split('\n')
    let newValue = null
    for (let i = 0; i < contents.length; i++) {
        let line = contents[i];
        let r = /^#from:(.*)$/.exec(line)
        if (r) {
            newValue = fs.readFileSync(fileName.replace(/[^/]+$/, '') + r[1]).toString("utf8").replace(/\n+/g, r => "\\n".repeat(r.length - 1) || " ")
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

function getLuaContent(fileName) {
    return fs.readFileSync(fileName).toString("utf8")
        .replace(/--\[\[DEBUG]]/g, '-- [[DEBUG]]') // Comment --[[DEBUG]]-s
}
