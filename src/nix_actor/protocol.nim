# SPDX-License-Identifier: MIT

import
  std / typetraits, preserves

type
  Serve* {.preservesRecord: "serve".} = object
  
  Build* {.preservesRecord: "nix-build".} = object
  
proc `$`*(x: Serve | Build): string =
  `$`(toPreserve(x))

proc encode*(x: Serve | Build): seq[byte] =
  encode(toPreserve(x))
