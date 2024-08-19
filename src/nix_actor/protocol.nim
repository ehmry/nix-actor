# SPDX-License-Identifier: MIT

import
  preserves, std / tables, std / options

type
  Error* {.preservesRecord: "error".} = object
  
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
  RepoResolveDetailImport* = string
  RepoResolveDetailLookupPath* = seq[string]
  RepoResolveDetailStore* = Option[Value]
  `RepoResolveDetail`* {.preservesDictionary.} = object
  
  Derivation* {.preservesRecord: "drv".} = object
  
  StoreResolveDetail* {.preservesDictionary.} = object
  
  CheckStorePath* {.preservesRecord: "check-path".} = object
  
  StoreResolveStep* {.preservesRecord: "nix-store".} = object
  
proc `$`*(x: Error | RepoArgs | RepoResolveStep | AttrSet | RepoStore |
    RepoResolveDetail |
    Derivation |
    StoreResolveDetail |
    CheckStorePath |
    StoreResolveStep): string =
  `$`(toPreserves(x))

proc encode*(x: Error | RepoArgs | RepoResolveStep | AttrSet | RepoStore |
    RepoResolveDetail |
    Derivation |
    StoreResolveDetail |
    CheckStorePath |
    StoreResolveStep): seq[byte] =
  encode(toPreserves(x))
