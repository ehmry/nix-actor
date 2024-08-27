# SPDX-License-Identifier: MIT

import
  preserves, std / tables, std / options

type
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
      
  
  ResultKind* {.pure.} = enum
    `Error`, `ok`
  ResultOk* {.preservesRecord: "ok".} = object
  
  `Result`* {.preservesOr.} = object
    case orKind*: ResultKind
    of ResultKind.`Error`:
      
    of ResultKind.`ok`:
      
  
  StoreParamsKind* {.pure.} = enum
    `storeParams`, `absent`
  StoreParamsStoreParams* {.preservesDictionary.} = object
  
  StoreParamsAbsent* {.preservesDictionary.} = object
  `StoreParams`* {.preservesOr.} = object
    case orKind*: StoreParamsKind
    of StoreParamsKind.`storeParams`:
      
    of StoreParamsKind.`absent`:
      
  
  NixResolveStep* {.preservesRecord: "nix".} = object
  
  RealiseString* {.preservesRecord: "realise-string".} = object
  
  StoreUriKind* {.pure.} = enum
    `storeUri`, `absent`
  StoreUriStoreUri* {.preservesDictionary.} = object
  
  StoreUriAbsent* {.preservesDictionary.} = object
  `StoreUri`* {.preservesOr.} = object
    case orKind*: StoreUriKind
    of StoreUriKind.`storeUri`:
      
    of StoreUriKind.`absent`:
      
  
  NixResolveDetailLookupPath* = Option[seq[string]]
  NixResolveDetailStoreUri* = Option[string]
  `NixResolveDetail`* {.preservesDictionary.} = object
  
proc `$`*(x: Eval | Error | AttrSet | LookupPath | Result | StoreParams |
    NixResolveStep |
    RealiseString |
    StoreUri |
    NixResolveDetail): string =
  `$`(toPreserves(x))

proc encode*(x: Eval | Error | AttrSet | LookupPath | Result | StoreParams |
    NixResolveStep |
    RealiseString |
    StoreUri |
    NixResolveDetail): seq[byte] =
  encode(toPreserves(x))
