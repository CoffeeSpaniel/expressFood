-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2020 at 01:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodexpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `house_num` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_line` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_line` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cust_postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `house_num`, `first_line`, `second_line`, `cust_postcode`) VALUES
(1, '11', 'Fortune Street', 'Denver Drive', 'CF5 8ER'),
(2, '46', 'Justin Avenue', 'Portland Place', 'CF136YU'),
(3, '22', 'Copper Street', 'Adamsdown', 'CF4 6HG'),
(4, '44a', 'South Down Road', 'Derwen Fawr', 'CF22 1PR'),
(5, '1244 b', 'City Road', 'Midland', 'CF3 3AS'),
(6, '5', 'West Church Street', 'Southern Manfield', 'CF9 0TY');

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

CREATE TABLE `chef` (
  `chef_id` int(11) NOT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chef_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` enum('head chef','sous chef','chef') COLLATE utf8mb4_unicode_ci NOT NULL,
  `kitchen_tel_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_kpi` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`chef_id`, `postcode`, `chef_name`, `job_title`, `kitchen_tel_num`, `is_kpi`) VALUES
(1, 'CF10 9RT', 'Angela Heaney', 'head chef', '02920 748 587', 1),
(2, 'CF10 9RT', 'Jonathon Richards', 'sous chef', '02920 748 587', 1),
(3, 'CF10 9RT', 'Kevin Higson', 'chef', '02920 748 587', 1),
(4, 'CF10 9RT', 'Philip Tomlinson', 'chef', '02920 748 587', 1),
(5, 'CF3 5TY', 'Alice Smith', 'head chef', '02920 876 876', 1),
(6, 'CF3 5TY', 'Phillipa Turner', 'sous chef', '02920 876 876', 1),
(7, 'CF3 5TY', 'James Ericsson', 'chef', '02920 876 876', 1),
(8, 'CF3 5TY', 'Terrence Williams', 'chef', '02920 876 876', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `account_id` int(11) NOT NULL,
  `customer_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`account_id`, `customer_name`, `payment_method`, `email`, `tel_num`, `address_id`) VALUES
(1, 'Bill Turner', 'debit', 'bill@email.co.uk', '07886543217', 1),
(2, 'Rachel Thames', 'debit', 'rachel545@hotmail.com', '07847 574 382', 2),
(3, 'Paul Hitchens', 'debit', 'feelingpauly@hotmail.com', '07859 485 734', 3),
(4, 'Mark Pendegrast', 'credit', 'mark.pen@ntlworld.com', '02920 498 483', 4),
(5, 'Andrew Rea', 'credit', 'andrew.rea@domain.com', '07849 398 745', 5),
(6, 'Finn Stickly', 'debit', 'FSDesign@hotmail.com', '+44 7784 857 857', 6);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_reg` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_tel_num` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_kpi` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `vehicle_reg`, `driver_tel_num`, `is_kpi`) VALUES
(1, 'Tomas DuPaul', 'RT56 YUT', '07878 847 576', 0),
(2, 'Roger Phillipson', 'DR56 EYT', '07874 579 003', 1),
(3, 'Rachel McDavies', 'ER56 TYU', '07474 511 249', 1),
(4, 'Billy Jones', 'EY56 7YT', '07762 473 849', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `dish_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dish_type` enum('main','dessert') COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dietary` enum('no','vegetarian','vegan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_id`, `dish_name`, `dish_type`, `picture`, `description`, `dietary`, `cost`) VALUES
(1, 'Beef Stroganoff', 'main', 'https://www.recipetineats.com/wp-content/uploads/2018/01/Beef-Stroganoff_2-1-1.jpg', 'Succulent diced beef, prepared in a rich sauce with noodles.  ', 'no', '9.00'),
(2, 'Kale & Bean Burger', 'main', 'https://realfood.tesco.com/media/images/RFO-1400x919-Baked-bean-burger-ad8864a9-e82d-45f2-9b3e-0e1aaf16f539-0-1400x919.jpg', 'Kidney and black bean burger patty with slithers of kale prepared in an imitation brioche bun, with chunky chips', 'vegan', '8.25'),
(3, 'Vegan Millionaire Cheesecake', 'dessert', 'https://glutenfreecuppatea.co.uk/wp-content/uploads/2019/11/gluten-free-millionaires-cheesecake-recipe-3-480x480.jpg', 'Rich caramel mixed in with traditional cheesecake for a decadent dessert', 'vegan', '7.00'),
(4, 'Eton Mess', 'dessert', 'https://www.sweetestmenu.com/wp-content/uploads/2019/08/etonmess33a.jpg', 'A traditional English dessert consisting of a mixture of strawberries, meringue, and whipped cream', 'vegetarian', '7.50'),
(5, 'pulled pork burger\r\n', 'main', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.taste.com.au%2Frecipes%2Fslow-cooked-cola-pulled-pork-burgers-recipe%2Fnfq6wspt&psig=AOvVaw1rUgbdzESh9V3LlkIZCd5g&ust=1584283580005000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNDEnLKamugCFQAAAAAdAAAAABAD', 'An American classic, the meat is slow-cooked then shredded or \'pulled\' and layered with BBQ sauce', 'no', '8.50'),
(6, 'king prawn risotto ', 'main', 'https://www.weightwatchers.com.au/images/3081/dynamic/foodandrecipes/2016/01/GarlicPrawnRisotto_XXL.jpg', 'Fresh King Prawn in wild Jasmine rice with a rich white wine sauce', 'no', '9.50'),
(7, 'Lemon Tart', 'dessert', 'https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/tarte_au_citron_94480_16x9.jpg', 'Zesty slice of heaven with vanilla notes', 'vegetarian', '7.00'),
(8, 'profiteroles', 'dessert', 'https://www.recipetineats.com/wp-content/uploads/2018/11/Profiteroles_0.jpg', 'Almost as light as air, topped with chocolate and filled with a delicate orange cream.', 'vegetarian', '8.75'),
(9, 'Cajun Chicken Burger', 'main', 'https://www.bbcgoodfood.com/sites/default/files/styles/carousel_medium/public/recipe-collections/collection-image/2013/05/mexican-chicken-burger_1.jpg?itok=XoqAEXNs', 'Grilled Cajun-spiced chicken breasts topped with bacon, avocado and cheese', 'no', '7.75'),
(10, 'tabbouleh', 'main', 'https://cookieandkate.com/images/2019/07/best-tabbouleh-recipe-3.jpg', 'a super fresh herb and bulgur salad, with parsley being the number one ingredient', 'vegan', '6.50'),
(11, 'Black Forest Gateau ', 'dessert', 'https://www.readersdigest.ca/wp-content/uploads/sites/14/2014/02/black-forest-cake-760x506.jpg', 'chocolate cherry layered cream cake', 'vegetarian', '7.50'),
(12, 'Vegan Cherry Pie', 'dessert', 'https://images-na.ssl-images-amazon.com/images/I/91%2B0S6bMMuL._SL1500_.jpg', 'A vegan take on the delicious American classic', 'vegan', '7.00');

-- --------------------------------------------------------

--
-- Table structure for table `food_menu`
--

CREATE TABLE `food_menu` (
  `date` date NOT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_menu`
--

INSERT INTO `food_menu` (`date`, `food_id`) VALUES
('2020-03-13', 1),
('2020-03-13', 2),
('2020-03-13', 3),
('2020-03-13', 4),
('2020-03-16', 5),
('2020-03-16', 6),
('2020-03-16', 7),
('2020-03-16', 8),
('2020-03-18', 9),
('2020-03-18', 10),
('2020-03-18', 11),
('2020-03-18', 12);

-- --------------------------------------------------------

--
-- Table structure for table `food_order`
--

CREATE TABLE `food_order` (
  `food_id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `quantity` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_order`
--

INSERT INTO `food_order` (`food_id`, `order_num`, `quantity`) VALUES
(1, 1, 1),
(4, 1, 1),
(2, 2, 1),
(3, 2, 1),
(1, 3, 1),
(4, 3, 1),
(1, 4, 2),
(3, 4, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(8, 6, 1),
(9, 7, 1),
(11, 7, 1),
(9, 8, 1),
(12, 8, 1),
(10, 9, 1),
(11, 9, 1),
(9, 10, 2),
(12, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen`
--

CREATE TABLE `kitchen` (
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kitchen`
--

INSERT INTO `kitchen` (`postcode`, `name`) VALUES
('CF10 9RT', 'Cardiff Bay'),
('CF3 5TY', 'Cardiff Central');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`date`) VALUES
('2020-03-13'),
('2020-03-16'),
('2020-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_num` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `order_cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_num`, `account_id`, `driver_id`, `postcode`, `date`, `order_cost`) VALUES
(1, 1, 2, 'CF10 9RT', '2020-03-13', '16.50'),
(2, 2, 3, 'CF3 5TY', '2020-03-13', '15.25'),
(3, 3, 1, 'CF3 5TY', '2020-03-13', '16.50'),
(4, 4, 3, 'CF10 9RT', '2020-03-13', '32.50'),
(5, 3, 4, 'CF10 9RT', '2020-03-16', '17.00'),
(6, 5, 3, 'CF10 9RT', '2020-03-16', '18.25'),
(7, 3, 3, 'CF10 9RT', '2020-03-18', '15.25'),
(8, 6, 2, 'CF3 5TY', '2020-03-18', '14.75'),
(9, 2, 1, 'CF3 5TY', '2020-03-18', '14.00'),
(10, 1, 4, 'CF3 5TY', '2020-03-18', '22.50');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `is_delivery` tinyint(1) NOT NULL,
  `time_elapsed` time NOT NULL,
  `is_target_time` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `order_num`, `is_delivery`, `time_elapsed`, `is_target_time`) VALUES
(1, 1, 1, '00:17:55', 1),
(2, 2, 1, '00:19:36', 1),
(3, 3, 1, '16:32:15', 1),
(4, 4, 1, '00:17:21', 1),
(5, 5, 1, '00:18:12', 1),
(6, 6, 1, '00:17:09', 1),
(7, 7, 1, '00:19:17', 1),
(8, 8, 1, '00:12:12', 1),
(9, 9, 1, '00:22:23', 0),
(10, 10, 1, '00:17:08', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`chef_id`),
  ADD KEY `postcode` (`postcode`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `address_ID` (`address_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `food_menu`
--
ALTER TABLE `food_menu`
  ADD KEY `date` (`date`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `food_order`
--
ALTER TABLE `food_order`
  ADD KEY `order_num` (`order_num`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `kitchen`
--
ALTER TABLE `kitchen`
  ADD PRIMARY KEY (`postcode`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_num`),
  ADD KEY `account_ID` (`account_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `postcode` (`postcode`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `order_num` (`order_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chef`
--
ALTER TABLE `chef`
  MODIFY `chef_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`postcode`) REFERENCES `kitchen` (`postcode`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints for table `food_menu`
--
ALTER TABLE `food_menu`
  ADD CONSTRAINT `food_menu_ibfk_1` FOREIGN KEY (`date`) REFERENCES `menu` (`date`),
  ADD CONSTRAINT `food_menu_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`);

--
-- Constraints for table `food_order`
--
ALTER TABLE `food_order`
  ADD CONSTRAINT `food_order_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  ADD CONSTRAINT `food_order_ibfk_2` FOREIGN KEY (`order_num`) REFERENCES `order_table` (`order_num`);

--
-- Constraints for table `order_table`
--
ALTER TABLE `order_table`
  ADD CONSTRAINT `order_table_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `customer` (`account_ID`),
  ADD CONSTRAINT `order_table_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_ID`),
  ADD CONSTRAINT `order_table_ibfk_3` FOREIGN KEY (`postcode`) REFERENCES `kitchen` (`postcode`),
  ADD CONSTRAINT `order_table_ibfk_4` FOREIGN KEY (`date`) REFERENCES `menu` (`date`);

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`order_num`) REFERENCES `order_table` (`order_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
