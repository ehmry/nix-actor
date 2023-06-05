# SPDX-License-Identifier: MIT

import
  preserves, std / sets, std / tables

type
  Eval* {.preservesRecord: "eval".} = object
  
  Realise* {.preservesRecord: "realise".} = object
  
  Missing* {.preservesRecord: "missing".} = object
  
  Narinfo* {.preservesRecord: "narinfo".} = object
  
  FieldKind* {.pure.} = enum
    `int`, `string`
  `Field`* {.preservesOr.} = object
    case orKind*: FieldKind
    of FieldKind.`int`:
      
    of FieldKind.`string`:
      
  
  PathInfo* {.preservesRecord: "path-info".} = object
  
  Dict* = Table[Symbol, Preserve[void]]
  Build* {.preservesRecord: "nix-build".} = object
  
  Fields* = seq[Field]
  ActionStart* {.preservesRecord: "start".} = object
  
  FieldString* = string
  Instantiate* {.preservesRecord: "instantiate".} = object
  
  FieldInt* = BiggestInt
  ActionStop* {.preservesRecord: "stop".} = object
  
  ActionResult* {.preservesRecord: "result".} = object
  
proc `$`*(x: Eval | Realise | Missing | Narinfo | Field | PathInfo | Dict |
    Build |
    Fields |
    ActionStart |
    FieldString |
    Instantiate |
    FieldInt |
    ActionStop |
    ActionResult): string =
  `$`(toPreserve(x))

proc encode*(x: Eval | Realise | Missing | Narinfo | Field | PathInfo | Dict |
    Build |
    Fields |
    ActionStart |
    FieldString |
    Instantiate |
    FieldInt |
    ActionStop |
    ActionResult): seq[byte] =
  encode(toPreserve(x))
