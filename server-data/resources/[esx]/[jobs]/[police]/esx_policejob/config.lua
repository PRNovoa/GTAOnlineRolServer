Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	intendent = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	chef = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_MACHINEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 },
		{ weapon = 'WEAPON_SMG', price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 15000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 20000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 5000 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 1500 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {

	},

	recruit = {
		{ model = 'gnr_rtwizy', label = 'Entrenamientos', price = 1 },
		{ model = 'police', label = 'Volkswagen Arteon', price = 1 },
		{ model = 'policet', label = 'Furgoneta', price = 1 },
		{ model = 'polgs350', label = 'Lexus GS350', price = 1 },
		{ model = 'policeb', label = 'Patrulla Motorizada', price = 1 },
	},

	officer = {
		{ model = 'gnr_rtwizy', label = 'Entrenamientos', price = 1 },
		{ model = 'police2', label = 'Mercedes AMG', price = 1 },
		{ model = 'policet', label = 'Furgoneta', price = 1 },
		{ model = 'polgs350', label = 'Lexus GS350', price = 1 },
		{ model = 'policeb', label = 'Patrulla Motorizada', price = 1 },
	},

	sergeant = {
		{ model = 'gnr_rtwizy', label = 'Entrenamientos', price = 1 },
		{ model = 'police3', label = 'BMW M5', price = 1 },
		{ model = 'policet', label = 'Furgoneta', price = 1 },
		{ model = 'polgs350', label = 'Lexus GS350', price = 1 },
		{ model = 'policeb', label = 'Patrulla Motorizada', price = 1 },
	},

	intendent = {
		{ model = 'pbus', label = 'Practicas Policiales', price = 1 },
		{ model = 'police4', label = 'Audi A4', price = 1 },
		{ model = 'policet', label = 'Furgoneta', price = 1 },
		{ model = 'ghispo2', label = 'Masserati', price = 1 },
		{ model = 'policeb', label = 'Patrulla Motorizada', price = 1 },
	},

	lieutenant = {
		{ model = 'pbus', label = 'Practicas Policiales', price = 1 },
		{ model = 'police4', label = 'Audi A4', price = 1 },
		{ model = 'policet', label = 'Furgoneta', price = 1 },
		{ model = 'ghispo2', label = 'Masserati', price = 1 },
		{ model = 'policeb', label = 'Patrulla Motorizada', price = 1 },
	},

	chef = {
		{ model = 'riot', label = 'Unidad Blindada', price = 1 },
		{ model = 'sato', label = 'Blindado', price = 1 },
		{ model = 'riot2', label = 'Antidisturbios', price = 1 },
		{ model = 'hmmwv', label = 'Blindado 2', price = 1 },
		{ model = 'fbi', label = 'Secreta', price = 1 },
		{ model = 'fbi2', label = 'CNI Director', price = 1 },
		{ model = 'sheriff2', label = 'Secreta 2', price = 1 },
		{ model = 'polgs350', label = 'Lexus GS350', price = 1 },
		{ model = 'ghispo2', label = 'Masserati', price = 1 },
		{ model = 'hcbr500rgn', label = 'Patrulla Motorizada', price = 1 },
		{ model = 'pol718', label = 'UPR Porsche', price = 1 },
		{ model = 'hellcat', label = 'Dodge Charger', price = 1 },
	},

	boss = {
		{ model = 'riot', label = 'Unidad Blindada', price = 1 },
		{ model = 'sato', label = 'Blindado', price = 1 },
		{ model = 'riot2', label = 'Antidisturbios', price = 1 },
		{ model = 'hmmwv', label = 'Blindado 2', price = 1 },
		{ model = 'fbi', label = 'Secreta', price = 1 },
		{ model = 'fbi2', label = 'CNI Director', price = 1 },
		{ model = 'sheriff2', label = 'Secreta 2', price = 1 },
		{ model = 'polgs350', label = 'Lexus GS350', price = 1 },
		{ model = 'ghispo2', label = 'Masserati', price = 1 },
		{ model = 'hcbr500rgn', label = 'Patrulla Motorizada', price = 1 },
		{ model = 'pol718', label = 'UPR Porsche', price = 1 },
		{ model = 'hellcat', label = 'Dodge Charger', price = 1 },
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 }},

	intendent = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 }},

	lieutenant = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 }
	},

	chef = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 }
	},

	boss = {
		{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 1 },
		{ model = 'cargobob', label = 'Transporte', livery = 0, price = 1 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 13,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 2,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		}
	},

}