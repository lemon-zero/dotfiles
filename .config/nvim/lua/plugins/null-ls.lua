return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls_ok, null_ls = pcall(require, "null-ls")
        if not null_ls_ok then
            return
        end
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.diagnostics.eslint_d,
            },
        })
    end
}
