local HttpService = game:GetService("HttpService")

local function MapObjectsToDatatypes(Objects)
    local DataTypeMapping = {}

    for i, Object in ipairs(Objects) do 
        local ObjectDataType = typeof(Object)
        -- An array is required as two objects with the same name, or datatype would override each other if a dictionary was used
        table.insert(DataTypeMapping, i, {
        --    Datatype = ObjectDataType,
            Name = Object 
        })
    end 

    return DataTypeMapping
end 


local ScriptProfile = {}

function ScriptProfile.Compare(Reference, Comparee)
    
end 

function ScriptProfile.Build(Script)
    local Profile = {}

    local function DumpScript(ScriptClosure, Dump)
        local ClosureProtoypes = debug.getprotos(ScriptClosure)
    
        for _, Prototype in ipairs(ClosureProtoypes) do 
            local PrototypeName = debug.info(Prototype, "n")
            
            Dump[PrototypeName] = {}
    
            local PrototypeUpvalues = debug.getupvalues(Prototype)
            local PrototypeConstants = debug.getconstants(Prototype)
            local NestedProtos = debug.getprotos(Prototype)
            
            Dump[PrototypeName] = {
                Upvalues = MapObjectsToDatatypes(PrototypeUpvalues),
                Constants = MapObjectsToDatatypes(PrototypeConstants)
            }
            
            if #NestedProtos >= 1 then 
                -- Proto has more protos inside it
                -- Search that nested proto
    
                for _, NestedProto in ipairs(NestedProtos) do 
                    local NestedProtoName = debug.info(NestedProto, "n")
                    
                    Dump[PrototypeName][NestedProtoName] = {}
                    DumpScript(NestedProto, Dump[PrototypeName][NestedProtoName])
                end 
    
            end 
        end 

    end

    DumpScript(getscriptclosure(Script), Profile)
    return Profile
end 

return ScriptProfile 
