local M = {}

M.config = function()
    local present, coderunner = pcall(require, "code_runner")
    
    if not present then
        vim.api.nvim_command(":echo \"=> CodeRunner is not present\"")
        return
    end

    local options = {
        mode = "float",
        startinsert = true,
        close_key = '<ESC>',
        float = {
            border = "single",
            blend = 20,
        },

        filetype = {
            javascript = "node",
            java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
            c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            cpp = "cd $dir && g++ -Oz -std=c++20 \"$fileName\" -o \"$fileNameWithoutExt.exe\" && \"$fileNameWithoutExt\"",
            php = "E:/Programming/php/php.exe",
            python = "python -u",
            perl = "perl",
            perl6 = "perl6",
            ruby = "ruby",
            go = "go run",
            lua = "lua",
            groovy = "groovy",
            powershell = "powershell - ExecutionPolicy ByPass -File",
            bat = "cmd /c",
            shellscript = "bash",
            fsharp = "fsi",
            csharp = "scriptcs",
            vbscript = "cscript //Nologo",
            typescript = "ts-node",
            coffeescript = "coffee",
            scala = "scala",
            swift = "swift",
            julia = "julia",
            crystal = "crystal",
            ocaml = "ocaml",
            r = "Rscript",
            applescript = "osascript",
            clojure = "lein exec",
            haxe = "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
            rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
            racket = "racket",
            scheme = "csi -script",
            ahk = "autohotkey",
            autoit = "autoit3",
            dart = "dart",
            pascal = "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
            d = "cd $dir && dmd $fileName && $dir$fileNameWithoutExt",
            haskell = "runhaskell",
            nim = "nim compile --verbosity:0 --hints:off --run",
            lisp = "sbcl --script",
            kit = "kitc --run",
            v = "v run",
            sass = "sass --style expanded",
            scss = "scss --style expanded",
            less = "cd $dir && lessc $fileName $fileNameWithoutExt.css",
            FortranFreeForm = "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
            fortran = "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
        },
    }

    coderunner.setup(options)
end

return M