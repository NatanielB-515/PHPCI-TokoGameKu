-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2022 at 04:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `head` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `text_color` enum('text-dark','text-light') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `product_id`, `image`, `head`, `content`, `text_color`) VALUES
(4, 13, '7b49e4c971502d6f52044f0370a5a642.jpg', 'God Of War', 'A journey that forces Kratos and Atreus to work together as they face the dangerous Norse wilds', 'text-light'),
(5, 4, 'c1eae742a9b67b1de8f9634ad7d41964.png', 'Assasins\'s Creeds Valhalla', 'Become Eivor, a legendary Viking raider on a quest for glory.', 'text-light'),
(6, 11, 'c5e08764c1c585be7d38cac2c0857794.png', 'FINAL FANTASY VII REMAKE INTERGRADE', 'FINAL FANTASY VII REMAKE is a bold reimagining of the original FINAL FANTASY VII', 'text-light');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(4, 5, '2020-06-29', '520200629021101', 705000, 'User', 'Tangerang', '123123123', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `orders_id`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(3, 4, 'User', '111222333', 99999999, 'asdfasdfasdf', '23c839ec129597ed7735de78e515120a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `orders_id`, `product_id`, `subtotal`) VALUES
(7, 4, 1, 205000),
(8, 4, 5, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `edition` enum('reguler','premium') NOT NULL,
  `image` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `requirements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `edition`, `image`, `description`, `requirements`) VALUES
(1, 'Assassin\'s Creed Origins', 205000, 'reguler', 'e9e04a74d31b41ab50fdd9adc8e3644a.jpeg', '							<p>							<b>ASSASSIN’S CREED® ORIGINS IS A NEW BEGINNING\r\n</b></p><p>*The Discovery Tour by Assassin’s Creed®: Ancient Egypt is available now as a free update!*\r\n\r\n</p><p>Ancient Egypt, a land of majesty and intrigue, is disappearing in a ruthless fight for power. Unveil dark secrets and forgotten myths as you go back to the one founding moment: The Origins of the Assassin’s Brotherhood.\r\n</p><p><b>\r\n</b></p><p><b><br></b></p><p><b>A COUNTRY TO DISCOVER</b>\r\n</p><p>Sail down the Nile, uncover the mysteries of the pyramids or fight your way against dangerous ancient factions and wild beasts as you explore this gigantic and unpredictable land.\r\n</p><p><br></p><p><b>\r\nA NEW STORY EVERY TIME YOU PLAY</b>\r\n</p><p>Engage into multiple quests and gripping stories as you cross paths with strong and memorable characters, from the wealthiest high-born to the most desperate outcasts.\r\n</p><p><br></p><p><b>\r\nEMBRACE ACTION-RPG</b>\r\n</p><p>Experience a completely new way to fight. Loot and use dozens of weapons with different characteristics and rarities. Explore deep progression mechanics and challenge your skills against unique and powerful bosses.						</p>						', '							<p>							<u>MINIMUM CONFIGURATION\r\n</u></p><p>\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)</p><p>PROCESSOR: Intel Core i5-2400s @ 2.5 GHz or AMD FX-6350 @ 3.9 GHz or equivalent\r\n</p><p>\r\nVIDEO CARD: NVIDIA GeForce GTX 660 or AMD R9 270 (2048 MB VRAM with Shader Model 5.0 or better)\r\n\r\n</p><p>SYSTEM RAM: 6GB\r\n\r\nResolution: 720p\r\n\r\nVideo Preset: Lowest\r\n\r\n</p><p><br></p><p><u>RECOMMENDED CONFIGURATION\r\n</u></p><p>\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)\r\n</p><p>\r\nPROCESSOR: Intel Core i7- 3770 @ 3.5 GHz or AMD FX-8350 @ 4.0 GHz</p><p>\r\n\r\nVIDEO CARD: NVIDIA GeForce GTX 760 or AMD R9 280X (3GB VRAM with Shader Model 5.0 or better)\r\n\r\n</p><p>SYSTEM RAM: 8GB\r\n\r\nResolution: 1080p\r\n\r\nVideo Preset: High						</p>						'),
(2, 'Watch Dogs 2', 689000, 'premium', '0bec5d1f29f69666db24000bffe6c21c.jpeg', '														<p>							Use hacking as a weapon in the massive & dynamic open world of Watch Dogs 2.\r\n\r\nIn 2016, ctOS 2.0, an advanced operating system networking city infrastructure, was implemented in several US cities to create a safer, more efficient metropolis.\r\nPlay as Marcus Holloway, a brilliant young hacker living in the birthplace of the tech revolution, the San Francisco Bay Area. </p><p>Team up with Dedsec, a notorious group of hackers, and expose the hidden dangers of ctOS 2.0, which, in the hands of corrupt corporations, is being wrongfully used to monitor and manipulate citizens on a massive scale.\r\nWith the power of hacking and Dedsec by your side, launch the Hack of the Century, take down ctOS 2.0 and give freedom back to whom it belongs: the people.\r\n\r\nFeatures\r\n</p><p><b><br></b></p><p><b>WELCOME TO THE SAN FRANCISCO BAY AREA</b></p><p>\r\nExplore a massive and dynamic open-world offering an incredible variety of gameplay possibilities. Hack your way through traffic while you engage in dangerous car chases through the winding streets of San Francisco, traverse the rooftops of the colorful & vibrant neighborhoods of Oakland, and infiltrate the cutting edge offices of Silicon Valley companies. There are many secrets to uncover in the birthplace of the tech revolution.\r\n</p><p>\r\n</p><p><b><br></b></p><p><b>HACKING IS YOUR WEAPON\r\n</b></p><p>Hack into the city’s infrastructure, every connected device, and everyone’s personal database. Take control of drones, cars, cranes, security robots, and much more. Hack your enemies and bystanders alike– manipulate them in different ways to trigger unpredictable chains of events. Every person, any vehicle they might drive, any connected device they possess can be hacked.\r\n\r\n</p><p><b><br></b></p><p><b>YOU ARE IN CTRL</b>\r\n</p><p>Use hacking and stealth to complete missions without killing a single enemy or combine hacking and your weapons for a more ferocious approach. Develop different skills to suit your playstyle, and upgrade your hacker tools – RC cars, Quadcopter drones, 3D printed weapons and much more.\r\n\r\n</p><p><br></p><p><b>SEAMLESSLY CONNECT WITH FRIENDS</b>\r\n</p><p>Stay connected to your friends with a brand new seamless multiplayer experience that includes both Co-op and Player vs. Player activities, all available in a shared open world experience.\r\n\r\n</p><p><br></p><p><b>PUT YOUR EYES IN CTRL</b>\r\n</p><p>Get the upper hand with Tobii Eye Tracking. Let your gaze aid you in weaponizing the “internet of things”, aim at enemies and take cover while you naturally explore the environment. Combine the extensive eye tracking feature set to pinpoint enemies, interact with your surroundings, locate shelter points, and rapidly select hackable targets. Let your vision lead the hacking of the city’s digital brain.						</p>												', '														<p>							<u>RECOMMENDED\r\n</u></p><p>OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions only)\r\n</p><p>PROCESSOR: Intel Core i5 3470 @ 3.2 GHz, AMD FX 8120 @ 3.9 GHz\r\n</p><p>VIDEO CARD: NVIDIA GeForce GTX 780 | AMD Radeon R9 290, with 3GB VRAM or better - See supported List*\r\n</p><p>SYSTEM RAM: 8 GB\r\nHARD DRIVE: 50 GB\r\n</p><p>SOUND CARD: DirectX-compatible using the latest drivers</p><p>\r\nDVD-ROM DRIVE: DVD-ROM Dual Layer\r\n</p><p>DIRECT X: DirectX End-User Runtimes (June 2010)\r\nPERIPHERALS: Microsoft Xbox One Controller, DUALSHOCK® 4 Controller, Windows-compatible keyboard, mouse, optional controller\r\nMULTIPLAYER: 256 kbps or faster broadband connection						</p>												'),
(3, 'Anno 1800', 1149000, 'premium', '6c5746e5c0ce7de3934fe445296678c2.jpg', '																																																	<p>							Enhance your Anno 1800 experience with the Complete Edition including the following digital content:\r\n\r\nAnno 1800 - Full Game\r\n\r\n</p><p>Season 2 Pass, which includes 3 upcoming DLCs:\r\n</p><p>• Seat of Power: Show off the power of your city with a prestigious palace and government departments that can boost your economy with a variety of policies.\r\n<br>• Bright Harvest: Bring the wonders of mechanized farming to the countryside as you boost the efficiency of your farms with tractors and more.<br>\r\n• Land of Lions: Travel to the Southern continent and join forces with an embattled Emperor to bring life to the desert using a new irrigation system.\r\n\r\nAnd 3 exclusive ornaments\r\n\r\nSeason 1 Pass, which includes The Sunken Treasure, Botanica and The Passage DLCs						</p>																																										', '																																																	<p>							<u>MINIMUM\r\n</u></p><p>Minimum specifications – 1080p Low Preset @30 FPS\r\n\r\n</p><p>CPU: Intel i5-2500K - 3.3 Ghz, AMD FX 6350 - 3.9 Ghz              \r\n\r\nGPU: Nvidia GTX 660 - 2GB, AMD Radeon R7 260X - 2GB\r\n\r\n</p><p>RAM: 8GB\r\n\r\n \r\n\r\nMinimum specifications – 1080p Low Preset @60 FPS\r\n\r\n</p><p>CPU: Intel i5-4460 - 3.2 Ghz, AMD Ryzen3 1200 - 3.1 Ghz              \r\n\r\n</p><p>GPU: Nvidia GTX 670 - 2GB, AMD Radeon R9 270X - 2GB\r\n\r\n</p><p>RAM: 8GB\r\n\r\n \r\n\r\n</p><p><br></p><p><u>RECOMMENDED\r\n</u></p><p>Recommended specifications – 1080p High Preset @30 FPS</p><p>\r\n\r\nCPU: Intel i5-4690K - 3.5 Ghz, AMD Ryzen5 1400 - 3.2 Ghz            \r\n\r\n</p><p>GPU: Nvidia GTX 770 - 4GB, AMD Radeon R9 285 - 2GB\r\n\r\n</p><p>RAM: 8GB\r\n\r\n \r\n\r\nRecommended specifications – 1080p High Preset @60 FPS\r\n\r\n</p><p>CPU: Intel i5-4690K - 3.5 Ghz, AMD Ryzen5 1500X - 3.5 Ghz         \r\n</p><p>GPU: Nvidia GTX 970 - 4GB, AMD Radeon R9 290X - 4GB\r\n\r\n</p><p>RAM: 8GB						</p>																																										'),
(4, 'Assassin\'s Creed Valhalla', 700000, 'reguler', '5599c625eccbd1d806389bfde0de05b8.jpg', '														<p>Become Eivor, a legendary Viking raider on a quest for glory. Explore\r\n England\'s Dark Ages as you raid your enemies, grow your settlement, and\r\n build your political power.</p>\r\n\r\n<p>\r\n• Lead epic Viking raids against Saxon fortresses throughout England.<br>\r\n• Dual-wield powerful weapons and relive the visceral fighting style of the Vikings.<br>\r\n• Challenge yourself with the most varied collection of enemies ever found in Assassin\'s Creed.<br>\r\n• Shape the growth of your character with every choice you make and carve your path to glory.<br>\r\n• Explore a Dark Age open world, from the harsh shores of Norway to the beautiful kingdoms of England.<br>\r\n</p>\r\n\r\n\r\n\r\n<p><strong>THE GAME</strong><br>\r\n• Copy of the Ultimate Edition of <strong>Assassin’s Creed Valhalla</strong>, including the following digital content.<br></p>\r\n\r\n<p><strong>THE SEASON PASS</strong><br>\r\nExtend your experience with the<strong> Season Pass*</strong>:<br>\r\n• Get access to epic new content, explore new lands and discover new gear.<br>\r\n• Enjoy an immersive Story Mission, available at Launch.\r\n </p>\r\n\r\n<strong>THE ULTIMATE PACK</strong><br>\r\n\r\nStrike fear into the hearts of your enemies, dominate raids and rivers with the set of items included in the <strong>Ultimate Pack*</strong>: <br>\r\n• <strong>The Berserker Gear Pack </strong>includes the Bearded Axe, the\r\n Ursine Guard Light Shield, a new skin for your Raven, the ferocious \r\nHati Wolf Mount and the Berserker Set for Eivor.<br>\r\n• <strong>The Berserker Longship Pack</strong> includes a majestic Longship which comes with a unique figurehead and a set of new sails. <br>\r\n• <strong>The Berserker Settlement Pack </strong>includes new ways to customise your settlement in England.<br>\r\n• <strong>A Set of Runes </strong>to sharpen the weapons or improve the gear of your choice.												', '														<p>							<u>MINIMUM CONFIGURATION\r\n</u></p><p>\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)</p><p>PROCESSOR: Intel Core i5-2400s @ 2.5 GHz or AMD FX-6350 @ 3.9 GHz or equivalent\r\n</p><p>\r\nVIDEO CARD: NVIDIA GeForce GTX 660 or AMD R9 270 (2048 MB VRAM with Shader Model 5.0 or better)\r\n\r\n</p><p>SYSTEM RAM: 6GB\r\n\r\nResolution: 720p\r\n\r\nVideo Preset: Lowest\r\n\r\n</p><p><br></p><p><u>RECOMMENDED CONFIGURATION\r\n</u></p><p>\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)\r\n</p><p>\r\nPROCESSOR: Intel Core i7- 3770 @ 3.5 GHz or AMD FX-8350 @ 4.0 GHz</p><p>\r\n\r\nVIDEO CARD: NVIDIA GeForce GTX 760 or AMD R9 280X (3GB VRAM with Shader Model 5.0 or better)\r\n\r\n</p><p>SYSTEM RAM: 8GB\r\n\r\nResolution: 1080p\r\n\r\nVideo Preset: High						</p>												'),
(5, 'Far Cry 5', 500000, 'reguler', 'a96635de0dbca905689a25ee673f7dcb.jpg', '																												<h3><span style=\"color:null;\">Product Description<span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></h3>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Seventeen\r\n years after a global nuclear catastrophe, civilization re-emerges from \r\nthe chaos to find a world dramatically changed. In Hope County, Montana,\r\n the remaining populace has gathered into different groups, each with \r\ntheir own rules for survival. </span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">In\r\n this new world order, the vicious Highwaymen, led by twin sisters \r\nMickey and Lou, travel from place to place bleeding people dry of all \r\navailable resources. As the Survivors try to defend their lands against \r\nthe </span><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\">Highwaymen\'s relentless onslaught, </span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">it\'s up to you to come to their aid and lead the fight. </span><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-CA\"><span style=\"font-variant:small-caps\"></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">In the latest installment of the award-winning Far Cry franchise,</span><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\">\r\n you are the last line of defense in a transformed, post-apocalyptic \r\nHope County. Help the community of Survivors grow stronger, craft a \r\nmakeshift arsenal through Turf Wars and cross-country Expeditions, and \r\nform unexpected alliances to fight for survival in a dangerous new \r\nfrontier.</span><span style=\"font-size:9.0pt\" lang=\"EN-US\"><span style=\"font-family:\'Arial\',sans-serif\"></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt; text-align: justify;\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\"></span><span style=\"font-size:9.0pt\" lang=\"EN-US\"><span style=\"font-family:\'Arial\',sans-serif\"></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Stratum1 Regular\',sans-serif\" lang=\"EN-US\"></span><span style=\"font-size:9.0pt\" lang=\"EN-US\"><span style=\"font-family:\'Arial\',sans-serif\"></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0cm 0cm 0.0001pt\"> </p>\r\n\r\n<h3 style=\"text-align: justify; margin: 0cm 0cm 0.0001pt;\"><span style=\"color:null;\">Key Features</span></h3>\r\n\r\n<p><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">FIGHT FOR SURVIVAL IN A BREATHTAKING POST-APOCALYPTIC WORLD</span></b></span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:Symbol\" lang=\"EN-US\"></span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Sprawling\r\n superbloom fields and dense overgrowth invite you into a wildly \r\nbeautiful yet deadly post-apocalyptic landscape, to discover on your own\r\n or with a friend in two player co-op.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:Symbol\" lang=\"EN-US\"></span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Wildlife has not gone untouched by the disaster, with some predators evolving rugged natural defenses.</span></span></span></span></li></ul>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">UNFORGETTABLE CHARACTERS COLLIDE WITH A RELENTLESS DOUBLE THREAT</span></b> </span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Clash\r\n with the brutal Highwaymen and their unruly leaders Mickey and Lou. \r\nKnown as The Twins, these sisters combine brains and brawn to give their\r\n army an iron grip on Hope County\'s precious resources.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Recruit\r\n an eclectic cast of Guns and Fangs for Hire to fight by your side. \r\nThese new allies, as well as some familiar faces, each bring unique and \r\ncritical skills to the fray.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Find the former doomsday cult and seek out the charismatic leader who prophesized the collapse of civilization: Joseph Seed.</span></span></span></span></li></ul>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">GROW THE SURVIVORS TO BUILD UP YOUR HOMEBASE</span></b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Specialists join the Survivors to help you craft</span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">\r\n weapons and vehicles, train your Guns for Hire, and even go on \r\nExpeditions from the eight Homebase facilities: the workbench, training \r\ncamp, explosives lab, infirmary, garage, healing garden, cartography, \r\nand expeditions. </span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Grow your community and upgrade your Homebase to improve your facilities and unlock more powerful weapons and gear. </span></span></span></span></li></ul>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></b></span></span></span></p>\r\n\r\n<p style=\"margin:0cm 0cm 0.0001pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">BATTLE FOR RESOURCES IN HOPE COUNTY AND BEYOND</span></b><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></p>\r\n\r\n<ul><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Engage\r\n the Highwaymen in Turf Wars by clearing their outposts and then \r\nscavenging them for Ethanol and other materials. When the Highwaymen \r\nreturn with stronger reinforcements, you can take on a greater challenge\r\n for even more of these valuable resources.</span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">For\r\n the first time in Far Cry, the adventure is not just local. Venture \r\noutside of Hope County on thrilling Expeditions to unique and memorable \r\nlocations across the USA including wetlands, canyons, and coastal \r\nregions.</span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\"></span></span></span></span></li><li style=\"margin:0cm 0cm 0.0001pt 36pt\"><span style=\"color:null;\"><span style=\"font-size:10pt\"><span style=\"font-family:\'Times New Roman\',serif\"><span style=\"font-family:Symbol\" lang=\"EN-US\"></span><span style=\"font-family:\'Arial\',sans-serif\" lang=\"EN-US\">Expeditions\r\n and Outposts are different every playthrough, for rewarding missions \r\nthat increase in challenge and are surprising every time. </span></span></span></span></li></ul>																								', '																												<div class=\"section-content requirements-min\">\r\n                <h3>MINIMUM CONFIGURATION:</h3>\r\n\r\n<ul><li><font style=\"color:#bcbcbc;\">OPERATING SYSTEM: </font>Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions only)</li><li><font style=\"color:#bcbcbc;\">PROCESSOR: </font>Intel Core i5 2400 @ 3.1 GHz or AMD FX 6350 @ 3.9 GHz</li><li><font style=\"color:#bcbcbc;\">RAM: </font>8GB</li><li><font style=\"color:#bcbcbc;\">VIDEO CARD: </font>NVIDIA GeForce GTX 670 (2GB) or AMD Radeon R9 270X (2GB) or better</li><li><font style=\"color:#bcbcbc;\">RESOLUTION: </font>720p</li><li><font style=\"color:#bcbcbc;\">VIDEO PRESET: </font>Low</li><li><font style=\"color:#bcbcbc;\">DIRECTX: </font>June2010 Redistributable</li><li><font style=\"color:#bcbcbc;\">SOUND: </font>DirectX 9.0c compatible sound card with latest drivers</li><li><font style=\"color:#bcbcbc;\">HARD DRIVE: </font>30 GB available space</li><li><font style=\"color:#bcbcbc;\">PERIPHERALS: </font>Windows-compatible keyboard, mouse, headset</li></ul>\r\n\r\n<p> </p>\r\n            </div>\r\n        \r\n\r\n        \r\n            \r\n                <h3>RECOMMENDED CONFIGURATION:</h3>\r\n\r\n<ul><li><font style=\"color:#bcbcbc;\">OPERATING SYSTEM: </font>Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions only)</li><li><font style=\"color:#bcbcbc;\">PROCESSOR: </font>Intel Core i7-4790 @ 3.6 GHz or AMD Ryzen 5 1600 @ 3.2 GHz</li><li><font style=\"color:#bcbcbc;\">RAM: </font>8GB</li><li><font style=\"color:#bcbcbc;\">VIDEO CARD: </font>NVIDIA GeForce GTX 970 (4GB) or AMD Radeon R9 290X (4GB) or better</li><li><font style=\"color:#bcbcbc;\">RESOLUTION: </font>1080p</li><li><font style=\"color:#bcbcbc;\">VIDEO PRESET: </font>High</li><li><font style=\"color:#bcbcbc;\">DIRECTX: </font>DirectX June2010 Redistributable</li><li><font style=\"color:#bcbcbc;\">SOUND: </font>DirectX 9.0c compatible sound card with latest drivers</li><li><font style=\"color:#bcbcbc;\">HARD DRIVE: </font>30 GB available space</li><li><font style=\"color:#bcbcbc;\">PERIPHERALS: </font>Windows-compatible keyboard, mouse, headset <br></li></ul>																								'),
(11, 'FINAL FANTASY VII REMAKE INTERGRADE', 830000, 'premium', 'db330f2ddd0e00bc6d6d2ea4e7f56b12.png', '																					<strong>STORY</strong>\r\n<br>\r\nBy exploiting mako, the life-blood of the planet, through their mako reactors, the Shinra Electric Power Company has all but seized control of the entire world. A ragtag group of idealists, known as Avalanche, are one of the last bastions of resistance.<br>\r\n\r\nCloud, an elite SOLDIER operative-turned-mercenary takes part in an Avalanche operation to destroy Mako Reactor 1 in the city of Midgar.\r\nThe bombing plunges the city into fiery chaos, and Cloud is tormented by visions of a bitter enemy long thought dead.<br>\r\n\r\nOnce more begins a story that will shape the destiny of an entire world.<br>\r\n<br>\r\n* This game is a remake of FINAL FANTASY VII, first released in 1997.<br>\r\nThe first title in a multi-part series, it is based on the story from the original game, up to the escape from Midgar, adding in new elements.\r\nCloud, an elite SOLDIER operative-turned-mercenary takes part in an Avalanche operation to destroy Mako Reactor 1 in the city of Midgar.\r\nThe bombing plunges the city into fiery chaos, and Cloud is tormented by visions of a bitter enemy long thought dead.<br>\r\n\r\nOnce more begins a story that will shape the destiny of an entire world.<br>\r\n<br>\r\nFF7R EPISODE INTERmission (New episode featuring Yuffie Kisaragi)<br>\r\n\r\nFF7R EPISODE INTERmission is a brand-new adventure in the world of FINAL FANTASY VII REMAKE INTERGRADE. Play as Wutaian ninja Yuffie Kisaragi as she infiltrates Midgar and conspires with Avalanche HQ to steal the ultimate materia from the Shinra Electric Power Company.<br>\r\n<br>\r\n<strong>Content included in this product</strong><br>\r\n\r\nFINAL FANTASY VII REMAKE INTERGRADE contains the following content:<br>\r\n- FINAL FANTASY VII REMAKE full game<br>\r\n- DLC \"FF7R EPISODE INTERmission\" (New episode featuring Yuffie Kisaragi)<br>\r\n- Weapon: Cacstar<br>\r\n- Armor: Midgar Bangle<br>\r\n- Armor: Shinra Bangle<br>\r\n- Armor: Corneo Armlet<br>\r\n- Accessory: Superstar Belt<br>\r\n- Accessory: Mako Crystal<br>\r\n- Accessory: Seraphic Earrings<br>\r\n- Summon materia: Carbuncle<br>\r\n- Summon materia: Chocobo Chick<br>\r\n- Summon materia: Cactuar<br>\r\n<br>\r\n*The additional weapons, armor, accessories and summon materia can be obtained from the Gift Box on the main menu.<br>\r\n*The weapon \"Cacstar\" can only be used in FF7R EPISODE INTERmission (Yuffie episode)<br>\r\n																						', '														<p>							<u>MINIMUM CONFIGURATION\r\n</u></p><p>\r\nOS: Windows® 10 64-bit (ver. 2004 or later)</p><p>AMD FX-8350 / Intel® Core™ i5-3330\r\n</p><p>\r\nVIDEO CARD: AMD Radeon™ RX 480 / NVIDIA® GeForce® GTX 780 / 3GB VRAM required\r\n\r\n</p><p>8 GB RAM\r\n\r\nResolution: 720p\r\n\r\n</p><p><br></p><p><u>RECOMMENDED CONFIGURATION\r\n</u></p><p>\r\nOS: Windows® 10 64-bit (ver. 2004 or later)\r\n</p><p>\r\nPROCESSOR: AMD Ryzen™ 3 3100 / Intel® Core™ i7-3770</p><p>\r\n\r\nVIDEO CARD: AMD Radeon™ RX 5700 / NVIDIA® GeForce® GTX 1080 / 8GB VRAM required\r\n</p><p>SYSTEM RAM: 12GB\r\n\r\nResolution: 1080p\r\n\r\nVideo Preset: High						</p>																	'),
(12, 'Terraria', 150000, 'premium', '95b7c68e58c114d20c37ff80f8287a6b.jpg', 'Dig, Fight, Explore, Build: The very world is at your fingertips as you fight for survival, fortune, and glory. Will you delve deep into cavernous expanses in search of treasure and raw materials with which to craft ever-evolving gear, machinery, and aesthetics? Perhaps you will choose instead to seek out ever-greater foes to test your mettle in combat? Maybe you will decide to construct your own city to house the host of mysterious allies you may encounter along your travels?<br>\r\n<br>\r\nIn the World of Terraria, the choice is yours!<br>\r\n<br>\r\nBlending elements of classic action games with the freedom of sandbox-style creativity, Terraria is a unique gaming experience where both the journey and the destination are completely in the player’s control. The Terraria adventure is truly as unique as the players themselves!<br>\r\n<br>\r\nAre you up for the monumental task of exploring, creating, and defending a world of your own?<br>\r\n<br>\r\nKey features:<br>\r\nSandbox Play<br>\r\nRandomly generated worlds<br>\r\nFree Content Updates', 'REQUIRED<br>\r\nOS: Windows Xp, Vista, 7, 8/8.1, 10<br>\r\nProcessor: 2.0 Ghz<br>\r\nMemory: 2.5GB<br>\r\nHard Disk Space: 200MB<br>\r\nVideo Card: 128mb Video Memory, capable of Shader Model 2.0+<br>\r\nDirectX®: 9.0c or Greater<br>\r\n<br>\r\nRECOMMENDED<br>\r\nOS: Windows 7, 8/8.1, 10<br>\r\nProcessor: Dual Core 3.0 Ghz<br>\r\nMemory: 4GB<br>\r\nHard Disk Space: 200MB<br>\r\nVideo Card: 256mb Video Memory, capable of Shader Model 2.0+<br>\r\nDirectX®: 9.0c or Greater'),
(13, 'God Of War', 529000, 'reguler', '5289ea55a850de08047ce426a8e69ae0.jpg', '							Enter the Norse realm<br>\r\nHis vengeance against the Gods of Olympus years behind him, Kratos now lives as a man in the realm of Norse Gods and monsters. It is in this harsh, unforgiving world that he must fight to survive… and teach his son to do the same.<br>\r\n<br>\r\nGrasp a second chance<br>\r\nKratos is a father again. As mentor and protector to Atreus, a son determined to earn his respect, he is forced to deal with and control the rage that has long defined him while out in a very dangerous world with his son.<br>\r\n<br>\r\nJourney to a dark, elemental world of fearsome creatures<br>\r\nFrom the marble and columns of ornate Olympus to the gritty forests, mountains and caves of pre-Viking Norse lore, this is a distinctly new realm with its own pantheon of creatures, monsters and gods.<br>\r\n<br>\r\nEngage in visceral, physical combat<br>\r\nWith an over the shoulder camera that brings the player closer to the action than ever before, fights in God of War™ mirror the pantheon of Norse creatures Kratos will face: grand, gritty and grueling. A new main weapon and new abilities retain the defining spirit of the God of War series while presenting a vision of conflict that forges new ground in the genre.						', '							MINIMUM:<br>\r\nRequires a 64-bit processor and operating system<br>\r\nOS: Windows 10 64-bit<br>\r\nProcessor: Intel i5-2500k (4 core 3.3 GHz) or AMD Ryzen 3 1200 (4 core 3.1 GHz)<br>\r\nMemory: 8 GB RAM<br>\r\nGraphics: NVIDIA GTX 960 (4 GB) or AMD R9 290X (4 GB)<br>\r\nDirectX: Version 11<br>\r\nStorage: 70 GB available space<br>\r\nAdditional Notes: DirectX feature level 11_1 required<br>\r\n<br>\r\nRECOMMENDED:<br>\r\nRequires a 64-bit processor and operating system<br>\r\nOS: Windows 10 64-bit<br>\r\nProcessor: Intel i5-6600k (4 core 3.5 GHz) or AMD Ryzen 5 2400 G (4 core 3.6 GHz)<br>\r\nMemory: 8 GB RAM<br>\r\nGraphics: NVIDIA GTX 1060 (6 GB) or AMD RX 570 (4 GB)<br>\r\nDirectX: Version 11<br>\r\nStorage: 70 GB available space<br>\r\nAdditional Notes: DirectX feature level 11_1 required<br>						');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$I52FUe8oEeyXPw8y6olwD.m12vecYpd0FiS66r2iN08cOiRmHE.I6', '1'),
(5, 'user', 'user@gmail.com', '$2y$10$pdl1pLYi305EZ4WGc1BnfeboLPY/sTS4JJd3TbC9edOH.KPzAPtLe', '2'),
(6, 'Nataniel Blesyova', 'nataniel515@gmail.com', '$2y$10$RZHzSAr05lIs/V5c4hkjAuEa5jnMw9pEydLpvh0X0KCCkJYuohxcC', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
