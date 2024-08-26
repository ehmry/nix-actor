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
      
  
  Derivation* {.preservesRecord: "drv".} = object
  
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
  
  CheckStorePath* {.preservesRecord: "check-path".} = object
  
  StoreUriKind* {.pure.} = enum
    `storeUri`, `absent`
  StoreUriStoreUri* {.preservesDictionary.} = object
  
  StoreUriAbsent* {.preservesDictionary.} = object
  `StoreUri`* {.preservesOr.} = object
    case orKind*: StoreUriKind
    of StoreUriKind.`storeUri`:
      
    of StoreUriKind.`absent`:
      
  
  NixResolveDetailCache* = Option[EmbeddedRef]
  NixResolveDetailLookupPath* = Option[seq[string]]
  NixResolveDetailStoreUri* = Option[string]
  `NixResolveDetail`* {.preservesDictionary.} = object
  
  CopyClosure* {.preservesRecord: "copy-closure".} = object
  
  CacheSpaceKind* {.pure.} = enum
    `cacheSpace`, `absent`
  CacheSpaceCacheSpace* {.preservesDictionary.} = object
  
  CacheSpaceAbsent* {.preservesDictionary.} = object
  `CacheSpace`* {.preservesOr.} = object
    case orKind*: CacheSpaceKind
    of CacheSpaceKind.`cacheSpace`:
      
    of CacheSpaceKind.`absent`:
      
  
proc `$`*(x: Eval | Error | AttrSet | LookupPath | Derivation | Result |
    StoreParams |
    NixResolveStep |
    RealiseString |
    CheckStorePath |
    StoreUri |
    NixResolveDetail |
    CopyClosure |
    CacheSpace): string =
  `$`(toPreserves(x))

proc encode*(x: Eval | Error | AttrSet | LookupPath | Derivation | Result |
    StoreParams |
    NixResolveStep |
    RealiseString |
    CheckStorePath |
    StoreUri |
    NixResolveDetail |
    CopyClosure |
    CacheSpace): seq[byte] =
  encode(toPreserves(x))
