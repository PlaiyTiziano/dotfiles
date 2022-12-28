local header = {
    [[]],
    [[]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}

local footer = function()
    local lazy_stats = require("lazy").stats()

    local version = " "
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
    if lazy_stats == nil then
        return version
    else
        return version
            .. " Lazy 鈴"
            .. lazy_stats.count
            .. "("
            .. lazy_stats.loaded
            .. ")"
        -- .. " 🚀 "
        -- .. lazy_stats.startuptime
    end
end

return {
    {
        "goolord/alpha-nvim",
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = header
            dashboard.section.buttons.val = {
                dashboard.button(
                    "f",
                    "  Find File",
                    ":Telescope find_files<CR>"
                ),
                dashboard.button(
                    "e",
                    "  New file",
                    ":ene <BAR> startinsert <CR>"
                ),
                dashboard.button(
                    "r",
                    "  Recent Files",
                    ":Telescope oldfiles<CR>"
                ),
                dashboard.button(
                    "t",
                    "  Find Text",
                    ":Telescope live_grep<CR>"
                ),
                dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
                dashboard.button(
                    "u",
                    "  Update Plugins",
                    ":Lazy update<CR>"
                ),
                dashboard.button(
                    "p",
                    "🪐 Planets?",
                    ":Telescope planets<CR>"
                ),
                dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
            }

            dashboard.section.footer.val = footer()

            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButton"

            dashboard.opts.opts.noautocmd = true

            require("alpha").setup(dashboard.opts)
        end,
    },
}
