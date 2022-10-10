
local M = {}

-- local load_override = require("core.utils").load_override

M.ide = function()
    local present, ide = pcall(require, "IDE")

    if not present then
        vim.api.nvim_command(":echo \"=> IDE is not present\"")
        return
    end

    local options = {
        mappings = {
            ["<F5>"] = function(project)
                if project:is_busy() and not project:has_state("debug") then
                    return
                end
    
                project:debug()
            end,
    
            ["<F7>"] = function(project)
                if project:has_state("debug") then
                    project:debug({type = "stepinto"})
                else
                    vim.api.nvim_command(":NeoTreeShowToggle")
                end
            end,
    
            ["<F8>"] = function(project)
                if project:has_state("debug") then
                    project:debug({type = "stepover"})
                else
                    project:build()
                end
            end,
    
            ["<C-F5>"] = function(project)
                if not project:has_state("run") then
                    project:run()
                end
            end,
    
            ["<C-F8>"] = function(project)
                project:settings()
            end,
    
            ["<A-F5>"] = function(project)
                if project:has_state("debug") then
                    project:debug({type = "stop"})
                end
            end,
    
            ["<A-BS>"] = function(project)
                if project:is_busy() and not project:has_state("debug") then
                    project:stop()
                end
            end
        },
    
        integrations = {
            dap = {
                enable = true,
    
                config = {
                    adapters = {
                        codelldb = {
                            type = "server",
                            port = 8990,
    
                            executable = {
                                command = "C:/Users/SAL/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe",
                                args = {"--port", "8990"}
                            }
                        }
                    }
                }
            },
    
            dapui = {
                enable = true
            },
        },
    }
    options = load_override(options, "IDE")  
    ide.setup(options)
end

M.notify = function()
    local present, notify = pcall(require, "notify")
    
    if not present then
        vim.api.nvim_command(":echo \"=> Notify is not present\"")
        return
    end

    -- local options = {
    -- }
        
    -- notify.setup(options)
end

M.dressing = function()
    local present, dressing = pcall(require, "dressing")
    
    if not present then
        vim.api.nvim_command(":echo \"=> Dressing is not present\"")
        return
    end

    -- local options = {
    -- }

    -- dressing.setup(options)
end

M.dap = function()
    local present, dap = pcall(require, "dap")

    if not present then
        vim.api.nvim_command(":echo \"=> DAP is not present\"")
        return
    end

    -- local options = {
    -- }
        
    -- dap.setup(options)
end

M.dapui = function()
    local present, dapui = pcall(require, "dapui")

    if not present then
        vim.api.nvim_command(":echo \"=> DAP-UI is not present\"")
        return
    end

    -- local options = {
    -- }

    -- dapui.setup(options)
end

return M