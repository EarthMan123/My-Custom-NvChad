local overrides = require "custom.overrides"

local plugins = {
 -- Debugging Plugins Starts Here:
    ["Dax89/IDE.nvim"] = {
        config = function()
            require("custom.plugins.configs.ide").ide()
        end,
    },
    ["rcarriga/nvim-notify"] = {
        config = function()
            require("custom.plugins.configs.ide").notify()
        end,
    },   -- Notifications Popup (Optional)
    ["stevearc/dressing.nvim"] = {
        config = function()
            require("custom.plugins.configs.ide").dressing()
        end,
    }, -- Improved UI (Optional)
    ["mfussenegger/nvim-dap"] = {
        config = function()
            require("custom.plugins.configs.ide").dap()
        end,
    } , -- DAP Support (Optional)
    ["rcarriga/nvim-dap-ui"] = {
        wants = "nvim-dap",
        config = function()
            require("custom.plugins.configs.ide").dapui()
        end,
    },   -- DAP-UI Support (Optional)
 -- Debugging Plugins Ends Here ---------------------------

 -- Start of Code Runners
    ["CRAG666/code_runner.nvim"] = {
        -- wants = "plenary.nvim",
        config = function()
            require("custom.plugins.configs.coderunner").config()
        end,
    },
 --  End of Code Runners ---------------------------

 -- Start of LSP Config Bridge
    
    ["williamboman/mason-lspconfig.nvim"] = {
        after = "mason.nvim",
        config = function()
            require("custom.plugins.configs.lspconfig").masonlsp()
        end,
    },

    ["neovim/nvim-lspconfig"] = {
        after = "mason-lspconfig.nvim",
        config = function()
          require "plugins.configs.lspconfig"
          require("custom.plugins.configs.lspconfig").lspconfig()
        end,
    },
 -- End of LSP Config Bridge ---------------------------

 
 -- Start of overRides
    ["williamboman/mason.nvim"] = {
        override_options = overrides.mason,
    },

    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = overrides.treesitter,
    },

    ["kyazdani42/nvim-tree.lua"] = {
        override_options = overrides.nvimtree,
    },
 -- End of OverRides ---------------------------

 -- Start of MISCs
    ["sbdchd/neoformat"] = {},

    ["kyazdani42/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
        require "custom.plugins.configs.nvim-tree"
    end,
    },
 -- End of MISCs
}

return plugins