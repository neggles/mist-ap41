#!/usr/bin/env lua
local json = require ("cjson")

local config_file = io.open("/rw/etc/mist/ep-control/ble.json", r)
local config_data = config_file:read("*a")

local decoded_config = json.decode(config_data)

print(decoded_config.BLE.PowerLevel)

