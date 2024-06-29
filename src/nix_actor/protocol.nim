# SPDX-License-Identifier: MIT

import
  preserves, std / tables

type
  Error* {.preservesRecord: "error".} = object
  
  Eval* {.preservesRecord: "eval".} = object
  
  AttrSet* = Table[Symbol, Value]
  Realise* {.preservesRecord: "realise".} = object
  
  Derivation* {.preservesRecord: "drv".} = object
  
  RealiseResultKind* {.pure.} = enum
    `Error`, `RealiseSuccess`
  `RealiseResult`* {.preservesOr.} = object
    case orKind*: RealiseResultKind
    of RealiseResultKind.`Error`:
      
    of RealiseResultKind.`RealiseSuccess`:
      
  
  EvalSuccess* {.preservesRecord: "ok".} = object
  
  RealiseSuccess* {.preservesRecord: "ok".} = object
  
  EvalFile* {.preservesRecord: "eval-file".} = object
  
  EvalResultKind* {.pure.} = enum
    `err`, `ok`
  `EvalResult`* {.preservesOr.} = object
    case orKind*: EvalResultKind
    of EvalResultKind.`err`:
      
    of EvalResultKind.`ok`:
      
  
  ResolveStep* {.preservesRecord: "nix-actor".} = object
  
  EvalFileResultKind* {.pure.} = enum
    `err`, `ok`
  `EvalFileResult`* {.preservesOr.} = object
    case orKind*: EvalFileResultKind
    of EvalFileResultKind.`err`:
      
    of EvalFileResultKind.`ok`:
      
  
  EvalFileSuccess* {.preservesRecord: "ok".} = object
  
  ResolveDetail* {.preservesDictionary.} = object
  
proc `$`*(x: Error | Eval | AttrSet | Realise | Derivation | RealiseResult |
    EvalSuccess |
    RealiseSuccess |
    EvalFile |
    EvalResult |
    ResolveStep |
    EvalFileResult |
    EvalFileSuccess |
    ResolveDetail): string =
  `$`(toPreserves(x))

proc encode*(x: Error | Eval | AttrSet | Realise | Derivation | RealiseResult |
    EvalSuccess |
    RealiseSuccess |
    EvalFile |
    EvalResult |
    ResolveStep |
    EvalFileResult |
    EvalFileSuccess |
    ResolveDetail): seq[byte] =
  encode(toPreserves(x))
