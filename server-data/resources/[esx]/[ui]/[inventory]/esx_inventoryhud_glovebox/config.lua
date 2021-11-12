Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in glovebox.
Config.AllowPolice = true -- If true, police will be able to search players' glovebox.

Config.Locale = "es"

Config.OpenKey = 170

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Weight = 25000

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
    [0]     = 25000,  --Compact
    [1]     = 25000,  --Sedan
    [2]     = 25000,  --SUV
    [3]     = 25000,  --Coupes
    [4]     = 25000,  --Muscle
    [5]     = 25000,  --Sports Classics
    [6]     = 25000,  --Sports
    [7]     = 25000,  --Super
    [8]     = 25000,  --Motorcycles
    [9]     = 25000,  --Off-road
    [10]    = 25000,  --Industrial
    [11]    = 25000,  --Utility
    [12]    = 25000,  --Vans
    [13]    = 25000,  --Cycles
    [14]    = 25000,  --Boats
    [15]    = 25000,  --Helicopters
    [16]    = 25000,  --Planes
    [17]    = 25000,  --Service
    [18]    = 25000,  --Emergency
    [19]    = 25000,  --Military
    [20]    = 25000,  --Commercial
    [21]    = 25000,  --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "police",
    ambulance = "ambulance",
    mecano = "mechano"
}
