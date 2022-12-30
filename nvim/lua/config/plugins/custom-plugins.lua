return {
    {
        "aaronhallaert/continuous-testing.nvim",
        dev = true,
        config = function()
            require("continuous-testing").setup({
                notify = true,
                run_tests_on_setup = true,
                framework_setup = {
                    ruby = {
                        test_tool = "rspec",
                        test_cmd = "execute_api_command 'bundle exec rspec %file --format json --no-fail-fast'",
                    },
                },
                project_override = {},
            })
        end,
    },
}
