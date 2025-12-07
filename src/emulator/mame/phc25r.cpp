/***************************************************************************

  Custom PHC-25 driver (phc25r.cpp)
  Generated automatically by PowerShell script with user ROM checksums.

***************************************************************************/

#include "emu.h"
#include "cpu/z80/z80.h"

ROM_START(phc25r)
    ROM_REGION(0x6000, "maincpu", 0)    ROM_LOAD("022_04a.ic6", 0x0000, 0x2000, CRC(ea4a42e4) SHA1(7e9a3ea9e010026e0afdb77be4fd5e994af5c5da))
    ROM_LOAD("022_05a.ic7", 0x2000, 0x2000, CRC(e5dae138) SHA1(dc3db78c0cdc89f1605200d39535be65a4091705))
    ROM_LOAD("022_06a.ic8", 0x4000, 0x2000, CRC(1b7ed789) SHA1(74d44721f989710ae34a4539e1a508b8baba7d6c))
ROM_END

COMP( 1983, phc25r, 0, 0, phc25, phc25, phc25_state, empty_init, "Sanyo", "PHC-25 (User ROM)", MACHINE_SUPPORTS_SAVE )
