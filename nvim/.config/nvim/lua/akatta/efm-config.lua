local function on_attach(client)
    print(string.format('%s ${INPUT}', require('efmls-configs.fs').executable('clang-format')))
end

local efmls = require 'efmls-configs'
efmls.init {
    -- Your custom attach function
    on_attach = on_attach,

    -- Enable formatting provided by efm langserver
    init_options = {
        documentFormatting = true,
    },
}

local clang_format_config = require('efmls-configs.formatters.clang_format')
clang_format_config = vim.tbl_extend('force', clang_format_config, {
    formatCommand = "clang-format ${INPUT}", formatStdin = true, formatCanRange = true
})

local prettier_config = require('efmls-configs.formatters.prettier')
prettier_config = vim.tbl_extend('force', prettier_config, {
    formatCommand =
    "prettier --stdin-filepath ${INPUT} --use-tabs --no-semi --single-quote --jsx-single-quote --tab-width 4",
    formatStdin = true,
    formatCanRange = true
})

efmls.setup {
    lua = {
        { formatCommand = "stylua -i", formatStdin = true },
    },
    go = {
        { formatCommand = "gofumpt", formatStdin = true }
    },
    javascript = {
        formatter = prettier_config
    },
    javascriptreact = {
        formatter = prettier_config
    },
    typescript = {
        formatter = prettier_config
    },
    typescriptreact = {
        formatter = prettier_config
    },
    cpp = {
        formatter = clang_format_config
    },
}
