file .vscode/settings.json

python {
    localenv
    path: ./bin/python3
}

build {
    multicommand build = 'clear ; make'
}

watcher {
    exclude [

    ]
}

files {
    exclude [
        python.envfiles
    ]
}

editor {
    tabsize: 4
}
