local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok, lsp_config = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
--
-- for _, server in ipairs(lsp_installer.get_installed_servers()) do
-- 		lsp_config[server.name].setup {
-- 				on_attach = require("user.lsp.handlers").on_attach,
-- 				capabilities = require("user.lsp.handlers").capabilities,
-- 		}
-- end

lsp_installer.setup()
lsp_config.setup({
    ensure_installed = {
        "lua_ls",
        "marksman",
        "tflint",
        "tsserver"
    },
})

require("user.lsp.handlers").setup()
lsp_config.setup_handlers({
    function(server_name)
        local opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
        }
        if server_name == "jsonls" then
            local jsonls_opts = require("user.lsp.settings.jsonls")
            opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        end

        if server_name == "lua_ls" then
            local sumneko_opts = require("user.lsp.settings.lua_ls")
            opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        end

        if server_name == "pyright" then
            local pyright_opts = require("user.lsp.settings.pyright")
            opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        end

        if server_name == "emmet_ls" then
            local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
            opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
        end

        if server_name == "gopls" then
            local gopls_opts = require("user.lsp.settings.gopls")
            opts = vim.tbl_deep_extend("force", gopls_opts, opts)
        end

        require("lspconfig")[server_name].setup(opts)
    end
})
