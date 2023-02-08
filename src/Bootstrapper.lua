getgenv().RequestServer = function(Type, Data)
    local Package = {
        Url = "http://localhost:8090/",
        Headers = {
            InstructionType = Type, 
            InstructionData = Data}
    }

    return HTTP(Package)
end 


getgenv().GetScript = function(Name, LoadIntoGlobalEnvironment)
	local Script = RequestServer("GetScript", Name)

	if not Script.Body then 
		error(string.format("Failed to get script: %s", Name))
	end 

	if LoadIntoGlobalEnvironment then 
		getgenv()[Name] = loadstring(Script.Body)()
		return getgenv()[Name]
	end 

	return loadstring(Script.Body)()
end 

local Carbon = loadstring(game:HttpGet("https://raw.githubusercontent.com/WoffleTbh/CarbonUI/main/carbonui.lua"))()
