Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 30     -- old config from orginal script not used in this version.
Config.Locale       = 'en'
Config.BagPay       = 25     -- Pay per bag pulled from bin.
Config.MulitplyBags = true   -- Multiplies BagPay by number of workers - 4 max.
Config.TruckPlateNumb = 0

Config.Trucks = {
	"trash",
	"trash2",
	--"biff",  --took this vehilce out for aesthetics reasons.  Trying to find animation that works throwing the garbage up into the truck.
	--"scrap"
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -321.70, y = -1545.94, z = 30.02},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -316.16, y = -1536.08, z = 26.65},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -328.50, y = -1520.99, z = 27.53},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}
Config.DumpstersAvaialbe = {
    "prop_dumpster_01a",
    "prop_dumpster_02a",
	"prop_dumpster_02b",
	"prop_dumpster_3a",
	"prop_dumpster_4a",
	"prop_dumpster_4b",
	"prop_skip_01a",
	"prop_skip_02a",
	"prop_skip_06a",
	"prop_skip_05a",
	"prop_skip_03",
	"prop_skip_10a"
}


Config.Livraison = {
	-------------------------------------------Los Santos
		-- fleeca
		Delivery1LS = {
				Pos   = {x = 114.83280181885, y = -1462.3127441406, z = 29.295083999634},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
		-- fleeca2
		Delivery2LS = {
				Pos   = {x = -6.0481648445129, y = -1566.2338867188, z = 29.209197998047},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
		-- blainecounty
		Delivery3LS = {
				Pos   = {x = -1.8858588933945, y = -1729.5538330078, z = 29.300233840942},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
		-- PrincipalBank
		Delivery4LS = {
				Pos   = {x = 159.09, y = -1816.69, z = 27.9},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- route68e
		Delivery5LS = {
				Pos   = {x = 358.94696044922, y = -1805.0723876953, z = 28.966590881348},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 250
			},
		--littleseoul
		Delivery6LS = {
				Pos   = {x = 481.36560058594, y = -1274.8297119141, z = 29.64475440979},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
		--grovestreetgas
		Delivery7LS = {
				Pos   = {x = 431.9, y = -1065.45, z = 29.21},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		--fleecacarpark
		Delivery8LS = {
				Pos   = {x = 452.47, y = -1063.23, z = 29.21},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		--Mt Haan Dr Radio Tower
		Delivery9LS = {
				Pos   = {x = 342.78308105469, y = -1036.4720458984, z = 29.194206237793},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
		--Senora Way Fuel Depot
		Delivery10LS = {
				Pos   = {x = 451.97, y = -931.98, z = 28.48},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
	------------------------------------------- 2nd Patrol 
		-- Palomino Noose HQ
		Delivery1BC = {
				Pos   = {x = 474.36, y = -599.86, z = 28.5},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 400
			},
		-- El Burro Oil plain
		Delivery2BC = {
				Pos   = {x = 457.42, y = -549.47, z = 28.5},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- Orchardville ave
		Delivery3BC = {
				Pos   = {x = -381.68, y = 18.05, z = 46.9},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- Elysian Fields
		Delivery4BC = {
				Pos   = {x = 443.96984863281, y = -574.33978271484, z = 28.494501113892},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
	
			-- Carson Ave
		Delivery5BC = {
			Pos   = {x = -1242.53, y = -1358.92, z = 4.06},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 300
		},
	
	
		-- Carson Ave
		Delivery6BC = {
				Pos   = {x = 165.36, y = -1351.93, z = 29.3},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- Dutch London
		Delivery7BC = {
				Pos   = {x = -31.948055267334, y = -93.437454223633, z = 57.249073028564},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- Autopia Pkwy
		Delivery8BC = {
				Pos   = {x = 283.10873413086, y = -164.81878662109, z = 60.060565948486},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- Miriam Turner Overpass
		Delivery9BC = {
				Pos   = {x = 327.36, y = -183.56, z = 57.62},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
		-- Exceptionalist Way
		Delivery10BC = {
				Pos   = {x = 273.99, y = -1498.76, z = 29.29},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 300
			},
			
		RetourCamion = {
				Pos   = {x = -335.26095581055, y = -1529.5614013672, z = 27.565467834473},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 0
			},
		
		AnnulerMission = {
				Pos   = {x = -314.62796020508, y = -1514.5662841797, z = 27.677434921265},
				Color = {r = 204, g = 204, b = 0},
				Size  = {x = 5.0, y = 5.0, z = 3.0},
				Color = {r = 204, g = 204, b = 0},
				Type  = 1,
				Paye = 0
			},
	}
