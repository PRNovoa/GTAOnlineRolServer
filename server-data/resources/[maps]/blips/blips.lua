local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

	--  {name="Tequilala", colour=7, id=93, x = -564.91, y = 276.28, z = 83.12},
	--  {name="Local - Moteros", colour=6, id=93, x = 981.86, y = -103.19, z = 74.85},
     {name="Strip Club", colour=27, id=121, x = 128.95, y = -1298.96, z = 29.23},
   {name="Iglesia Don Jesus", colour=21, id=40, x = -790.27, y = -7.95, z = 40.77},
   {name="Black Bar", colour=40, id=40, x = 210.36, y = -924.86, z = 30.69}
	--  {name="Zonas residenciales - Clase media", colour=38, id=374, x = -1054.45, y = -1025.23, z = 2.13},
	--  {name="Zonas residenciales - Clase baja", colour=5, id=374, x = 160.55, y = -1881.47, z = 23.85},
  --    {name="Zonas residenciales - Clase alta", colour=1, id=374, x = 1130.47, y = -506.38, z = 64.26}
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)