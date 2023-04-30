-- Zaphkiel Was Here

QBCore = nil 

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
 end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		PlayerData = QBCore.Functions.GetPlayerData()
	end
end)


RegisterCommand('jobc', function(source, args, rawCommand)
	local msg = rawCommand:sub(6)
	local job = PlayerData.job.name
    TriggerServerEvent('qb-jobChat:chat', job, msg)
end, false)


-- TÜM MESLEKLER İÇİN GEÇERLİ OLMASINI İSTİYORSANIZ BUNU KULLANIN

--RegisterNetEvent('qb-jobChat:Send')
--AddEventHandler('qb-jobChat:Send', function(messageFull, job)
--    if PlayerData.job.name == job then
--		TriggerEvent('chat:addMessage', messageFull)
--    end
--end)

-- SADECE LEGAL MESLEKLER İÇİN GEÇERLİ OLMASINI İSTİYORSANIZ BUNU KULLANIN

RegisterNetEvent('qb-jobChat:Send')
AddEventHandler('qb-jobChat:Send', function(messageFull, job)
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
		TriggerEvent('chat:addMessage', messageFull)
    end
end)
