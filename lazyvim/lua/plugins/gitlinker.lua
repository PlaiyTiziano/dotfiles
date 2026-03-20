return {
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup({
        opts = {
          add_current_line_on_normal_mode = false,
          action_callback = function(url)
            require("gitlinker.actions").copy_to_clipboard(url)
            require("gitlinker.actions").open_in_browser(url)
          end,
        },
        callbacks = {
          ["gitlab.catsolutions.be"] = require("gitlinker.hosts").get_gitlab_type_url,
        },
      })
    end,
    event = "VeryLazy",
  },
}
