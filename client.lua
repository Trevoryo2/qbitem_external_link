local GUIDE_URL = "YOUR LINK"
local isOpen = false

RegisterNetEvent('myguide:openBook', function()
    if isOpen then return end
    isOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = "open" })
end)

-- We still keep this callback for clean closing
RegisterNUICallback('close', function(_, cb)
    isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ type = "close" })
    cb('ok')
end)

-- Optional: if you want a /guide command too
RegisterCommand('guide', function()
    TriggerEvent('myguide:openBook')
end, false)
