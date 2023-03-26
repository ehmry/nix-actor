# SPDX-License-Identifier: MIT

{.passC: staticExec("pkg-config --cflags nix-store").}
{.passL: staticExec("pkg-config --libs nix-store").}
{.passC: "\'-DSYSTEM=\"x86_64-linux\"\'".}
type
  StorePath {.importcpp: "nix::StorePath", header: "path.hh".} = object
    nil

proc isDerivation*(path: StorePath): bool {.importcpp.}
type
  Store {.importcpp: "nix::ref<nix::Store>", header: "store-api.hh".} = object
    nil

proc ensurePath*(store: Store; path: StorePath) {.importcpp.}
proc openStore*(): Store {.importcpp: "nix::openStore".}