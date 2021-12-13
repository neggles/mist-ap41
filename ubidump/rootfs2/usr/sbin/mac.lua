#!/usr/bin/env lua
-- Read MAC address of primary wired network adapter, return MAC + 3 for the MAC address of the Bluetooth adapter
--
-- list of active ethernet devices by model, the script expects the model name as the first argument
local devt = {
    aph = "aximac1",
    apl = "aximac0",
    vulcano = "eth0"
}

local devname = devt["aph"]
if arg[1] and devt[arg[1]] then
    devname = devt[arg[1]]
end
    
local handle = io.popen("ip link show dev " .. devname)
handle:read("*line")	-- toss away first line
local st = handle:read("*line")
handle:close()

if st == nil or st == '' then
    return 1
end

-- split mac address line into tokens, mac address is second token

local macStr = {}
local idx = 0;
local word
for word in  string.gmatch(st, "[^%s]+")  do
    macStr[idx] = word
    idx = idx + 1
end

-- parse off last hex digit
local prefix, rest = string.match(macStr[1], "([%x:]+)(%x%x)")
-- Add 3 to the last octet, modulo 255, print out
local btmac = string.format("%s%02X", prefix, (tonumber(rest, 16) + 3) % 255)
print(btmac)
