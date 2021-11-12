Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(733092387596795994)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo_name')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('BLACKLISTRP')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo_name')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/YjntCvt')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)