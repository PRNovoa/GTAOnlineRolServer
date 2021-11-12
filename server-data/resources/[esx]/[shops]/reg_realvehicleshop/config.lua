Config                            = {}
Config.DrawDistance               = 100
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 75

Config.Locale                     = 'es'

Config.LicenseEnable = true -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: '0000 XXX'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateNumbers  = 4
Config.PlateUseSpace = true
Config.PlateLetters  = 3

Config.Blip = {
	Sprite = 326,
	Display = 4,
	Scale = 0.8,
	Colour = 51
}

Config.Zones = {

	ShopEntering = { -- Menu para comprar
		Pos   = vector3(-1164.45, -1708.15, 3.46),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	ShopInside = {  -- Expositor
		Pos     = vector3(-1124.97, -1709.69, 3.46),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 140.0,
		Type    = -1
	},

	ShopOutside = { -- Spawn de vehiculo comprado
		Pos     = vector3(-1135.6, -1717.8, 3.45),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 175.0,
		Type    = -1
	},

	BossActions = { -- Self explanatory
		Pos   = vector3(-1177.08, -1702.66, 4.56),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(-18.2, -1078.5, 25.6),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = { -- Reventa de vehiculo
		Pos   = vector3(-1174.25, -1733.1, 3.46),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = 1
	}

}
