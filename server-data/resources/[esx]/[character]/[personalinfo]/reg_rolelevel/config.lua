Config = {}

--#### CONFIGURACIÓN DE ROLELEVEL ####--

-- Cuantas veces más vale el voto de un roleplayer ejemplar respecto al de un novato
Config.Multiplier = 50

-- Puntuación del jugador a partir de la cual su voto vale un 95% o más del máximo, porque es un buen roleplayer
Config.GoodLevel =  200

-- Tiempo entre voto y voto a cualquier persona (en minutos)
Config.TimeBetweenAny = 30

-- Tiempo entre voto y voto a la misma persona (en horas)
Config.TimeBetweenSame = 24

-- Tiempo de vida de los votos guardados en rolevotes (en días, la comprobación para borrar se hace cuando se inicia el servidor)
-- No modificará el rolelevel de los jugadores
Config.VoteTimeLife = 7
-- Se tiene que cumplir que TimeBetweenAny < TimeBetweenSame < VoteTimeLife (en las mismas unidades por supuesto)

-- Distancia máxima entre los jugadores para que el voto sea válido
Config.MaxDistance = 80

-- Permisos para votar
Config.VotePerm = "user"

-- Permisos para ver el rolelevel de cualquier jugador
Config.SeeRoleLevelPerm = "admin"