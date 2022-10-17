require("plugins")
require("opts")
require("style")

require("binds")
require("treesitter")

require("telescope-config")
require("harpoon-config")

require("continuous-testing")

-- LSP's
require("nvim-lsp")

-- Custom plugins
require("continuous-testing").setup({
    notify = true,
    framework_setup = {
        ruby = {
            test_tool = "rspec",
            test_cmd = "execute_api_command 'bundle exec spring rspec %file --format json --no-fail-fast'",
        },
    },
    project_override = {},
})
