local cmd = "echo $0"
-- print(cmd)

local function excute_cmd(cmd)
    local t = io.popen(cmd)
    local ret = t:read("*all")
    return ret
end
local shell = excute_cmd(cmd)

print(shell)