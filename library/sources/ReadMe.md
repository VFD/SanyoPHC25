# Codes source pour PHC-25


## Introduction

Se trouve ici un ensemble de programmes pour le Sanyo PHC-25.\
Sources officielles ou non.\
L'idée majeur est la préservation via GITHUB.


___
##  Organisation du répertoire

```mermaid
---
config:
  treeView:
    showIcons: true
  themeVariables:
      treeView:
      labelColor: '#ff00ff'
      lineColor: '#ff00E9'
---

treeView-beta

sources/
  asm/         ## assembler programs
  basic/       ## basic programs
  emulator/    ## emulators
    mame/
      022_04a.ic6         ## Mame ROM (3)
      022_05a.ic7
      022_06a.ic8
      cutROM.ps1          ## PowerShell to split the 24Ko ROM in 3 parts
      RPUFOS-Basic-phc25rom-Beta4.bin    ## New ROM v0.1 beta
      ReadMe.md
      phc25.zip
      phc25r.cpp
    ReadMe.md
    phc25emu100.zip
    phc25emu100_src.zip
    phc25emu101.zip
    phc25emu101_src.zip
  phc/         ## phc files for emulator
    ReadMe.md
  rom/         ## ROMs
    Basic
    disassembly
    patches
    tools
    ReadMe.md
  wav/         ## wav files for real machine
    ReadMe.md
  ReadMe.md
```

___

## To do

___


