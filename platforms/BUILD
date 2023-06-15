platform(
    name = "platform_linux",
    constraint_values = [
        "@bazel_tools//tools/cpp:clang",
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    exec_properties = {
        "OSFamily": "Linux",
        "container-image": "docker://gcr.io/flame-public/rbe-ubuntu20-04:latest",
        "recycle-runner": "true",
    },
)
