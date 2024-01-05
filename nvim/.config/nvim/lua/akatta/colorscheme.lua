local colorscheme = "kanagawa"
require('kanagawa').setup({
    background = {
        dark = 'dragon'
    }
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end


