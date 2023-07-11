return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true },
            })
        end,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },
}
