return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope_ok, telescope = pcall(require, "telescope")
        if not telescope_ok then
            return
        end
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
        })
        local builtin_ok, builtin = pcall(require, "telescope.builtin")
        if not builtin_ok then
            return
        end
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
    end
}
