# SPDX-License-Identifier: MIT

import
  preserves, std / tables

type
  Eval* {.preservesRecord: "eval".} = object
  
  Realise* {.preservesRecord: "realise".} = object
  
  Narinfo* {.preservesRecord: "narinfo".} = object
  
  Dict* = Table[Symbol, Preserve[void]]
  Build* {.preservesRecord: "nix-build".} = object
  
  Instantiate* {.preservesRecord: "instantiate".} = object
  
proc `$`*(x: Eval | Realise | Narinfo | Dict | Build | Instantiate): string =
  `$`(toPreserve(x))

proc encode*(x: Eval | Realise | Narinfo | Dict | Build | Instantiate): seq[byte] =
  encode(toPreserve(x))
