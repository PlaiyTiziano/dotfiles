return {
    {
        "aaronhallaert/continuous-testing.nvim",
        -- dev = true,
        config = true,
        opts = {
            notify = true,
            run_tests_on_setup = true,
            framework_setup = {
                ruby = {
                    test_tool = "rspec",
                    test_cmd = "execute_api_command -i 'bundle exec rspec %file --format json --no-fail-fast'",
                },
            },
            project_override = {},
        },
        event = "VeryLazy",
    },
}
