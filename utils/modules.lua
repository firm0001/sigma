local Modules = {}

function Modules:New(className, properties)
    local instance = Instance.new(className)
    if properties then
        for key, value in pairs(properties) do
            instance[key] = value
        end
    end
    return instance
end

function Modules:Connect(eventname, callback, id)
    local event = Utilities.Event[eventname]
    if not event then 
        return Error:Log("Event '" .. eventname .. "' does not exist.") 
    end

    local success, connection
    if typeof(event) == "RBXScriptSignal" then
        success, connection = pcall(function() return event:Connect(callback) end)
    elseif typeof(event) == "Instance" and (event:IsA("BindableEvent") or event:IsA("Changed")) then
        success, connection = pcall(function() return event.Event:Connect(callback) end)
    else
        return Error:Log("Unsupported event type: '" .. eventname .. "'")
    end

    if success and connection then
        connections[id] = connection
    else
        Error:Log("Failed to establish connection for '" .. eventname .. "'")
    end
end

return Modules
