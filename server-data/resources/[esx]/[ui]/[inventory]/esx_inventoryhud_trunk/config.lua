Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "es"

Config.OpenKey = 170

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Weight = 250000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {
    bandage = 20,
    beer = 330,
    binocular = 250,
    blowpipe = 500,
    blowtorch = 2500,
    bread = 50,
    bulletproof = 2500,
    c4_bank = 10000,
    carokit = 500,
    carotool = 500,
    cashew = 100,
    chips = 75,
    chocolate = 50,
    cigarette = 25,
    cocacola = 330,
    coke = 5,
    coke_pooch = 25,
    colis = 500,
    cupcake = 50,
    drill = 1500,
    drpepper = 330,
    drugscales = 1000,
    energy = 500,
    fixkit = 500,
    fixtool = 500,
    gazbottle = 500,
    gps = 500,
    grand_cru = 150,
    hamburger = 400,
    highgradefert = 1000,
    icetea = 330,
    jewels = 15,
    lemonade = 330,
    letter = 20,
    lighter = 250,
    lockpick = 10,
    lowgradefert = 1000,
    medikit = 500,
    meth = 10,
    meth_pooch = 50,
    opium = 12,
    opium_pooch = 60,
    phone = 200,
    pistachio = 100,
    plantpot = 350,
    raspberry = 50,
    rollingpaper = 25,
    sandwich = 100,
    scubagear = 2500,
    tequila = 50,
    vodka = 50,
    water = 330,
    weed = 40,
    weed_pooch = 200,
    whisky = 150,
    wine = 150,
}

Config.VehicleWeight = {
    [0]     = 150000, --Compact
    [1]     = 250000, --Sedan
    [2]     = 300000, --SUV
    [3]     = 250000, --Coupes
    [4]     = 250000, --Muscle
    [5]     = 200000, --Sports Classics
    [6]     = 200000, --Sports
    [7]     = 100000, --Super
    [8]     = 25000, --Motorcycles
    [9]     = 250000, --Off-road
    [10]    = 500000, --Industrial
    [11]    = 500000, --Utility
    [12]    = 1500000, --Vans
    [13]    = 5000, --Cycles
    [14]    = 150000, --Boats
    [15]    = 1000000, --Helicopters
    [16]    = 500000, --Planes
    [17]    = 250000, --Service
    [18]    = 250000, --Emergency
    [19]    = 350000, --Military
    [20]    = 2500000, --Commercial
    [21]    = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "CNP",
    ambulance = "CRUZROJA",
    mecano = "MECANICO"
}
