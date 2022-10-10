local overrides = require "custom.overrides"

local plugins = {
 -- Debugging Plugins Starts Here:
    ["rcarriga/nvim-notify"] = {
        config = function()
            require("custom.plugins.configs.ide").notify()
        end,
    },   -- Notifications Popup (Optional)
    ["stevearc/dressing.nvim"] = {
        -- after = "notify"
        config = function()
            require("custom.plugins.configs.ide").dressing()
        end,
    }, -- Improved UI (Optional)
    ["mfussenegger/nvim-dap"] = {
        -- after = "dressing"
        config = function()
            require("custom.plugins.configs.ide").dap()
        end,
    } , -- DAP Support (Optional)
    ["rcarriga/nvim-dap-ui"] = {
        -- after = "dap"
        config = function()
            require("custom.plugins.configs.ide").dapui()
        end,
    },   -- DAP-UI Support (Optional)

    ["Dax89/IDE.nvim"] = {
        -- after = "dapui"
        config = function()
            require("custom.plugins.configs.ide").ide()
        end,
    },
 -- Debugging Plugins Ends Here ---------------------------

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

 -- Start of Code Runners
    ["CRAG666/code_runner.nvim"] = {
        config = function()
            require "custom.plugins.configs.coderunner"
        end,
    },
 --  Start of Code Runners ---------------------------
}

return plugins