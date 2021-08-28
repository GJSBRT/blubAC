blubAC = {}

blubAC.License = "blub-7359-7049-8570-7365-8514" -- enter your license key here. NEEDED TO START ANTICHEAT!
blubAC.Email = "---" -- Enter your email address here. used for if an error occures

blubAC.BanPlayers = true -- If false, Anticheat only logs in Discord
blubAC.VerboseServer = false -- Debug mode client side THIS SHOULD BE DISABLED IN PRODUCTION AS IT EXPOSES TOKENS

blubAC.UseESX = true -- Do you use ESX?
blubAC.ESXTrigger = "esx:getSharedObject" -- Put your ESX Object Trigger Right Here
blubAC.MaxTransferAmount = 1000000 -- ADJUST THIS

-- Discord Webhooks here :)
blubAC.GeneralBanWebhook = "aaa"
blubAC.EntitiesWebhookLog = "aaa"
blubAC.ExplosionWebhookLog = "aaa"

-- Misc Protections
blubAC.ExplosionProtection = true
blubAC.AntiGiveorRemoveWeapons = true
blubAC.AntiBlacklistedWords = true
blubAC.AntiBlacklistedTriggers = true
blubAC.AntiClearPedTasks = true
blubAC.AntiFakeChatMessages = true
blubAC.AntiVPN = false -- May not work on all hosting providers
blubAC.ReloadBanListTime = 600000 -- 10 Mins

blubAC.MaxPedsPerUser = 3
blubAC.MaxPropsPerUser = 100
blubAC.MaxVehiclesPerUser = 5
blubAC.MaxEntitiesPerUser = 100
blubAC.MaxParticlesPerUser = 3

blubAC.BlacklistedWeapons = {
	"WEAPON_HAMMER"
}

blubAC.BlacklistedWords = {
	"bad words"
}

blubAC.BlacklistedTriggers = {
	"redst0nia:checking",
	"esx_mafiajob:confiscatePlayerItem",
	"lscustoms:payGarage",
	"vrp_slotmachine:server:2",
	"esx_fueldelivery:pay",
	"esx_carthief:pay",
	"esx_godirtyjob:pay",
	"esx_pizza:pay",
	"esx_ranger:pay",
	"esx_truckerjob:pay",
	"AdminMenu:giveBank",
	"AdminMenu:giveCash",
	"esx_gopostaljob:pay",
	"esx_banksecurity:pay",
	"esx_slotmachine:sv:2",
	"esx_billing:sendBill",
	"esx_jail:sendToJail",
	"esx_jailer:sendToJail",
	"NB:recruterplayer",
	"js:jailuser",
	"esx-qalle-jail:jailPlayer",
	"OG_cuffs:cuffCheckNearest",
	"cuffServer",
	"cuffGranted",
	"esx_mechanicjob:startCraft",
	"esx_drugs:startHarvestWeed",
	"esx_drugs:startTransformWeed",
	"esx_drugs:startSellWeed",
	"esx_drugs:startHarvestCoke",
	"esx_drugs:startTransformCoke",
	"esx_drugs:startSellCoke",
	"esx_drugs:startHarvestMeth",
	"esx_drugs:startTransformMeth",
	"esx_drugs:startSellMeth",
	"esx_drugs:startHarvestOpium",
	"esx_drugs:startSellOpium",
	"esx_drugs:startTransformOpium",
	"esx_blanchisseur:startWhitening",
	"esx_drugs:stopHarvestCoke",
	"esx_drugs:stopTransformCoke",
	"esx_drugs:stopSellCoke",
	"esx_drugs:stopHarvestMeth",
	"esx_drugs:stopTransformMeth",
	"esx_drugs:stopSellMeth",
	"esx_drugs:stopHarvestWeed",
	"esx_drugs:stopTransformWeed",
	"esx_drugs:stopSellWeed",
	"esx_drugs:stopHarvestOpium",
	"esx_drugs:stopTransformOpium",
	"esx_drugs:stopSellOpium",
	"esx_tankerjob:pay",
	"esx_vehicletrunk:giveDirty",
	"gambling:spend",
	"AdminMenu:giveDirtyMoney",
	"mission:completed",
	"truckerJob:success",
	"99kr-burglary:addMoney",
	"esx_jailer:unjailTime",
	"esx_ambulancejob:revive",
	"DiscordBot:playerDied",
	"hentailover:xdlol",
	"antilynx8:anticheat",
	"antilynx8:crashuser",
	"antilynxr6:detection",
	"antilynx8r4a:anticheat",
	"antilynxr4:detect",
	"antilynxr4:crashuser1",
	"js:jailuser", 
	"ynx8:anticheat",
	"lynx8:anticheat",
	"shilling=yet7",
	"adminmenu:allowall",
	"h:xd",
	"esx_skin:responseSaveSkin",
	"ljail:jailplayer",
	"adminmenu:setsalary",
	"adminmenu:cashoutall",
	"HCheat:TempDisableDetection",
	"esx_drugs:pickedUpCannabis",
	"esx_drugs:processCannabis",
	"esx-qalle-hunting:reward",
	"esx-qalle-hunting:sell",
	"esx_mecanojob:onNPCJobCompleted",
	"BsCuff:Cuff696999",
	"veh_SR:CheckMoneyForVeh",
	"mellotrainer:adminTempBan",
	"mellotrainer:adminKick",
	"d0pamine_xyz:getFuckedNigger",
	"esx_communityservice:sendToCommunityService",
	"InteractSound_SV:PlayOnAll",
	"InteractSound_SV:PlayWithinDistance",
	"crown_xyz:getFuckedNigger",
	"esx:clientLog",
	"kashactersS:DeleteCharacter",
	"lscustoms:UpdateVeh",
	"NB:destituerplayer",
	"esx_vangelico_robbery:robberycomplete",
	"esx_vangelico_robbery:gioielli",
	"esx_policejob:requestarrest",
}

blubAC.BlockedExplosions = {
	0,
	1,
	2,
	3,
	4,
	5,
	25,
	32,
	33,
	35,
	36,
	37,
	38
}

blubAC.BlacklistedModels = {}

blubAC.WhitelistedProps = {
	"prop_ballistic_shield"
}
