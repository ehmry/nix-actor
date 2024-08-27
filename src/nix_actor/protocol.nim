# SPDX-License-Identifier: MIT

import
  preserves, std / tables, std / options

type
  EvalResolveDetailLookupPath* = Option[seq[string]]
  EvalResolveDetailStoreUri* = Option[string]
  `EvalResolveDetail`* {.preservesDictionary.} = object
  
  Eval* {.preservesRecord: "eval".} = object
  
  Error* {.preservesRecord: "error".} = object
  
  AttrSet* = Table[Symbol, Value]
  LookupPathKind* {.pure.} = enum
    `lookupPath`, `absent`
  LookupPathLookupPath* {.preservesDictionary.} = object
  
  LookupPathAbsent* {.preservesDictionary.} = object
  `LookupPath`* {.preservesOr.} = object
    case orKind*: LookupPathKind
    of LookupPathKind.`lookupPath`:
      
    of LookupPathKind.`absent`:
      
  
  StoreResolveDetailStoreUri* = string
  `StoreResolveDetail`* {.preservesDictionary.} = object
  
  StoreParamsKind* {.pure.} = enum
    `storeParams`, `absent`
  StoreParamsStoreParams* {.preservesDictionary.} = object
  
  StoreParamsAbsent* {.preservesDictionary.} = object
  `StoreParams`* {.preservesOr.} = object
    case orKind*: StoreParamsKind
    of StoreParamsKind.`storeParams`:
      
    of StoreParamsKind.`absent`:
      
  
  ResultKind* {.pure.} = enum
    `Error`, `ok`
  ResultOk* {.preservesRecord: "ok".} = object
  
  `Result`* {.preservesOr.} = object
    case orKind*: ResultKind
    of ResultKind.`Error`:
      
    of ResultKind.`ok`:
      
  
  RealiseString* {.preservesRecord: "realise-string".} = object
  
  CheckStorePath* {.preservesRecord: "check-path".} = object
  
  StoreUriKind* {.pure.} = enum
    `storeUri`, `absent`
  StoreUriStoreUri* {.preservesDictionary.} = object
  
  StoreUriAbsent* {.preservesDictionary.} = object
  `StoreUri`* {.preservesOr.} = object
    case orKind*: StoreUriKind
    of StoreUriKind.`storeUri`:
      
    of StoreUriKind.`absent`:
      
  
  Replicate* {.preservesRecord: "replicate".} = object
  
  StoreResolveStep* {.preservesRecord: "nix-store".} = object
  
  EvalResolveStep* {.preservesRecord: "nix".} = object
  
proc `$`*(x: EvalResolveDetail | Eval | Error | AttrSet | LookupPath |
    StoreResolveDetail |
    StoreParams |
    Result |
    RealiseString |
    CheckStorePath |
    StoreUri |
    Replicate |
    StoreResolveStep |
    EvalResolveStep): string =
  `$`(toPreserves(x))

proc encode*(x: EvalResolveDetail | Eval | Error | AttrSet | LookupPath |
    StoreResolveDetail |
    StoreParams |
    Result |
    RealiseString |
    CheckStorePath |
    StoreUri |
    Replicate |
    StoreResolveStep |
    EvalResolveStep): seq[byte] =
  encode(toPreserves(x))
