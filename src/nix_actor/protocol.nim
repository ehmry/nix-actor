# SPDX-License-Identifier: MIT

import
  preserves, std / tables, std / options

type
  Error* {.preservesRecord: "error".} = object
  
  Eval* {.preservesRecord: "eval".} = object
  
  RepoArgsKind* {.pure.} = enum
    `present`, `absent`
  RepoArgsPresent* {.preservesDictionary.} = object
  
  RepoArgsAbsent* {.preservesDictionary.} = object
  `RepoArgs`* {.preservesOr.} = object
    case orKind*: RepoArgsKind
    of RepoArgsKind.`present`:
      
    of RepoArgsKind.`absent`:
      
  
  RepoResolveStep* {.preservesRecord: "nix-repo".} = object
  
  AttrSet* = Table[Symbol, Value]
  Realise* {.preservesRecord: "realise".} = object
  
  RepoStoreKind* {.pure.} = enum
    `uri`, `cap`, `absent`
  RepoStoreUri* {.preservesDictionary.} = object
  
  RepoStoreCap* {.preservesDictionary.} = object
  
  RepoStoreAbsent* {.preservesDictionary.} = object
  `RepoStore`* {.preservesOr.} = object
    case orKind*: RepoStoreKind
    of RepoStoreKind.`uri`:
      
    of RepoStoreKind.`cap`:
      
    of RepoStoreKind.`absent`:
      
  
  RepoResolveDetailArgs* = Option[Value]
  RepoResolveDetailCache* = Option[EmbeddedRef]
  RepoResolveDetailImport* = string
  RepoResolveDetailLookupPath* = seq[string]
  RepoResolveDetailStore* = Option[Value]
  `RepoResolveDetail`* {.preservesDictionary.} = object
  
  Derivation* {.preservesRecord: "drv".} = object
  
  StoreResolveDetailCache* = Option[EmbeddedRef]
  StoreResolveDetailUri* = string
  `StoreResolveDetail`* {.preservesDictionary.} = object
  
  ResultKind* {.pure.} = enum
    `Error`, `ok`
  ResultOk* {.preservesRecord: "ok".} = object
  
  `Result`* {.preservesOr.} = object
    case orKind*: ResultKind
    of ResultKind.`Error`:
      
    of ResultKind.`ok`:
      
  
  Context* = EmbeddedRef
  CheckStorePath* {.preservesRecord: "check-path".} = object
  
  CopyClosure* {.preservesRecord: "copy-closure".} = object
  
  CacheSpaceKind* {.pure.} = enum
    `cacheSpace`, `absent`
  CacheSpaceCacheSpace* {.preservesDictionary.} = object
  
  CacheSpaceAbsent* {.preservesDictionary.} = object
  `CacheSpace`* {.preservesOr.} = object
    case orKind*: CacheSpaceKind
    of CacheSpaceKind.`cacheSpace`:
      
    of CacheSpaceKind.`absent`:
      
  
  StoreResolveStep* {.preservesRecord: "nix-store".} = object
  
proc `$`*(x: Error | Eval | RepoArgs | RepoResolveStep | AttrSet | Realise |
    RepoStore |
    RepoResolveDetail |
    Derivation |
    StoreResolveDetail |
    Result |
    Context |
    CheckStorePath |
    CopyClosure |
    CacheSpace |
    StoreResolveStep): string =
  `$`(toPreserves(x))

proc encode*(x: Error | Eval | RepoArgs | RepoResolveStep | AttrSet | Realise |
    RepoStore |
    RepoResolveDetail |
    Derivation |
    StoreResolveDetail |
    Result |
    Context |
    CheckStorePath |
    CopyClosure |
    CacheSpace |
    StoreResolveStep): seq[byte] =
  encode(toPreserves(x))
