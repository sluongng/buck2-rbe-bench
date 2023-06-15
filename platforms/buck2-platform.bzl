def _platforms(ctx):
    platform = ExecutionPlatformInfo(
        label = ctx.label.raw_target(),
        configuration = ConfigurationInfo(
            constraints = {},
            values = {},
        ),
        executor_config = CommandExecutorConfig(
            local_enabled = False,
            remote_enabled = True,
            use_limited_hybrid = False,
            remote_execution_properties = {
                "recycle-runner": "true",
            },
            remote_execution_use_case = "buck2-default",
            remote_output_paths = "output_paths",
        ),
    )

    return [DefaultInfo(), ExecutionPlatformRegistrationInfo(platforms = [platform])]

platforms = rule(attrs = {}, impl = _platforms)
