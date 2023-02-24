return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd("colorscheme catppuccin")
        end,
    },
    "nyoom-engineering/oxocarbon.nvim",
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    "ellisonleao/gruvbox.nvim",
    { "xiyaowong/nvim-transparent", config = function()

        local transparent_ok, transparent = pcall(require, "transparent")
        if not transparent_ok then
            return
        end

        transparent.setup({
            enable = true,
            extra_groups = { -- table/string: additional groups that should be cleared
                "all",
            },
            exclude = {},
        })
    end },
}
