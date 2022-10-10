local M = {}

-- local load_override = require("core.utils").load_override

M.masonlsp = function()
    local present, masonlsp = pcall(require, "mason-lspconfig")
    
    if not present then
        vim.api.nvim_command(":echo \"=> Mason-LSPConfig is not present\"")
        return
    end

    local options = {
        ensure_installed = {
            "clangd",
            "pyright",
        },
    },

    -- options = load_override(options, "williamboman/mason-lspconfig.nvim")  
    masonlsp.setup(options)
end

M.lspconfig = function()
    local present, lspconfig = pcall(require, "lspconfig")
    
    if not present then
        vim.api.nvim_command(":echo \"=> LSPConfig is not present\"")
        return
    end

    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities
    
    local lspconfigs = require "lspconfig"
    local servers = { "html", "cssls", "clangd"}
    
    for _, lsp in ipairs(servers) do
      lspconfigs[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
end

return M