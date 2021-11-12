Config = {}
Config.Locale = 'es'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},

	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Armory
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	-- Cell 4
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(466.14, -998.4, 24.9),
		textCoords = vector3(466.14, -998.4, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	
	-- Cell 5
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(466.01, -1002.18, 24.9),
		textCoords = vector3(466.01, -1002.18, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell Entrevista
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(482.02, -992.54, 24.9),
		textCoords = vector3(482.02, -992.54, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	-- Cell Entrevista
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(482.09, -988.35, 24.9),
		textCoords = vector3(482.09, -988.35, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

-- Cell Entrevista
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(482.09, -988.35, 24.9),
		textCoords = vector3(482.09, -988.35, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	--  Entrevista 1
	{
		objHash = GetHashKey('v_ilev_ph_gendoor005'),
		objHeading = 0.0,
		objCoords = vector3(477.62, -991.5, 24.9),
		textCoords = vector3(477.62, -991.5, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	--  Entrevista 2
	{
		objHash = GetHashKey('v_ilev_ph_gendoor005'),
		objHeading = 0.0,
		objCoords = vector3(477.44, -988.3, 24.9),
		textCoords = vector3(477.44, -988.3, 24.9),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(482.02, -991.54, 25.0),
		textCoords = vector3(482.02, -991.54, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = false,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1856.6, 3689.46, 34.27),
		textCoords = vector3(1856.6, 3689.46, 34.27),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Vestuario
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objHeading = 30.0,
		objCoords = vector3(1856.79, 3690.03, 34.27),
		textCoords = vector3(1856.79, 3690.03, 34.27),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Cell
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 210.0,
		objCoords = vector3(1844.69, 3688.55, 30.74),
		textCoords = vector3(1844.69, 3688.55, 30.74),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Cell double
	{
		textCoords = vector3(1848.28, 3690.51, 34.27),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor002'), objHeading = 30.0, objCoords  = vector3(1848.8, 3690.76, 34.27)},
			{objHash = GetHashKey('v_ilev_ph_gendoor002'), objHeading = 210.0, objCoords  = vector3(1848.28, 3690.51, 34.27)}
		}
	},
	--OFICINA DOBLE
	{
		textCoords = vector3(1850.63, 3682.8, 34.27),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor002'), objHeading = 298.5, objCoords  = vector3(1851, 3682.5, 34.27)},
			{objHash = GetHashKey('v_ilev_ph_gendoor002'), objHeading = 120.0, objCoords  = vector3(1851, 3683.51, 34.27)}
		}
	},
	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

	--Vestuario
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objHeading = 135.0,
		objCoords = vector3(-450.66, 6016.07, 31.72),
		textCoords = vector3(-450.66, 6016.07, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--puertas en frente al entrar
	{
		textCoords = vector3(-448.64, 6007.6, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ss_door8'), objHeading = 315.0, objCoords  = vector3(-448.1, 6007.17, 31.72)},
			{objHash = GetHashKey('v_ilev_ss_door7'), objHeading = 135.0, objCoords  = vector3(-449.07, 6008.72, 31.72)}
		}
	},
	--Puertas a la izq
	{
		textCoords = vector3(-441.88, 6011.87, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_bk_door2'), objHeading = 225.0, objCoords  = vector3(-442.47, 6011.37, 31.72)},
			{objHash = GetHashKey('v_ilev_bk_door2'), objHeading = 45.0, objCoords  = vector3(-441.26, 6012.39, 31.72)}
		}
	},
	{--Interrogaci�n
	objHash = GetHashKey('v_ilev_cd_entrydoor'),
		objHeading = 10.0,
		objCoords = vector3(-453.86, 6011.52, 31.72),
		textCoords = vector3(-453.86, 6011.52, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Puertas hacia atr�s
	{
		objHash = GetHashKey('v_ilev_gc_door01'),
		objHeading = 315.0,
		objCoords = vector3(-451.44, 6006.55, 31.84),
		textCoords = vector3(-451.44, 6006.55, 31.84),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_gc_door01'),
		objHeading = 135.0,
		objCoords = vector3(-446.73, 6001.90, 31.72),
		textCoords = vector3(-446.73, 6001.90, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--ARMERIA
	{
		objHash = GetHashKey('v_ilev_fingate'),
		objHeading = 315.0,
		objCoords = vector3(-437.05, 5992.3, 31.72),
		textCoords = vector3(-437.05, 5992.3, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Main cell door
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 315.0,
		objCoords = vector3(-432.69, 5992.69, 31.72),
		textCoords = vector3(-432.69, 5992.69, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 315.0,
		objCoords = vector3(-428.44, 5997.14, 31.72),
		textCoords = vector3(-428.44, 5997.14, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 315.0,
		objCoords = vector3(-431.55, 6000.19, 31.72),
		textCoords = vector3(-431.55, 6000.19, 31.72),
		authorizedJobs = {'guardiacivil', 'offguardiacivil'},
		locked = true,
		maxDistance = 1.25
	},
	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'guardiacivil'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'guardiacivil'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	--
	-- Armería Ilegal	
	--

	{
		objHash = GetHashKey('v_ilev_tort_door'),
		objHeading = 291.0,
		objCoords = vector3(2566.95, 4651.89, 34.08),
		textCoords = vector3(2566.95, 4651.89, 34.08),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_tort_door'),
		objHeading = 295.0,
		objCoords = vector3(2555.81, 4651.66, 34.08),
		textCoords = vector3(2555.81, 4651.66, 34.08),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 1.25
	},

	--
	--Lavandería
	--

	{
		textCoords = vector3(-605.69, -1626.62, 33.01),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door1'), objHeading = 175.0, objCoords  = vector3(-605, -1626.39, 33.01)},
			{objHash = GetHashKey('v_ilev_rc_door1'), objHeading = 355.0, objCoords  = vector3(-606.34, -1626.28, 33.01)}
		}
	},

	{
		textCoords = vector3(-624.18, -1624.75, 33.01),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door1'), objHeading = 355.0, objCoords  = vector3(-625.03, -1624.72, 33.01)},
			{objHash = GetHashKey('v_ilev_rc_door1'), objHeading = 175.0, objCoords  = vector3(-623.56, -1624.78, 33.01)}
		}
	},

	--
	--Puerta Banco
	--

	--[[{
		objHash = GetHashKey('hei_v_ilev_bk_gate2_pris'),
		objHeading = 250.0,
		objCoords = vector3(261.89, 221.8, 106.28),
		textCoords = vector3(261.89, 221.8, 106.28),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	}]]

}