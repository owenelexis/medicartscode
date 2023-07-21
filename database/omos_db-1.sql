-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2023 at 08:27 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21061515_omos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `customer_id`, `product_id`, `quantity`) VALUES
(20, 4, 9, 1),
(22, 5, 18, 1),
(23, 5, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(5, 'Capsule', 'The active part of the medicine is contained inside a plastic shell that dissolves slowly in the stomach. You can take some capsules apart and mix the contents with your child’s favorite food. Others need to be swallowed whole, so the medicine isn’t absorbed until the stomach acid breaks down the capsule shell.', 1, 0, '2023-07-16 18:15:26', '2023-07-18 22:56:11'),
(6, 'Syrup', 'Syrup, also known as liquid medication or oral suspension, refers to a form of medication that is administered orally in a liquid form. It is commonly used for children or individuals who have difficulty swallowing pills or tablets.', 1, 0, '2023-07-16 18:42:45', '2023-07-16 18:42:45'),
(7, 'Tablet', 'The active ingredient is combined with another substance and pressed into a round or oval solid shape. There are different types of tablet. Soluble or dispersible tablets can safely be dissolved in water.', 1, 0, '2023-07-16 18:44:02', '2023-07-18 22:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `customer_list`
--

CREATE TABLE `customer_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_list`
--

INSERT INTO `customer_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `email`, `password`, `avatar`, `date_created`, `date_updated`) VALUES
(4, 'Mackie', 'D.', 'Luffy', 'Male', '9275329537', 'itik@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/customers/4.png?v=1689560852', '2023-07-15 13:15:33', '2023-07-20 14:57:19'),
(5, 'Owen', 'F', 'Anicas', 'Male', '9275329537', 'iti@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '2023-07-15 19:11:53', '2023-07-15 19:11:53'),
(6, 'Migs', 'D.', 'Dino', 'Male', '09985329537', 'tik@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '2023-07-16 14:14:04', '2023-07-16 14:14:04'),
(8, 'Jhannex', 'O.', 'Olasiman', 'Male', '9275329512', 'j@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/customers/8.png?v=1689512287', '2023-07-16 20:58:07', '2023-07-16 20:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0,
  `price` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(7, 9, 4, 8.00),
(8, 8, 4, 10.00),
(9, 10, 3, 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `total_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=packed,\r\n2=out for delivery,\r\n3=paid\r\n',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `customer_id`, `delivery_address`, `total_amount`, `status`, `date_created`, `date_updated`) VALUES
(7, '2023071600002', 4, 'Taytay,Rizal', 32.00, 1, '2023-07-16 20:42:27', '2023-07-16 20:44:01'),
(8, '2023071600001', 5, 'Pasay', 40.00, 0, '2023-07-16 20:47:42', '2023-07-16 20:47:42'),
(9, '2023071600003', 8, 'Taytay, Rizal', 360.00, 0, '2023-07-16 20:58:39', '2023-07-16 20:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payer_id` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `brand` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `dose` varchar(250) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `brand`, `name`, `description`, `dose`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(8, 7, 'Biogesic', 'Paracetamol Biogesic', 'Paracetamol (Biogesic) is a medication that is typically used to relieve mild to moderate pain such as headache, backache, menstrual cramps, muscular strain, minor arthritis pain, toothache, and reduce fevers caused by illnesses such as the common cold and flu. Generally, Paracetamol (Biogesic) is safe to take on an empty stomach.', '500mg', 10.00, 'uploads/medicines//1_Bio.png?v=1689507520', 1, 0, '2023-07-16 18:51:58', '2023-07-20 17:37:09'),
(9, 7, 'Neozep', 'Phenylephrine HCl Chlorphenamine Maleate Paracetamol', 'Neozep for the relief of clogged nose, runny nose, postnasal drip, itchy and watery eyes, sneezing, headache, body aches, and fever associated with the common cold, allergic rhinitis, sinusitis, flu, and other minor respiratory tract infections.', '500mg', 8.00, 'uploads/medicines//1_Neo.jpg?v=1689505246', 1, 0, '2023-07-16 19:00:46', '2023-07-18 22:58:25'),
(10, 6, 'Lagundi', 'Vitex negundo', 'Lagundi has become one of the most established and widely used herbal drugs for cough in the country through the various measures taken to promote research and development of traditional medicine. The lagundi-based medication was first licensed by PCHRD to three pharmaceutical companies in 1995 namely, Pascual Laboratories, Inc., Gruppo Medica, Inc. and Natrapharm, Inc.', '10mL', 120.00, 'uploads/medicines//1_lagun.jpg?v=1689507431', 1, 0, '2023-07-16 19:37:11', '2023-07-18 00:05:57'),
(11, 7, 'RiteMed', 'Vitamin B1+ B6 + B12 Complex Tablet', 'Each tablet contains: Thiamine Mononitrate (Vitamin B1) 100 mg, Pyridoxine Hydrochloride (Vitamin B6) 5 mg, Cyanocobalamin (Vitamin B12) 50 mcg. This product contains B-complex vitamins (Vitamins B1, B6 and B12). These nutrients are required for the normal function of the nervous system and are used as adjunct in the management of neuromuscular pain. \r\nB-complex vitamins also help in the conversion of food to energy to support numerous normal body processes.', '100mg/5mg/50mcg', 100.00, 'uploads/medicines//2_RiteMed.png?v=1689837932', 1, 0, '2023-07-20 15:08:11', '2023-07-20 15:25:32'),
(12, 7, 'Ceelin Plus', 'Ascorbic Acid Sodium Ascorbate Zinc', 'Ceelin Plus Chewable 20mg / 90mg/ 5mg Tablets – 30S\r\nCeelin® Plus provides children double protection against sickness with the powerful combination of Vitamin C and Zinc. It is the only brand made with ZincPlus® Technology that ensures the stable combination of these 2 ingredients so that kids get the full dose they need.', '20mg / 90mg/ 5mg Tablets', 187.50, 'uploads/medicines//1_Ceelin.jpg?v=1689839888', 1, 0, '2023-07-20 15:30:18', '2023-07-20 15:58:08'),
(13, 6, 'Ascof', 'Vitex negundo L. Lagundi Leaf', 'Indications / Uses\r\nRelief of cough due to common colds & flu. Treatment of bronchospasm in acute bronchial asthma, chronic bronchitis & other bronchopulmonary disorders. Relief of reversible, mild to moderate bronchospasm (prophylactic/maintenance medication) in adults & children w/ obstructive airway disease.\r\nAdult 300-600 mg (5-10 mL) 1-2 tsp thrice daily-four times daily. Children 15 mg/kg/dose thrice daily, >40 kg 2 tsp thrice daily, 6-12 yr (20-40 kg) 1? tsp thrice daily, 4-6 yr (15.5-20 kg) 1 tsp thrice daily, 2-4 yr (10-15.5 kg) ? tsp thrice daily.', '300 mg / 5ml Ponkan Syrup 120 ml', 134.50, 'uploads/medicines//3_Ascof.png?v=1689839145', 1, 0, '2023-07-20 15:31:25', '2023-07-20 15:45:45'),
(14, 7, 'Enervon', 'Enervon C Bottle 30 Tablets', 'This product is especially formulated for adults to help ensure optimum energy and increase body resistance against infections. It contains B-complex vitamins (Vitamins B1, B2, B6, B12, Nicotinamide, and Calcium Pantothenate) to help optimize conversion of food into energy that the body can utilize for numerous physiologic processes such as respiration, digestion, blood circulation, immune system response, and as fuel for physical activities. It also has Vitamin C, an antioxidant which helps the body\'s natural defense against free radicals and help boost immune function.', 'Once a day', 190.00, 'uploads/medicines//1_Enervon.jpg?v=1689839341', 1, 0, '2023-07-20 15:34:20', '2023-07-20 15:49:01'),
(15, 5, 'Optein', 'Optein Food Supplement Capsule', 'Each capsule contains Vitamin C (as Ascorbic acid) 60 mg, Vitamin E (as a-tocopherol) 10 mg, Zinc (as Zinc sulfate) 5 mg, and FloraGlo Lutein Free 20% of 30 mg - 6 mg.', 'One cap daily', 28.25, 'uploads/medicines//1_Optein.jpg?v=1689839400', 1, 0, '2023-07-20 15:39:26', '2023-07-20 15:50:00'),
(16, 5, 'Forti-D', 'Colecalciferol 800IU Capsule', 'Forti-D is the vital vitamin because it can help keep all your 36 vital organs healthy. How? Because our body is full of Vitamin D receptors which are found in cells. This allows us to process Vitamin D we get from the sun, food, and supplements and thereby helps our body organs with their functions.', 'Once a day', 150.00, 'uploads/medicines//1_Forti D.jpg?v=1689839511', 1, 0, '2023-07-20 15:41:14', '2023-07-20 15:51:51'),
(17, 5, 'Solmux', 'Salbutamol Suffate + Carbocisteine', 'Solmux is the trusted cough with phlegm solution that is scientifically proven to:\r\nMelt phlegm, making it less thick and sticky\r\nExpel phlegm with bacteria, and\r\nStop excess production of phlegm', 'Salbutamol 2 mg / Carbocisteine 500 mg', 14.25, 'uploads/medicines//1_Solmux.jpg?v=1689839583', 1, 0, '2023-07-20 15:42:14', '2023-07-20 15:53:03'),
(18, 7, 'Fluimucil', 'Acetylcysteine Fluimucil 600mg Eff Tablet', 'Fluimucil 600 mg Tablet 10\'s belongs to a class of drugs called \'mucolytic agents\' (cough/sputum thinner) primarily used to treat respiratory diseases associated with excessive mucus. Acute respiratory diseases are initially associated with dry, irritating cough, hoarseness in laryngitis (swelling of the voice box), or burning sensation in the chest due to bronchitis (swelling of the lining of bronchial tubes). Then, wet mucus forms, and continuous coughing out of sputum occurs. In chronic respiratory diseases, both dry irritating cough and wet cough with mucus occur.', '600mg', 38.75, 'uploads/medicines//1_Fluimucil.jpg?v=1689840099', 1, 0, '2023-07-20 15:59:58', '2023-07-20 16:01:39'),
(19, 6, 'Tempra', 'Paracetamol Tempra', 'Paracetamol is an analgesic-antipyretic drug. It is not a salicylate. It contains no phenacetin or caffeine. It has no effect on prothrombin time. Paracetamol (TEMPRA) is particularly valuable for use in patients who do not tolerate aspirin well because it is less likely to cause gastrointestinal distress.', '5mL', 135.50, 'uploads/medicines//1_Tempra.png?v=1689846483', 1, 0, '2023-07-20 17:36:24', '2023-07-20 17:48:03'),
(20, 5, 'Advil', 'Ibuprofen Advil 1 Liquigel Capsule', 'Advil is a nonsteroidal anti-inflammatory drug (NSAID). Ibuprofen works by reducing hormones that cause inflammation and pain in the body. Advil is used to reduce fever and treat pain or inflammation caused by many conditions such as headache, toothache, back pain, arthritis, menstrual cramps, or minor injury.', '200mg', 8.50, 'uploads/medicines//1_Advil.png?v=1689847296', 1, 0, '2023-07-20 18:01:35', '2023-07-20 18:01:36'),
(21, 5, 'Medicol Advance', 'Ibuprofen Medicol Advance 1 Capsule', 'Medicol Advance For the relief of headache. For the relief of toothache, muscular aches, minor arthritis pain, backache, minor aches and pains associated with the common cold, and pain of menstrual cramps (dysmenorrhea). For fever reduction.', '400mg', 12.00, 'uploads/medicines//1_Medicol 400.jpg?v=1689847431', 1, 0, '2023-07-20 18:03:51', '2023-07-20 18:03:51'),
(22, 7, 'Allerta', 'Loratadine Allerta 1 tablet', 'Allerta provides a non-drowsy and fast-acting relief from allergies. It contains Loratadine, an anti-allergy ingredient. Loratadine blocks the substance that causes allergic symptoms (histamine). Loratadine is not likely to make you drowsy or dizzy than the older class of anti-allergy medicines.', '10mg', 23.50, 'uploads/medicines//1_Allerta.jpg?v=1689847649', 1, 0, '2023-07-20 18:07:29', '2023-07-20 18:07:29'),
(23, 7, 'Stresstabs', 'Stresstabs Multivitamins and Iron Tablets ', 'Multivitamins + Iron (Stresstabs) contains Vitamin C, E, and Iron. It also includes eight (8) B-complex Vitamins (B1, B2, B6, B12, Biotin, Nicotinamide, Pantothenic Acid, and Folic Acid) at safe levels. It provides vitamin and iron supplementation to help fight the effects of stress.', '1 tablet a day', 88.00, 'uploads/medicines//1_Stresstabs.jpg?v=1689865474', 1, 0, '2023-07-20 23:04:34', '2023-07-20 23:04:34'),
(24, 7, 'Kremil-S Advance', 'Famotidine Calcium Carbonate Magnesium Hydroxide', 'Kremil-S Tablet is for milder stomach pain due to hyperacidity and it also relieves gassiness. Kremil-S® Advance provides relief for more severe hyperacidity and heartburn. It works in as fast as 5 minutes and stops excess acid production for up to 10 hours.', '10 mg/800 mg/165 mg', 20.00, 'uploads/medicines//1_Kremil-S-Advance.png?v=1689865899', 1, 0, '2023-07-20 23:11:39', '2023-07-20 23:11:39'),
(25, 5, 'Diatabs', 'Loperamide Diatabs', 'Control and symptomatic relief of acute non-specific diarrhea, chronic diarrhea associated with inflammatory bowel disease. Reduction of number and volume of discharge in patients with ileostomies and colostomies.', '2mg', 7.50, 'uploads/medicines//1_Diatabs.jpg?v=1689866304', 1, 0, '2023-07-20 23:18:24', '2023-07-20 23:18:24'),
(26, 5, 'Alaxan FR', 'Ibuprofen + Paracetamol Alaxan FR', 'Faster relief of mild to moderately severe pain of musculoskeletal origin eg, muscle pain, arthritis, rheumatism, sprain, strain, bursitis, tendonitis, backache, stiff neck, tension headache, dysmenorrhea, toothache, pain after tooth extraction & minor surgical operations. Reduction of fever.', '200 mg/325 mg', 8.50, 'uploads/medicines//1_Alaxan FR.png?v=1689866701', 1, 0, '2023-07-20 23:25:01', '2023-07-20 23:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `quantity` float(12,2) NOT NULL DEFAULT 0.00,
  `expiration` date DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `code`, `quantity`, `expiration`, `date_created`, `date_updated`) VALUES
(12, 8, 'M1', 20.00, '2024-07-16', '2023-07-16 20:40:03', '2023-07-16 20:40:03'),
(13, 9, 'M2', 20.00, '2024-08-22', '2023-07-16 20:40:31', '2023-07-16 20:40:31'),
(14, 10, 'M3', 25.00, '2024-04-16', '2023-07-16 20:40:55', '2023-07-16 20:40:55'),
(15, 13, 'M4', 20.00, '2024-08-20', '2023-07-20 16:07:32', '2023-07-20 16:07:32'),
(16, 12, 'M5', 20.00, '2024-08-20', '2023-07-20 16:08:09', '2023-07-20 16:08:09'),
(17, 14, 'M6', 20.00, '2024-08-20', '2023-07-20 16:08:49', '2023-07-20 16:08:49'),
(18, 18, 'M7', 20.00, '2024-08-20', '2023-07-20 16:09:07', '2023-07-20 16:09:07'),
(19, 16, 'M8', 20.00, '2024-08-20', '2023-07-20 16:09:33', '2023-07-20 16:09:33'),
(20, 15, 'M9', 20.00, '2024-08-20', '2023-07-20 16:09:59', '2023-07-20 16:09:59'),
(21, 11, 'M10', 20.00, '2024-08-20', '2023-07-20 16:10:20', '2023-07-20 16:10:20'),
(22, 20, 'M11', 20.00, '2024-08-20', '2023-07-20 18:08:54', '2023-07-20 18:08:54'),
(23, 22, 'M12', 20.00, '2024-08-20', '2023-07-20 18:09:16', '2023-07-20 18:09:16'),
(24, 21, 'M13', 20.00, '2024-08-20', '2023-07-20 18:09:39', '2023-07-20 18:09:39'),
(25, 17, 'M14', 20.00, '2024-08-20', '2023-07-20 18:10:01', '2023-07-20 18:10:01'),
(26, 19, 'M15', 20.00, '2024-08-20', '2023-07-20 18:10:24', '2023-07-20 18:10:24'),
(27, 26, 'M16', 20.00, '2024-08-20', '2023-07-20 23:26:12', '2023-07-20 23:26:12'),
(28, 25, 'M17', 20.00, '2024-08-20', '2023-07-20 23:26:37', '2023-07-20 23:26:37'),
(29, 24, 'M18', 20.00, '2024-08-20', '2023-07-20 23:26:58', '2023-07-20 23:27:23'),
(30, 23, 'M19', 20.00, '2024-08-20', '2023-07-20 23:27:54', '2023-07-20 23:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `stock_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Medicine Ordering System'),
(6, 'short_name', 'MediCart'),
(11, 'logo', 'uploads/logo.png?v=1689693358'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1689757125'),
(17, 'phone', '298-195-0381'),
(18, 'mobile', '09128437295 / 09836295302'),
(19, 'email', 'medicart@gmail.com'),
(20, 'address', '920 Brazil Street. Ciudad Grande, Pasig, City.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Admin', '', '1', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1689512380', NULL, 1, '2021-01-20 14:02:37', '2023-07-16 21:00:15'),
(7, 'Anthony', 'O.', 'Olasiman', 'Jhannex', '202cb962ac59075b964b07152d234b70', 'uploads/avatars/7.png?v=1689756652', NULL, 2, '2022-05-26 11:04:16', '2023-07-19 16:50:52'),
(8, 'Owen', 'F.', 'Anicas', 'Owen', '202cb962ac59075b964b07152d234b70', NULL, NULL, 2, '2023-07-19 16:51:53', '2023-07-19 16:51:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_list`
--
ALTER TABLE `customer_list`
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
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `stock_id` (`stock_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_list`
--
ALTER TABLE `customer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `customer_id_fk_cl` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_cl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_id_fk_oi` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_oi` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `customer_id_fk_ol` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id_fk_pl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `product_id_fk_sl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `order_id_fk_so` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `stock_id_fk_so` FOREIGN KEY (`stock_id`) REFERENCES `stock_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
