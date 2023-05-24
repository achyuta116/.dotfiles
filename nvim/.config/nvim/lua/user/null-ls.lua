local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.clang_format.with({ extra_args = {"-style={IndentWidth: 4}"}}),
        formatting.prettier.with({ extra_args = { "--use-tabs", "--no-semi", "--single-quote", "--jsx-single-quote", "--tab-width 4" } }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.gofumpt,
        -- diagnostics.flake8
    },
})
