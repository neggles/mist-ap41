#!/usr/bin/env lua
-- read /etc/mist/version, print model number
local handle = io.open("/etc/mist/version", "r")
if handle == nil then
    error("No version file?\n")
    return 
end
handle:read("*line")	-- toss away first line
local st = handle:read("*line")
handle:close()

if st == nil or st == '' then
    return 1
end

-- split line into tokens, model is second token

local macStr = {}
local idx = 0;
local word
for word in  string.gmatch(st, "[^=]+")  do
    macStr[idx] = word
    idx = idx + 1
end
print(macStr[1])
