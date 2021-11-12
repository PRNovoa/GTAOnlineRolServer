Config = {}

Config.Locale = 'es'

Config.serverLogo = 'https://i.imgur.com/TYHFNw9.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.voice = {

	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	
	keys = {
		distance 	= '~',
	}
}


Config.vehicle = {
	speedUnit = 'KMH',
	maxSpeed = 400,

	keys = {
		onoffEngine	= 'Z',
								-- N7 VehicleLock
		seatbelt 	= 'K',
		cruiser		= 'CAPS',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.ui = {
	showServerLogo		= true,

	showJob		 		= true,
	showJob2		 	= true,

	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= true,
	showSocietyMoney	= true,
	showSociety2Money	= false,

	showDate 			= false,
	showLocation 		= true,
	showVoice	 		= true,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= true,
	showHunger 			= true,
	showThirst	 		= true,

	showMinimap			= true,

	showWeapons			= true,	
}