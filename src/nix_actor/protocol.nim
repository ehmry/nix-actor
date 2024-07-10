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
  RepoResolveDetailArgs* = Option[Value]
  RepoResolveDetailImport* = string
  RepoResolveDetailLookupPath* = seq[string]
  RepoResolveDetailStore* = string
  `RepoResolveDetail`* {.preservesDictionary.} = object
  
  Derivation* {.preservesRecord: "drv".} = object
  
proc `$`*(x: Error | RepoArgs | RepoResolveStep | AttrSet | RepoResolveDetail |
    Derivation): string =
  `$`(toPreserves(x))

proc encode*(x: Error | RepoArgs | RepoResolveStep | AttrSet | RepoResolveDetail |
    Derivation): seq[byte] =
  encode(toPreserves(x))
