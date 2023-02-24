return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
        if not treesitter_ok then
            return
        end
        treesitter.setup({
            ensure_installed = { "help", "vim", "javascript", "typescript", "tsx", "c", "lua", "rust" },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })
    end,
}
