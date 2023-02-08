getgenv().RequestServer = function(Type, Data)
    local Package = {
        Url = "http://localhost:8090/",
        Headers = {
            InstructionType = Type, 
            InstructionData = Data}
    }

    return HTTP(Package)
end 

local Apathy = RequestServer("GetApathy")
local Carbon = loadstring(game:HttpGet("https://raw.githubusercontent.com/WoffleTbh/CarbonUI/main/carbonui.lua"))()
