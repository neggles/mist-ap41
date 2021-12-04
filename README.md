# Mist AP41 exploration notes

notes and docs and whatnot from my shenanigans with the Juniper / Mist Systems AP41 access point.

# Hardware specs

| Device     | Vendor   | Part             | Notes                                      |
|------------|----------|------------------|--------------------------------------------|
| SoC        | Broadcom | BCM?????         |                                            |
| RAM        | ???      | ???              |                                            |
| Flash      | Micron   | MT29F2G08ABAGAWP | x8 2Gb Parallel NAND flash with on-die ECC |
| 2GHz Radio |          |                  |                                            |
| 5GHz Radio |          |                  |                                            |
| Scan Radio |          |                  |                                            |
| BLE Radio  |          |                  |                                            |

# Headers, connections, debug.

## Serial console

There is a not-really-hidden 5-pin 0.1" header accessible without disassembling the device.
It contains a 3.3V TTL serial console @ 115200 8/N/1.

| Pin    | 1   | 2    | 3   | 4  | 5  |
|--------|-----|------|-----|----|----|
| Signal | GND | VCC? | ??? | TX | RX |

Pin 1 is the closest to the outer edge of the case, and marked on the board.

## SW_DEBUG header

4-pin 0.1" header near the main SoC, presumably for SWD access.

| Pin    | 1   | 2    | 3   | 4  |
|--------|-----|------|-----|----|
| Signal | GND | VCC? | ??? | TX |

Pin 1 marked on board.

# Software info

