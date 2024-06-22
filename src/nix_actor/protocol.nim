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
    `Error`, `Outputs`
  `RealiseResult`* {.preservesOr.} = object
    case orKind*: RealiseResultKind
    of RealiseResultKind.`Error`:
      
    of RealiseResultKind.`Outputs`:
      
  
  EvalSuccess* {.preservesTuple.} = object
  
  EvalResultKind* {.pure.} = enum
    `Error`, `EvalSuccess`
  `EvalResult`* {.preservesOr.} = object
    case orKind*: EvalResultKind
    of EvalResultKind.`Error`:
      
    of EvalResultKind.`EvalSuccess`:
      
  
  InstantiateResultKind* {.pure.} = enum
    `Error`, `Derivation`
  `InstantiateResult`* {.preservesOr.} = object
    case orKind*: InstantiateResultKind
    of InstantiateResultKind.`Error`:
      
    of InstantiateResultKind.`Derivation`:
      
  
  ResolveStep* {.preservesRecord: "nix-actor".} = object
  
  Instantiate* {.preservesRecord: "instantiate".} = object
  
  Outputs* {.preservesRecord: "outputs".} = object
  
  ResolveDetail* {.preservesDictionary.} = object
  
proc `$`*(x: Error | Eval | AttrSet | Realise | Derivation | RealiseResult |
    EvalSuccess |
    EvalResult |
    InstantiateResult |
    ResolveStep |
    Instantiate |
    Outputs |
    ResolveDetail): string =
  `$`(toPreserves(x))

proc encode*(x: Error | Eval | AttrSet | Realise | Derivation | RealiseResult |
    EvalSuccess |
    EvalResult |
    InstantiateResult |
    ResolveStep |
    Instantiate |
    Outputs |
    ResolveDetail): seq[byte] =
  encode(toPreserves(x))
