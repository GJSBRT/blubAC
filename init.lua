if IsDuplicityVersion() then
	AddEventHandler('blubac_tokenizer:serverReady', function()
		exports['blubac_tokenizer']:setupServerResource(GetCurrentResourceName())
	end)
else
	securityToken = nil
	AddEventHandler('blubac_tokenizer:clientReady', function()
		securityToken = exports['blubac_tokenizer']:setupClientResource(GetCurrentResourceName())
	end)
end
