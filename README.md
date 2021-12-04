# Mist AP41 exploration notes

notes and docs and whatnot from my shenanigans with the Juniper / Mist Systems AP41 access point.

# Hardware specs

| Device     | Vendor   | Part             | Notes                                      |
|-----------:|----------|------------------|--------------------------------------------|
| SoC        | Broadcom | BCM58625BB1KF12G |                                            |
| RAM        | SK Hynix | H5TQ2G63GFR x2   | 2Gb x16 DDR3L SDRAM (total 512MiB)         |
| Flash      | Micron   | MT29F2G08ABAGAWP | 2Gb x8 Parallel NAND flash with on-die ECC |
| 2GHz Radio |          |                  |                                            |
| 5GHz Radio |          |                  |                                            |
| Scan Radio |          |                  |                                            |
| BLE Radio  |          |                  |                                            |
|            |          |                  |                                            |
| EEPROM     | STMicro  | 24C64WP          | 64Kbit I2C EEPROM                          |

# Headers, connections, debug.

## Serial console

There is a not-really-hidden 5-pin 0.1" header accessible without disassembling the device. 

3.3V TTL serial console @ 115200 8/N/1, Pin 1 is the closest to the outer edge of the case.

| Pin    | 1   | 2    | 3   | 4  | 5  |
|--------|-----|------|-----|----|----|
| Signal | GND | VCC? | ??? | TX | RX |


## SW_DEBUG header

4-pin 0.1" header near the main SoC, presumably for some kind of debug access.

Marked J13, pin 1 marked on board.

| Pin    | 1   | 2    | 3   | 4   |
|--------|-----|------|-----|-----|
| Signal | 3V3 | ??   | ??  | GND |

# Software info

See logs in `logs/` folder for more details.

U-Boot 2015.01, boots direct from NAND (though there is an unpopulated footprint for a SO-8 SPI NOR, and for a slide switch to change between NAND and NOR boot modes).

U-Boot asks for a challenge if you attempt to pause boot, but the challenge it issues is `TODO` (grr) and I don't know what it's expecting for a response.

Likewise, once Linux finishes booting up, logging in requires answering a crypto challenge. There is a small I2C EEPROM on the board that probably contains some of the data for this, and what appears to be a secure element chip of some kind.

And I don't have a TSOP48 clip to dump the NAND with. Joy.
