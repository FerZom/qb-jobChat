-- Zaphkiel Was Here


TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

function getIdentity(source)
	local steam = GetPlayerIdentifiers(source)[1]
	local result = exports.oxmysql:executeSync("SELECT * FROM players WHERE steam = @steam", {['@steam'] = steam})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			steam = identity['steam'],
			firstname = identity['firstname'],
			lastname = identity['lastname']
		}
	else
		return nil
	end
end

RegisterServerEvent('qb-jobChat:chat')
AddEventHandler('qb-jobChat:chat', function(job, msg)
    local _source = source
    local xPlayers = QBCore.Functions.GetPlayers()
    local pName= getIdentity(source)
	fal = pName.firstname .. " " .. pName.lastname
	jobName = string.upper(job)
	local messageFull = {
        template = '<div style="padding: 10px; margin: 10px; background-color: rgba(31, 62, 87, 1); border-radius: 20px;"><i class="far fa-building"style="font-size:15px"><strong></i style="font-size:20px">  [ {0} ] {1} : {2}</font></i></strong></div>',
        args = {jobName, fal, msg}
    }
    TriggerClientEvent('qb-jobChat:Send', -1, messageFull, job)
end)