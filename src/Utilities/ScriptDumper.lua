local ScriptDumper = {}

function Script.DumpFunctions(Script)
    local DumpedFunctions = {}

    for _, CollectedObject in ipairs(getgc()) do 
        if type(CollectedObject) == "function" and getfenv(CollectedObject).script == Script then 
            table.insert(DumpedFunctions, CollectedObject) 
        end 
    end 

    return DumpedFunctions
end 

return ScriptDumper = {}
