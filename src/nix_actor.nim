# SPDX-License-Identifier: MIT

import
  std / [json, osproc, parseutils, strutils, tables]

import
  eris / memory_stores

import
  preserves, preserves / jsonhooks

import
  syndicate

from syndicate / protocols / dataspace import Observe

import
  ./nix_actor / protocol

import
  ./nix_actor / [clients, daemons]

type
  Value = Preserve[void]
  Observe = dataspace.Observe[Ref]
proc parseArgs(args: var seq[string]; opts: AttrSet) =
  for sym, val in opts:
    add(args, "--" & $sym)
    if not val.isString "":
      var js: JsonNode
      if fromPreserve(js, val):
        add(args, $js)
      else:
        stderr.writeLine "invalid option --", sym, " ", val

proc build(spec: string): Build =
  var execOutput = execProcess("nix",
                               args = ["build", "--json", "--no-link", spec],
                               options = {poUsePath})
  var js = parseJson(execOutput)
  Build(input: spec, output: js[0].toPreserve)

proc realise(realise: Realise): seq[string] =
  var execlines = execProcess("nix-store", args = ["--realize", realise.drv],
                              options = {poUsePath})
  split(strip(execlines), '\n')

proc instantiate(instantiate: Instantiate): Value =
  const
    cmd = "nix-instantiate"
  var args = @["--expr", instantiate.expr]
  parseArgs(args, instantiate.options)
  var execOutput = strip execProcess(cmd, args = args, options = {poUsePath})
  execOutput.toPreserve

proc eval(eval: Eval): Value =
  const
    cmd = "nix"
  var args = @["eval", "--expr", eval.expr]
  parseArgs(args, eval.options)
  var execOutput = strip execProcess(cmd, args = args, options = {poUsePath})
  if execOutput != "":
    var js = parseJson(execOutput)
    result = js.toPreserve

proc bootNixFacet(turn: var Turn; ds: Ref): Facet =
  result = inFacet(turn)do (turn: var Turn):
    during(turn, ds, ?Observe(pattern: !Build) ?? {0: grabLit()})do (
        spec: string):(discard publish(turn, ds, build(spec)))
    during(turn, ds, ?Observe(pattern: !Realise) ?? {0: grabLit()})do (
        drvPath: string):
      var ass = Realise(drv: drvPath)
      ass.outputs = realise(ass)
      discard publish(turn, ds, ass)
    during(turn, ds,
           ?Observe(pattern: !Instantiate) ?? {0: grabLit(), 1: grabDict()})do (
        e: string; o: Value):
      var ass = Instantiate(expr: e)
      if not fromPreserve(ass.options, unpackLiterals(o)):
        stderr.writeLine "invalid options ", o
      else:
        ass.result = instantiate(ass)
        discard publish(turn, ds, ass)
    during(turn, ds, ?Observe(pattern: !Eval) ?? {0: grabLit(), 1: grabDict()})do (
        e: string; o: Value):
      var ass = Eval(expr: e)
      if not fromPreserve(ass.options, unpackLiterals(o)):
        stderr.writeLine "invalid options ", o
      else:
        ass.result = eval(ass)
        discard publish(turn, ds, ass)

type
  RefArgs {.preservesDictionary.} = object
  
  ClientSideArgs {.preservesDictionary.} = object
  
  DaemonSideArgs {.preservesDictionary.} = object
  
runActor("main")do (root: Ref; turn: var Turn):
  let store = newMemoryStore()
  connectStdio(root, turn)
  during(turn, root, ?RefArgs)do (ds: Ref):
    discard bootNixFacet(turn, ds)
    during(turn, root, ?ClientSideArgs)do (socketPath: string):
      bootClientSide(turn, ds, store, socketPath)
    during(turn, root, ?DaemonSideArgs)do (socketPath: string):
      bootDaemonSide(turn, ds, store, socketPath)