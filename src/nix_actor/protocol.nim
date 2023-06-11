# SPDX-License-Identifier: MIT

import
  preserves, std / sets, std / tables

type
  Eval* {.preservesRecord: "eval".} = object
  
  AttrSet* = Table[Symbol, Preserve[void]]
  Realise* {.preservesRecord: "realise".} = object
  
  LegacyPathAttrs* {.preservesDictionary.} = object
  
  Missing* {.preservesRecord: "missing".} = object
  
  Narinfo* {.preservesRecord: "narinfo".} = object
  
  FieldKind* {.pure.} = enum
    `int`, `string`
  `Field`* {.preservesOr.} = object
    case orKind*: FieldKind
    of FieldKind.`int`:
      
    of FieldKind.`string`:
      
  
  StringSet* = HashSet[string]
  AddToStoreAttrs* {.preservesDictionary.} = object
  
  AddToStoreClientAttrs* {.preservesDictionary.} = object
  
  PathInfo* {.preservesRecord: "path".} = object
  
  Build* {.preservesRecord: "nix-build".} = object
  
  Fields* = seq[Field]
  ActionStart* {.preservesRecord: "start".} = object
  
  Instantiate* {.preservesRecord: "instantiate".} = object
  
  StringSeq* = seq[string]
  ActionStop* {.preservesRecord: "stop".} = object
  
  ActionResult* {.preservesRecord: "result".} = object
  
proc `$`*(x: Eval | AttrSet | Realise | LegacyPathAttrs | Missing | Narinfo |
    Field |
    StringSet |
    AddToStoreAttrs |
    AddToStoreClientAttrs |
    PathInfo |
    Build |
    Fields |
    ActionStart |
    Instantiate |
    StringSeq |
    ActionStop |
    ActionResult): string =
  `$`(toPreserve(x))

proc encode*(x: Eval | AttrSet | Realise | LegacyPathAttrs | Missing | Narinfo |
    Field |
    StringSet |
    AddToStoreAttrs |
    AddToStoreClientAttrs |
    PathInfo |
    Build |
    Fields |
    ActionStart |
    Instantiate |
    StringSeq |
    ActionStop |
    ActionResult): seq[byte] =
  encode(toPreserve(x))
