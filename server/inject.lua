local Chars = {}
local didPlayerLoad = {}
local resourceNames = {}
local resourceTokens = {}
local initComplete = false

for Loop = 0, 255 do
	Chars[Loop+1] = string.char(Loop)
end

local String = table.concat(Chars)

local Built = {['.'] = Chars}

local AddLookup = function(CharSet)
	local Substitute = string.gsub(String, '[^'..CharSet..']', '')
	local Lookup = {}
	for Loop = 1, string.len(Substitute) do
		Lookup[Loop] = string.sub(Substitute, Loop, Loop)
	end
	Built[CharSet] = Lookup

	return Lookup
end

function string.random(Length, CharSet)
	local CharSet = CharSet or '.'
	if CharSet == '' then
		return ''
	else
		local Result = {}
		local Lookup = Built[CharSet] or AddLookup(CharSet)
		local Range = #Lookup

		for Loop = 1,Length do
			Result[Loop] = Lookup[math.random(1, Range)]
		end

		return table.concat(Result)
	end
end

function init()
	if blubAC.VerboseServer then
		print("[blubAC] Tokenizor Active")
	end
	math.randomseed(os.time())
	TriggerEvent('blubAC:serverReady')
end

function initNewPlayer(source)
	if didPlayerLoad[source] == nil or resourceNames[source] == nil then
		didPlayerLoad[source] = false
		resourceNames[source] = {}
	end
end

function isTokenUnique(token)
	if #resourceNames > 0 then
		for i=1, #resourceNames, 1 do
			if resourceNames[i] ~= nil then
				for id,resource in pairs(resourceNames[i]) do
					if resource == token then
						if blubAC.VerboseServer then
							print("[blubAC] Token collision, generating new token.")
						end
						return false
					end
				end
			end
		end
		for resource,storedToken in pairs(resourceTokens) do
			if storedToken == token then
				if blubAC.VerboseServer then
					print("[blubAC] Token collision, generating new token.")
				end
				return false
			end
		end
	end
	return true
end

function generateToken()
	math.randomseed(os.time())
	local token = string.random(Config.TokenLength, Config.TokenCharset)
	while not isTokenUnique(token) do
		token = string.random(Config.TokenLength, Config.TokenCharset)
	end
	return string.random(Config.TokenLength, Config.TokenCharset)
end

function getObfuscatedEvent(source, resourceName)
	initNewPlayer(source)
	if resourceNames[source][resourceName] == nil then
		resourceNames[source][resourceName] = generateToken()
		if blubAC.VerboseServer then
			print("[blubAC] Obfuscated Event for Player ID " .. tostring(source) .. ": Original - " .. tostring(resourceName) .. " Obfuscated - "  .. tostring(resourceNames[source][resourceName]))
		end
	end
	return(resourceNames[source][resourceName])
end

function getResourceToken(resourceName)
	return resourceTokens[resourceName]
end

function setupServerResource(resource)
	resourceTokens[resource] = generateToken()
	if blubAC.VerboseServer then
		print("[blubAC] Generated token for resource " .. tostring(resource) .. ": " .. tostring(resourceTokens[resource]))
	end
	AddEventHandler('blubAC:playerLoaded', function(player)
		local _source = player
		if blubAC.VerboseServer then
			print("[blubAC] Sending token for " .. tostring(resource) .. " (Event: " .. tostring(getObfuscatedEvent(_source, resource)) .. " Token: " .. tostring(resourceTokens[resource]) .. ") to Player ID " .. tostring(_source) .. ".")
		end
		TriggerClientEvent(getObfuscatedEvent(_source, resource), _source, resourceTokens[resource])
	end)
end

function secureServerEvent(resource, player, token)
	local _source = player
	if resourceTokens[resource] == nil then
		return true
	elseif _source == "" then -- If the request came from the server, then no need to authenticate the token
		return true 
	else
		if blubAC.VerboseServer then
			print("[blubAC] Validating token for " .. tostring(resource) .. " for Player ID " .. tostring(_source) .. ". Provided: " .. tostring(token) .. " Stored: " .. tostring(resourceTokens[resource]))
		end
		if token ~= resourceTokens[resource] then
			if blubAC.VerboseServer then
				print("[blubAC] Invalid token detected! Resource: " .. tostring(resource) .. ", Player ID: " .. tostring(_source) .. ". Provided: " .. tostring(token) .. " Stored: " .. tostring(resourceTokens[resource]))
			end
			if Config.CustomAction then
				Config.CustomActionFunction(_source)
			else
				DropPlayer(_source, Config.KickMessage)
			end
			return false
		end
	end
	return true
end

RegisterNetEvent('blubAC:requestObfuscation')
AddEventHandler('blubAC:requestObfuscation', function(resourceName, id)
	local _source = source
	TriggerClientEvent('blubAC:obfuscateReceived', _source, id, getObfuscatedEvent(_source, resourceName))
end)

RegisterNetEvent('blubAC:playerSpawned')
AddEventHandler('blubAC:playerSpawned', function()
	local _source = source
	initComplete = true
	
	initNewPlayer(_source)
	
	if not didPlayerLoad[_source] then
		didPlayerLoad[_source] = true
		if blubAC.VerboseServer then
			print("Player ID " .. tostring(_source) .. " loaded.")
		end
		TriggerEvent('blubAC:playerLoaded', _source)
	else
		print("[blubAC] Player ID " .. tostring(_source) .. " requested another security token, potential cheater?")
	end
end)

AddEventHandler('onServerResourceStart', function (resource)
    if resource == GetCurrentResourceName() then
        init()
    elseif resourceTokens[resource] ~= nil and initComplete then
		if blubAC.VerboseServer then
			print("[blubAC] NOTICE: " .. resource .. " was restarted and is no longer protected with security tokens!")
		end
		resourceTokens[resource] = nil
	end
end)

AddEventHandler("playerDropped", function(player, reason)
	local _source = source
	if blubAC.VerboseServer then
		print("[blubAC] Player ID " .. tostring(_source) .. " dropped, purged obfuscated events.")
	end
    didPlayerLoad[_source] = false
	resourceNames[_source] = {}
end)
