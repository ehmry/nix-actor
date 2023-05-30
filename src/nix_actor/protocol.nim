# SPDX-License-Identifier: MIT

import
  preserves, std / tables

type
  Eval* {.preservesRecord: "eval".} = object
  
  Realise* {.preservesRecord: "realise".} = object
  
  Build* {.preservesRecord: "nix-build".} = object
  
proc `$`*(x: Eval | Realise | Build): string =
  `$`(toPreserve(x))

proc encode*(x: Eval | Realise | Build): seq[byte] =
  encode(toPreserve(x))
