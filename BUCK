# Add some execution time to each action to simulate a real build.
load(":instance.bzl", "INSTANCE_NAME")
SIZE_RANGE = range(0, 1000)

XYZ_SHA256 = "72036ae48c55d632cc333cac04c78be336b0c76f39b225d023e218efe077ab1b"

SLEEP_CMD = "sleep \$((RANDOM % 5));"

[
    genrule(
        name = "x_{}".format(n),
        out = "x_{}.txt".format(n),
        cmd = SLEEP_CMD + "echo {} x_{} >$OUT".format(INSTANCE_NAME, n),
    )
    for n in SIZE_RANGE
]

[
    genrule(
        name = "y_{}".format(n),
        out = "y_{}.txt".format(n),
        cmd = SLEEP_CMD + "echo {} y_{} >$OUT".format(INSTANCE_NAME, n),
    )
    for n in SIZE_RANGE
]

[
    genrule(
        name = "z_{}".format(n),
        out = "z_{}.txt".format(n),
        cmd = SLEEP_CMD + "cat $(location :x_{n}) $(location :y_{n}) >$OUT".format(n = n),
        srcs = [
            ":x_{}".format(n),
            ":y_{}".format(n),
        ],
    )
    for n in SIZE_RANGE
]

genrule(
    name = "xyz",
    out = "xyz.txt",
    # cat $(location :z_0) $(location :z_1) ... $(location :z_999) > $@,
    cmd = SLEEP_CMD + "cat " + " ".join([
        "$(location :z_{})".format(n)
        for n in SIZE_RANGE
    ]) + " > $OUT",
    srcs = [
        ":z_{}".format(n)
        for n in SIZE_RANGE
    ],
)

sh_test(
    name = "test",
    test = "test.sh",
    args = ["$(location :xyz)", XYZ_SHA256],
    remote_execution = {
      "capabilities": {},
      "remote_cache_enabled": True,
      "use_case": "default",
    },
)
