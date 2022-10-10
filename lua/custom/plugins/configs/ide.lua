
local M = {}

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

    local options = {
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has("nvim-0.8") == 1,
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
            -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        controls = {
          -- Requires Neovim nightly (or 0.8 when released)
          enabled = true,
          -- Display controls in this element
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        }
    }

    dapui.setup(options)
end

return M