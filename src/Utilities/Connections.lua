local function GetInstanceConnections(Instance, ConnectionType)
    return getconnections(Instance[ConnectionType])
end 

local Connections = {}

function Connections.DisableConnections(...)
    local Connections = GetInstanceConnections(...)

    for _, Connection in ipairs(Connections) do 
        Connection:Disable()
    end 

end 

function Connections.EnableConnections(...)
    local Connections = GetInstanceConnections(...)

    for _, Connection in ipairs(Connections) do 
        Connection:Enable()
    end 

end 

return Connections 
