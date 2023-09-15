-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2023 at 02:20 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 4, 'demo', 'asdasdasd', 1, 1, '2023-07-23 19:47:17', '2023-07-27 21:16:08'),
(11, 4, 'Flowers', 'Blooms of nature, a symphony of beauty and grace.', 1, 0, '2023-07-27 21:17:04', NULL),
(12, 5, 'Indoor Plants', '\"Bringing nature\'s serenity inside, a touch of green for every space.\"', 1, 0, '2023-07-27 21:28:06', NULL),
(13, 4, 'Indoor Potted Plants', '\"Charming potted greens, nature\'s elegance for your indoor scenes.\"', 1, 0, '2023-07-27 21:49:05', '2023-07-27 21:59:29'),
(14, 5, 'Trees', 'Trees are essential for life on Earth, providing oxygen, shelter, and numerous ecological benefits.', 1, 0, '2023-07-31 04:01:43', NULL),
(15, 6, 'Fruit Tree', 'Fruit tree: Nature\'s fruitful gift, bearing delicious rewards.', 1, 0, '2023-07-31 04:17:31', '2023-07-31 04:22:56'),
(16, 6, 'PlantScaping', 'PlantScaping: Elevating spaces through the artful integration of plants and greenery.', 1, 0, '2023-07-31 04:25:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'D', 'Smith', 'Male', '09123456789', 'This is only my sample address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 1, '2022-02-09 13:53:36', '2023-07-27 19:16:14'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 4, 10, 'demo', '&lt;p&gt;klskaskcnsncks&lt;/p&gt;', 2000, 'uploads/products/9.png?v=1690123664', 1, 1, '2023-07-23 19:47:44', '2023-07-27 21:16:19'),
(10, 4, 11, 'Rose', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Shrub&lt;br&gt;\r\nFlowering period: repeated bloomers/spring, fall&lt;br&gt;\r\nDormancy: no, evergreen perennial&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 540, 'uploads/products/10.png?v=1690474768', 1, 0, '2023-07-27 21:19:27', '2023-07-27 21:19:28'),
(11, 4, 11, 'Petunia', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Shrub&lt;br&gt;\r\nFlowering period: Spring&lt;br&gt;\r\nSeasonal Plant&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 810, 'uploads/products/11.png?v=1690474823', 1, 0, '2023-07-27 21:20:23', '2023-07-27 21:20:23'),
(12, 4, 11, 'Hibiscus rosa (Shoe Plant/ China Rose)', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Shrub/Small tree&lt;br&gt;\r\nFlowering period: Bloom usually round the year&lt;br&gt;\r\nDormancy: Evergreen&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 440, 'uploads/products/12.png?v=1690474880', 1, 0, '2023-07-27 21:21:19', '2023-07-27 21:21:20'),
(13, 5, 12, 'Phoenix palm', '&lt;p&gt;&quot;Phoenix palm, an elegant tropical icon with graceful arching fronds.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;12 inch&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 340, 'uploads/products/13.png?v=1690475416', 1, 0, '2023-07-27 21:30:15', '2023-07-27 21:30:16'),
(14, 5, 12, 'Elephanta', '&lt;p&gt;&quot;The Elephanta plant: Majestic leaves that make a statement in any room.&quot;&lt;br&gt;&lt;/p&gt;', 630, 'uploads/products/14.png?v=1690475486', 1, 0, '2023-07-27 21:31:26', '2023-07-27 21:31:26'),
(15, 5, 12, 'Areca palm', '&lt;p&gt;&quot;Elegant and air-purifying, the Areca palm brings tropical vibes to your indoor oasis.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor palms&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 500, 'uploads/products/15.png?v=1690475539', 1, 0, '2023-07-27 21:32:19', '2023-07-27 21:32:19'),
(16, 5, 12, 'Codiaeum', '&lt;p&gt;&quot;Codiaeum, the vibrant artist of the plant world, with its multicolored foliage.&quot;&lt;br&gt;&lt;/p&gt;', 439, 'uploads/products/16.png?v=1690475588', 1, 0, '2023-07-27 21:33:07', '2023-07-27 21:33:08'),
(17, 5, 12, 'Spider plant', '&lt;p&gt;&quot;Graceful arching leaves, the resilient beauty of the Spider plant.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor Natural Air\r\npurifier&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 380, 'uploads/products/17.png?v=1690475687', 1, 0, '2023-07-27 21:34:47', '2023-07-27 21:34:47'),
(18, 5, 12, 'Rhapis palm (lady finger)', '&lt;p&gt;&quot;Elegantly slender, the Rhapis palm exudes a ladylike charm.&quot;&lt;br&gt;&lt;/p&gt;', 390, 'uploads/products/18.png?v=1690475733', 1, 0, '2023-07-27 21:35:33', '2023-07-27 21:35:33'),
(19, 5, 12, 'Scheffella plant', '&lt;p&gt;&quot;Schefflera, a lush and elegant indoor plant with vibrant, umbrella-like leaves.&quot;&lt;br&gt;&lt;/p&gt;', 320, 'uploads/products/19.png?v=1690475771', 1, 0, '2023-07-27 21:36:11', '2023-07-27 21:36:11'),
(20, 5, 12, 'Snake plant (sansevieria)', '&lt;p&gt;&quot;Graceful and hardy, the Snake plant thrives with ease, a perfect green companion.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Other names: Saint\r\nGeorge\'s sword&lt;br&gt;\r\n12 inch size and pot&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 460, 'uploads/products/20.png?v=1690475956', 1, 0, '2023-07-27 21:39:16', '2023-07-27 21:39:16'),
(21, 5, 12, 'Money Plants', '&lt;p&gt;&quot;Money Plants: Lush green guardians of prosperity and good fortune.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;NASA recommended natural\r\nAir purifiers&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 290, 'uploads/products/21.png?v=1690476014', 1, 0, '2023-07-27 21:40:14', '2023-07-27 21:40:14'),
(22, 5, 12, 'Peace lily', '&lt;p&gt;&quot;Elegant and tranquil, the Peace Lily brings harmony to any space.&quot;&lt;br&gt;&lt;/p&gt;', 450, 'uploads/products/22.png?v=1690476188', 1, 0, '2023-07-27 21:43:08', '2023-07-27 21:43:08'),
(23, 5, 12, 'Elephant bush', '&lt;p&gt;&quot;Elephant bush, a resilient succulent with cascading leaves, adding a touch of charm to any space.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor plant&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 230, 'uploads/products/23.png?v=1690476249', 1, 0, '2023-07-27 21:44:09', '2023-07-27 21:44:09'),
(24, 5, 12, 'Aloe vera', '&lt;p&gt;&quot;A soothing succulent, nature\'s remedy for skin and health.&quot;&lt;br&gt;&lt;/p&gt;', 275, 'uploads/products/24.png?v=1690476294', 1, 0, '2023-07-27 21:44:54', '2023-07-27 21:44:54'),
(25, 5, 12, 'Ruscus', '&lt;p&gt;&quot;Ruscus: An evergreen beauty, gracing spaces with its elegant foliage.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;House indoor plants&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 540, 'uploads/products/25.png?v=1690476345', 1, 0, '2023-07-27 21:45:45', '2023-07-27 21:45:45'),
(26, 5, 12, 'Iris', '&lt;p&gt;&quot;Iris: Elegance in every petal, a rainbow of nature\'s artistry.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor natural air\r\npurfier&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 340, 'uploads/products/26.png?v=1690476386', 1, 0, '2023-07-27 21:46:26', '2023-07-27 21:46:26'),
(27, 4, 13, 'Monestra', '&lt;p&gt;&quot;Lush and dramatic, the Monstera stands as a living work of art.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor NASA recommended\r\nplant&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 510, 'uploads/products/27.png?v=1690476607', 1, 0, '2023-07-27 21:50:07', '2023-07-27 21:50:07'),
(28, 4, 13, 'Pony tail', '&lt;p&gt;&quot;Ponytail Palm - A captivating houseplant with cascading foliage and a whimsical charm.&quot;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor beautification\r\nplants&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 435, 'uploads/products/28.png?v=1690477421', 1, 0, '2023-07-27 22:03:40', '2023-07-27 22:03:41'),
(29, 5, 14, 'Cassia Fistula (Amaltas)', '&lt;p&gt;Cassia Fistula, also known as Amaltas, is a flowering tree with golden-yellow blossoms used for medicinal and ornamental purposes.&lt;br&gt;&lt;/p&gt;', 1500, 'uploads/products/29.png?v=1690758232', 1, 0, '2023-07-31 04:03:52', '2023-07-31 04:03:52'),
(30, 5, 14, 'Bottle Brush', '&lt;p&gt;&quot;Bottle Brush (Callistemon) is a flowering shrub known for its cylindrical, brush-like flower spikes.&quot;&lt;br&gt;&lt;/p&gt;', 2100, 'uploads/products/30.png?v=1690758281', 1, 0, '2023-07-31 04:04:41', '2023-07-31 04:04:41'),
(31, 5, 14, 'Alstonia (Devil tree)', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Flowering period: Late\r\nautumn to Early winter&lt;br&gt;\r\nIt has greenish white fragrant flowers&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 999, 'uploads/products/31.png?v=1690758359', 1, 0, '2023-07-31 04:05:59', '2023-07-31 04:05:59'),
(32, 5, 14, 'Plumeria Peela Mohar', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Local Name: Konda Chinta&lt;br&gt;\r\nBlooming time: Spring, Summer&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 890, 'uploads/products/32.png?v=1690758393', 1, 0, '2023-07-31 04:06:33', '2023-07-31 04:06:33'),
(33, 5, 14, 'Plumeria (frangipani)', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Bloominng peroid: Jan to\r\nNov&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;Plumeria, also known as frangipani, is a beautiful tropical flower with fragrant blooms.&lt;br&gt;&lt;/p&gt;', 3200, 'uploads/products/33.png?v=1690758472', 1, 0, '2023-07-31 04:07:52', '2023-07-31 04:07:52'),
(34, 5, 14, 'Conocarpus', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Widespread mangroves&amp;nbsp;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/span&gt;&lt;font color=&quot;#666666&quot; face=&quot;IBM Plex Sans, sans-serif&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;specie&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;', 750, 'uploads/products/34.png?v=1690758512', 1, 0, '2023-07-31 04:08:32', '2023-07-31 04:08:32'),
(35, 5, 14, 'Shareen (Silk Plant,Albizia)', '&lt;p&gt;Shareen, also known as Silk Plant or Albizia, is a beautiful tree with feathery foliage and stunning flowers.&lt;br&gt;&lt;/p&gt;', 400, 'uploads/products/35.png?v=1690758566', 1, 0, '2023-07-31 04:09:25', '2023-07-31 04:09:26'),
(36, 5, 14, 'Kachnar (Bauhinia variegata)', '&lt;h6&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;﻿Kachnar (Bauhinia variegata) is a flowering tree known for its beautiful pink and white blossoms.&lt;/span&gt;&lt;/h6&gt;', 500, 'uploads/products/36.png?v=1690758668', 1, 0, '2023-07-31 04:11:08', '2023-07-31 04:11:08'),
(37, 5, 14, 'Bakain ( Dharek, Melia azedarach)', '&lt;p&gt;Bakain (Dharek, Melia azedarach) is a deciduous tree known for its toxic berries and traditional medicinal uses.&lt;br&gt;&lt;/p&gt;', 700, 'uploads/products/37.png?v=1690758710', 1, 0, '2023-07-31 04:11:49', '2023-07-31 04:11:50'),
(38, 5, 14, 'Neem-Azadirachta indica', '&lt;p&gt;Neem (Azadirachta indica) is a versatile tree known for its medicinal properties and various agricultural and environmental uses.&lt;br&gt;&lt;/p&gt;', 390, 'uploads/products/38.png?v=1690758754', 1, 0, '2023-07-31 04:12:34', '2023-07-31 04:12:34'),
(39, 6, 15, 'Jamun | Syzygium cumini', '&lt;p&gt;Jamun (Syzygium cumini) is a purple, delicious fruit with potential health benefits, native to the Indian subcontinent.&lt;br&gt;&lt;/p&gt;', 600, 'uploads/products/39.png?v=1690759107', 1, 0, '2023-07-31 04:18:27', '2023-07-31 04:18:27'),
(40, 6, 15, 'Guava (Amrood)', '&lt;p&gt;Guava, also known as Amrood, is a tropical fruit with a sweet and tangy flavor.&lt;br&gt;&lt;/p&gt;', 2300, 'uploads/products/40.png?v=1690759158', 1, 0, '2023-07-31 04:19:18', '2023-07-31 04:19:18'),
(41, 6, 15, 'Mango', '&lt;p&gt;Mango is a tropical fruit known for its sweet and juicy flesh, enjoyed worldwide.&lt;br&gt;&lt;/p&gt;', 3100, 'uploads/products/41.png?v=1690759201', 1, 0, '2023-07-31 04:20:01', '2023-07-31 04:20:01'),
(42, 6, 15, 'Mulberry (Shahtoot)', '&lt;p&gt;Mulberry (Shahtoot) is a sweet and juicy berry-bearing tree with a rich history of cultivation.&lt;br&gt;&lt;/p&gt;', 1700, 'uploads/products/42.png?v=1690759236', 1, 0, '2023-07-31 04:20:36', '2023-07-31 04:20:36'),
(43, 6, 15, 'Sukh Chain', '&lt;p&gt;&quot;Sukh Chain: A serene state of contentment and tranquility.&quot;&lt;br&gt;&lt;/p&gt;', 300, 'uploads/products/43.png?v=1690759280', 1, 0, '2023-07-31 04:21:20', '2023-07-31 04:21:20'),
(44, 6, 15, 'Peepal', '&lt;p&gt;Peepal (Ficus religiosa) is a sacred, large deciduous tree with heart-shaped leaves, revered in various cultures for its spiritual significance.&lt;br&gt;&lt;/p&gt;', 570, 'uploads/products/44.png?v=1690759329', 1, 0, '2023-07-31 04:22:08', '2023-07-31 04:22:09'),
(45, 6, 16, 'Asparagus plant', '&lt;p&gt;Asparagus is a perennial flowering plant known for its tender, edible green or purple shoots.&lt;br&gt;&lt;/p&gt;', 240, 'uploads/products/45.png?v=1690759573', 1, 0, '2023-07-31 04:26:13', '2023-07-31 04:26:13'),
(46, 6, 16, 'Silver bush', '&lt;p&gt;Silver bush (Convolvulus cneorum) is a small, evergreen shrub with silky, silvery leaves and white-pinkish flowers.&lt;br&gt;&lt;/p&gt;', 230, 'uploads/products/46.png?v=1690759616', 1, 0, '2023-07-31 04:26:56', '2023-07-31 04:26:56'),
(47, 6, 16, 'Elephant shrub', '&lt;p&gt;Elephant shrub (Portulacaria afra) is a drought-tolerant, succulent plant with small, round, green leaves, often used as a bonsai.&lt;br&gt;&lt;/p&gt;', 210, 'uploads/products/47.png?v=1690759652', 1, 0, '2023-07-31 04:27:32', '2023-07-31 04:27:32'),
(48, 6, 16, 'Euphorbia', '&lt;p&gt;Euphorbia is a diverse genus of flowering plants known for their unique and often succulent stems, ranging from small annual herbs to large shrubs and trees.&lt;br&gt;&lt;/p&gt;', 300, 'uploads/products/48.png?v=1690759692', 1, 0, '2023-07-31 04:28:12', '2023-07-31 04:28:12'),
(49, 6, 16, 'Star yucca', '&lt;p&gt;Star yucca (Yucca gloriosa) is a drought-tolerant, ornamental plant with striking spiky leaves and elegant white flowers.&lt;br&gt;&lt;/p&gt;', 170, 'uploads/products/49.png?v=1690759727', 1, 0, '2023-07-31 04:28:47', '2023-07-31 04:28:47'),
(50, 6, 16, 'Button patharchatt', '&lt;p&gt;&quot;Button patharchatt is a savory Indian snack made with seasoned chickpea flour and deep-fried to crispy perfection.&quot;&lt;br&gt;&lt;/p&gt;', 230, 'uploads/products/50.png?v=1690759760', 1, 0, '2023-07-31 04:29:20', '2023-07-31 04:29:20'),
(51, 6, 16, 'Iresine', '&lt;p&gt;Iresine is a genus of colorful foliage plants, commonly known as bloodleaf or chicken-gizzard plant.&lt;br&gt;&lt;/p&gt;', 420, 'uploads/products/51.png?v=1690759791', 1, 0, '2023-07-31 04:29:51', '2023-07-31 04:29:51'),
(52, 6, 16, 'Ficus species', '&lt;p&gt;Ficus species are diverse, evergreen trees, shrubs, or vines known for their unique aerial roots and fig fruits.&lt;br&gt;&lt;/p&gt;', 150, 'uploads/products/52.png?v=1690759832', 1, 0, '2023-07-31 04:30:32', '2023-07-31 04:30:32'),
(53, 4, 11, 'Bougainvillea (Pink and Whte) ', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Climber/vine&lt;br&gt;\r\nFlowering period: Spring&lt;br&gt;\r\nDormancy: Leave may fall in Winter but evergreen&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 400, 'uploads/products/53.png?v=1690760075', 1, 0, '2023-07-31 04:34:35', '2023-07-31 04:34:35'),
(54, 4, 11, 'Cestrum Nocturnum (Night Queen Jasmine, Rat ki Rani)', '&lt;p&gt;&lt;span style=&quot;font-size:10.5pt;line-height:107%;\r\nfont-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;color:#666666;mso-font-kerning:0pt;\r\nmso-ligatures:none;mso-ansi-language:EN-US;mso-fareast-language:EN-US;\r\nmso-bidi-language:AR-SA&quot;&gt;Type: Shrub&lt;br&gt;\r\nLocal name: Raat ki Rani ( the flowers release a scent of sweet perfume that\r\npervades the area within 300-500 ft of the plant)&lt;br&gt;\r\nFlowering period: From Spring until Fall&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 380, 'uploads/products/54.png?v=1690760111', 1, 0, '2023-07-31 04:35:10', '2023-07-31 04:35:11'),
(55, 4, 11, 'Trachelospermum jasminoides', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Climber&lt;br&gt;\r\nLocal name: Star Jasmine&lt;br&gt;\r\nFlowering period: Spring&lt;br&gt;\r\nDormancy: Evergreen&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 700, 'uploads/products/55.png?v=1690760139', 1, 0, '2023-07-31 04:35:39', '2023-07-31 04:35:39'),
(56, 4, 11, 'Jasmine Sambac (Arabian jasmine)', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Shrubs&lt;br&gt;\r\nLocal name: Motia/ Kali&lt;br&gt;\r\nFlowering period: Summer/Fall&lt;br&gt;\r\nDormancy: evergreen but dormant in winter&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 560, 'uploads/products/56.png?v=1690760166', 1, 0, '2023-07-31 04:36:06', '2023-07-31 04:36:06'),
(57, 4, 11, 'Passiflora (Passion Flower)', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Type: Climber&lt;br&gt;\r\nFlowering period: Warm months&lt;br&gt;\r\nWinter: may shed some leaves&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 800, 'uploads/products/57.png?v=1690760197', 1, 0, '2023-07-31 04:36:36', '2023-07-31 04:36:37'),
(58, 4, 13, 'Aglaonema', '&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-bottom: 7.5pt; line-height: 15pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;font-size:10.5pt;font-family:&amp;quot;IBM Plex Sans&amp;quot;,sans-serif;\r\nmso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;;mso-bidi-font-family:&amp;quot;Times New Roman&amp;quot;;\r\ncolor:#666666;mso-font-kerning:0pt;mso-ligatures:none&quot;&gt;Indoor Natural Air\r\npurifiers&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 430, 'uploads/products/58.png?v=1690760240', 1, 0, '2023-07-31 04:37:19', '2023-07-31 04:37:20'),
(59, 4, 13, 'Sanchezia', '&lt;p&gt;Sanchezia is a tropical evergreen plant with vibrant foliage and colorful bracts, commonly grown as an ornamental houseplant.&lt;br&gt;&lt;/p&gt;', 230, 'uploads/products/59.png?v=1690760274', 1, 0, '2023-07-31 04:37:53', '2023-07-31 04:37:54'),
(60, 4, 13, 'Table palm', '&lt;p&gt;Table palm (Chamaedorea elegans) is a small, elegant, and popular houseplant, also known as the parlor palm, commonly placed on tables or indoors for its ornamental appeal.&lt;br&gt;&lt;/p&gt;', 510, 'uploads/products/60.png?v=1690760310', 1, 0, '2023-07-31 04:38:30', '2023-07-31 04:38:30'),
(61, 4, 13, 'Croton', '&lt;p&gt;Croton is a colorful and ornamental tropical plant prized for its vibrant foliage.&lt;br&gt;&lt;/p&gt;', 330, 'uploads/products/61.png?v=1690760340', 1, 0, '2023-07-31 04:39:00', '2023-07-31 04:39:00'),
(62, 4, 13, 'Strelitzia', '&lt;p&gt;Strelitzia is a genus of tropical plants known for their striking, bird-like flowers and bold, architectural foliage.&lt;br&gt;&lt;/p&gt;', 340, 'uploads/products/62.png?v=1690760371', 1, 0, '2023-07-31 04:39:31', '2023-07-31 04:39:31'),
(63, 4, 13, 'Chocolate and Plants', '&lt;p&gt;&quot;Chocolate is a delectable treat derived from cacao beans, while plants encompass a diverse kingdom of living organisms essential for life on Earth.&quot;&lt;br&gt;&lt;/p&gt;', 650, 'uploads/products/63.png?v=1690760412', 1, 0, '2023-07-31 04:40:12', '2023-07-31 04:40:12'),
(64, 4, 13, 'Calathea', '&lt;p&gt;Calathea is a genus of beautiful and decorative tropical plants known for their vibrant and patterned leaves.&lt;br&gt;&lt;/p&gt;', 240, 'uploads/products/64.png?v=1690760445', 1, 0, '2023-07-31 04:40:45', '2023-07-31 04:40:45'),
(65, 4, 13, 'Cactus', '&lt;p&gt;Cactus is a desert plant known for its ability to store water in its fleshy, spiky stems, enabling it to thrive in arid environments.&lt;br&gt;&lt;/p&gt;', 340, 'uploads/products/65.png?v=1690760475', 1, 0, '2023-07-31 04:41:15', '2023-07-31 04:41:15'),
(66, 4, 13, 'Chinese evergreen', '&lt;p&gt;Chinese Evergreen (Aglaonema) is a popular, low-maintenance houseplant known for its attractive variegated leaves and air-purifying qualities.&lt;br&gt;&lt;/p&gt;', 230, 'uploads/products/66.png?v=1690760515', 1, 0, '2023-07-31 04:41:54', '2023-07-31 04:41:55'),
(67, 4, 13, 'Lemon grass', '&lt;p&gt;Lemongrass (Cymbopogon) is a fragrant herb widely used in culinary and medicinal applications.&lt;br&gt;&lt;/p&gt;', 310, 'uploads/products/67.png?v=1690760550', 1, 0, '2023-07-31 04:42:30', '2023-07-31 04:42:30'),
(68, 4, 13, 'Ferns', '&lt;p&gt;Ferns are non-flowering, vascular plants characterized by feathery fronds and spore-producing structures.&lt;br&gt;&lt;/p&gt;', 340, 'uploads/products/68.png?v=1690760584', 1, 0, '2023-07-31 04:43:04', '2023-07-31 04:43:04'),
(69, 4, 13, 'English Ivy', '&lt;p&gt;English Ivy (Hedera helix) is a woody vine known for its dense, climbing foliage and is commonly used as an ornamental plant for walls and landscapes.&lt;br&gt;&lt;/p&gt;', 340, 'uploads/products/69.png?v=1690760618', 1, 0, '2023-07-31 04:43:38', '2023-07-31 04:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 1, '2022-02-09 08:49:34', '2023-07-27 19:15:41'),
(2, 'Cosmetics', 1, 1, '2022-02-09 08:49:46', '2023-07-27 19:15:37'),
(3, 'Produce', 1, 1, '2022-02-09 08:50:31', '2023-07-27 19:15:45'),
(4, 'Anyy', 1, 1, '2022-02-09 08:50:36', '2023-07-27 19:15:33'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45'),
(6, 'Fowers', 1, 0, '2023-07-27 21:10:36', NULL),
(7, 'Indoor Plants', 1, 0, '2023-07-27 21:10:48', NULL),
(8, 'Plantscaping ', 1, 0, '2023-07-27 21:12:30', NULL),
(9, 'Trees', 1, 0, '2023-07-27 21:13:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Multi-Vendor Online nursery Management System'),
(6, 'short_name', 'Rubab&apos;s Nursery '),
(11, 'logo', 'uploads/logo-1690731364.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1690124792.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '202307-00001', 4, '101', 'shabeer khan', '9329434888', 'shabeer', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/vendors/4.png?v=1690123534', 1, 0, '2023-07-23 19:45:34', '2023-07-23 19:45:34'),
(5, '202307-00002', 7, '102', 'Rubab', '2334324342', 'rubs', '7d37c580f9c36fa004af865448a6e278', 'uploads/vendors/5.png?v=1690475150', 1, 0, '2023-07-27 21:25:50', '2023-07-27 21:47:53'),
(6, '202307-00003', 9, '103', 'fox martin', '23423123131', 'fox', '925d7518fc597af0e43f5606f9a51512', 'uploads/vendors/6.png?v=1690758992', 1, 0, '2023-07-31 04:16:32', '2023-07-31 04:16:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
