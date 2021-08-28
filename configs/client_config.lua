blubAC = {}
blubAC.Enable = true
blubAC.MainAnticheat = true


--==START OF TOKENIZER CONFIG

blubAC.VerboseClient = false -- Debug mode client side THIS SHOULD BE DISABLED IN PRODUCTION AS IT EXPOSES TOKENS

blubAC.TokenLength = 24

--[[
	Define the character set to be used in generation
	%a%d = all capital and lowercase letters and digits
	Syntax:
		.	all characters
		%a	letters
		%c	control characters
		%d	digits
		%l	lower case letters
		%p	punctuation characters
		%s	space characters
		%u	upper case letters
		%w	alphanumeric characters
		%x	hexadecimal digits
		%z	the character with representation 0
--]]
blubAC.TokenCharset = "%a%d"

--[[
	Adjust the delay between when the client deploys the listeners and
	when the server sends the information.
	250 seems like a sweet spot here, but it can be reduced or increased if desired.
]]

blubAC.ClientDelay = 250

--[[
	Define the message given to users with an invalid token
--]]
blubAC.KickMessage = "Invalid security token detected."

--[[
	Define a custom function to trigger when a player is kicked
	If blubAC.CustomAction is false, the player will be dropped
]]
blubAC.CustomAction = true
blubAC.CustomActionFunction = function(source)
	TriggerServerEvent('DFEdsgDSGsdG', source)
end
--==END OF TOKENIZER CONFIG

blubAC.UseESX = true
blubAC.ESXTrigger = "esx:getSharedObject" -- If you use ESX, put the trigger right here
blubAC.CheckPlayersMoney = true

blubAC.MaxResourceNameLength = 50 -- Change this to a higher value if you get banned while entering the server, you can also change the resources that have a long name...

blubAC.GodModeProtection = true
blubAC.AntiSpectate = true
blubAC.AntiSpeedHacks = true
blubAC.AntiBoomDamage = true
blubAC.PlayerProtection = true
blubAC.AntiBlacklistedWeapons = true
blubAC.AntiVDM = true

blubAC.AntiDamageModifier = true
blubAC.AntiThermalVision = true
blubAC.AntiNightVision = true
blubAC.AntiResourceStartorStop = true
blubAC.AntiCommandInjection = false -- If you can get in the server while this is "true" perfect. Otherwise just disable it.
blubAC.AntiLicenseClears = true

blubAC.AntiCInjection = true
blubAC.BlackListedCMD = {
	"kill"
}

blubAC.DisableVehicleWeapons = true
blubAC.AntiKeyboardNativeInjections = true
blubAC.AntiCheatEngine = true
blubAC.AntiNoclip = false
blubAC.AntiRadar = false
blubAC.AntiRagdoll = false
blubAC.AntiInvisible = true
blubAC.AntiExplosiveBullets = true
blubAC.AntiBlips = true
blubAC.AntiInfiniteAmmo = true
blubAC.AntiPedChange = true
blubAC.AntiVehicleModifiers = true
blubAC.AntiSuperJump = true
blubAC.AntiFreeCam = false -- Set to false if you have a scripts which takes control of the camera like a clothing script
blubAC.DeleteBrokenCars = true
blubAC.ClearPedsAfterDetection = true
blubAC.ClearObjectsAfterDetection = true
blubAC.ClearVehiclesAfterDetection = true
blubAC.AntiMenyoo = true
blubAC.AntiPedRevive = false
blubAC.AntiSuicide = false -- This isn't perfectly working, if normal players get banned because of this, disable it.
blubAC.AntiGiveArmour = true
blubAC.AntiFlyandVehicleBelowLimits = true 

blubAC.AntiVehicleSpawn = false
blubAC.GarageList = { -- Place all of the garage coordinates right here.
	{x = 217.89, y = -804.99, z = 30.91},
	{x=217.04, y=-909.73, z=18.32},
}

blubAC.HospitalCoords = vector3(293.11,-582.1,43.19) -- Put here the hospital coords or the coords where the player respawns after dying

blubAC.BlacklistedWeapons = {}




