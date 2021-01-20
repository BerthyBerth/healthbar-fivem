function chat(text, color)
    TriggerEvent(
        "chat:addMessage",
        {
            color,
            multiline = true,
            args = {msg}
        }
    )
end

local display = true

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, false)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

-- cb = callback

RegisterNUICallback("data", function(data, cb)
    chat(data, {0, 0, 255})
end)

RegisterNUICallback("error", function(data, cb)
    chat("[Error] " .. data.error, {255, 0, 0})
end)

Citizen.CreateThread(function()
    while true do
        print("THREADING")
        Citizen.Wait(500)
        SendNUIMessage({
            type = "hb",
            cur_health = GetEntityHealth(GetPlayerPed(-1)),
            max_health = GetEntityMaxHealth(GetPlayerPed(-1))
        })
    end
end)