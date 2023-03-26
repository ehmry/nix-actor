# SPDX-License-Identifier: MIT

import
  std / typetraits, preserves

type
  Build* {.preservesRecord: "nix-build".} = object
  
proc `$`*(x: Build): string =
  `$`(toPreserve(x))

proc encode*(x: Build): seq[byte] =
  encode(toPreserve(x))
