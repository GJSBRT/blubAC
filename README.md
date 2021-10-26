# About
here's some info about this AC. First of all it's not finished. it's a small project for a previous server. It's based on vb ac with some added features, which may not all work. 

If you want to support my work, you can get a server at https://dutchis.net or join my discord https://discord.gg/wMrVGkzjwW



# Permissions
ADMIN BYPASS (INCLUDES ADMIN MENU):
```
add_ace blubacadmin allow 
add_ace identifier.steam:000000000000000 blubacadmin allow
```

ADMIN BYPASS (DOES NOT INCLUDE ADMIN MENU):
```
add_ace blubacbypass allow 
add_ace identifier.steam:000000000000000 blubacbypass allow
```

# COMMANDS:
reloadbans - Reloads bans

blubacinstall - Installs anti-inject

blubacuninstall - Uninstalls anti-inject



# Tokenizor Usage
The security token is stored in a variable named `securityToken` on the client side in each resource. In order to retreive the security token for a given resource, you must include the `init.lua` script in your resource's `__resource.lua` file. The `init.lua` script must be included as both a server and client script:
```lua
server_script '@blubAC/init.lua'
client_script '@blubAC/init.lua'
```

## Client
Once the token is received, it can be passed along with a server event to be validated on the server-side.
```lua
TriggerServerEvent('blubac:testEvent', securityToken)
```

## Server
In order to protect a server event, a simple if statement must be added.
```lua
RegisterNetEvent('blubac:testEvent')
AddEventHandler('blubac:testEvent', function(token)
	if not exports['blubac_tokenizer']:secureServerEvent(GetCurrentResourceName(), source, token) then
		return false
	end
	print("Authenticated")
end)
```
