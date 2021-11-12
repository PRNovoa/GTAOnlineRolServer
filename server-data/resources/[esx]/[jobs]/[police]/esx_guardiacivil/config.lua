Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 5

Config.Locale                     = 'es'

Config.GuardiaCivilStations = {

	SandyShores = {

		Blip = {
			--Coords  = vector3(425.1, -979.5, 30.7),
			Coords = vector3(1848.03, 3689.18, 34.27),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 2
		},

		Cloakrooms = {
			--vector3(452.6, -992.8, 30.6)
			vector3(1858.52, 3693.21, 34.27),
		},

		Armories = {
			--vector3(451.7, -980.1, 30.6)
			vector3(1843.17, 3689.21, 34.27),
		},

		Vehicles = {
			{
				Spawner = vector3(1867.92, 3696.03, 33.58),--primera comisaria que me amarg� la vida
				InsideShop = vector3(1867.16, 3684.36, 33.75),
				SpawnPoints = {
					{coords = vector3(1867.92, 3696.03, 33.58), heading = 209.59, radius = 6.0},
					
				}
			},
		},

		Helicopters = {
			
		},

		BossActions = {
			vector3(1846.98, 3679.57, 34.27)
		}
	},

	Paleto = {

		
		Blip = {
			--Coords  = vector3(425.1, -979.5, 30.7),
			Coords = vector3(-446.17, 6013.29, 31.72),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 2
		},

		Cloakrooms = {
			--vector3(452.6, -992.8, 30.6)
			vector3(-439.93, 5991.93, 31.72)
		},

		Armories = {
			--vector3(451.7, -980.1, 30.6)
			vector3(-437.32, 5989.41, 31.72)
		},

		Vehicles = {
			
			{
				Spawner = vector3(-466.74, 6024.47, 31.34),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(-466.74, 6024.47, 31.34), heading = 250, radius = 6.0},
					{coords = vector3(-466.71, 6014.84, 31.34), heading = 311.54, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-475.31, 5988.47, 31.34),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-475.31, 5988.47, 31.34), heading = 318.01, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-437.83, 5999.7, 31.72)
		}
	}
}

Config.AuthorizedWeapons = {
	alumno = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	cabo = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	sargento = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	suboficial = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	capitan = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	teniente = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	general = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_pistol', components = {0, 0, 1000, 4000, nil}, price = 0},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		alumno = {},

		cabo = {
			{model = 'police3', price = 0}
		},

		sargento = {
			{model = 'police3', price = 0}
		},

		suboficial = {
			{model = 'policet', price = 0},
			{model = 'policeb', price = 0}
		},

		capitan = {
			{model = 'policet', price = 0},
			{model = 'policeb', price = 0}
		},

		teniente = {
			{model = 'riot', price = 0},
			{model = 'fbi2', price = 0}
		},

		general = {
			{model = 'hellcatred', price = 0},
			{model = 'hellcatred', price = 0}
		},

		boss = {
			{model = 'police3', price = 0}
		}
	},

	helicopter = {
		
		alumno = {},

		cabo = {},

		sargento = {},

		suboficial = {},

		capitan = {},

		teniente = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},

		general = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		},

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 0}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	alumno = {},

	cabo = {},

	sargento = {},

	suboficial = {},

	capitan = {},

	teniente = {},

	general = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	alumno = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	cabo = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	sargento = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	suboficial = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	capitan = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 2,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	teniente = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	general = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 2,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 3,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 11,  bproof_2 = 1
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	}
}
