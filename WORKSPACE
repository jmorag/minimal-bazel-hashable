workspace(name = "bazel-hashable")

# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive"
)

# Download latest rules_cc
http_archive(
   name = "rules_cc",
   urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz"],
   sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
   strip_prefix = "rules_cc-0.0.9",
)

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    sha256 = "298f6f0db23391274b4eca215daa01797d05699469048ef94540d5829b466377",
    strip_prefix = "rules_haskell-0.17",
    url = "https://github.com/tweag/rules_haskell/archive/refs/tags/v0.17.tar.gz",
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

load(
    "@rules_haskell//haskell:toolchain.bzl",
    "rules_haskell_toolchains",
)

load(
    "@rules_haskell//haskell:cabal.bzl",
    "stack_snapshot"
)

stack_snapshot(
    name = "stackage",
    packages = ["hashable-1.4.3.0"],
    snapshot = "nightly-2023-11-07",
)

# Download a GHC binary distribution from haskell.org and register it as a toolchain.
rules_haskell_toolchains(
    version = "9.6.3",
)
