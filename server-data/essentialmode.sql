CREATE DATABASE IF NOT EXISTS `essentialmode`;
USE `essentialmode`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Concessionnaire', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_police', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Concesionnaire', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glovebox_inventory`
--

CREATE TABLE `glovebox_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `data` text COLLATE utf8mb4_bin NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `glovebox_inventory`
--

INSERT INTO `glovebox_inventory` (`id`, `plate`, `data`, `owned`) VALUES
(1, ' MENYOO ', '{}', 0),
(3, '00FDA415', '{}', 0),
(9, 'YHX 164 ', '{\"money\":[{\"amount\":1500}]}', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `rare` tinyint(4) NOT NULL DEFAULT '0',
  `can_remove` tinyint(4) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `price`) VALUES
('100gbag', 'Ziploc Bag[100g]', 20, 0, 1, 0),
('1gbag', 'Ziploc Bag[1g]', 20, 0, 1, 0),
('50gbag', 'Ziploc Bag[50g]', 20, 0, 1, 0),
('5gbag', 'Ziploc Bag[5g]', 20, 0, 1, 0),
('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, 0, 1, 0),
('WEAPON_ADVANCEDRIFLE_AMMO', 'Advanced Rifle Ammo', 1, 0, 1, 0),
('WEAPON_APPISTOL', 'AP Pistol', 1, 0, 1, 0),
('WEAPON_APPISTOL_AMMO', 'AP Pistol Ammo', 1, 0, 1, 0),
('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, 0, 1, 0),
('WEAPON_ASSAULTRIFLE_AMMO', 'Assault Rifle Ammo', 1, 0, 1, 0),
('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 0, 1, 0),
('WEAPON_ASSAULTSHOTGUN_AMMO', 'Assault Shotgun Ammo', 1, 0, 1, 0),
('WEAPON_ASSAULTSMG', 'Assault SMG', 1, 0, 1, 0),
('WEAPON_ASSAULTSMG_AMMO', 'Assault SMG Ammo', 1, 0, 1, 0),
('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, 0, 1, 0),
('WEAPON_AUTOSHOTGUN_AMMO', 'Auto Shotgun Ammo', 1, 0, 1, 0),
('WEAPON_BAT', 'Baseball Bat', 1, 0, 1, 0),
('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, 0, 1, 0),
('WEAPON_CARBINERIFLE_AMMO', 'Carbin Rifle Ammo', 1, 0, 1, 0),
('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, 0, 1, 0),
('WEAPON_COMBATPISTOL_AMMO', 'Combat Pistol Ammo', 1, 0, 1, 0),
('WEAPON_FLASHLIGHT', 'Flashlight', 1, 0, 1, 0),
('WEAPON_KNIFE', 'Knife', 100, 1, 1, 0),
('WEAPON_PISTOL', 'Pistol', 1, 0, 1, 0),
('WEAPON_PISTOL_AMMO', '9mm Rounds', 1, 0, 1, 0),
('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 0, 1, 0),
('WEAPON_PUMPSHOTGUN_AMMO', 'Pump Shotgun Ammo', 1, 0, 1, 0),
('WEAPON_SMG', 'SMG', 1, 0, 1, 0),
('WEAPON_SMG_AMMO', 'Shotgun Shells', 1, 0, 1, 0),
('WEAPON_STUNGUN', 'Taser', 100, 1, 1, 0),
('beer', 'Beer', 20, 0, 1, 0),
('binocular', 'Binoculars', 20, 0, 1, 0),
('blowtorch', 'Blowtorch', 20, 0, 1, 0),
('bread', 'Pan', 1, 0, 1, 0),
('cashew', 'Cashew', 20, 0, 1, 0),
('chips', 'Chips', 20, 0, 1, 0),
('chocolate', 'Chocolate', 20, 0, 1, 0),
('cigarette', 'Cigarette', 20, 0, 1, 0),
('cocacola', 'Coca-Cola', 20, 0, 1, 0),
('cupcake', 'Cupcake', 20, 0, 1, 0),
('drill', 'Drill', 20, 0, 1, 0),
('drpepper', 'Dr Pepper', 20, 0, 1, 0),
('drugscales', 'Scales', 20, 0, 1, 0),
('energy', 'Energy Drink', 20, 0, 1, 0),
('fixkit', 'Fix Kit', 20, 0, 1, 0),
('gps', 'GPS', 20, 0, 1, 0),
('grand_cru', 'Champagne', 20, 0, 1, 0),
('hamburger', 'Hamburger', 20, 0, 1, 0),
('highgradefert', 'Fertilizer [high]', 20, 0, 1, 0),
('icetea', 'Ice-Tea', 20, 0, 1, 0),
('lemonade', 'Lemonade', 20, 0, 1, 0),
('lighter', 'Lighter', 20, 0, 1, 0),
('lockpick', 'Lockpick', 20, 0, 1, 0),
('lowgradefert', 'Fertilizer [low]', 20, 0, 1, 0),
('phone', 'Phone', 20, 0, 1, 0),
('pistachio', 'Pistachio', 20, 0, 1, 0),
('plantpot', 'Plant Pot', 20, 0, 1, 0),
('rollingpaper', 'Rolling Paper', 20, 0, 1, 0),
('sandwich', 'Sandwich', 20, 0, 1, 0),
('scubagear', 'Scuba Gear', 20, 0, 1, 0),
('tequila', 'Tequila', 20, 0, 1, 0),
('vodka', 'Vodka', 20, 0, 1, 0),
('water', 'Agua', 1, 0, 1, 0),
('whisky', 'Whisky', 20, 0, 1, 0),
('wine', 'Wine', 20, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('cardealer', 'Concessionnaire'),
('police', 'LSPD'),
('unemployed', 'En el paro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Hola', 200, '{}', '{}'),
(2, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(3, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(4, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(5, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(6, 'police', 0, 'recruit', 'Recluta', 20, '{}', '{}'),
(7, 'police', 1, 'officer', 'Oficial', 40, '{}', '{}'),
(8, 'police', 2, 'sergeant', 'Sargento', 60, '{}', '{}'),
(9, 'police', 3, 'lieutenant', 'General', 85, '{}', '{}'),
(10, 'police', 4, 'boss', 'Comandante', 100, '{}', '{}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jsfour_criminalrecord`
--

CREATE TABLE `jsfour_criminalrecord` (
  `offense` varchar(160) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `institution` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `charge` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `term` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `classified` int(2) NOT NULL DEFAULT '0',
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `warden` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `jsfour_criminalrecord`
--

INSERT INTO `jsfour_criminalrecord` (`offense`, `date`, `institution`, `charge`, `description`, `term`, `classified`, `identifier`, `dob`, `warden`) VALUES
('E-806', '2020-06-24', 'Bolingbroke', 'Robbery', 'Robbed a civilian', '1Y 6M', 1, 'c6bc95fc384b577c2c0a269bbd6cd0314f89f896', '03/30/1997', 'Eren'),
('F-275', '2020-06-24', 'Bolingbroke', 'Robbery', 'Robbed a civilian', '1Y 6M 0D', 0, 'c6bc95fc384b577c2c0a269bbd6cd0314f89f896', '03/30/1997', 'Eren');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jsfour_criminaluserinfo`
--

CREATE TABLE `jsfour_criminaluserinfo` (
  `identifier` varchar(160) COLLATE utf8mb4_bin NOT NULL,
  `aliases` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `recordid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `eyecolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `haircolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `jsfour_criminaluserinfo`
--

INSERT INTO `jsfour_criminaluserinfo` (`identifier`, `aliases`, `recordid`, `weight`, `eyecolor`, `haircolor`, `firstname`, `lastname`, `dob`, `sex`, `height`) VALUES
('c6bc95fc384b577c2c0a269bbd6cd0314f89f896', 'EREN', 'E140F499', '52kg', 'black', 'black', 'EREN', 'JAEGER', '03/30/1997', 'm', '83cm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
('c6bc95fc384b577c2c0a269bbd6cd0314f89f896', 'YHX 164', '{\"model\":-344943009,\"plate\":\"YHX 164\"}', 'car', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `data` text COLLATE utf8mb4_bin NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `trunk_inventory`
--

INSERT INTO `trunk_inventory` (`id`, `plate`, `data`, `owned`) VALUES
(1, ' MENYOO ', '{}', 0),
(9, 'YHX 164 ', '{\"money\":[{\"amount\":27000}]}', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateofbirth` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `money` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `accounts` longtext COLLATE utf8mb4_bin,
  `inventory` longtext COLLATE utf8mb4_bin,
  `loadout` longtext COLLATE utf8mb4_bin,
  `permission_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`identifier`, `license`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `job`, `job_grade`, `money`, `bank`, `skin`, `status`, `position`, `accounts`, `inventory`, `loadout`, `permission_level`) VALUES
('c6bc95fc384b577c2c0a269bbd6cd0314f89f896', NULL, 'superadmin', 'Eren', 'Jaeger', '03/30/1997', 'm', 83, 'police', 4, NULL, NULL, '{\"eyebrows_3\":0,\"skin\":0,\"moles_2\":0,\"glasses_2\":0,\"complexion_1\":0,\"bproof_1\":0,\"hair_color_2\":0,\"bracelets_1\":-1,\"beard_3\":0,\"moles_1\":0,\"shoes_2\":0,\"ears_2\":0,\"arms\":0,\"sun_1\":0,\"age_2\":0,\"eyebrows_4\":0,\"eyebrows_1\":0,\"chest_3\":0,\"bags_2\":0,\"chain_2\":0,\"watches_1\":-1,\"makeup_1\":0,\"face\":0,\"complexion_2\":0,\"sex\":0,\"hair_2\":3,\"lipstick_4\":0,\"decals_2\":0,\"beard_4\":0,\"pants_1\":0,\"blemishes_1\":0,\"blush_2\":0,\"lipstick_3\":0,\"decals_1\":0,\"makeup_4\":0,\"chest_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"age_1\":0,\"bodyb_1\":0,\"beard_1\":0,\"torso_1\":3,\"helmet_2\":0,\"sun_2\":0,\"lipstick_1\":0,\"makeup_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"eye_color\":0,\"hair_1\":5,\"makeup_3\":0,\"arms_2\":0,\"helmet_1\":-1,\"shoes_1\":0,\"bracelets_2\":0,\"chest_2\":0,\"torso_2\":0,\"blush_1\":0,\"beard_2\":0,\"chain_1\":0,\"glasses_1\":0,\"tshirt_1\":0,\"bproof_2\":0,\"tshirt_2\":5,\"hair_color_1\":0,\"ears_1\":-1,\"blush_3\":0,\"lipstick_2\":0,\"bodyb_2\":0,\"mask_1\":0,\"bags_1\":0,\"pants_2\":0}', '[]', '{\"y\":-847.6,\"x\":305.4,\"heading\":93.4,\"z\":29.1}', '{\"money\":963500,\"bank\":4420100,\"black_money\":0}', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1, 'dmv', 'c6bc95fc384b577c2c0a269bbd6cd0314f89f896'),
(2, 'drive', 'c6bc95fc384b577c2c0a269bbd6cd0314f89f896');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Adder', 'adder', 900000, 'super'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indices de la tabla `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indices de la tabla `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indices de la tabla `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jsfour_criminalrecord`
--
ALTER TABLE `jsfour_criminalrecord`
  ADD PRIMARY KEY (`offense`);

--
-- Indices de la tabla `jsfour_criminaluserinfo`
--
ALTER TABLE `jsfour_criminaluserinfo`
  ADD PRIMARY KEY (`identifier`);

--
-- Indices de la tabla `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indices de la tabla `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indices de la tabla `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indices de la tabla `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `firstname` (`firstname`);

--
-- Indices de la tabla `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indices de la tabla `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

--
-- ROLELEVEL SQL
--

CREATE TABLE `rolevotes` (
	`id` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id),
	`emisor` VARCHAR(40),
	`receptor` VARCHAR(40),
	`tiempo` BIGINT,
	`voto` FLOAT,
	`justificacion` VARCHAR(160)
);

ALTER TABLE `users` ADD `rolelevel` FLOAT NULL DEFAULT 0;