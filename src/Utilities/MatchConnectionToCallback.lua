return function(Connections, Callback)
    for _, Connection in ipairs(Connections) do 
        if Connection.Function == Callback then 
            return Connection
        end 
    end
end 
