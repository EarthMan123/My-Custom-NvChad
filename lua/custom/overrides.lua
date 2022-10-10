local M = {}

M.treesitter = {
    ensure_installed = {
      "cpp",
      "python",
    },
  }

M.mason = {
    ensure_installed = {
        -- cpp
        "cpptools",
        "clang-format",
        "codelldb",
        "cpplint",
    "
        -- python
        "pylint",
        "vulture",
        "debugpy",
        "pyright",
        "blue",

        --msic
        "cspell",
      },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
      enable = true,
    },
  
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
  }

return M