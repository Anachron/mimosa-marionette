@echo off
if "%1" == "ci" (
  testem ci --file ".mimosa\testemRequire\testem.json"
) else (
  testem --file ".mimosa\testemRequire\testem.json"
)