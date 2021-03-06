-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 09, 2020 at 08:52 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'oqPf8HMG6AK0ex7Od6E5PlAITOsxzHnn', 1, '2020-09-07 18:08:39', '2020-09-07 18:08:39', '2020-09-07 18:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Ecommerce', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(2, 'Fashion', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(3, 'Electronic', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4, 'Commercial', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_themes', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(2, 'widget_total_users', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(3, 'widget_total_pages', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(4, 'widget_total_plugins', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(5, 'widget_analytics_general', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(6, 'widget_analytics_page', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(7, 'widget_analytics_browser', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(8, 'widget_analytics_referrer', '2020-09-07 18:23:17', '2020-09-07 18:23:17'),
(9, 'widget_posts_recent', '2020-09-18 02:25:50', '2020-09-18 02:25:50'),
(10, 'widget_audit_logs', '2020-09-18 02:25:50', '2020-09-18 02:25:50'),
(11, 'widget_ecommerce_report_general', '2020-09-18 02:25:50', '2020-09-18 02:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_brands`
--

INSERT INTO `ec_brands` (`id`, `name`, `description`, `website`, `logo`, `status`, `order`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Fashion live', NULL, NULL, 'brands/1.png', 'published', 0, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(2, 'Hand crafted', NULL, NULL, 'brands/2.png', 'published', 1, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(3, 'Mestonix', NULL, NULL, 'brands/3.png', 'published', 2, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4, 'Sunshine', NULL, NULL, 'brands/4.png', 'published', 3, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(5, 'Pure', NULL, NULL, 'brands/5.png', 'published', 4, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(6, 'Anfold', NULL, NULL, 'brands/6.png', 'published', 5, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(7, 'Automotive', NULL, NULL, 'brands/7.png', 'published', 6, 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `ec_cart`
--

CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_currencies`
--

CREATE TABLE `ec_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_currencies`
--

INSERT INTO `ec_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 2, 0, 1, 1, '2020-09-26 21:40:23', '2020-09-26 21:43:50'),
(2, 'EUR', '???', 1, 2, 1, 0, 1.17, '2020-09-28 07:06:28', '2020-09-28 07:06:28'),
(3, 'VND', '???', 0, 0, 2, 0, 23177, '2020-09-29 07:51:03', '2020-10-07 07:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customers`
--

CREATE TABLE `ec_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customers`
--

INSERT INTO `ec_customers` (`id`, `name`, `email`, `password`, `avatar`, `dob`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Smith', 'john.smith@botble.com', '$2y$10$iNJaxWD.cB3VQ.z8jm.zt.JDlbN5271C6NDJaick.WzYiyiRgFVxy', NULL, NULL, '446-277-2869 x24089', NULL, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(2, 'Kathryne Bogan MD', 'nicolas.porter@example.com', '$2y$10$Gn//zd7r2gSZNUZsYu3RBO9EJaH.1ICFwSbLT4O/SKZW2JMJOj7HG', NULL, NULL, '1-361-879-3257', NULL, '2020-10-09 06:51:43', '2020-10-09 06:51:43'),
(3, 'Leola Berge', 'sharon22@example.org', '$2y$10$T3UubAXgIkEwVsRDq6QNV.g8NjGOh1gGviqIvAp1eypASW5HHolZ6', NULL, NULL, '(664) 870-7203', NULL, '2020-10-09 06:51:43', '2020-10-09 06:51:43'),
(4, 'Lucy Bode', 'paris04@example.net', '$2y$10$RUN6fNcySK03NiyaSnb2bOhEZWBPyX644F6LFS37gGucv/020bOKq', NULL, NULL, '751.619.1845', NULL, '2020-10-09 06:51:43', '2020-10-09 06:51:43'),
(5, 'Nash Hahn', 'gorczany.victoria@example.net', '$2y$10$s2zsVIMPlDnSz8LggzD4S.Pbq7yIXft/PVcJdc6QxPo6Jh764dA5q', NULL, NULL, '456.471.6640', NULL, '2020-10-09 06:51:43', '2020-10-09 06:51:43'),
(6, 'Kenya Donnelly II', 'abe.wyman@example.com', '$2y$10$LH9h3W7LOgeQS2bm9hwCuOiX2IroAeziAGpr56RAJ6WnM97CaptHC', NULL, NULL, '768.622.0779 x1324', NULL, '2020-10-09 06:51:44', '2020-10-09 06:51:44'),
(7, 'Mr. Zander Pouros MD', 'wendy82@example.com', '$2y$10$.GLkNniJ.Ye1R2LljkTISewE9MzmCDwBsymU230ugq67LlX2T7pw.', NULL, NULL, '704-420-2958 x76999', NULL, '2020-10-09 06:51:44', '2020-10-09 06:51:44'),
(8, 'Veda Rippin', 'gino13@example.com', '$2y$10$YHbxBsFPisxKKONrQc8vEupq1YdecN/3BWLMWG3X82QE5BEcGR6fu', NULL, NULL, '+1-963-273-1502', NULL, '2020-10-09 06:51:44', '2020-10-09 06:51:44'),
(9, 'Imogene Jacobs', 'braulio.kessler@example.net', '$2y$10$rYHr5DeWK12kfEuTRQuZ.ucEswhiDphbNsOlZu9EB3t.7o.msorOa', NULL, NULL, '1-909-799-0833 x1597', NULL, '2020-10-09 06:51:45', '2020-10-09 06:51:45'),
(10, 'Amelia Thompson Jr.', 'kiehn.marge@example.net', '$2y$10$NGWe1GpYwoONasxHp3OXjOtmS7TyCutYzQbxURUgjJDcsMGLoqasm', NULL, NULL, '1-594-954-7543', NULL, '2020-10-09 06:51:45', '2020-10-09 06:51:45'),
(11, 'Frederik Wyman', 'utillman@example.net', '$2y$10$A.vWoXlPBF/i.ggXBBlocOeFjhTzV5y6ZHcOdrjQyPGP.80qbLGAu', NULL, NULL, '(932) 991-4977', NULL, '2020-10-09 06:51:45', '2020-10-09 06:51:45'),
(12, 'Dillan Emmerich', 'gleason.meghan@example.com', '$2y$10$40RLzZVzxuEwO8t143VVXugC/L2nxQH3Vh.IQqklyAHoYZfa3mw4C', NULL, NULL, '604-939-9543', NULL, '2020-10-09 06:51:45', '2020-10-09 06:51:45'),
(13, 'Dr. Janelle Hane', 'wjohnson@example.org', '$2y$10$rI3XEtN2KSSZf9B.UObie.5j5YKqwO9z06Xeu5AE61tAQYRqAKgyy', NULL, NULL, '328.985.5768 x3531', NULL, '2020-10-09 06:51:46', '2020-10-09 06:51:46'),
(14, 'Desmond McLaughlin', 'brant.ankunding@example.net', '$2y$10$mo0DLLoLr7/gG6it9O.O6eKj2dk..ZpcnjwCFTuILnKPBBDNPwhom', NULL, NULL, '627.658.4330 x116', NULL, '2020-10-09 06:51:46', '2020-10-09 06:51:46'),
(15, 'Mr. Moshe Reilly', 'lew39@example.net', '$2y$10$OjD4ZpweqRJiv13aHx5tBO3RRqtjeZ3eIomLbC3HQPmgisWEu1T4W', NULL, NULL, '(924) 580-8355 x227', NULL, '2020-10-09 06:51:46', '2020-10-09 06:51:46'),
(16, 'Mr. Ian Walsh DVM', 'blanche.walsh@example.com', '$2y$10$WYU2ElZab5VIKZkr6CtR8uN1G.7z1eqamBXGw.tpBkuQRKGTfNli.', NULL, NULL, '1-865-221-2103', NULL, '2020-10-09 06:51:47', '2020-10-09 06:51:47'),
(17, 'Eliseo Mueller', 'cronin.zena@example.org', '$2y$10$SaOLZOH9dG28WFYThLVAZ.r9Kpee606Ym4brDa5Tj5kDBYgPkA4je', NULL, NULL, '(374) 828-5504 x57148', NULL, '2020-10-09 06:51:47', '2020-10-09 06:51:47'),
(18, 'Miles Langworth', 'udubuque@example.org', '$2y$10$//n52Z8JIxe6k4Wa1VtmrO200VKGeXt6jDPuW2NE3nP8ekgsQuoCK', NULL, NULL, '638.366.4046 x5588', NULL, '2020-10-09 06:51:47', '2020-10-09 06:51:47'),
(19, 'Larry Weissnat', 'rene.mayert@example.com', '$2y$10$zOm2FemrHbmi0z./pph6Ke.L5YaMYPA3z2t4ZgNzpTUeINx6NxYnq', NULL, NULL, '1-682-951-5046', NULL, '2020-10-09 06:51:47', '2020-10-09 06:51:47'),
(20, 'Mabel Runolfsdottir', 'lydia96@example.net', '$2y$10$B.DS/NBJDyOHOAIyzSGdb.WupoEHqfA3w8JeDzFfG0kw5YDVi/ytW', NULL, NULL, '+12397580273', NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(21, 'Jarred Nader', 'ullrich.kane@example.net', '$2y$10$DiXeDRTMKJ1SKnNqpFC1ZOyxf44l950P5Ss/zJ02VDnXatv/xkdIe', NULL, NULL, '865-452-1815 x01837', NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_addresses`
--

CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customer_addresses`
--

INSERT INTO `ec_customer_addresses` (`id`, `name`, `email`, `phone`, `country`, `state`, `city`, `address`, `customer_id`, `is_default`, `created_at`, `updated_at`) VALUES
(2, 'Sang Nguyen', 'minhsang2603@gmail.com', '0324324344', 'VN', 'Ho Chi Minh', 'Quan 10', '23 Hoang Hoa Tham', 1, 0, '2020-10-02 22:15:03', '2020-10-02 22:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_password_resets`
--

CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customer_password_resets`
--

INSERT INTO `ec_customer_password_resets` (`email`, `token`, `created_at`) VALUES
('minhsang2603@gmail.com', '$2y$10$i5Wh9KqkuLFbXtO/ZXdfEu/bWzdGJ.ojD5nsPSBOZfS16PbEe70TO', '2020-09-30 07:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_customers`
--

CREATE TABLE `ec_discount_customers` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_products`
--

CREATE TABLE `ec_discount_products` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_product_collections`
--

CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_grouped_products`
--

CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_orders`
--

CREATE TABLE `ec_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(8,2) DEFAULT NULL,
  `shipping_amount` decimal(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '1',
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_addresses`
--

CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_histories`
--

CREATE TABLE `ec_order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_product`
--

CREATE TABLE `ec_order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_products`
--

CREATE TABLE `ec_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT '0',
  `is_searchable` tinyint(4) NOT NULL DEFAULT '0',
  `is_show_on_list` tinyint(4) NOT NULL DEFAULT '0',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0',
  `price` double UNSIGNED DEFAULT NULL,
  `sale_price` double UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wide_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_products`
--

INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(1, 'Dual Camera 20MP', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/7-p.jpg\",\"products\\/hover-8-p.jpg\"]', 'SW-126-A0', 0, 10, 0, 1, 1, NULL, NULL, 0, 0, 0, 0, 80.25, 61.7925, NULL, NULL, 19.00, 20.00, 13.00, 720.00, NULL, NULL, NULL, NULL, NULL, 6, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 120027),
(2, 'Smart Watches', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/8-p.jpg\",\"products\\/hover-10-p.jpg\"]', 'SW-172-A0', 0, 13, 0, 1, 1, NULL, NULL, 0, 0, 0, 0, 40.5, 31.185, NULL, NULL, 17.00, 15.00, 11.00, 821.00, NULL, NULL, NULL, NULL, NULL, 6, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 97797),
(3, 'Beat Headphone', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/5-p.jpg\",\"products\\/hover-9-p.jpg\"]', 'SW-162-A0', 0, 13, 0, 1, 1, NULL, NULL, 0, 0, 0, 0, 20, 14.4, NULL, NULL, 10.00, 18.00, 14.00, 621.00, NULL, NULL, NULL, NULL, NULL, 4, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 147370),
(4, 'Red & Black Headphone', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/6-p.jpg\",\"products\\/hover-6-p.jpg\"]', 'SW-100-A0', 0, 17, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 52, 44.72, NULL, NULL, 18.00, 15.00, 13.00, 826.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 83110),
(5, 'Smart Watch External', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/3-p.jpg\",\"products\\/hover-7-p.jpg\"]', 'SW-123-A0', 0, 19, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 72, 64.08, NULL, NULL, 15.00, 18.00, 20.00, 711.00, NULL, NULL, NULL, NULL, NULL, 2, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 186942),
(6, 'Nikon HD camera', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/7-p.jpg\",\"products\\/hover-3-p.jpg\"]', 'SW-106-A0', 0, 11, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 45, 35.55, NULL, NULL, 19.00, 19.00, 14.00, 684.00, NULL, NULL, NULL, NULL, NULL, 3, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 83702),
(7, 'Audio Equipment', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/9-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-140-A0', 0, 16, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 50, 43.5, NULL, NULL, 16.00, 10.00, 18.00, 695.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 60994),
(8, 'Smart Televisions', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/6-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-195-A0', 0, 11, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 122, 86.62, NULL, NULL, 10.00, 13.00, 18.00, 641.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 23381),
(9, 'Samsung Smart Phone', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/8-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-160-A0', 0, 17, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 57, 40.47, NULL, NULL, 17.00, 19.00, 16.00, 860.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1, 159926),
(10, 'Dual Camera 20MP', NULL, NULL, 'published', '[\"products\\/7-p.jpg\",\"products\\/hover-8-p.jpg\"]', 'SW-126-A0', 0, 10, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 80.25, 61.7925, NULL, NULL, 19.00, 20.00, 13.00, 720.00, NULL, NULL, NULL, NULL, NULL, 6, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(11, 'Smart Watches', NULL, NULL, 'published', '[\"products\\/8-p.jpg\",\"products\\/hover-10-p.jpg\"]', 'SW-172-A0', 0, 13, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 40.5, 31.185, NULL, NULL, 17.00, 15.00, 11.00, 821.00, NULL, NULL, NULL, NULL, NULL, 6, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(12, 'Beat Headphone', NULL, NULL, 'published', '[\"products\\/5-p.jpg\",\"products\\/hover-9-p.jpg\"]', 'SW-162-A0', 0, 13, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 20, 14.4, NULL, NULL, 10.00, 18.00, 14.00, 621.00, NULL, NULL, NULL, NULL, NULL, 4, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(13, 'Beat Headphone', NULL, NULL, 'published', '[\"products\\/9-p.jpg\",\"products\\/hover-10-p.jpg\"]', 'SW-162-A0-A1', 0, 13, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 20, 17.8, NULL, NULL, 10.00, 18.00, 14.00, 621.00, NULL, NULL, NULL, NULL, NULL, 4, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(14, 'Beat Headphone', NULL, NULL, 'published', '[\"products\\/2-p.jpg\",\"products\\/hover-4-p.jpg\"]', 'SW-162-A0-A2', 0, 13, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 20, 18, NULL, NULL, 10.00, 18.00, 14.00, 621.00, NULL, NULL, NULL, NULL, NULL, 4, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(15, 'Red & Black Headphone', NULL, NULL, 'published', '[\"products\\/6-p.jpg\",\"products\\/hover-6-p.jpg\"]', 'SW-100-A0', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 52, 44.72, NULL, NULL, 18.00, 15.00, 13.00, 826.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(16, 'Red & Black Headphone', NULL, NULL, 'published', '[\"products\\/4-p.jpg\",\"products\\/hover-9-p.jpg\"]', 'SW-100-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 52, 39.52, NULL, NULL, 18.00, 15.00, 13.00, 826.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(17, 'Red & Black Headphone', NULL, NULL, 'published', '[\"products\\/7-p.jpg\",\"products\\/hover-2-p.jpg\"]', 'SW-100-A0-A2', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 52, 40.04, NULL, NULL, 18.00, 15.00, 13.00, 826.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(18, 'Smart Watch External', NULL, NULL, 'published', '[\"products\\/3-p.jpg\",\"products\\/hover-7-p.jpg\"]', 'SW-123-A0', 0, 19, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 72, 64.08, NULL, NULL, 15.00, 18.00, 20.00, 711.00, NULL, NULL, NULL, NULL, NULL, 2, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(19, 'Smart Watch External', NULL, NULL, 'published', '[\"products\\/10-p.jpg\",\"products\\/hover-3-p.jpg\"]', 'SW-123-A0-A1', 0, 19, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 72, 56.88, NULL, NULL, 15.00, 18.00, 20.00, 711.00, NULL, NULL, NULL, NULL, NULL, 2, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(20, 'Nikon HD camera', NULL, NULL, 'published', '[\"products\\/7-p.jpg\",\"products\\/hover-3-p.jpg\"]', 'SW-106-A0', 0, 11, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 45, 35.55, NULL, NULL, 19.00, 19.00, 14.00, 684.00, NULL, NULL, NULL, NULL, NULL, 3, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(21, 'Audio Equipment', NULL, NULL, 'published', '[\"products\\/9-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-140-A0', 0, 16, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 50, 43.5, NULL, NULL, 16.00, 10.00, 18.00, 695.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(22, 'Smart Televisions', NULL, NULL, 'published', '[\"products\\/6-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-195-A0', 0, 11, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 122, 86.62, NULL, NULL, 10.00, 13.00, 18.00, 641.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(23, 'Smart Televisions', NULL, NULL, 'published', '[\"products\\/2-p.jpg\",\"products\\/hover-9-p.jpg\"]', 'SW-195-A0-A1', 0, 11, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 122, 98.82, NULL, NULL, 10.00, 13.00, 18.00, 641.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(24, 'Smart Televisions', NULL, NULL, 'published', '[\"products\\/3-p.jpg\",\"products\\/hover-10-p.jpg\"]', 'SW-195-A0-A2', 0, 11, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 122, 102.48, NULL, NULL, 10.00, 13.00, 18.00, 641.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(25, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/8-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-160-A0', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 57, 40.47, NULL, NULL, 17.00, 19.00, 16.00, 860.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(26, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/1-p.jpg\",\"products\\/hover-3-p.jpg\"]', 'SW-160-A0-A1', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 57, 46.17, NULL, NULL, 17.00, 19.00, 16.00, 860.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(27, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/1-p.jpg\",\"products\\/hover-1-p.jpg\"]', 'SW-160-A0-A2', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 57, 49.02, NULL, NULL, 17.00, 19.00, 16.00, 860.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0),
(28, 'Samsung Smart Phone', NULL, NULL, 'published', '[\"products\\/5-p.jpg\",\"products\\/hover-9-p.jpg\"]', 'SW-160-A0-A3', 0, 17, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 57, 45.6, NULL, NULL, 17.00, 19.00, 16.00, 860.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes`
--

CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attributes`
--

INSERT INTO `ec_product_attributes` (`id`, `attribute_set_id`, `title`, `slug`, `color`, `image`, `is_default`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Green', 'green', '#5FB7D4', NULL, 1, 1, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(2, 1, 'Blue', 'blue', '#333333', NULL, 0, 2, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(3, 1, 'Red', 'red', '#DA323F', NULL, 0, 3, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4, 1, 'Black', 'back', '#2F366C', NULL, 0, 4, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(5, 1, 'Brown', 'brown', '#87554B', NULL, 0, 5, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(6, 2, 'S', 's', NULL, NULL, 1, 1, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(7, 2, 'M', 'm', NULL, NULL, 1, 2, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(8, 2, 'L', 'l', NULL, NULL, 1, 3, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(9, 2, 'XL', 'xl', NULL, NULL, 1, 4, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(10, 2, 'XXL', 'xxl', NULL, NULL, 1, 5, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets`
--

CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_comparable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attribute_sets`
--

INSERT INTO `ec_product_attribute_sets` (`id`, `title`, `slug`, `display_layout`, `is_searchable`, `is_comparable`, `is_use_in_product_listing`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'visual', 1, 1, 1, 'published', 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(2, 'Size', 'size', 'text', 1, 1, 1, 'published', 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories`
--

CREATE TABLE `ec_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_categories`
--

INSERT INTO `ec_product_categories` (`id`, `name`, `description`, `status`, `order`, `image`, `is_featured`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Television', NULL, 'published', 0, 'product-categories/p-1.png', 1, '2020-10-09 06:51:41', '2020-10-09 06:51:41', NULL),
(2, 'Mobile', NULL, 'published', 1, 'product-categories/p-2.png', 1, '2020-10-09 06:51:41', '2020-10-09 06:51:41', NULL),
(3, 'Headphone', NULL, 'published', 2, 'product-categories/p-3.png', 1, '2020-10-09 06:51:41', '2020-10-09 06:51:41', NULL),
(4, 'Watches', NULL, 'published', 3, 'product-categories/p-4.png', 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(5, 'Game', NULL, 'published', 4, 'product-categories/p-5.png', 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(6, 'Camera', NULL, 'published', 5, 'product-categories/p-6.png', 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(7, 'Audio', NULL, 'published', 6, 'product-categories/p-7.png', 1, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(8, 'Mobile & Tablet', NULL, 'published', 7, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(9, 'Accessories', NULL, 'published', 8, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(10, 'Home Audio & Theater', NULL, 'published', 9, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(11, 'Tv & Smart Box', NULL, 'published', 10, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(12, 'Printer', NULL, 'published', 11, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(13, 'Computer', NULL, 'published', 12, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(14, 'Fax Machine', NULL, 'published', 13, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(15, 'Mouse', NULL, 'published', 14, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', NULL),
(16, 'PLEASE mind what you\'re.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 0),
(17, 'MARMALADE\', but to open them.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 0),
(18, 'Between yourself and me.\'.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 0),
(19, 'Alice. \'But you\'re so easily.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 0),
(20, 'As she said to live. \'I\'ve.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 0),
(21, 'The Knave of Hearts, who.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1),
(22, 'I shall only look up and.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1),
(23, 'Alice soon came upon a time.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1),
(24, 'Alice aloud, addressing.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1),
(25, 'I to do anything but sit.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 1),
(26, 'I shall have to beat time.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 2),
(27, 'And so it was too much.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 2),
(28, 'Alice replied very solemnly.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 2),
(29, 'Hatter said, tossing his.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 2),
(30, 'The Gryphon lifted up both.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 2),
(31, 'Cheshire cat,\' said the.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 3),
(32, 'As she said to Alice, and.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 3),
(33, 'Queen jumped up on tiptoe.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 3),
(34, 'Alice, in a game of croquet.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 3),
(35, 'She generally gave herself.', NULL, 'published', 0, NULL, 0, '2020-10-09 06:51:42', '2020-10-09 06:51:42', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_category_product`
--

CREATE TABLE `ec_product_category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_category_product`
--

INSERT INTO `ec_product_category_product` (`id`, `category_id`, `product_id`) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 13, 1),
(4, 4, 2),
(5, 6, 2),
(6, 10, 2),
(7, 5, 3),
(8, 3, 3),
(9, 6, 3),
(10, 3, 4),
(11, 12, 4),
(12, 13, 4),
(13, 6, 5),
(14, 14, 5),
(15, 7, 5),
(16, 10, 6),
(17, 9, 6),
(18, 5, 6),
(19, 4, 7),
(20, 14, 7),
(21, 10, 7),
(22, 11, 8),
(23, 13, 8),
(24, 8, 8),
(25, 12, 9),
(26, 10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections`
--

CREATE TABLE `ec_product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collections`
--

INSERT INTO `ec_product_collections` (`id`, `name`, `slug`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Arrival', 'new-arrival', NULL, NULL, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(2, 'Best Sellers', 'best-sellers', NULL, NULL, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(3, 'Special Offer', 'special-offer', NULL, NULL, 'published', '2020-10-09 06:51:42', '2020-10-09 06:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collection_products`
--

CREATE TABLE `ec_product_collection_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collection_products`
--

INSERT INTO `ec_product_collection_products` (`id`, `product_collection_id`, `product_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 3, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 6),
(7, 1, 7),
(8, 3, 8),
(9, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_cross_sale_relations`
--

CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_related_relations`
--

CREATE TABLE `ec_product_related_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tags`
--

CREATE TABLE `ec_product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tags`
--

INSERT INTO `ec_product_tags` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronic', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(2, 'Mobile', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(3, 'Iphone', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4, 'Printer', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(5, 'Office', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(6, 'IT', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tag_product`
--

CREATE TABLE `ec_product_tag_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tag_product`
--

INSERT INTO `ec_product_tag_product` (`product_id`, `tag_id`) VALUES
(1, 2),
(1, 6),
(2, 3),
(2, 5),
(2, 6),
(3, 1),
(3, 4),
(3, 6),
(4, 1),
(4, 2),
(5, 2),
(5, 3),
(6, 2),
(6, 3),
(6, 6),
(7, 1),
(7, 2),
(8, 1),
(8, 3),
(8, 6),
(9, 1),
(9, 2),
(9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_up_sale_relations`
--

CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variations`
--

CREATE TABLE `ec_product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `configurable_product_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variations`
--

INSERT INTO `ec_product_variations` (`id`, `product_id`, `configurable_product_id`, `is_default`) VALUES
(1, 10, 1, 1),
(2, 11, 2, 1),
(3, 12, 3, 1),
(4, 13, 3, 0),
(5, 14, 3, 0),
(6, 15, 4, 1),
(7, 16, 4, 0),
(8, 17, 4, 0),
(9, 18, 5, 1),
(10, 19, 5, 0),
(11, 20, 6, 1),
(12, 21, 7, 1),
(13, 22, 8, 1),
(14, 23, 8, 0),
(15, 24, 8, 0),
(16, 25, 9, 1),
(17, 26, 9, 0),
(18, 27, 9, 0),
(19, 28, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variation_items`
--

CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variation_items`
--

INSERT INTO `ec_product_variation_items` (`id`, `attribute_id`, `variation_id`) VALUES
(1, 4, 1),
(2, 6, 1),
(3, 5, 2),
(4, 6, 2),
(5, 3, 3),
(6, 8, 3),
(7, 4, 4),
(8, 9, 4),
(9, 2, 5),
(10, 8, 5),
(11, 1, 6),
(12, 7, 6),
(13, 3, 7),
(14, 10, 7),
(15, 3, 8),
(16, 9, 8),
(17, 5, 9),
(18, 10, 9),
(19, 1, 10),
(20, 6, 10),
(21, 1, 11),
(22, 6, 11),
(23, 3, 12),
(24, 10, 12),
(25, 3, 13),
(26, 6, 13),
(27, 2, 14),
(28, 6, 14),
(29, 1, 15),
(30, 6, 15),
(31, 4, 16),
(32, 10, 16),
(33, 4, 17),
(34, 10, 17),
(35, 3, 18),
(36, 9, 18),
(37, 4, 19),
(38, 7, 19);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute`
--

CREATE TABLE `ec_product_with_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute`
--

INSERT INTO `ec_product_with_attribute` (`id`, `attribute_id`, `product_id`) VALUES
(1, 5, 1),
(2, 10, 1),
(3, 3, 2),
(4, 6, 2),
(5, 3, 3),
(6, 10, 3),
(7, 2, 4),
(8, 10, 4),
(9, 4, 5),
(10, 6, 5),
(11, 2, 6),
(12, 9, 6),
(13, 3, 7),
(14, 8, 7),
(15, 5, 8),
(16, 8, 8),
(17, 1, 9),
(18, 8, 9);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute_set`
--

CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

INSERT INTO `ec_product_with_attribute_set` (`id`, `attribute_set_id`, `product_id`, `order`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 1, 2, 0),
(4, 2, 2, 0),
(5, 1, 3, 0),
(6, 2, 3, 0),
(7, 1, 4, 0),
(8, 2, 4, 0),
(9, 1, 5, 0),
(10, 2, 5, 0),
(11, 1, 6, 0),
(12, 2, 6, 0),
(13, 1, 7, 0),
(14, 2, 7, 0),
(15, 1, 8, 0),
(16, 2, 8, 0),
(17, 1, 9, 0),
(18, 2, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_reviews`
--

CREATE TABLE `ec_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_reviews`
--

INSERT INTO `ec_reviews` (`id`, `customer_id`, `product_id`, `star`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 4.00, 'King, \'that saves.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(2, 12, 10, 5.00, 'She went on all.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(3, 8, 4, 5.00, 'Mock Turtle, who.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4, 11, 4, 1.00, 'King and the whole.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(5, 14, 6, 1.00, 'Gryphon, \'you.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(6, 3, 9, 1.00, 'Pigeon. \'I can see.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(7, 4, 1, 2.00, 'Queen had never.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(8, 13, 6, 4.00, 'Soon her eye fell.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(9, 14, 7, 2.00, 'Alice very meekly.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(10, 19, 1, 4.00, 'Little Bill It was.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(11, 19, 6, 4.00, 'Hatter: \'but you.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(12, 16, 4, 1.00, 'Hatter. \'You MUST.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(13, 12, 6, 1.00, 'Dinah\'ll be.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(14, 20, 5, 2.00, 'Besides, SHE\'S.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(15, 7, 8, 5.00, 'Alice did not.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(16, 11, 6, 1.00, 'I find a number of.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(17, 9, 8, 3.00, 'Mabel! I\'ll try.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(18, 19, 4, 4.00, 'Alice thought).', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(19, 2, 7, 4.00, 'And I declare it\'s.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(20, 19, 10, 3.00, 'Number One,\' said.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(21, 5, 10, 5.00, 'Footman, \'and that.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(22, 15, 1, 2.00, 'Dormouse denied.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(23, 6, 6, 3.00, 'VERY deeply with a.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(24, 7, 2, 5.00, 'Hatter, and he.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(25, 13, 6, 5.00, 'You know the song.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(26, 11, 7, 1.00, 'Caterpillar took.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(27, 4, 8, 4.00, 'Mock Turtle.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(28, 8, 10, 5.00, 'Alice. The King.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(29, 20, 4, 5.00, 'I wonder what.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(30, 14, 7, 3.00, 'Nile On every.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(31, 3, 7, 2.00, 'Lory, who at last.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(32, 3, 6, 4.00, 'King. \'Shan\'t,\'.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(33, 5, 9, 5.00, 'CHAPTER V. Advice.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(34, 12, 5, 4.00, 'William\'s conduct.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(35, 3, 3, 3.00, 'Queen said to.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(36, 9, 2, 4.00, 'Alice was a very.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(37, 12, 3, 2.00, 'I tell you!\' said.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(38, 17, 3, 2.00, 'Alice did not seem.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(39, 3, 4, 3.00, 'I will just.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(40, 10, 9, 4.00, 'Just at this.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(41, 17, 10, 1.00, 'Alice said to.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(42, 17, 3, 1.00, 'I!\' he replied.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(43, 6, 7, 1.00, 'Alice. \'That\'s the.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(44, 2, 2, 4.00, 'I like being that.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(45, 3, 8, 4.00, 'Duchess\'s cook.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(46, 7, 7, 4.00, 'Then the Queen was.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(47, 3, 1, 5.00, 'Alice, \'it\'s very.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(48, 20, 10, 1.00, 'Hatter, \'or you\'ll.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(49, 19, 4, 2.00, 'Cat, and vanished.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(50, 10, 7, 3.00, 'AT ALL. Soup does.', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipments`
--

CREATE TABLE `ec_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipment_histories`
--

CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping`
--

CREATE TABLE `ec_shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping`
--

INSERT INTO `ec_shipping` (`id`, `title`, `country`, `created_at`, `updated_at`) VALUES
(1, 'All', NULL, '2020-10-06 21:01:40', '2020-10-06 21:01:40');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rules`
--

CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping_rules`
--

INSERT INTO `ec_shipping_rules` (`id`, `name`, `shipping_id`, `type`, `currency_id`, `from`, `to`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Flat rate', 1, 'base_on_price', NULL, '10.00', '300.00', '10.00', '2020-10-06 21:01:40', '2020-10-06 21:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rule_items`
--

CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_rule_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_store_locators`
--

CREATE TABLE `ec_store_locators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_store_locators`
--

INSERT INTO `ec_store_locators` (`id`, `name`, `email`, `phone`, `address`, `country`, `state`, `city`, `is_primary`, `is_shipping_location`, `created_at`, `updated_at`) VALUES
(1, 'Default store', 'admin@botble.com', '123-456-7890', '123 Street, Old Trafford', 'US', 'New York', 'New York', 1, 1, '2020-09-26 21:40:23', '2020-09-26 21:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `ec_taxes`
--

CREATE TABLE `ec_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_taxes`
--

INSERT INTO `ec_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `ec_wish_lists`
--

CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'favicon', 1, 'image/png', 1803, 'general/favicon.png', '[]', '2020-09-18 02:28:05', '2020-09-18 02:28:05', NULL),
(2, 1, 'logo', 1, 'image/png', 3927, 'general/logo.png', '[]', '2020-09-21 02:50:42', '2020-09-21 02:50:42', NULL),
(11, 1, '1', 3, 'image/png', 3509, 'brands/1.png', '[]', '2020-09-26 21:09:42', '2020-09-26 21:09:42', NULL),
(12, 1, '2', 3, 'image/png', 3505, 'brands/2.png', '[]', '2020-09-26 21:09:43', '2020-09-26 21:09:43', NULL),
(13, 1, '3', 3, 'image/png', 2585, 'brands/3.png', '[]', '2020-09-26 21:09:44', '2020-09-26 21:09:44', NULL),
(14, 1, '4', 3, 'image/png', 6427, 'brands/4.png', '[]', '2020-09-26 21:09:45', '2020-09-26 21:09:45', NULL),
(15, 1, '5', 3, 'image/png', 3246, 'brands/5.png', '[]', '2020-09-26 21:09:46', '2020-09-26 21:09:46', NULL),
(16, 1, '6', 3, 'image/png', 3276, 'brands/6.png', '[]', '2020-09-26 21:09:47', '2020-09-26 21:09:47', NULL),
(17, 1, '7', 3, 'image/png', 3120, 'brands/7.png', '[]', '2020-09-26 21:09:48', '2020-09-26 21:09:48', NULL),
(65, 1, '1', 8, 'image/jpeg', 82629, 'news/1.jpg', '[]', '2020-10-02 06:50:47', '2020-10-02 06:50:47', NULL),
(66, 1, '2', 8, 'image/jpeg', 119904, 'news/2.jpg', '[]', '2020-10-02 06:50:49', '2020-10-02 06:50:49', NULL),
(67, 1, '3', 8, 'image/jpeg', 89543, 'news/3.jpg', '[]', '2020-10-02 06:50:50', '2020-10-02 06:50:50', NULL),
(68, 1, '4', 8, 'image/jpeg', 51573, 'news/4.jpg', '[]', '2020-10-02 06:50:52', '2020-10-02 06:50:52', NULL),
(69, 1, '5', 8, 'image/jpeg', 41164, 'news/5.jpg', '[]', '2020-10-02 06:50:54', '2020-10-02 06:50:54', NULL),
(70, 1, '6', 8, 'image/jpeg', 80696, 'news/6.jpg', '[]', '2020-10-02 06:50:55', '2020-10-02 06:50:55', NULL),
(71, 1, 'logo_light', 1, 'image/png', 3736, 'general/logo-light.png', '[]', '2020-10-02 20:42:15', '2020-10-02 20:42:15', NULL),
(72, 1, '1', 9, 'image/jpeg', 2733, 'testimonials/1.jpg', '[]', '2020-10-02 21:00:57', '2020-10-02 21:00:57', NULL),
(73, 1, '2', 9, 'image/jpeg', 2840, 'testimonials/2.jpg', '[]', '2020-10-02 21:00:59', '2020-10-02 21:00:59', NULL),
(74, 1, '3', 9, 'image/jpeg', 3065, 'testimonials/3.jpg', '[]', '2020-10-02 21:01:00', '2020-10-02 21:01:00', NULL),
(75, 1, '4', 9, 'image/jpeg', 2559, 'testimonials/4.jpg', '[]', '2020-10-02 21:01:02', '2020-10-02 21:01:02', NULL),
(76, 1, 'american_express', 1, 'image/png', 3209, 'general/american-express.png', '[]', '2020-10-05 01:54:57', '2020-10-05 01:54:57', NULL),
(77, 1, 'discover', 1, 'image/png', 2494, 'general/discover.png', '[]', '2020-10-05 01:54:58', '2020-10-05 01:54:58', NULL),
(78, 1, 'master_card', 1, 'image/png', 3407, 'general/master-card.png', '[]', '2020-10-05 01:54:59', '2020-10-05 01:54:59', NULL),
(79, 1, 'paypal', 1, 'image/png', 2670, 'general/paypal.png', '[]', '2020-10-05 01:55:00', '2020-10-05 01:55:00', NULL),
(80, 1, 'visa', 1, 'image/png', 2841, 'general/visa.png', '[]', '2020-10-05 01:55:01', '2020-10-05 01:55:01', NULL),
(81, 1, 'newsletter', 1, 'image/jpeg', 48929, 'general/newsletter.jpg', '[]', '2020-10-07 06:25:52', '2020-10-07 06:25:52', NULL),
(82, 1, 'b-1', 5, 'image/jpeg', 20539, 'banners/b-1.jpg', '[]', '2020-10-07 06:28:59', '2020-10-07 06:28:59', NULL),
(83, 1, 'b-2', 5, 'image/jpeg', 18320, 'banners/b-2.jpg', '[]', '2020-10-07 06:29:00', '2020-10-07 06:29:00', NULL),
(84, 1, 'b-3', 5, 'image/jpeg', 42872, 'banners/b-3.jpg', '[]', '2020-10-07 06:29:00', '2020-10-07 06:29:00', NULL),
(85, 1, 'f-1', 6, 'image/jpeg', 11106, 'featured-products/f-1.jpg', '[]', '2020-10-07 06:29:26', '2020-10-07 06:29:26', NULL),
(86, 1, 'f-2', 6, 'image/jpeg', 22667, 'featured-products/f-2.jpg', '[]', '2020-10-07 06:29:26', '2020-10-07 06:29:26', NULL),
(111, 1, 'p-1', 2, 'image/png', 9577, 'product-categories/p-1.png', '[]', '2020-10-07 06:31:27', '2020-10-07 06:31:27', NULL),
(112, 1, 'p-2', 2, 'image/png', 5510, 'product-categories/p-2.png', '[]', '2020-10-07 06:31:28', '2020-10-07 06:31:28', NULL),
(113, 1, 'p-3', 2, 'image/png', 16215, 'product-categories/p-3.png', '[]', '2020-10-07 06:31:29', '2020-10-07 06:31:29', NULL),
(114, 1, 'p-4', 2, 'image/png', 7394, 'product-categories/p-4.png', '[]', '2020-10-07 06:31:30', '2020-10-07 06:31:30', NULL),
(115, 1, 'p-5', 2, 'image/png', 6714, 'product-categories/p-5.png', '[]', '2020-10-07 06:31:31', '2020-10-07 06:31:31', NULL),
(116, 1, 'p-6', 2, 'image/png', 9541, 'product-categories/p-6.png', '[]', '2020-10-07 06:31:32', '2020-10-07 06:31:32', NULL),
(117, 1, 'p-7', 2, 'image/png', 13677, 'product-categories/p-7.png', '[]', '2020-10-07 06:31:33', '2020-10-07 06:31:33', NULL),
(118, 1, '1-p', 4, 'image/jpeg', 11828, 'products/1-p.jpg', '[]', '2020-10-07 06:32:08', '2020-10-07 06:32:08', NULL),
(119, 1, '2-p', 4, 'image/jpeg', 13611, 'products/2-p.jpg', '[]', '2020-10-07 06:32:09', '2020-10-07 06:32:09', NULL),
(120, 1, '3-p', 4, 'image/jpeg', 29315, 'products/3-p.jpg', '[]', '2020-10-07 06:32:11', '2020-10-07 06:32:11', NULL),
(121, 1, '4-p', 4, 'image/jpeg', 18069, 'products/4-p.jpg', '[]', '2020-10-07 06:32:12', '2020-10-07 06:32:12', NULL),
(122, 1, '5-p', 4, 'image/jpeg', 18634, 'products/5-p.jpg', '[]', '2020-10-07 06:32:13', '2020-10-07 06:32:13', NULL),
(123, 1, '6-p', 4, 'image/jpeg', 18243, 'products/6-p.jpg', '[]', '2020-10-07 06:32:13', '2020-10-07 06:32:13', NULL),
(124, 1, '7-p', 4, 'image/jpeg', 27961, 'products/7-p.jpg', '[]', '2020-10-07 06:32:15', '2020-10-07 06:32:15', NULL),
(125, 1, '8-p', 4, 'image/jpeg', 10698, 'products/8-p.jpg', '[]', '2020-10-07 06:32:16', '2020-10-07 06:32:16', NULL),
(126, 1, '9-p', 4, 'image/jpeg', 12576, 'products/9-p.jpg', '[]', '2020-10-07 06:32:17', '2020-10-07 06:32:17', NULL),
(127, 1, '10-p', 4, 'image/jpeg', 12569, 'products/10-p.jpg', '[]', '2020-10-07 06:32:18', '2020-10-07 06:32:18', NULL),
(128, 1, '11-p', 4, 'image/jpeg', 27107, 'products/11-p.jpg', '[]', '2020-10-07 06:32:20', '2020-10-07 06:32:20', NULL),
(129, 1, '12-p', 4, 'image/jpeg', 33934, 'products/12-p.jpg', '[]', '2020-10-07 06:32:21', '2020-10-07 06:32:21', NULL),
(130, 1, 'hover-1-p', 4, 'image/jpeg', 8682, 'products/hover-1-p.jpg', '[]', '2020-10-07 06:32:23', '2020-10-07 06:32:23', NULL),
(131, 1, 'hover-2-p', 4, 'image/jpeg', 13085, 'products/hover-2-p.jpg', '[]', '2020-10-07 06:32:24', '2020-10-07 06:32:24', NULL),
(132, 1, 'hover-3-p', 4, 'image/jpeg', 10054, 'products/hover-3-p.jpg', '[]', '2020-10-07 06:32:25', '2020-10-07 06:32:25', NULL),
(133, 1, 'hover-4-p', 4, 'image/jpeg', 17089, 'products/hover-4-p.jpg', '[]', '2020-10-07 06:32:26', '2020-10-07 06:32:26', NULL),
(134, 1, 'hover-5-p', 4, 'image/jpeg', 25924, 'products/hover-5-p.jpg', '[]', '2020-10-07 06:32:28', '2020-10-07 06:32:28', NULL),
(135, 1, 'hover-6-p', 4, 'image/jpeg', 15654, 'products/hover-6-p.jpg', '[]', '2020-10-07 06:32:29', '2020-10-07 06:32:29', NULL),
(136, 1, 'hover-7-p', 4, 'image/jpeg', 27890, 'products/hover-7-p.jpg', '[]', '2020-10-07 06:32:30', '2020-10-07 06:32:30', NULL),
(137, 1, 'hover-8-p', 4, 'image/jpeg', 10509, 'products/hover-8-p.jpg', '[]', '2020-10-07 06:32:32', '2020-10-07 06:32:32', NULL),
(138, 1, 'hover-9-p', 4, 'image/jpeg', 13379, 'products/hover-9-p.jpg', '[]', '2020-10-07 06:32:34', '2020-10-07 06:32:34', NULL),
(139, 1, 'hover-10-p', 4, 'image/jpeg', 10286, 'products/hover-10-p.jpg', '[]', '2020-10-07 06:32:36', '2020-10-07 06:32:36', NULL),
(140, 1, 'hover-11-p', 4, 'image/jpeg', 26283, 'products/hover-11-p.jpg', '[]', '2020-10-07 06:32:38', '2020-10-07 06:32:38', NULL),
(141, 1, 'hover-12-p', 4, 'image/jpeg', 15533, 'products/hover-12-p.jpg', '[]', '2020-10-07 06:32:39', '2020-10-07 06:32:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'General', 'general', 0, '2020-09-18 02:27:53', '2020-09-18 02:27:53', NULL),
(2, 1, 'Product Categories', 'product-categories', 0, '2020-09-26 20:06:44', '2020-09-26 20:06:44', NULL),
(3, 1, 'Brands', 'brands', 0, '2020-09-26 21:09:24', '2020-09-26 21:09:24', NULL),
(4, 1, 'Products', 'products', 0, '2020-09-26 21:37:02', '2020-09-26 21:37:02', NULL),
(5, 1, 'Banners', 'banners', 0, '2020-09-28 08:11:12', '2020-09-28 08:11:12', NULL),
(6, 1, 'Featured products', 'featured-products', 0, '2020-09-29 01:58:05', '2020-09-29 01:58:05', NULL),
(8, 1, 'News', 'news', 0, '2020-10-02 06:50:14', '2020-10-02 06:50:14', NULL),
(9, 1, 'Testimonials', 'testimonials', 0, '2020-10-02 21:00:47', '2020-10-02 21:00:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Useful Links', 'useful-links', 'published', '2020-09-21 03:03:53', '2020-09-21 03:03:53'),
(2, 'Categories', 'categories', 'published', '2020-09-21 03:05:56', '2020-09-21 03:05:56'),
(3, 'My Account', 'my-account', 'published', '2020-09-21 03:06:57', '2020-09-21 03:06:57'),
(4, 'Main menu', 'main-menu', 'published', '2020-09-21 03:43:51', '2020-09-21 03:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 4, 'main-menu', '2020-09-21 03:44:33', '2020-09-21 03:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `reference_id` int(10) UNSIGNED DEFAULT '0',
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, NULL, 'about-us', '', 0, 'About Us', '', '_self', 0, '2020-09-21 03:04:41', '2020-10-05 01:41:59'),
(2, 1, 0, 0, NULL, 'faq', '', 1, 'FAQ', '', '_self', 0, '2020-09-21 03:04:41', '2020-10-05 01:41:59'),
(3, 1, 0, 0, NULL, 'location', '', 2, 'Location', '', '_self', 0, '2020-09-21 03:04:41', '2020-10-05 01:41:59'),
(4, 1, 0, 0, NULL, 'affiliates', '', 3, 'Affiliates', '', '_self', 0, '2020-09-21 03:04:41', '2020-10-05 01:41:59'),
(5, 1, 0, 0, NULL, 'contact-us', '', 4, 'Contact', '', '_self', 0, '2020-09-21 03:04:41', '2020-10-05 01:41:59'),
(6, 2, 0, 0, NULL, 'product-categories/television', '', 0, 'Television', '', '_self', 0, '2020-09-21 03:06:39', '2020-09-26 21:03:41'),
(7, 2, 0, 0, NULL, 'product-categories/mobile', '', 1, 'Mobile', '', '_self', 0, '2020-09-21 03:06:39', '2020-09-26 21:03:41'),
(8, 2, 0, 0, NULL, 'product-categories/watches', '', 2, 'Watches', '', '_self', 0, '2020-09-21 03:06:39', '2020-09-26 21:03:41'),
(9, 2, 0, 0, NULL, '/products?collections%5B%5D=2', '', 3, 'Best Seller', '', '_self', 0, '2020-09-21 03:06:39', '2020-10-05 01:40:54'),
(10, 2, 0, 0, NULL, '/products?collections%5B%5D=1', '', 4, 'New Arrivals', '', '_self', 0, '2020-09-21 03:06:39', '2020-10-05 01:40:54'),
(11, 3, 0, 0, NULL, '/customer/overview', '', 0, 'My profile', '', '_self', 0, '2020-09-21 03:07:31', '2020-10-05 01:38:41'),
(12, 3, 0, 0, NULL, '/wishlist', '', 1, 'Wishlist', '', '_self', 0, '2020-09-21 03:07:31', '2020-10-05 01:38:41'),
(13, 3, 0, 0, NULL, 'customer/orders', '', 2, 'Orders', '', '_self', 0, '2020-09-21 03:07:31', '2020-10-05 01:38:41'),
(14, 3, 0, 0, NULL, '/orders/tracking', '', 3, 'Order tracking', '', '_self', 0, '2020-09-21 03:07:31', '2020-10-05 01:38:41'),
(15, 4, 0, 0, NULL, '/', '', 0, 'Home', '', '_self', 0, '2020-09-21 03:44:33', '2020-09-21 03:44:33'),
(16, 4, 0, 3, 'Botble\\Page\\Models\\Page', NULL, '', 3, 'Blog', '', '_self', 1, '2020-09-21 03:44:33', '2020-10-02 22:24:06'),
(17, 4, 0, 2, 'Botble\\Page\\Models\\Page', NULL, '', 4, 'Contact us', '', '_self', 0, '2020-09-21 03:44:33', '2020-10-02 22:24:06'),
(18, 4, 0, 0, NULL, '/', '', 2, 'Shop', '', '_self', 1, '2020-09-21 03:44:33', '2020-10-02 22:24:06'),
(21, 4, 18, 0, NULL, 'product-categories/watches', '', 0, 'Product Category', '', '_self', 0, '2020-09-26 21:56:03', '2020-10-02 22:24:06'),
(22, 4, 0, 0, NULL, '/products', '', 1, 'Products', '', '_self', 0, '2020-10-02 22:24:06', '2020-10-02 22:24:06'),
(23, 4, 18, 0, NULL, '/products/beat-headphone', '', 3, 'Product single', '', '_self', 0, '2020-10-02 22:24:06', '2020-10-05 01:36:32'),
(24, 4, 16, 0, NULL, '/news/4-expert-tips-on-how-to-choose-the-right-mens-wallet', '', 3, 'Blog single', '', '_self', 0, '2020-10-02 22:24:06', '2020-10-05 01:36:32'),
(25, 4, 16, 0, NULL, '/blog', '', 0, 'Blog left sidebar', '', '_self', 0, '2020-10-05 01:32:51', '2020-10-05 01:32:51'),
(26, 4, 18, 0, NULL, '/brands', '', 1, 'Brands', '', '_self', 0, '2020-10-05 01:36:32', '2020-10-05 01:36:32'),
(27, 4, 18, 0, NULL, '/product-tags/electronic', '', 2, 'Product tag', '', '_self', 0, '2020-10-05 01:36:32', '2020-10-05 01:36:32'),
(28, 4, 16, 0, NULL, '/news/ecommerce', '', 1, 'Blog category', '', '_self', 0, '2020-10-05 01:36:32', '2020-10-05 01:36:32'),
(29, 4, 16, 0, NULL, '/tags/modern', '', 2, 'Blog tag', '', '_self', 0, '2020-10-05 01:36:32', '2020-10-05 01:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `reference_id`, `meta_key`, `meta_value`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-09-21 03:40:45', '2020-09-21 03:40:45'),
(2, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-09-21 03:41:43', '2020-09-21 03:41:43'),
(3, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-09-21 03:42:08', '2020-09-21 03:42:08'),
(4, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-09-21 03:42:47', '2020-09-21 03:42:47'),
(5, 1, 'icon', '[\"flaticon-tv\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(6, 2, 'icon', '[\"flaticon-responsive\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(7, 3, 'icon', '[\"flaticon-headphones\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(8, 4, 'icon', '[\"flaticon-watch\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(9, 5, 'icon', '[\"flaticon-console\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(10, 6, 'icon', '[\"flaticon-camera\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(11, 7, 'icon', '[\"flaticon-music-system\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-28 21:51:12'),
(12, 8, 'icon', '[\"flaticon-responsive\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(13, 9, 'icon', '[\"flaticon-plugins\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(14, 10, 'icon', '[\"flaticon-music-system\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(15, 11, 'icon', '[\"flaticon-monitor\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(16, 12, 'icon', '[\"flaticon-printer\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(17, 13, 'icon', '[\"flaticon-tv\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-28 21:51:12'),
(18, 14, 'icon', '[\"flaticon-fax\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(19, 15, 'icon', '[\"flaticon-mouse\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:31:01', '2020-09-26 20:32:54'),
(20, 19, 'icon', '[\"flaticon-watch\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(21, 25, 'icon', '[\"flaticon-console\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(22, 26, 'icon', '[\"flaticon-camera\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(23, 27, 'icon', '[\"flaticon-music-system\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(24, 28, 'icon', '[\"flaticon-responsive\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(25, 29, 'icon', '[\"flaticon-plugins\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(26, 30, 'icon', '[\"flaticon-music-system\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(27, 31, 'icon', '[\"flaticon-monitor\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(28, 32, 'icon', '[\"flaticon-printer\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(29, 33, 'icon', '[\"flaticon-tv\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(30, 34, 'icon', '[\"flaticon-fax\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(31, 35, 'icon', '[\"flaticon-mouse\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-09-26 20:50:57', '2020-09-26 20:50:57'),
(32, 10, 'featured_image', '[\"products\\/hover-10.jpg\"]', 'Botble\\Ecommerce\\Models\\Product', '2020-09-28 21:11:07', '2020-09-28 21:11:07'),
(33, 10, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-09-28 21:11:07', '2020-09-28 21:11:07'),
(34, 1, 'featured_image', '[\"featured-products\\/f-1.jpg\"]', 'Botble\\Ecommerce\\Models\\Product', '2020-09-28 21:13:09', '2020-10-07 06:36:02'),
(35, 2, 'featured_image', '[\"featured-products\\/f-2.jpg\"]', 'Botble\\Ecommerce\\Models\\Product', '2020-09-28 21:13:09', '2020-10-07 06:36:02'),
(36, 3, 'featured_image', '[\"featured-products\\/f-1.jpg\"]', 'Botble\\Ecommerce\\Models\\Product', '2020-09-28 21:13:09', '2020-10-07 06:36:02'),
(37, 4, 'featured_image', '[\"featured-products\\/1.jpg\"]', 'Botble\\Ecommerce\\Models\\Product', '2020-09-28 21:13:09', '2020-09-29 02:15:26'),
(38, 25, 'featured_image', '[null]', 'Botble\\Ecommerce\\Models\\Product', '2020-10-03 08:36:30', '2020-10-03 08:36:30'),
(39, 26, 'featured_image', '[null]', 'Botble\\Ecommerce\\Models\\Product', '2020-10-03 08:36:44', '2020-10-03 08:36:44'),
(40, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-10-05 01:44:17', '2020-10-05 01:44:17'),
(41, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-10-05 01:44:28', '2020-10-05 01:44:28'),
(42, 7, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-10-05 01:44:40', '2020-10-05 01:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_07_15_042406_change_site_title_from_settings_to_theme_options', 1),
(14, '2019_08_13_033145_remove_unused_columns_in_users_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2019_09_07_030654_update_menu_nodes_table', 1),
(17, '2019_09_07_045041_update_slugs_table', 1),
(18, '2019_09_07_050405_update_slug_reference_for_page', 1),
(19, '2019_09_08_014859_update_meta_boxes_table', 1),
(20, '2019_09_08_015629_update_meta_box_data_for_page', 1),
(21, '2019_09_12_073711_update_media_url', 1),
(22, '2019_10_20_002256_remove_parent_id_in_pages_table', 1),
(23, '2020_03_28_020724_make_column_user_id_nullable_table_revisions', 1),
(24, '2015_06_18_033822_create_blog_table', 2),
(25, '2019_09_07_035526_update_menu_node_reference_type_for_category', 2),
(26, '2019_09_07_050058_update_slug_reference_for_blog', 2),
(27, '2019_09_07_155716_update_language_meta_for_blog', 2),
(28, '2019_09_08_015552_update_meta_box_data_for_blog', 2),
(29, '2019_10_20_002342_remove_parent_id_in_tags_table', 2),
(30, '2015_06_29_025744_create_audit_history', 3),
(31, '2016_06_17_091537_create_contacts_table', 4),
(32, '2017_05_18_080441_create_payment_tables', 5),
(33, '2020_02_03_144309_update_column_payment_channel', 5),
(34, '2020_02_11_133026_add_description_to_table_payments', 5),
(35, '2020_03_23_093053_update_payments_table', 5),
(36, '2017_10_24_154832_create_newsletter_table', 6),
(37, '2016_10_07_193005_create_translations_table', 7),
(38, '2020_03_05_041139_create_ecommerce_tables', 8),
(39, '2020_09_22_135635_update_taxes_table', 9),
(40, '2020_09_29_101006_add_views_into_ec_products_table', 10),
(41, '2018_07_09_214610_create_testimonial_table', 11),
(42, '2020_09_03_152245_add_company_to_testimonials_table', 11),
(43, '2020_09_03_153420_add_status_to_testimonials_table', 11),
(44, '2020_10_01_152311_make_column_image_in_product_attributes_table_nullable', 12),
(45, '2020_10_05_030817_make_column_charge_id_nullable', 13),
(47, '2020_10_06_073439_improve_ecommerce_database', 14);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'minhsang2603@gmail.com', NULL, 'subscribed', '2020-09-18 01:36:28', '2020-09-18 01:36:28'),
(2, 'minhsang2603+3@gmail.com', NULL, 'subscribed', '2020-09-18 01:45:14', '2020-09-18 01:45:14'),
(3, 'minhsang2603+1@gmail.com', NULL, 'subscribed', '2020-09-18 01:48:30', '2020-09-18 01:48:30'),
(4, 'minhsang2603+2@gmail.com', NULL, 'subscribed', '2020-09-18 01:50:52', '2020-09-18 01:50:52'),
(5, 'minhsang2603+5@gmail.com', NULL, 'subscribed', '2020-09-18 01:53:38', '2020-09-18 01:53:38'),
(6, 'minhsang2603+6@gmail.com', NULL, 'unsubscribed', '2020-09-18 01:57:39', '2020-09-18 01:58:30'),
(7, 'minhsang2603+7@gmail.com', NULL, 'subscribed', '2020-09-18 01:59:07', '2020-09-18 01:59:07'),
(8, 'minhsang2603+8@gmail.com', NULL, 'subscribed', '2020-09-18 02:03:20', '2020-09-18 02:03:20'),
(9, 'minhsang2603+9@gmail.com', NULL, 'subscribed', '2020-09-18 02:07:09', '2020-09-18 02:07:09'),
(10, 'minhsang2603+10@gmail.com', NULL, 'subscribed', '2020-09-18 02:13:58', '2020-09-18 02:13:58'),
(11, 'minhsang2603+11@gmail.com', NULL, 'subscribed', '2020-09-18 02:16:40', '2020-09-18 02:16:40'),
(12, 'minhsang2603+4@gmail.com', NULL, 'subscribed', '2020-09-21 02:01:16', '2020-09-21 02:01:16'),
(13, 'minhsang2603+24@gmail.com', NULL, 'subscribed', '2020-10-02 21:14:40', '2020-10-02 21:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '<div>[featured-products limit=&quot;2&quot;][/featured-products]</div>\r\n\r\n<div>[featured-product-categories title=&quot;Top Categories&quot; description=&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.&quot;][/featured-product-categories]</div>\r\n\r\n<div>[product-collections title=&quot;Exclusive Products&quot;][/product-collections]</div>\r\n\r\n<div>[banners image1=&quot;banners/b-1.jpg&quot; url1=&quot;/product-categories/headphone&quot; image2=&quot;banners/b-2.jpg&quot; url2=&quot;/product-categories/camera&quot; image3=&quot;banners/b-3.jpg&quot; url3=&quot;/product-categories/watches&quot;][/banners]</div>\r\n\r\n<div>[trending-products title=&quot;Trending Products&quot;][[/trending-products]</div>\r\n\r\n<div>[product-blocks featured_product_title=&quot;Featured Products&quot; top_rated_product_title=&quot;Top Rated Products&quot; on_sale_product_title=&quot;On Sale Products&quot;][/product-blocks]</div>\r\n\r\n<div>[featured-brands title=&quot;Our Brands&quot;][/featured-brands]</div>\r\n\r\n<div>[featured-news title=&quot;Visit Our Blog&quot; description=&quot;Our Blog updated the newest trend of the world regularly&quot;][/featured-news]\r\n<div>[testimonials title=&quot;Our Client Say!&quot;][/testimonials]</div>\r\n\r\n<div>[our-features icon1=&quot;flaticon-shipped&quot; title1=&quot;Free Delivery&quot; description1=&quot;Free shipping on all US order or order above $200&quot; icon2=&quot;flaticon-money-back&quot; title2=&quot;30 Day Returns Guarantee&quot; description2=&quot;Simply return it within 30 days for an exchange&quot; icon3=&quot;flaticon-support&quot; title3=&quot;27/4 Online Support&quot; description3=&quot;Contact us 24 hours a day, 7 days a week&quot;][/our-features]</div>\r\n\r\n<div>[newsletter-form title=&quot;Join Our Newsletter Now&quot; description=&quot;Register now to get updates on promotions.&quot;][/newsletter-form]</div>\r\n</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2020-09-21 03:40:45', '2020-10-07 06:37:35'),
(2, 'Contact us', '<div>[contact-form][/contact-form]</div>', 1, NULL, 'default', 0, NULL, 'published', '2020-09-21 03:41:43', '2020-09-21 03:41:43'),
(3, 'Blog', '<p>---</p>', 1, NULL, 'blog-sidebar', 0, NULL, 'published', '2020-09-21 03:42:08', '2020-10-02 07:03:51'),
(4, 'About us', '<p>---</p>', 1, NULL, 'default', 0, NULL, 'published', '2020-09-21 03:42:47', '2020-09-21 03:42:47'),
(5, 'FAQ', '<p>---</p>', 1, NULL, 'default', 0, NULL, 'published', '2020-10-05 01:44:17', '2020-10-05 01:44:17'),
(6, 'Location', '<p>---</p>', 1, NULL, 'default', 0, NULL, 'published', '2020-10-05 01:44:28', '2020-10-05 01:44:28'),
(7, 'Affiliates', '<p>---</p>', 1, NULL, 'default', 0, NULL, 'published', '2020-10-05 01:44:40', '2020-10-05 01:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `currency`, `user_id`, `charge_id`, `payment_channel`, `created_at`, `updated_at`, `description`, `order_id`, `status`, `payment_type`, `customer_id`, `refunded_amount`, `refund_note`) VALUES
(1, '16.50', 'USD', 0, 'GI0JG3TNKO', 'cod', '2020-10-02 22:03:01', '2020-10-02 22:03:01', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(2, '47.85', 'USD', 0, '9K1JJBSTPQ', 'cod', '2020-10-06 20:40:21', '2020-10-06 20:40:21', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(3, '57.85', 'USD', 0, 'RPFRDAERGL', 'cod', '2020-10-06 21:18:30', '2020-10-06 21:18:30', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(4, '62.67', 'USD', 0, 'NKNKWQJZ7O', 'cod', '2020-10-06 21:24:29', '2020-10-06 21:24:29', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(5, '62.47', 'USD', 0, 'CIVTUULYP1', 'bank_transfer', '2020-10-06 22:01:32', '2020-10-06 22:01:32', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(6, '62.67', 'USD', 0, 'BCL4AHXVFA', 'bank_transfer', '2020-10-06 22:04:20', '2020-10-06 22:04:20', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(7, '106.05', 'USD', 0, '3CCC6NDEXY', 'cod', '2020-10-07 01:54:22', '2020-10-07 01:54:22', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL),
(8, '44.30', 'USD', 0, '1PXW4G3GM2', 'bank_transfer', '2020-10-07 02:20:38', '2020-10-07 02:20:38', NULL, NULL, 'pending', 'confirm', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, '4 Expert Tips On How To Choose The Right Men???s Wallet', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 575, NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(2, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'There isn???t much a girl can???t handle with the right accessories. That???s why the perfect women???s clutch bag is a wardrobe essential for first dates and spring weddings.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 197, NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(3, 'The Top 2020 Handbag Trends to Know', 'For the handbag obsessives, let\'s dive into the latter a little more. This year will bring a fresh array of bag designs, and already we\'ve gotten a sneak peek of what both spring and fall 2020 collections have to offer/', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 125, NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4, 'How to Match the Color of Your Handbag With an Outfit', 'To match your multi-colored purses with your favorite outfits, simply select a complementary handbag hue that will make your outfit pop for work or the weekend.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 1573, NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(5, 'How to Care for Leather Bags', 'A leather bag is a special, near-universally beloved object, appreciated in equal measure by bon-vivants of both sexes, who cherish the supple hand, understated burnish and heady smell that can only emanate from premium quality skin.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 299, NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(6, 'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends', 'Summer is just around the corner, and there\'s no easier way to amp up your new-season look than with a chic, new handbag. Whether you\'re wearing basic sweat shorts and a tank top or a pretty floral maxi dress, a bag is an effortless way to add interest to all your summer ensembles.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 2368, NULL, '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(117, 1, 5),
(119, 1, 1),
(120, 1, 2),
(121, 4, 3),
(122, 2, 4),
(123, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 1, 4),
(17, 2, 4),
(18, 3, 4),
(19, 4, 4),
(20, 5, 4),
(21, 1, 5),
(22, 2, 5),
(23, 3, 5),
(24, 4, 5),
(25, 5, 5),
(26, 1, 6),
(27, 2, 6),
(28, 3, 6),
(29, 4, 6),
(30, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\Page\\Models\\Page', 1, 1, 'template', 'default', 'homepage', '2020-09-21 03:41:22', '2020-09-21 03:41:22'),
(2, 'Botble\\Page\\Models\\Page', 1, 1, 'name', 'Homepage', 'Home', '2020-09-21 03:42:29', '2020-09-21 03:42:29'),
(3, 'Botble\\Page\\Models\\Page', 3, 1, 'template', 'default', 'blog-sidebar', '2020-10-02 07:03:51', '2020-10-02 07:03:51');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'theme--site_title', '', NULL, NULL),
(2, 'theme--show_site_name', '', NULL, NULL),
(3, 'theme--seo_title', '', NULL, NULL),
(4, 'theme--seo_description', '', NULL, NULL),
(5, 'theme', 'shopwise', NULL, NULL),
(6, 'activated_plugins', '[\"analytics\",\"blog\",\"backup\",\"audit-log\",\"captcha\",\"contact\",\"cookie-consent\",\"payment\",\"newsletter\",\"translation\",\"paystack\",\"razorpay\",\"testimonial\",\"social-login\",\"ecommerce\"]', NULL, NULL),
(7, 'membership_authorization_at', '2020-10-05 08:06:06', NULL, NULL),
(8, 'payment_cod_status', '1', NULL, NULL),
(9, 'payment_bank_transfer_status', '1', NULL, NULL),
(10, 'theme-shopwise-site_title', 'Shopwise - Laravel Ecommerce System', NULL, NULL),
(11, 'theme-shopwise-show_site_name', '0', NULL, NULL),
(12, 'theme-shopwise-seo_title', 'Shopwise - Laravel Ecommerce System', NULL, NULL),
(13, 'theme-shopwise-seo_description', '', NULL, NULL),
(14, 'theme-shopwise-seo_og_image', '', NULL, NULL),
(15, 'theme-shopwise-copyright', '?? 2020 All Rights Reserved by Botble Technologies.', NULL, NULL),
(16, 'theme-shopwise-preloader_enabled', 'no', NULL, NULL),
(17, 'theme-shopwise-favicon', 'general/favicon.png', NULL, NULL),
(18, 'theme-shopwise-logo', 'general/logo.png', NULL, NULL),
(19, 'theme-shopwise-facebook', '#', NULL, NULL),
(20, 'theme-shopwise-twitter', '#', NULL, NULL),
(21, 'theme-shopwise-youtube', '#', NULL, NULL),
(22, 'theme-shopwise-behance', '', NULL, NULL),
(23, 'theme-shopwise-linkedin', '', NULL, NULL),
(25, 'theme-shopwise-number_of_posts_in_a_category', '12', NULL, NULL),
(26, 'theme-shopwise-number_of_posts_in_a_tag', '12', NULL, NULL),
(28, 'theme-shopwise-cookie_consent_enable', 'yes', NULL, NULL),
(29, 'theme-shopwise-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies.', NULL, NULL),
(30, 'theme-shopwise-cookie_consent_button_text', 'Allow cookies', NULL, NULL),
(31, 'admin_email', 'admin@botble.com', NULL, NULL),
(32, 'time_zone', 'UTC', NULL, NULL),
(33, 'locale', 'en', NULL, NULL),
(34, 'enable_send_error_reporting_via_email', '0', NULL, NULL),
(37, 'admin_title', 'Botble Technologies', NULL, NULL),
(38, 'rich_editor', 'ckeditor', NULL, NULL),
(39, 'default_admin_theme', 'default', NULL, NULL),
(40, 'enable_change_admin_theme', '1', NULL, NULL),
(41, 'enable_multi_language_in_admin', '1', NULL, NULL),
(42, 'enable_cache', '0', NULL, NULL),
(43, 'cache_time', '10', NULL, NULL),
(44, 'cache_admin_menu_enable', '0', NULL, NULL),
(46, 'cache_time_site_map', '3600', NULL, NULL),
(47, 'show_admin_bar', '1', NULL, NULL),
(52, 'enable_captcha', '0', NULL, NULL),
(53, 'captcha_type', 'v2', NULL, NULL),
(58, 'theme-shopwise-hotline', '123-456-7890', NULL, NULL),
(59, 'theme-shopwise-address', '123 Street, Old Trafford, NewYork, USA', NULL, NULL),
(60, 'theme-shopwise-email', 'info@sitename.com', NULL, NULL),
(61, 'theme-shopwise-primary_font', 'Poppins', NULL, NULL),
(62, 'theme-shopwise-primary_color', '#FF324D', NULL, NULL),
(63, 'theme-shopwise-about-us', 'If you are going to use of Lorem Ipsum need to be sure there isn\'t anything hidden of text.', NULL, NULL),
(64, 'theme-shopwise-instagram', '#', NULL, NULL),
(67, 'theme-shopwise-newsletter_image', 'general/newsletter.jpg', NULL, NULL),
(68, 'theme-shopwise-blog_page_id', '3', NULL, NULL),
(71, 'ecommerce_store_name', 'Shopwise', NULL, NULL),
(72, 'ecommerce_store_phone', '123-456-7890', NULL, NULL),
(73, 'ecommerce_store_address', '123 Street, Old Trafford', NULL, NULL),
(74, 'ecommerce_store_state', 'New York', NULL, NULL),
(75, 'ecommerce_store_city', 'New York', NULL, NULL),
(76, 'ecommerce_store_country', 'US', NULL, NULL),
(79, 'ecommerce_store_weight_unit', 'g', NULL, NULL),
(80, 'ecommerce_store_width_height_unit', 'cm', NULL, NULL),
(81, 'ecommerce_currencies_is_default', '0', NULL, NULL),
(82, 'ecommerce_shopping_cart_enabled', '1', NULL, NULL),
(83, 'ecommerce_review_enabled', '1', NULL, NULL),
(84, 'theme-shopwise-secondary_color', '#1D2224', NULL, NULL),
(87, 'theme-shopwise-homepage_id', '1', NULL, NULL),
(88, 'theme-shopwise-logo_footer', 'general/logo-light.png', NULL, NULL),
(89, 'permalink-botble-page-models-page', '', NULL, NULL),
(90, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(91, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(92, 'permalink-botble-blog-models-tag', 'tags', NULL, NULL),
(93, 'permalink-botble-ecommerce-models-product', 'products', NULL, NULL),
(94, 'permalink-botble-ecommerce-models-brand', 'brands', NULL, NULL),
(95, 'permalink-botble-ecommerce-models-productcategory', 'product-categories', NULL, NULL),
(96, 'permalink-botble-ecommerce-models-producttag', 'product-tags', NULL, NULL),
(97, 'theme-shopwise-facebook_chat_enabled', 'yes', NULL, NULL),
(98, 'theme-shopwise-facebook_page_id', '', NULL, NULL),
(99, 'theme-shopwise-facebook_comment_enabled_in_post', 'yes', NULL, NULL),
(100, 'theme-shopwise-facebook_comment_enabled_in_product', 'yes', NULL, NULL),
(101, 'theme-shopwise-payment_method_1', 'general/visa.png', NULL, NULL),
(102, 'theme-shopwise-payment_method_2', 'general/paypal.png', NULL, NULL),
(103, 'theme-shopwise-payment_method_3', 'general/master-card.png', NULL, NULL),
(104, 'theme-shopwise-payment_method_4', 'general/discover.png', NULL, NULL),
(105, 'theme-shopwise-payment_method_5', 'general/american-express.png', NULL, NULL),
(106, 'theme-shopwise-payment_method_6', '', NULL, NULL),
(107, 'ecommerce_store_order_prefix', NULL, NULL, NULL),
(108, 'ecommerce_store_order_suffix', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'home', 1, 'Botble\\Page\\Models\\Page', '', '2020-09-21 03:40:45', '2020-10-02 22:24:25'),
(2, 'contact-us', 2, 'Botble\\Page\\Models\\Page', '', '2020-09-21 03:41:43', '2020-10-02 22:24:25'),
(3, 'blog', 3, 'Botble\\Page\\Models\\Page', '', '2020-09-21 03:42:08', '2020-10-02 22:24:25'),
(4, 'about-us', 4, 'Botble\\Page\\Models\\Page', '', '2020-09-21 03:42:47', '2020-10-02 22:24:25'),
(2870, 'faq', 5, 'Botble\\Page\\Models\\Page', '', '2020-10-05 01:44:17', '2020-10-05 01:44:17'),
(2871, 'location', 6, 'Botble\\Page\\Models\\Page', '', '2020-10-05 01:44:28', '2020-10-05 01:44:28'),
(2872, 'affiliates', 7, 'Botble\\Page\\Models\\Page', '', '2020-10-05 01:44:40', '2020-10-05 01:44:40'),
(4027, 'television', 1, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:41', '2020-10-09 06:51:41'),
(4028, 'mobile', 2, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:41', '2020-10-09 06:51:41'),
(4029, 'headphone', 3, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4030, 'watches', 4, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4031, 'game', 5, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4032, 'camera', 6, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4033, 'audio', 7, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4034, 'mobile-tablet', 8, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4035, 'accessories', 9, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4036, 'home-audio-theater', 10, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4037, 'tv-smart-box', 11, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4038, 'printer', 12, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4039, 'computer', 13, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4040, 'fax-machine', 14, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4041, 'mouse', 15, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4042, 'please-mind-what-youre', 16, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4043, 'marmalade-but-to-open-them', 17, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4044, 'between-yourself-and-me', 18, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4045, 'alice-but-youre-so-easily', 19, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4046, 'as-she-said-to-live-ive', 20, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4047, 'the-knave-of-hearts-who', 21, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4048, 'i-shall-only-look-up-and', 22, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4049, 'alice-soon-came-upon-a-time', 23, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4050, 'alice-aloud-addressing', 24, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4051, 'i-to-do-anything-but-sit', 25, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4052, 'i-shall-have-to-beat-time', 26, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4053, 'and-so-it-was-too-much', 27, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4054, 'alice-replied-very-solemnly', 28, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4055, 'hatter-said-tossing-his', 29, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4056, 'the-gryphon-lifted-up-both', 30, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4057, 'cheshire-cat-said-the', 31, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4058, 'as-she-said-to-alice-and', 32, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4059, 'queen-jumped-up-on-tiptoe', 33, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4060, 'alice-in-a-game-of-croquet', 34, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4061, 'she-generally-gave-herself', 35, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4062, 'fashion-live', 1, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4063, 'hand-crafted', 2, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4064, 'mestonix', 3, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4065, 'sunshine', 4, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4066, 'pure', 5, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4067, 'anfold', 6, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4068, 'automotive', 7, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4069, 'dual-camera-20mp', 1, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4070, 'smart-watches', 2, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4071, 'beat-headphone', 3, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4072, 'red-black-headphone', 4, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4073, 'smart-watch-external', 5, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4074, 'nikon-hd-camera', 6, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4075, 'audio-equipment', 7, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4076, 'smart-televisions', 8, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4077, 'samsung-smart-phone', 9, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-10-09 06:51:42', '2020-10-09 06:51:42'),
(4078, 'electronic', 1, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4079, 'mobile', 2, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4080, 'iphone', 3, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4081, 'printer', 4, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4082, 'office', 5, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4083, 'it', 6, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4084, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4085, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4086, 'jquery', 3, 'Botble\\Blog\\Models\\Tag', 'tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4087, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4088, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tags', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4089, 'ecommerce', 1, 'Botble\\Blog\\Models\\Category', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4090, 'fashion', 2, 'Botble\\Blog\\Models\\Category', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4091, 'electronic', 3, 'Botble\\Blog\\Models\\Category', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4092, 'commercial', 4, 'Botble\\Blog\\Models\\Category', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4093, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 1, 'Botble\\Blog\\Models\\Post', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4094, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 2, 'Botble\\Blog\\Models\\Post', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4095, 'the-top-2020-handbag-trends-to-know', 3, 'Botble\\Blog\\Models\\Post', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4096, 'how-to-match-the-color-of-your-handbag-with-an-outfit', 4, 'Botble\\Blog\\Models\\Post', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4097, 'how-to-care-for-leather-bags', 5, 'Botble\\Blog\\Models\\Post', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4098, 'were-crushing-hard-on-summers-10-biggest-bag-trends', 6, 'Botble\\Blog\\Models\\Post', 'news', '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(3, 'Jquery', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-10-09 06:51:48', '2020-10-09 06:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `content`, `image`, `created_at`, `updated_at`, `company`, `status`) VALUES
(1, 'Donald H. Hilixer', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 'testimonials/1.jpg', '2020-10-09 06:51:48', '2020-10-09 06:51:48', 'Founder, Hilix', 'published'),
(2, 'Rosalina D. William', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 'testimonials/2.jpg', '2020-10-09 06:51:48', '2020-10-09 06:51:48', 'Founder, qux co.', 'published'),
(3, 'John Becker', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 'testimonials/3.jpg', '2020-10-09 06:51:48', '2020-10-09 06:51:48', 'CEO, Highlands coffee', 'published'),
(4, 'Browfish Dumble', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 'testimonials/4.jpg', '2020-10-09 06:51:48', '2020-10-09 06:51:48', 'Founder, Condo', 'published');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(2, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(3, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(4, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(5, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(6, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(7, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(8, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(9, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(10, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(11, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(12, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(13, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(14, 1, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(15, 1, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2020-10-09 03:54:21', '2020-10-09 03:54:21'),
(16, 1, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(17, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(18, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(19, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(20, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(21, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(22, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(23, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(24, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(25, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(26, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(27, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(28, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(29, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(30, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(31, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(32, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(33, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(34, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(35, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(36, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(37, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(38, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(39, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(40, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(41, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(42, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(43, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(44, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(45, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(46, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(47, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(48, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(49, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(50, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(51, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(52, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(53, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(54, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(55, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(56, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(57, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(58, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(59, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(60, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(61, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(62, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(63, 1, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(64, 1, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(65, 1, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(66, 1, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(67, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(68, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(69, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(70, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(71, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(72, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(73, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(74, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(75, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(76, 1, 'en', 'validation', 'password', 'The password is incorrect.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(77, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(78, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(79, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(80, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(81, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(82, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(83, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(84, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(85, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(86, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(87, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(88, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(89, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(90, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(91, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(92, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(93, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(94, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(95, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(96, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(97, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(98, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(99, 1, 'en', 'core/acl/api', 'api_clients', 'API Clients', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(100, 1, 'en', 'core/acl/api', 'create_new_client', 'Create new client', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(101, 1, 'en', 'core/acl/api', 'create_new_client_success', 'Create new client successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(102, 1, 'en', 'core/acl/api', 'edit_client', 'Edit client \":name\"', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(103, 1, 'en', 'core/acl/api', 'edit_client_success', 'Updated client successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(104, 1, 'en', 'core/acl/api', 'delete_success', 'Deleted client successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(105, 1, 'en', 'core/acl/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(106, 1, 'en', 'core/acl/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(107, 1, 'en', 'core/acl/api', 'cancel_delete', 'No', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(108, 1, 'en', 'core/acl/api', 'continue_delete', 'Yes, let\'s delete it!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(109, 1, 'en', 'core/acl/api', 'name', 'Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(110, 1, 'en', 'core/acl/api', 'cancel', 'Cancel', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(111, 1, 'en', 'core/acl/api', 'save', 'Save', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(112, 1, 'en', 'core/acl/api', 'edit', 'Edit', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(113, 1, 'en', 'core/acl/api', 'delete', 'Delete', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(114, 1, 'en', 'core/acl/api', 'client_id', 'Client ID', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(115, 1, 'en', 'core/acl/api', 'secret', 'Secret', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(116, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(117, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(118, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(119, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(120, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(121, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(122, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(123, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(124, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(125, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(126, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(127, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(128, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(129, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(130, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(131, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(132, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(133, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(134, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(135, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(136, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(137, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(138, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(139, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(140, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(141, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(142, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(143, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(144, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(145, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(146, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(147, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(148, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(149, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(150, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(151, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(152, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(153, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(154, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(155, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(156, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(157, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(158, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(159, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(160, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(161, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(162, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(163, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(164, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(165, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(166, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(167, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(168, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(169, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(170, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(171, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(172, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(173, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(174, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(175, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(176, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(177, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(178, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(179, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(180, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(181, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(182, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(183, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(184, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(185, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(186, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(187, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(188, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(189, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(190, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(191, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(192, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(193, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(194, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(195, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(196, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(197, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(198, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(199, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(200, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(201, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(202, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(203, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(204, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(205, 1, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(206, 1, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(207, 1, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(208, 1, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(209, 1, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(210, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(211, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(212, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(213, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(214, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(215, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(216, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(217, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(218, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(219, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(220, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(221, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(222, 1, 'en', 'core/acl/users', 'email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(223, 1, 'en', 'core/acl/users', 'role', 'Role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(224, 1, 'en', 'core/acl/users', 'username', 'Username', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(225, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(226, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(227, 1, 'en', 'core/acl/users', 'message', 'Message', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(228, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(229, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(230, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(231, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(232, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(233, 1, 'en', 'core/acl/users', 'password', 'Password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(234, 1, 'en', 'core/acl/users', 'save', 'Save', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(235, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(236, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(237, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(238, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(239, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(240, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(241, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(242, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(243, 1, 'en', 'core/acl/users', 'close', 'Close', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(244, 1, 'en', 'core/acl/users', 'update', 'Update', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(245, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(246, 1, 'en', 'core/acl/users', 'users', 'Users', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(247, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(248, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(249, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(250, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(251, 1, 'en', 'core/acl/users', 'info.email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(252, 1, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(253, 1, 'en', 'core/acl/users', 'info.address', 'Address', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(254, 1, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(255, 1, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(256, 1, 'en', 'core/acl/users', 'info.job', 'Job Position', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(257, 1, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(258, 1, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(259, 1, 'en', 'core/acl/users', 'info.interes', 'Interests', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(260, 1, 'en', 'core/acl/users', 'info.about', 'About', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(261, 1, 'en', 'core/acl/users', 'gender.title', 'Gender', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(262, 1, 'en', 'core/acl/users', 'gender.male', 'Male', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(263, 1, 'en', 'core/acl/users', 'gender.female', 'Female', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(264, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(265, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(266, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(267, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(268, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(269, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(270, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(271, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(272, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(273, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(274, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(275, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(276, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(277, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(278, 1, 'vi', 'core/acl/auth', 'login.username', 'T??n truy c????p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(279, 1, 'vi', 'core/acl/auth', 'login.password', 'M????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(280, 1, 'vi', 'core/acl/auth', 'login.title', '????ng nh???p v??o qu???n tr???', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(281, 1, 'vi', 'core/acl/auth', 'login.remember', 'Nh???? m????t kh????u?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(282, 1, 'vi', 'core/acl/auth', 'login.login', '????ng nh????p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(283, 1, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lo??ng nh????p t??n truy c????p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(284, 1, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui l??ng nh???p email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(285, 1, 'vi', 'core/acl/auth', 'login.success', '????ng nh????p tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(286, 1, 'vi', 'core/acl/auth', 'login.fail', 'Sai t??n truy c????p ho????c m????t kh????u.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(287, 1, 'vi', 'core/acl/auth', 'login.not_active', 'Ta??i khoa??n cu??a ba??n ch??a ????????c ki??ch hoa??t!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(288, 1, 'vi', 'core/acl/auth', 'login.banned', 'Ta??i khoa??n na??y ??a?? bi?? kho??a.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(289, 1, 'vi', 'core/acl/auth', 'login.logout_success', '????ng xu????t tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(290, 1, 'vi', 'core/acl/auth', 'login.dont_have_account', 'B???n kh??ng c?? t??i kho???n trong h??? th???ng, vui l??ng li??n h??? qu???n tr??? vi??n!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(291, 1, 'vi', 'core/acl/auth', 'login.email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(292, 1, 'vi', 'core/acl/auth', 'forgot_password.title', 'Qu??n m????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(293, 1, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Qu??n m????t kh????u?</p><p>Vui l??ng nh???p email ????ng nh???p t??i kho???n c???a b???n ????? h??? th???ng g???i li??n k???t kh??i ph???c m???t kh???u.</p>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(294, 1, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoa??n t????t', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(295, 1, 'vi', 'core/acl/auth', 'reset.new_password', 'M????t kh????u m????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(296, 1, 'vi', 'core/acl/auth', 'reset.repassword', 'Xa??c nh????n m????t kh????u m????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(297, 1, 'vi', 'core/acl/auth', 'reset.title', 'Kh??i phu??c m????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(298, 1, 'vi', 'core/acl/auth', 'reset.update', 'C????p nh????t', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(299, 1, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Li??n k????t na??y kh??ng chi??nh xa??c ho????c ??a?? h????t hi????u l????c, vui lo??ng y??u c????u kh??i phu??c m????t kh????u la??i!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(300, 1, 'vi', 'core/acl/auth', 'reset.user_not_found', 'T??n ????ng nh????p kh??ng t????n ta??i.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(301, 1, 'vi', 'core/acl/auth', 'reset.success', 'Kh??i phu??c m????t kh????u tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(302, 1, 'vi', 'core/acl/auth', 'reset.fail', 'Token kh??ng h????p l???? ho????c li??n k????t kh??i phu??c m????t kh????u ??a?? h????t th????i gian hi????u l????c!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(303, 1, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email kh??i phu??c m????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(304, 1, 'vi', 'core/acl/auth', 'reset.send.success', 'M????t email kh??i phu??c m????t kh????u ??a?? ????????c g????i t????i email cu??a ba??n, vui lo??ng ki????m tra va?? hoa??n t????t y??u c????u.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(305, 1, 'vi', 'core/acl/auth', 'reset.send.fail', 'Kh??ng th???? g????i email trong lu??c na??y. Vui lo??ng th????c hi????n la??i sau.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(306, 1, 'vi', 'core/acl/auth', 'reset.new-password', 'M????t kh????u m????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(307, 1, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(308, 1, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email kh??i phu??c m????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(309, 1, 'vi', 'core/acl/auth', 'failed', 'Kh??ng tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(310, 1, 'vi', 'core/acl/auth', 'repassword', 'Xa??c nh????n m????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(311, 1, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(312, 1, 'vi', 'core/acl/auth', 'back_to_login', 'Quay l???i trang ????ng nh???p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(313, 1, 'vi', 'core/acl/auth', 'login_title', '????ng nh???p v??o qu???n tr???', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(314, 1, 'vi', 'core/acl/auth', 'login_via_social', '????ng nh???p th??ng qua m???ng x?? h???i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(315, 1, 'vi', 'core/acl/auth', 'lost_your_password', 'Qu??n m???t kh???u?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(316, 1, 'vi', 'core/acl/auth', 'not_member', 'Ch??a l?? th??nh vi??n?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(317, 1, 'vi', 'core/acl/auth', 'register_now', '????ng k?? ngay', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(318, 1, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Kh??ng th???? xo??a quy????n ng??????i du??ng na??y vi?? no?? ??ang ????????c s???? du??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(319, 1, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Kh??ng th???? xo??a quy????n ha??n na??y vi?? no?? thu????c v???? ng??????i kha??c!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(320, 1, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Ba??n kh??ng ????????c phe??p s????a quy????n na??y vi?? no?? thu????c v???? ng??????i kha??c', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(321, 1, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Ba??n kh??ng th???? xo??a quy????n ng??????i du??ng h???? th????ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(322, 1, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quy????n ng??????i du??ng ??a?? ????????c xo??a!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(323, 1, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quy????n ng??????i du??ng ??a?? ????????c c????p nh????t tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(324, 1, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quy????n ng??????i du??ng m????i ??a?? ????????c ta??o tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(325, 1, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quy????n ng??????i du??ng ??a?? ????????c sao che??p tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(326, 1, 'vi', 'core/acl/permissions', 'notices.no_select', 'Ha??y cho??n i??t nh????t m????t quy????n ng??????i du??ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(327, 1, 'vi', 'core/acl/permissions', 'notices.not_found', 'Kh??ng ti??m th????y quy????n ng??????i du??ng na??y', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(328, 1, 'vi', 'core/acl/permissions', 'list', 'Danh sa??ch ph??n quy????n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(329, 1, 'vi', 'core/acl/permissions', 'name', 'T??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(330, 1, 'vi', 'core/acl/permissions', 'current_role', 'Quy????n hi????n ta??i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(331, 1, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Kh??ng co?? quy????n ha??n na??o', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(332, 1, 'vi', 'core/acl/permissions', 'role_assigned', 'Quy????n ??a?? ????????c ga??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(333, 1, 'vi', 'core/acl/permissions', 'create_role', 'Ta??o quy????n m????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(334, 1, 'vi', 'core/acl/permissions', 'role_name', 'T??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(335, 1, 'vi', 'core/acl/permissions', 'role_description', 'M?? ta??', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(336, 1, 'vi', 'core/acl/permissions', 'permission_flags', 'C???? ??a??nh d????u quy????n ha??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(337, 1, 'vi', 'core/acl/permissions', 'cancel', 'Hu??y bo??', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(338, 1, 'vi', 'core/acl/permissions', 'reset', 'La??m la??i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(339, 1, 'vi', 'core/acl/permissions', 'save', 'L??u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(340, 1, 'vi', 'core/acl/permissions', 'global_role_msg', '????y la?? m????t ph??n quy????n toa??n cu??c va?? kh??ng th???? thay ??????i.  Ba??n co?? th???? s???? du??ng nu??t \"Nh??n ba??n\" ?????? ta??o m????t ba??n sao che??p cho ph??n quy????n na??y va?? chi??nh s????a.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(341, 1, 'vi', 'core/acl/permissions', 'details', 'Chi ti????t', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(342, 1, 'vi', 'core/acl/permissions', 'duplicate', 'Nh??n ba??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(343, 1, 'vi', 'core/acl/permissions', 'all', 'T????t ca?? ph??n quy????n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(344, 1, 'vi', 'core/acl/permissions', 'list_role', 'Danh sa??ch quy????n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(345, 1, 'vi', 'core/acl/permissions', 'created_on', 'Nga??y ta??o', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(346, 1, 'vi', 'core/acl/permissions', 'created_by', '????????c ta??o b????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(347, 1, 'vi', 'core/acl/permissions', 'actions', 'Ta??c vu??', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(348, 1, 'vi', 'core/acl/permissions', 'create_success', 'Ta??o tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(349, 1, 'vi', 'core/acl/permissions', 'delete_global_role', 'Kh??ng th???? xo??a quy????n h???? th????ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(350, 1, 'vi', 'core/acl/permissions', 'delete_success', 'Xo??a quy????n tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(351, 1, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nh??n ba??n tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(352, 1, 'vi', 'core/acl/permissions', 'modified_success', 'S????a tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(353, 1, 'vi', 'core/acl/permissions', 'no_select', 'Ha??y cho??n i??t nh????t m????t quy????n ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(354, 1, 'vi', 'core/acl/permissions', 'not_found', 'Kh??ng ti??m th????y quy????n tha??nh vi??n na??o!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(355, 1, 'vi', 'core/acl/permissions', 'options', 'Tu??y cho??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(356, 1, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Kh??ng th???? xo??a quy????n ha??n na??y vi?? no?? thu????c v???? ng??????i kha??c!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(357, 1, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Ba??n kh??ng ????????c phe??p s????a quy????n na??y vi?? no?? thu????c v???? ng??????i kha??c', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(358, 1, 'vi', 'core/acl/permissions', 'role_in_use', 'Kh??ng th???? xo??a quy????n ng??????i du??ng na??y vi?? no?? ??ang ????????c s???? du??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(359, 1, 'vi', 'core/acl/permissions', 'access_denied_message', 'Ba??n kh??ng co?? quy????n s???? du??ng ch????c n??ng na??y!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(360, 1, 'vi', 'core/acl/permissions', 'roles', 'Quy???n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(361, 1, 'vi', 'core/acl/permissions', 'role_permission', 'Nh??m v?? ph??n quy???n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(362, 1, 'vi', 'core/acl/permissions', 'user_management', 'Qu???n l?? ng?????i d??ng h??? th???ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(363, 1, 'vi', 'core/acl/permissions', 'super_user_management', 'Qu???n l?? ng?????i d??ng c???p cao', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(364, 1, 'vi', 'core/acl/reminders', 'password', 'M???t kh???u ph???i ??t nh???t 6 k?? t??? v?? tr??ng kh???p v???i m???t kh???u x??c nh???n.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(365, 1, 'vi', 'core/acl/reminders', 'user', 'H??? th???ng kh??ng th??? t??m th???y t??i kho???n v???i email n??y.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(366, 1, 'vi', 'core/acl/reminders', 'token', 'M?? kh??i ph???c m???t kh???u n??y kh??ng h???p l???.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(367, 1, 'vi', 'core/acl/reminders', 'sent', 'Li??n k???t kh??i ph???c m???t kh???u ???? ???????c g???i!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(368, 1, 'vi', 'core/acl/reminders', 'reset', 'M???t kh???u ???? ???????c thay ?????i!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(369, 1, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Kh??ng th???? xo??a ng??????i du??ng ??ang ????ng nh????p h???? th????ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(370, 1, 'vi', 'core/acl/users', 'no_select', 'Ha??y cho??n i??t nh????t m????t tr??????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(371, 1, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Kh??ng th???? kho??a ng??????i du??ng ??ang ????ng nh????p h???? th????ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(372, 1, 'vi', 'core/acl/users', 'update_success', 'C????p nh????t tra??ng tha??i tha??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(373, 1, 'vi', 'core/acl/users', 'save_setting_failed', 'Co?? l????i xa??y ra trong qua?? tri??nh l??u ca??i ??????t cu??a ng??????i du??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(374, 1, 'vi', 'core/acl/users', 'not_found', 'Kh??ng ti??m th????y ng??????i du??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(375, 1, 'vi', 'core/acl/users', 'email_exist', 'Email na??y ??a?? ????????c s???? du??ng b????i ng??????i du??ng kha??c trong h???? th????ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(376, 1, 'vi', 'core/acl/users', 'username_exist', 'T??n ????ng nh????p na??y ??a?? ????????c s???? du??ng b????i ng??????i du??ng kha??c trong h???? th????ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(377, 1, 'vi', 'core/acl/users', 'update_profile_success', 'Th??ng tin ta??i khoa??n cu??a ba??n ??a?? ????????c c????p nh????t tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(378, 1, 'vi', 'core/acl/users', 'password_update_success', 'C????p nh????t m????t kh????u tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(379, 1, 'vi', 'core/acl/users', 'current_password_not_valid', 'M????t kh????u hi????n ta??i kh??ng chi??nh xa??c', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(380, 1, 'vi', 'core/acl/users', 'user_exist_in', 'Ng??????i du??ng ??a?? la?? tha??nh vi??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(381, 1, 'vi', 'core/acl/users', 'email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(382, 1, 'vi', 'core/acl/users', 'username', 'T??n ????ng nh????p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(383, 1, 'vi', 'core/acl/users', 'role', 'Ph??n quy????n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(384, 1, 'vi', 'core/acl/users', 'first_name', 'Ho??', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(385, 1, 'vi', 'core/acl/users', 'last_name', 'T??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(386, 1, 'vi', 'core/acl/users', 'message', 'Th??ng ??i????p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(387, 1, 'vi', 'core/acl/users', 'cancel_btn', 'Hu??y bo??', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(388, 1, 'vi', 'core/acl/users', 'password', 'M????t kh????u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(389, 1, 'vi', 'core/acl/users', 'new_password', 'M????t kh????u m????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(390, 1, 'vi', 'core/acl/users', 'save', 'L??u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(391, 1, 'vi', 'core/acl/users', 'confirm_new_password', 'Xa??c nh????n m????t kh????u m????i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(392, 1, 'vi', 'core/acl/users', 'deleted', 'Xo??a tha??nh vi??n tha??nh c??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(393, 1, 'vi', 'core/acl/users', 'cannot_delete', 'Kh??ng th???? xo??a tha??nh vi??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(394, 1, 'vi', 'core/acl/users', 'list', 'Danh sa??ch tha??nh vi??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(395, 1, 'vi', 'core/acl/users', 'last_login', 'L???n cu???i ????ng nh???p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(396, 1, 'vi', 'core/acl/users', 'error_update_profile_image', 'C?? l???i trong qu?? tr??nh ?????i ???nh ?????i di???n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(397, 1, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin cha??o :name</h3><p>H??? th???ng v???a nh???n ???????c y??u c???u kh??i ph???c m???t kh???u cho t??i kho???n c???a b???n, ????? ho??n t???t t??c v??? n??y vui l??ng click v??o ???????ng link b??n d?????i.</p><p><a href=\":link\">Kh??i phu??c m????t kh????u</a></p><p>N???u kh??ng ph???i b???n y??u c???u kh??i ph???c m???t kh???u, vui l??ng b??? qua email n??y.</p><p>Email n??y c?? gi?? tr??? trong v??ng 60 ph??t k??? t??? l??c nh???n ???????c email.</p>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(398, 1, 'vi', 'core/acl/users', 'change_profile_image', 'Thay ?????i ???nh ?????i di???n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(399, 1, 'vi', 'core/acl/users', 'new_image', '???nh m???i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(400, 1, 'vi', 'core/acl/users', 'loading', '??ang t???i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(401, 1, 'vi', 'core/acl/users', 'close', '????ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(402, 1, 'vi', 'core/acl/users', 'update', 'C???p nh???t', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(403, 1, 'vi', 'core/acl/users', 'read_image_failed', 'Kh??ng ?????c ???????c n???i dung c???a h??nh ???nh', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(404, 1, 'vi', 'core/acl/users', 'update_avatar_success', 'C???p nh???t ???nh ?????i di???n th??nh c??ng!', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(405, 1, 'vi', 'core/acl/users', 'users', 'Qu???n tr??? vi??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(406, 1, 'vi', 'core/acl/users', 'info.title', 'Th??ng tin ng?????i d??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(407, 1, 'vi', 'core/acl/users', 'info.first_name', 'H???', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(408, 1, 'vi', 'core/acl/users', 'info.last_name', 'T??n', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(409, 1, 'vi', 'core/acl/users', 'info.email', 'Email', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(410, 1, 'vi', 'core/acl/users', 'info.second_email', 'Email d??? ph??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(411, 1, 'vi', 'core/acl/users', 'info.address', '?????a ch???', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(412, 1, 'vi', 'core/acl/users', 'info.second_address', '?????a ch??? d??? ph??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(413, 1, 'vi', 'core/acl/users', 'info.birth_day', 'Ng??y sinh', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(414, 1, 'vi', 'core/acl/users', 'info.job', 'Ngh??? nghi???p', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(415, 1, 'vi', 'core/acl/users', 'info.mobile_number', 'S??? ??i???n tho???i di ?????ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(416, 1, 'vi', 'core/acl/users', 'info.second_mobile_number', 'S??? ??i???n tho???i d??? ph??ng', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(417, 1, 'vi', 'core/acl/users', 'info.interes', 'S??? th??ch', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(418, 1, 'vi', 'core/acl/users', 'info.about', 'Gi???i thi???u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(419, 1, 'vi', 'core/acl/users', 'gender.title', 'Gi???i t??nh', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(420, 1, 'vi', 'core/acl/users', 'gender.male', 'nam', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(421, 1, 'vi', 'core/acl/users', 'gender.female', 'n???', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(422, 1, 'vi', 'core/acl/users', 'change_password', 'Thay ?????i m???t kh???u', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(423, 1, 'vi', 'core/acl/users', 'current_password', 'M???t kh???u hi???n t???i', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(424, 1, 'en', 'core/base/base', 'yes', 'Yes', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(425, 1, 'en', 'core/base/base', 'no', 'No', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(426, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(427, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(428, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(429, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(430, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(431, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(432, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(433, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(434, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(435, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(436, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(437, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(438, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(439, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(440, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(441, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(442, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(443, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(444, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(445, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(446, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(447, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(448, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(449, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(450, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(451, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(452, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(453, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(454, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(455, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://shopwise.local/admin\">clicking here</a>.', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(456, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(457, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(458, 1, 'en', 'core/base/forms', 'save', 'Save', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(459, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(460, 1, 'en', 'core/base/forms', 'image', 'Image', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(461, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(462, 1, 'en', 'core/base/forms', 'create', 'Create', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(463, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(464, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(465, 1, 'en', 'core/base/forms', 'ok', 'OK', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(466, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(467, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(468, 1, 'en', 'core/base/forms', 'template', 'Template', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(469, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(470, 1, 'en', 'core/base/forms', 'file', 'File', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(471, 1, 'en', 'core/base/forms', 'content', 'Content', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(472, 1, 'en', 'core/base/forms', 'description', 'Description', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(473, 1, 'en', 'core/base/forms', 'name', 'Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(474, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(475, 1, 'en', 'core/base/forms', 'title', 'Title', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(476, 1, 'en', 'core/base/forms', 'value', 'Value', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(477, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(478, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2020-10-09 03:54:22', '2020-10-09 03:54:22'),
(479, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(480, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(481, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(482, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(483, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(484, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(485, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(486, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(487, 1, 'en', 'core/base/forms', 'update', 'Update', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(488, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(489, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(490, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(491, 1, 'en', 'core/base/forms', 'order', 'Order', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(492, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(493, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(494, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(495, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(496, 1, 'en', 'core/base/forms', 'add', 'Add', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(497, 1, 'en', 'core/base/forms', 'link', 'Link', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(498, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(499, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(500, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(501, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(502, 1, 'en', 'core/base/layouts', 'appearance', 'Appearance', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(503, 1, 'en', 'core/base/layouts', 'menu', 'Menu', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(504, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(505, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(506, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(507, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(508, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(509, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(510, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(511, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(512, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(513, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(514, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(515, 1, 'en', 'core/base/layouts', 'home', 'Home', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(516, 1, 'en', 'core/base/layouts', 'search', 'Search', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(517, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(518, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(519, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(520, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(521, 1, 'en', 'core/base/mail', 'send-fail', 'Send email failed', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(522, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(523, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(524, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(525, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(526, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(527, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(528, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(529, 1, 'en', 'core/base/notices', 'error', 'Error!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(530, 1, 'en', 'core/base/notices', 'success', 'Success!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(531, 1, 'en', 'core/base/notices', 'info', 'Info!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(532, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(533, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(534, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(535, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(536, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(537, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(538, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(539, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(540, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(541, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(542, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(543, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(544, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(545, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(546, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(547, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(548, 1, 'en', 'core/base/system', 'user.email', 'Email', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(549, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(550, 1, 'en', 'core/base/system', 'user.username', 'Username', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(551, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(552, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(553, 1, 'en', 'core/base/system', 'user.create', 'Create', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(554, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(555, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(556, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(557, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(558, 1, 'en', 'core/base/system', 'options.info', 'System information', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(559, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(560, 1, 'en', 'core/base/system', 'info.title', 'System information', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(561, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(562, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(563, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(564, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(565, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(566, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(567, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(568, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(569, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(570, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(571, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(572, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(573, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(574, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(575, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(576, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(577, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(578, 1, 'en', 'core/base/system', 'database', 'Database', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(579, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(580, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(581, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(582, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(583, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(584, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(585, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(586, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(587, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(588, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(589, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(590, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(591, 1, 'en', 'core/base/system', 'installed_packages', 'Installed Packages and their version numbers', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(592, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(593, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(594, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(595, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(596, 1, 'en', 'core/base/system', 'version', 'Version', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(597, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(598, 1, 'en', 'core/base/tables', 'id', 'ID', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(599, 1, 'en', 'core/base/tables', 'name', 'Name', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(600, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(601, 1, 'en', 'core/base/tables', 'title', 'Title', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(602, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(603, 1, 'en', 'core/base/tables', 'order', 'Order', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(604, 1, 'en', 'core/base/tables', 'status', 'Status', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(605, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(606, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(607, 1, 'en', 'core/base/tables', 'description', 'Description', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(608, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(609, 1, 'en', 'core/base/tables', 'url', 'URL', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(610, 1, 'en', 'core/base/tables', 'author', 'Author', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(611, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(612, 1, 'en', 'core/base/tables', 'column', 'Column', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(613, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(614, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(615, 1, 'en', 'core/base/tables', 'views', 'Views', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(616, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(617, 1, 'en', 'core/base/tables', 'session', 'Session', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(618, 1, 'en', 'core/base/tables', 'activated', 'activated', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(619, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(620, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(621, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(622, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(623, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(624, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(625, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(626, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(627, 1, 'en', 'core/base/tables', 'export', 'Export', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(628, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(629, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(630, 1, 'en', 'core/base/tables', 'print', 'Print', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(631, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(632, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(633, 1, 'en', 'core/base/tables', 'display', 'Display', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(634, 1, 'en', 'core/base/tables', 'all', 'All', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(635, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(636, 1, 'en', 'core/base/tables', 'action', 'Actions', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(637, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(638, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(639, 1, 'en', 'core/base/tables', 'save', 'Save', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(640, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(641, 1, 'en', 'core/base/tables', 'to', 'to', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(642, 1, 'en', 'core/base/tables', 'in', 'in', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(643, 1, 'en', 'core/base/tables', 'records', 'records', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(644, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(645, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(646, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(647, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(648, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(649, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(650, 1, 'en', 'core/base/tables', 'template', 'Template', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(651, 1, 'en', 'core/base/tables', 'email', 'Email', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(652, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(653, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(654, 1, 'en', 'core/base/tables', 'image', 'Image', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(655, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(656, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(657, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(658, 1, 'en', 'core/base/tabs', 'file', 'Files', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(659, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(660, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(661, 1, 'vi', 'core/base/cache', 'cache_management', 'Qu???n l?? b??? nh??? ?????m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(662, 1, 'vi', 'core/base/cache', 'cache_commands', 'C??c l???nh xo?? b??? nh??? ?????m c?? b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(663, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'X??a t???t c??? b??? ?????m hi???n c?? c???a ???ng d???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(664, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'X??a c??c b??? nh??? ?????m c???a ???ng d???ng: c?? s??? d??? li???u, n???i dung t??nh... Ch???y l???nh n??y khi b???n th??? c???p nh???t d??? li???u nh??ng giao di???n kh??ng thay ?????i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(665, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'B??? ?????m ???? ???????c x??a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(666, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'L??m m???i b??? ?????m giao di???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(667, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'L??m m???i b??? ?????m giao di???n gi??p ph???n giao di???n lu??n m???i nh???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(668, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'B??? ?????m giao di???n ???? ???????c l??m m???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(669, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'X??a b??? nh??? ?????m c???a ph???n c???u h??nh', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(670, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'B???n c???n l??m m???i b??? ?????m c???u h??nh khi b???n t???o ra s??? thay ?????i n??o ???? ??? m??i tr?????ng th??nh ph???m.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(671, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'B??? ?????m c???u h??nh ???? ???????c x??a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(672, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xo?? cache ???????ng d???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(673, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'C???n th???c hi???n thao t??c n??y khi th???y kh??ng xu???t hi???n ???????ng d???n m???i.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(674, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'B??? ?????m ??i???u h?????ng ???? b??? x??a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(675, 1, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xo?? l???ch s??? l???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(676, 1, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'L???ch s??? l???i ???? ???????c l??m s???ch', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(677, 1, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xo?? l???ch s??? l???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(678, 1, 'vi', 'core/base/enums', 'statuses.draft', 'B???n nh??p', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(679, 1, 'vi', 'core/base/enums', 'statuses.pending', '??ang ch??? x??? l??', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(680, 1, 'vi', 'core/base/enums', 'statuses.publish', '???? xu???t b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(681, 1, 'vi', 'core/base/errors', '401_title', 'Ba??n kh??ng co?? quy????n truy c????p trang na??y', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(682, 1, 'vi', 'core/base/errors', '401_msg', '<li>Ba??n kh??ng ????????c c????p quy????n truy c????p b????i qua??n tri?? vi??n.</li>\n	                <li>Ba??n s???? du??ng sai loa??i ta??i khoa??n.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(683, 1, 'vi', 'core/base/errors', '404_title', 'Kh??ng ti??m th????y trang y??u c????u', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(684, 1, 'vi', 'core/base/errors', '404_msg', '<li>Trang ba??n y??u c????u kh??ng t????n ta??i.</li>\n	                <li>Li??n k????t ba??n v????a nh????n kh??ng co??n ????????c s???? du??ng.</li>\n	                <li>Trang na??y co?? th???? ??a?? ????????c chuy????n sang vi?? tri?? kha??c.</li>\n	                <li>Co?? th???? co?? l????i xa??y ra.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(685, 1, 'vi', 'core/base/errors', '500_title', 'Kh??ng th???? ta??i trang', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(686, 1, 'vi', 'core/base/errors', '500_msg', '<li>Trang ba??n y??u c????u kh??ng t????n ta??i.</li>\n	                <li>Li??n k????t ba??n v????a nh????n kh??ng co??n ????????c s???? du??ng.</li>\n	                <li>Trang na??y co?? th???? ??a?? ????????c chuy????n sang vi?? tri?? kha??c.</li>\n	                <li>Co?? th???? co?? l????i xa??y ra.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(687, 1, 'vi', 'core/base/errors', 'reasons', '??i???u n??y c?? th??? x???y ra v?? nhi???u l?? do.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(688, 1, 'vi', 'core/base/errors', 'try_again', 'Vui l??ng th??? l???i trong v??i ph??t, ho???c quay tr??? l???i trang chu?? b???ng ca??ch <a href=\"http://cms.local/admin\"> nh???n v??o ????y </a>.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(689, 1, 'vi', 'core/base/forms', 'choose_image', 'Ch???n ???nh', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(690, 1, 'vi', 'core/base/forms', 'actions', 'T??c v???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(691, 1, 'vi', 'core/base/forms', 'save', 'L??u', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(692, 1, 'vi', 'core/base/forms', 'save_and_continue', 'L??u & ch???nh s???a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(693, 1, 'vi', 'core/base/forms', 'image', 'H??nh ???nh', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(694, 1, 'vi', 'core/base/forms', 'image_placeholder', 'Ch??n ???????ng d???n h??nh ???nh ho???c nh???n n??t ????? ch???n h??nh', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(695, 1, 'vi', 'core/base/forms', 'create', 'T???o m???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(696, 1, 'vi', 'core/base/forms', 'edit', 'S???a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(697, 1, 'vi', 'core/base/forms', 'permalink', '????????ng d????n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(698, 1, 'vi', 'core/base/forms', 'ok', 'OK', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(699, 1, 'vi', 'core/base/forms', 'cancel', 'Hu??y bo??', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(700, 1, 'vi', 'core/base/forms', 'character_remain', 'k?? t??? c??n l???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(701, 1, 'vi', 'core/base/forms', 'template', 'Template', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(702, 1, 'vi', 'core/base/forms', 'choose_file', 'Ch???n t???p tin', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(703, 1, 'vi', 'core/base/forms', 'file', 'T???p tin', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(704, 1, 'vi', 'core/base/forms', 'content', 'N???i dung', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(705, 1, 'vi', 'core/base/forms', 'description', 'M?? t???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(706, 1, 'vi', 'core/base/forms', 'name', 'T??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(707, 1, 'vi', 'core/base/forms', 'name_placeholder', 'Nh???p t??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(708, 1, 'vi', 'core/base/forms', 'description_placeholder', 'M?? t??? ng???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(709, 1, 'vi', 'core/base/forms', 'parent', 'Cha', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(710, 1, 'vi', 'core/base/forms', 'icon', 'Bi???u t?????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(711, 1, 'vi', 'core/base/forms', 'order_by', 'S???p x???p', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(712, 1, 'vi', 'core/base/forms', 'order_by_placeholder', 'S???p x???p', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(713, 1, 'vi', 'core/base/forms', 'slug', 'Slug', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(714, 1, 'vi', 'core/base/forms', 'is_featured', 'N???i b???t?', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(715, 1, 'vi', 'core/base/forms', 'is_default', 'M???c ?????nh?', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(716, 1, 'vi', 'core/base/forms', 'icon_placeholder', 'V?? d???: fa fa-home', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(717, 1, 'vi', 'core/base/forms', 'update', 'C???p nh???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(718, 1, 'vi', 'core/base/forms', 'publish', 'Xu???t b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(719, 1, 'vi', 'core/base/forms', 'remove_image', 'Xo?? ???nh', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(720, 1, 'vi', 'core/base/forms', 'add', 'Th??m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(721, 1, 'vi', 'core/base/forms', 'add_short_code', 'Th??m shortcode', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(722, 1, 'vi', 'core/base/forms', 'alias', 'M?? thay th???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(723, 1, 'vi', 'core/base/forms', 'alias_placeholder', 'M?? thay th???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(724, 1, 'vi', 'core/base/forms', 'basic_information', 'Th??ng tin c?? b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(725, 1, 'vi', 'core/base/forms', 'link', 'Li??n k???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(726, 1, 'vi', 'core/base/forms', 'order', 'Th??? t???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(727, 1, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(728, 1, 'vi', 'core/base/forms', 'title', 'Ti??u ?????', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(729, 1, 'vi', 'core/base/forms', 'value', 'Gi?? tr???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(730, 1, 'vi', 'core/base/forms', 'show_hide_editor', '???n/Hi???n tr??nh so???n th???o', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(731, 1, 'vi', 'core/base/forms', 'basic_info_title', 'Th??ng tin c?? b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(732, 1, 'vi', 'core/base/layouts', 'platform_admin', 'Qu???n tr??? h??? th???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(733, 1, 'vi', 'core/base/layouts', 'dashboard', 'B???ng ??i???u khi???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(734, 1, 'vi', 'core/base/layouts', 'appearance', 'Hi???n th???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(735, 1, 'vi', 'core/base/layouts', 'menu', 'Tr??nh ????n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(736, 1, 'vi', 'core/base/layouts', 'widgets', 'Ti???n ??ch', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(737, 1, 'vi', 'core/base/layouts', 'theme_options', 'Tu??? ch???n giao di???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(738, 1, 'vi', 'core/base/layouts', 'plugins', 'Ti???n ??ch m??? r???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(739, 1, 'vi', 'core/base/layouts', 'settings', 'C??i ?????t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(740, 1, 'vi', 'core/base/layouts', 'setting_general', 'C?? b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(741, 1, 'vi', 'core/base/layouts', 'system_information', 'Th??ng tin h??? th???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(742, 1, 'vi', 'core/base/layouts', 'theme', 'Giao di???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(743, 1, 'vi', 'core/base/layouts', 'copyright', 'B???n quy???n :year &copy; :company. Phi??n b???n: <span>:version</span>', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(744, 1, 'vi', 'core/base/layouts', 'profile', 'Th??ng tin c?? nh??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(745, 1, 'vi', 'core/base/layouts', 'logout', '????ng xu???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(746, 1, 'vi', 'core/base/layouts', 'no_search_result', 'Kh??ng c?? k???t qu??? t??m ki???m, h??y th??? l???i v???i t??? kh??a kh??c.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(747, 1, 'vi', 'core/base/layouts', 'home', 'Trang ch???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(748, 1, 'vi', 'core/base/layouts', 'search', 'T??m ki???m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(749, 1, 'vi', 'core/base/layouts', 'add_new', 'Th??m m???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(750, 1, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(751, 1, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang t???i xong trong', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(752, 1, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngo??i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(753, 1, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(754, 1, 'vi', 'core/base/mail', 'send-fail', 'G????i email kh??ng tha??nh c??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(755, 1, 'vi', 'core/base/mail', 'happy_birthday', 'Ch??c m???ng sinh nh???t!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(756, 1, 'vi', 'core/base/notices', 'create_success_message', 'T???o th??nh c??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(757, 1, 'vi', 'core/base/notices', 'update_success_message', 'C???p nh???t th??nh c??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(758, 1, 'vi', 'core/base/notices', 'delete_success_message', 'X??a th??nh c??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(759, 1, 'vi', 'core/base/notices', 'success_header', 'Th??nh c??ng!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(760, 1, 'vi', 'core/base/notices', 'error_header', 'L???i!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(761, 1, 'vi', 'core/base/notices', 'no_select', 'Cho??n i??t nh????t 1 tr?????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(762, 1, 'vi', 'core/base/notices', 'cannot_delete', 'Kh??ng th??? x??a b???n ghi n??y', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(763, 1, 'vi', 'core/base/notices', 'processing_request', 'H??? th???ng ??ang x??? l?? y??u c???u.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(764, 1, 'vi', 'core/base/notices', 'error', 'L???i!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(765, 1, 'vi', 'core/base/notices', 'success', 'Th??nh c??ng!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(766, 1, 'vi', 'core/base/notices', 'info', 'Th??ng tin!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(767, 1, 'vi', 'core/base/system', 'no_select', 'Ha??y cho??n i??t nh????t 1 tr??????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(768, 1, 'vi', 'core/base/system', 'cannot_find_user', 'Kh??ng th???? ta??i ????????c th??ng tin ng??????i du??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(769, 1, 'vi', 'core/base/system', 'supper_revoked', 'Quy????n qua??n tri?? vi??n cao nh????t ??a?? ????????c g???? bo??', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(770, 1, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Kh??ng th??? g??? b??? quy???n qu???n tr??? c???p cao c???a ch??nh b???n!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(771, 1, 'vi', 'core/base/system', 'cant_remove_supper', 'Ba??n kh??ng co?? quy????n xo??a qua??n tri?? vi??n c????p cao', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(772, 1, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Kh??ng th???? ti??m th????y ng??????i du??ng v????i email na??y', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(773, 1, 'vi', 'core/base/system', 'supper_granted', 'Quy????n qua??n tri?? cao nh????t ??a?? ????????c ga??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(774, 1, 'vi', 'core/base/system', 'delete_log_success', 'Xo??a t????p tin log tha??nh c??ng!', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(775, 1, 'vi', 'core/base/system', 'get_member_success', 'Hi????n thi?? danh sa??ch tha??nh vi??n tha??nh c??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(776, 1, 'vi', 'core/base/system', 'error_occur', 'C?? l???i d?????i ????y', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(777, 1, 'vi', 'core/base/system', 'role_and_permission', 'Ph??n quy????n h???? th????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(778, 1, 'vi', 'core/base/system', 'role_and_permission_description', 'Qua??n ly?? nh????ng ph??n quy????n trong h???? th????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(779, 1, 'vi', 'core/base/system', 'user.list_super', 'Danh sa??ch qua??n tri?? vi??n c????p cao', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(780, 1, 'vi', 'core/base/system', 'user.username', 'T??n ????ng nh????p', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(781, 1, 'vi', 'core/base/system', 'user.email', 'Email', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(782, 1, 'vi', 'core/base/system', 'user.last_login', '????ng nh????p l????n cu????i	', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(783, 1, 'vi', 'core/base/system', 'user.add_user', 'Th??m qua??n tri?? vi??n c????p cao', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(784, 1, 'vi', 'core/base/system', 'user.cancel', 'Hu??y bo??', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(785, 1, 'vi', 'core/base/system', 'user.create', 'Th??m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(786, 1, 'vi', 'core/base/system', 'options.features', 'Ki????m soa??t truy c????p ca??c ti??nh n??ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(787, 1, 'vi', 'core/base/system', 'options.feature_description', 'B????t/t????t ca??c ti??nh n??ng.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(788, 1, 'vi', 'core/base/system', 'options.manage_super', 'Qua??n ly?? qua??n tri?? vi??n c????p cao', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(789, 1, 'vi', 'core/base/system', 'options.manage_super_description', 'Th??m/xo??a qua??n tri?? vi??n c????p cao', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(790, 1, 'vi', 'core/base/system', 'options.info', 'Th??ng tin h???? th????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(791, 1, 'vi', 'core/base/system', 'options.info_description', 'Nh????ng th??ng tin v???? c????u hi??nh hi????n ta??i cu??a h???? th????ng.', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(792, 1, 'vi', 'core/base/system', 'info.title', 'Th??ng tin h???? th????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(793, 1, 'vi', 'core/base/system', 'info.cache', 'B??? nh??? ?????m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(794, 1, 'vi', 'core/base/system', 'info.environment', 'M??i tr?????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(795, 1, 'vi', 'core/base/system', 'info.locale', 'Ng??n ng??? h??? th???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(796, 1, 'vi', 'core/base/system', 'user_management', 'Qu???n l?? th??nh vi??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(797, 1, 'vi', 'core/base/system', 'user_management_description', 'Qu???n l?? ng?????i d??ng trong h??? th???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(798, 1, 'vi', 'core/base/system', 'app_size', 'K??ch th?????c ???ng d???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(799, 1, 'vi', 'core/base/system', 'cache_dir_writable', 'C?? th??? ghi b??? nh??? ?????m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(800, 1, 'vi', 'core/base/system', 'cache_driver', 'Lo???i l??u tr??? b??? nh??? ?????m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(801, 1, 'vi', 'core/base/system', 'copy_report', 'Sao ch??p b??o c??o', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(802, 1, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(803, 1, 'vi', 'core/base/system', 'database', 'H??? th???ng d??? li???u', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(804, 1, 'vi', 'core/base/system', 'debug_mode', 'Ch??? ????? s???a l???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(805, 1, 'vi', 'core/base/system', 'dependency_name', 'T??n g??i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(806, 1, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(807, 1, 'vi', 'core/base/system', 'extra_information', 'Th??ng tin m??? r???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(808, 1, 'vi', 'core/base/system', 'extra_stats', 'Th???ng k?? th??m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(809, 1, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(810, 1, 'vi', 'core/base/system', 'framework_version', 'Phi??n b???n framework', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(811, 1, 'vi', 'core/base/system', 'get_system_report', 'L???y th??ng tin h??? th???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(812, 1, 'vi', 'core/base/system', 'installed_packages', 'C??c g??i ???? c??i ?????t v?? phi??n b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(813, 1, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(814, 1, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(815, 1, 'vi', 'core/base/system', 'package_name', 'T??n g??i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(816, 1, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(817, 1, 'vi', 'core/base/system', 'php_version', 'Phi??n b???n PHP', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(818, 1, 'vi', 'core/base/system', 'report_description', 'Vui l??ng chia s??? th??ng tin n??y nh???m m???c ????ch ??i???u tra nguy??n nh??n g??y l???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(819, 1, 'vi', 'core/base/system', 'server_environment', 'M??i tr?????ng m??y ch???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(820, 1, 'vi', 'core/base/system', 'server_os', 'H??? ??i???u h??nh c???a m??y ch???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(821, 1, 'vi', 'core/base/system', 'server_software', 'Ph???n m???m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(822, 1, 'vi', 'core/base/system', 'session_driver', 'Lo???i l??u tr??? phi??n l??m vi???c', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(823, 1, 'vi', 'core/base/system', 'ssl_installed', '???? c??i ?????t ch???ng ch??? SSL', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(824, 1, 'vi', 'core/base/system', 'storage_dir_writable', 'C?? th??? l??u tr??? d??? li???u t???m', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(825, 1, 'vi', 'core/base/system', 'system_environment', 'M??i tr?????ng h??? th???ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(826, 1, 'vi', 'core/base/system', 'timezone', 'M??i gi???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(827, 1, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(828, 1, 'vi', 'core/base/system', 'version', 'Phi??n b???n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(829, 1, 'vi', 'core/base/system', 'cms_version', 'Phi??n b???n CMS', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(830, 1, 'vi', 'core/base/tables', 'filter_enabled', 'T??m ki???m n??ng cao ???? ???????c k??ch ho???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(831, 1, 'vi', 'core/base/tables', 'id', 'ID', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(832, 1, 'vi', 'core/base/tables', 'name', 'T??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(833, 1, 'vi', 'core/base/tables', 'order_by', 'Th??? t???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(834, 1, 'vi', 'core/base/tables', 'status', 'Tr???ng th??i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(835, 1, 'vi', 'core/base/tables', 'created_at', 'Ng??y t???o', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(836, 1, 'vi', 'core/base/tables', 'updated_at', 'Ng??y c???p nh???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(837, 1, 'vi', 'core/base/tables', 'operations', 'T??c v???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(838, 1, 'vi', 'core/base/tables', 'loading_data', '??ang t???i d??? li???u t??? server', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(839, 1, 'vi', 'core/base/tables', 'url', 'URL', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(840, 1, 'vi', 'core/base/tables', 'author', 'Ng??????i ta??o', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(841, 1, 'vi', 'core/base/tables', 'column', 'C????t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(842, 1, 'vi', 'core/base/tables', 'origin', 'Ba??n cu??', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(843, 1, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay ??????i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(844, 1, 'vi', 'core/base/tables', 'notes', 'Ghi chu??', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(845, 1, 'vi', 'core/base/tables', 'activated', 'k??ch ho???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(846, 1, 'vi', 'core/base/tables', 'browser', 'Tr??nh duy???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(847, 1, 'vi', 'core/base/tables', 'deactivated', 'h???y k??ch ho???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(848, 1, 'vi', 'core/base/tables', 'description', 'M?? t???', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(849, 1, 'vi', 'core/base/tables', 'session', 'Phi??n', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(850, 1, 'vi', 'core/base/tables', 'views', 'L?????t xem', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(851, 1, 'vi', 'core/base/tables', 'restore', 'Kh??i ph???c', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(852, 1, 'vi', 'core/base/tables', 'edit', 'S???a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(853, 1, 'vi', 'core/base/tables', 'delete', 'X??a', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(854, 1, 'vi', 'core/base/tables', 'action', 'H??nh ?????ng', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(855, 1, 'vi', 'core/base/tables', 'activate', 'K??ch ho???t', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(856, 1, 'vi', 'core/base/tables', 'add_new', 'Th??m m???i', '2020-10-09 03:54:23', '2020-10-09 03:54:23'),
(857, 1, 'vi', 'core/base/tables', 'all', 'T???t c???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(858, 1, 'vi', 'core/base/tables', 'cancel', 'H???y b???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(859, 1, 'vi', 'core/base/tables', 'confirm_delete', 'X??c nh???n x??a', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(860, 1, 'vi', 'core/base/tables', 'confirm_delete_msg', 'B???n c?? ch???c ch???n mu???n x??a b???n ghi n??y?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(861, 1, 'vi', 'core/base/tables', 'csv', 'CSV', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(862, 1, 'vi', 'core/base/tables', 'deactivate', 'H???y k??ch ho???t', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(863, 1, 'vi', 'core/base/tables', 'delete_entry', 'X??a b???n ghi', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(864, 1, 'vi', 'core/base/tables', 'display', 'Hi???n th???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(865, 1, 'vi', 'core/base/tables', 'excel', 'Excel', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(866, 1, 'vi', 'core/base/tables', 'export', 'Xu???t b???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(867, 1, 'vi', 'core/base/tables', 'filter', 'Nh???p t??? kh??a...', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(868, 1, 'vi', 'core/base/tables', 'filtered_from', '???????c l???c t???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(869, 1, 'vi', 'core/base/tables', 'in', 'trong t???ng s???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(870, 1, 'vi', 'core/base/tables', 'loading', '??ang t???i d??? li???u t??? h??? th???ng', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(871, 1, 'vi', 'core/base/tables', 'no_data', 'Kh??ng c?? d??? li???u ????? hi???n th???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(872, 1, 'vi', 'core/base/tables', 'no_record', 'Kh??ng c?? d??? li???u', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(873, 1, 'vi', 'core/base/tables', 'pdf', 'PDF', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(874, 1, 'vi', 'core/base/tables', 'print', 'In', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(875, 1, 'vi', 'core/base/tables', 'records', 'b???n ghi', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(876, 1, 'vi', 'core/base/tables', 'reload', 'T???i l???i', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(877, 1, 'vi', 'core/base/tables', 'reset', 'L??m m???i', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(878, 1, 'vi', 'core/base/tables', 'save', 'L??u', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(879, 1, 'vi', 'core/base/tables', 'show_from', 'Hi???n th??? t???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(880, 1, 'vi', 'core/base/tables', 'template', 'Giao di???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(881, 1, 'vi', 'core/base/tables', 'to', '?????n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(882, 1, 'vi', 'core/base/tables', 'view', 'Xem chi ti???t', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(883, 1, 'vi', 'core/base/tables', 'email', 'Email', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(884, 1, 'vi', 'core/base/tables', 'image', 'H??nh ???nh', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(885, 1, 'vi', 'core/base/tables', 'is_featured', 'N???i b???t', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(886, 1, 'vi', 'core/base/tables', 'last_login', 'L???n cu???i ????ng nh???p', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(887, 1, 'vi', 'core/base/tables', 'order', 'Th??? t???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(888, 1, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(889, 1, 'vi', 'core/base/tables', 'slug', 'Slug', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(890, 1, 'vi', 'core/base/tables', 'title', 'Ti??u ?????', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(891, 1, 'vi', 'core/base/tabs', 'detail', 'Chi ti???t', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(892, 1, 'vi', 'core/base/tabs', 'file', 'T???p tin', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(893, 1, 'vi', 'core/base/tabs', 'record_note', 'Ghi ch??', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(894, 1, 'vi', 'core/base/tabs', 'revision', 'L???ch s??? thay ?????i', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(895, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(896, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(897, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(898, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(899, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(900, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(901, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(902, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(903, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(904, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(905, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(906, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(907, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(908, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(909, 1, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'H???y b???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(910, 1, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'M??? r???ng', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(911, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'B???n c?? ch???c?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(912, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'V??ng, ???n ti???n ??ch n??y', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(913, 1, 'vi', 'core/dashboard/dashboard', 'hide', '???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(914, 1, 'vi', 'core/dashboard/dashboard', 'hide_message', 'B???n c?? ch???c ch???n mu???n ???n ti???n ??ch n??y? N?? s??? kh??ng ???????c hi???n th??? tr??n trang ch??? n???a!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(915, 1, 'vi', 'core/dashboard/dashboard', 'hide_success', '???n ti???n ??ch th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(916, 1, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Qu???n l?? ti???n ??ch', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(917, 1, 'vi', 'core/dashboard/dashboard', 'reload', 'L??m m???i', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(918, 1, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'L??u ti???n ??ch th??nh c??ng', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(919, 1, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'C???p nh???t v??? tr?? ti???n ??ch th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(920, 1, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Ti???n ??ch n??y kh??ng t???n t???i!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(921, 1, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'To??n m??n h??nh', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(922, 1, 'vi', 'core/dashboard/dashboard', 'title', 'Trang qu???n tr???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(923, 1, 'en', 'core/media/media', 'filter', 'Filter', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(924, 1, 'en', 'core/media/media', 'everything', 'Everything', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(925, 1, 'en', 'core/media/media', 'image', 'Image', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(926, 1, 'en', 'core/media/media', 'video', 'Video', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(927, 1, 'en', 'core/media/media', 'document', 'Document', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(928, 1, 'en', 'core/media/media', 'view_in', 'View in', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(929, 1, 'en', 'core/media/media', 'all_media', 'All media', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(930, 1, 'en', 'core/media/media', 'trash', 'Trash', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(931, 1, 'en', 'core/media/media', 'recent', 'Recent', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(932, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(933, 1, 'en', 'core/media/media', 'upload', 'Upload', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(934, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(935, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(936, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(937, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(938, 1, 'en', 'core/media/media', 'sort', 'Sort', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(939, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(940, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(941, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(942, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(943, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(944, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(945, 1, 'en', 'core/media/media', 'actions', 'Actions', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(946, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(947, 1, 'en', 'core/media/media', 'insert', 'Insert', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(948, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(949, 1, 'en', 'core/media/media', 'create', 'Create', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(950, 1, 'en', 'core/media/media', 'rename', 'Rename', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(951, 1, 'en', 'core/media/media', 'close', 'Close', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(952, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(953, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(954, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(955, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(956, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(957, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(958, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(959, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(960, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(961, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(962, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(963, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(964, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(965, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(966, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(967, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(968, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(969, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(970, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(971, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(972, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(973, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(974, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(975, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(976, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(977, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(978, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(979, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(980, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(981, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(982, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(983, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(984, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(985, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(986, 1, 'en', 'core/media/media', 'add', 'Add media', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(987, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(988, 1, 'en', 'core/media/media', 'javascript.url', 'Url', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(989, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full url', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(990, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(991, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(992, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(993, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(994, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(995, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(996, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(997, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(998, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(999, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1000, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1001, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1002, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1003, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1004, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1005, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1006, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1007, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1008, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1009, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1010, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1011, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1012, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1013, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1014, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1015, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1016, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1017, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1018, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1019, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1020, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1021, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1022, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1023, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1024, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1025, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1026, 1, 'vi', 'core/media/media', 'filter', 'L???c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1027, 1, 'vi', 'core/media/media', 'everything', 'T???t c???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1028, 1, 'vi', 'core/media/media', 'image', 'H??nh ???nh', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1029, 1, 'vi', 'core/media/media', 'video', 'Phim', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1030, 1, 'vi', 'core/media/media', 'document', 'T??i li???u', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1031, 1, 'vi', 'core/media/media', 'view_in', 'Ch??? ????? xem', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1032, 1, 'vi', 'core/media/media', 'all_media', 'T???t c??? t???p tin', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1033, 1, 'vi', 'core/media/media', 'trash', 'Th??ng r??c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1034, 1, 'vi', 'core/media/media', 'recent', 'G???n ????y', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1035, 1, 'vi', 'core/media/media', 'favorites', '???????c g???n d???u sao', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1036, 1, 'vi', 'core/media/media', 'upload', 'T???i l??n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1037, 1, 'vi', 'core/media/media', 'add_from', 'Th??m t???', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1038, 1, 'vi', 'core/media/media', 'youtube', 'Youtube', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1039, 1, 'vi', 'core/media/media', 'vimeo', 'Vimeo', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1040, 1, 'vi', 'core/media/media', 'vine', 'Vine', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1041, 1, 'vi', 'core/media/media', 'daily_motion', 'Dailymotion', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1042, 1, 'vi', 'core/media/media', 'create_folder', 'T???o th?? m???c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1043, 1, 'vi', 'core/media/media', 'refresh', 'L??m m???i', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1044, 1, 'vi', 'core/media/media', 'empty_trash', 'D???n th??ng r??c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1045, 1, 'vi', 'core/media/media', 'search_file_and_folder', 'T??m ki???m t???p tin v?? th?? m???c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1046, 1, 'vi', 'core/media/media', 'sort', 'S???p x???p', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1047, 1, 'vi', 'core/media/media', 'file_name_asc', 'T??n t???p tin - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1048, 1, 'vi', 'core/media/media', 'file_name_desc', 'T??n t???p tin - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1049, 1, 'vi', 'core/media/media', 'created_date_asc', 'Ng??y t???o - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1050, 1, 'vi', 'core/media/media', 'created_date_desc', 'Ng??y t???o - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1051, 1, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ng??y t???i l??n - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1052, 1, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ng??y t???i l??n - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1053, 1, 'vi', 'core/media/media', 'size_asc', 'K??ch th?????c - ASC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1054, 1, 'vi', 'core/media/media', 'size_desc', 'K??ch th?????c - DESC', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1055, 1, 'vi', 'core/media/media', 'actions', 'H??nh ?????ng', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1056, 1, 'vi', 'core/media/media', 'nothing_is_selected', 'Kh??ng c?? t???p tin n??o ???????c ch???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1057, 1, 'vi', 'core/media/media', 'insert', 'Ch??n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1058, 1, 'vi', 'core/media/media', 'coming_soon', '??ang ph??t tri???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1059, 1, 'vi', 'core/media/media', 'add_from_youtube', 'Th??m t??? youtube', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1060, 1, 'vi', 'core/media/media', 'playlist', 'Playlist', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1061, 1, 'vi', 'core/media/media', 'add_url', 'Th??m ???????ng d???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1062, 1, 'vi', 'core/media/media', 'folder_name', 'T??n th?? m???c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1063, 1, 'vi', 'core/media/media', 'create', 'T???o', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1064, 1, 'vi', 'core/media/media', 'rename', '?????i t??n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1065, 1, 'vi', 'core/media/media', 'close', '????ng', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1066, 1, 'vi', 'core/media/media', 'save_changes', 'L??u thay ?????i', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1067, 1, 'vi', 'core/media/media', 'move_to_trash', '????a v??o th??ng r??c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1068, 1, 'vi', 'core/media/media', 'confirm_trash', 'B???n c?? ch???c ch???n mu???n b??? nh???ng t???p tin n??y v??o th??ng r??c?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1069, 1, 'vi', 'core/media/media', 'confirm', 'X??c nh???n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1070, 1, 'vi', 'core/media/media', 'confirm_delete', 'X??a t???p tin', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1071, 1, 'vi', 'core/media/media', 'confirm_delete_description', 'H??nh ?????ng n??y kh??ng th??? kh??i ph???c. B???n c?? ch???c ch???n mu???n x??a c??c t???p tin n??y?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1072, 1, 'vi', 'core/media/media', 'empty_trash_title', 'D???n s???ch th??ng r??c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1073, 1, 'vi', 'core/media/media', 'empty_trash_description', 'H??nh ?????ng n??y kh??ng th??? kh??i ph???c. B???n c?? ch???c ch???n mu???n d???n s???ch th??ng r??c?', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1074, 1, 'vi', 'core/media/media', 'up_level', 'Quay l???i m???t c???p', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1075, 1, 'vi', 'core/media/media', 'upload_progress', 'Ti???n tr??nh t???i l??n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1076, 1, 'vi', 'core/media/media', 'name_reserved', 'T??n n??y kh??ng ???????c ph??p ?????t', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1077, 1, 'vi', 'core/media/media', 'folder_created', 'T???o th?? m???c th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1078, 1, 'vi', 'core/media/media', 'gallery', 'Th?? vi???n t???p tin', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1079, 1, 'vi', 'core/media/media', 'trash_error', 'C?? l???i khi x??a t???p tin/th?? m???c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1080, 1, 'vi', 'core/media/media', 'trash_success', 'X??a t???p tin/th?? m???c th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1081, 1, 'vi', 'core/media/media', 'restore_error', 'C?? l???i trong qu?? tr??nh kh??i ph???c', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1082, 1, 'vi', 'core/media/media', 'restore_success', 'Kh??i ph???c th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1083, 1, 'vi', 'core/media/media', 'copy_success', 'Sao ch??p th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1084, 1, 'vi', 'core/media/media', 'delete_success', 'X??a th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1085, 1, 'vi', 'core/media/media', 'favorite_success', 'Th??m d???u sao th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1086, 1, 'vi', 'core/media/media', 'remove_favorite_success', 'B??? d???u sao th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1087, 1, 'vi', 'core/media/media', 'rename_error', 'C?? l???i trong qu?? tr??nh ?????i t??n', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1088, 1, 'vi', 'core/media/media', 'rename_success', '?????i t??n th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1089, 1, 'vi', 'core/media/media', 'invalid_action', 'H??nh ?????ng kh??ng h???p l???!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1090, 1, 'vi', 'core/media/media', 'file_not_exists', 'T???p tin kh??ng t???n t???i!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1091, 1, 'vi', 'core/media/media', 'download_file_error', 'C?? l???i trong qu?? tr??nh t???i xu???ng t???p tin!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1092, 1, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'H??y b???t ZipArchive extension ????? t???i t???p tin!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1093, 1, 'vi', 'core/media/media', 'can_not_download_file', 'Kh??ng th??? t???i t???p tin!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1094, 1, 'vi', 'core/media/media', 'invalid_request', 'Y??u c???u kh??ng h???p l???!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1095, 1, 'vi', 'core/media/media', 'add_success', 'Th??m th??nh c??ng!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1096, 1, 'vi', 'core/media/media', 'file_too_big', 'T???p tin qu?? l???n. Gi???i h???n t???i l??n l?? :size bytes', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1097, 1, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Lo???i t???p tin kh??ng h???p l??? ho???c kh??ng th??? x??c ?????nh lo???i t???p tin!', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1098, 1, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2020-10-09 03:54:24', '2020-10-09 03:54:24'),
(1099, 1, 'vi', 'core/media/media', 'menu_name', 'Qu???n l?? t???p tin', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1100, 1, 'vi', 'core/media/media', 'add', 'Th??m t???p tin', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1101, 1, 'vi', 'core/media/media', 'javascript.name', 'T??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1102, 1, 'vi', 'core/media/media', 'javascript.url', '???????ng d???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1103, 1, 'vi', 'core/media/media', 'javascript.full_url', '???????ng d???n tuy???t ?????i', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1104, 1, 'vi', 'core/media/media', 'javascript.size', 'K??ch th?????c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1105, 1, 'vi', 'core/media/media', 'javascript.mime_type', 'Lo???i', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1106, 1, 'vi', 'core/media/media', 'javascript.created_at', '???????c t???i l??n l??c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1107, 1, 'vi', 'core/media/media', 'javascript.updated_at', '???????c ch???nh s???a l??c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1108, 1, 'vi', 'core/media/media', 'javascript.nothing_selected', 'B???n ch??a ch???n t???p tin n??o', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1109, 1, 'vi', 'core/media/media', 'javascript.visit_link', 'M??? li??n k???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1110, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.original_msg', 'Vui l??ng nh???p ch??nh x??c ???????ng d???n Youtube', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1111, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.no_api_key_msg', 'Vui l??ng khai b??o API key c???a Youtube', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1112, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.invalid_url_msg', 'Li??n k???t n??y kh??ng d???n ?????n Youtube', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1113, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.error_msg', 'C?? l???i x???y ra trong ti???n tr??nh th???c hi???n...', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1114, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1115, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'B???n c?? th??? k??o th??? t???p tin v??o ????y ????? t???i l??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1116, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Ho???c c?? th??? b???m n??t T???i l??n ??? ph??a tr??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1117, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1118, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hi???n t???i kh??ng c?? t???p tin n??o trong th??ng r??c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1119, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'X??a t???p tin s??? ??em t???p tin l??u v??o th??ng r??c. X??a t???p tin trong th??ng r??c s??? x??a v??nh vi???n.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1120, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1121, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'B???n ch??a ?????t t???p tin n??o v??o m???c y??u th??ch', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1122, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Th??m t???p tin v??o m???c y??u th??ch ????? t??m ki???m ch??ng d??? d??ng sau n??y.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1123, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1124, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'B???n ch??a m??? t???p tin n??o.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1125, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'M???c n??y hi???n th??? c??c t???p tin b???n ???? xem g???n ????y.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1126, 1, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1127, 1, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Th?? m???c tr???ng', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1128, 1, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Th?? m???c n??y ch??a c?? t???p tin n??o', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1129, 1, 'vi', 'core/media/media', 'javascript.clipboard.success', '???????ng d???n c???a c??c t???p tin ???? ???????c sao ch??p v??o clipboard', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1130, 1, 'vi', 'core/media/media', 'javascript.message.error_header', 'L???i', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1131, 1, 'vi', 'core/media/media', 'javascript.message.success_header', 'Th??nh c??ng', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1132, 1, 'vi', 'core/media/media', 'javascript.download.error', 'B???n ch??a ch???n t???p tin n??o ho???c t???p tin n??y kh??ng cho ph??p t???i v???', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1133, 1, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem tr?????c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1134, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao ch??p ???????ng d???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1135, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', '?????i t??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1136, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nh??n b???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1137, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Y??u th??ch', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1138, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'X??a kh???i m???c y??u th??ch', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1139, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'T???i xu???ng', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1140, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuy???n v??o th??ng r??c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1141, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'X??a ho??n to??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1142, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Kh??i ph???c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1143, 1, 'vi', 'core/media/media', 'empty_trash_success', 'D???n s???ch th??ng r??c th??nh c??ng', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1144, 1, 'vi', 'core/media/media', 'name_invalid', 'T??n th?? m???c ch???a k?? t??? kh??ng h???p l???', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1145, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1146, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1147, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1148, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1149, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1150, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1151, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1152, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1153, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1154, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1155, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1156, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1157, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1158, 1, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1159, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1160, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1161, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1162, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1163, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1164, 1, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1165, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1166, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1167, 1, 'en', 'core/setting/setting', 'general.optimize_page_speed', 'Optimize page speed (minify HTML output, inline CSS, remove comments ..)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1168, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1169, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1170, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1171, 1, 'en', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Enable multi language in admin area?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1172, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1173, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1174, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1175, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1176, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1177, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1178, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1179, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1180, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1181, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1182, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1183, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2020-10-09 03:54:25', '2020-10-09 03:54:25');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1184, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1185, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1186, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1187, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1188, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1189, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1190, 1, 'en', 'core/setting/setting', 'general.select', '??? Select ???', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1191, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1192, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1193, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1194, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1195, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1196, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1197, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1198, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1199, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1200, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1201, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1202, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1203, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1204, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1205, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1206, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1207, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1208, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1209, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1210, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1211, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1212, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1213, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1214, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1215, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1216, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1217, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1218, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1219, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1220, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1221, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1222, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1223, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1224, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1225, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1226, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1227, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1228, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1229, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1230, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1231, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1232, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1233, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1234, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1235, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1236, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1237, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1238, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1239, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1240, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1241, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1242, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1243, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1244, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1245, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1246, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1247, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1248, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1249, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1250, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1251, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1252, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1253, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1254, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1255, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1256, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1257, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1258, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1259, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1260, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1261, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1262, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1263, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1264, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1265, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1266, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1267, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1268, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1269, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1270, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1271, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1272, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1273, 1, 'en', 'core/setting/setting', 'template', 'Template', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1274, 1, 'en', 'core/setting/setting', 'description', 'Description', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1275, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1276, 1, 'en', 'core/setting/setting', 'send', 'Send', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1277, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1278, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1279, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1280, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1281, 1, 'vi', 'core/setting/setting', 'title', 'Ca??i ??????t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1282, 1, 'vi', 'core/setting/setting', 'general.theme', 'Giao di???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1283, 1, 'vi', 'core/setting/setting', 'general.description', 'C????u hi??nh nh????ng th??ng tin ca??i ??????t website.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1284, 1, 'vi', 'core/setting/setting', 'general.title', 'Th??ng tin chung', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1285, 1, 'vi', 'core/setting/setting', 'general.general_block', 'Th??ng tin chung', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1286, 1, 'vi', 'core/setting/setting', 'general.site_title', 'T??n trang', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1287, 1, 'vi', 'core/setting/setting', 'general.admin_email', 'Email qua??n tri?? vi??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1288, 1, 'vi', 'core/setting/setting', 'general.seo_block', 'C???u hi??nh SEO', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1289, 1, 'vi', 'core/setting/setting', 'general.seo_title', 'Ti??u ????? SEO', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1290, 1, 'vi', 'core/setting/setting', 'general.seo_description', 'M?? t??? SEO', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1291, 1, 'vi', 'core/setting/setting', 'general.seo_keywords', 'T??? kho?? SEO', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1292, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1293, 1, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1294, 1, 'vi', 'core/setting/setting', 'general.enable_captcha', 'S???? du??ng Captcha?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1295, 1, 'vi', 'core/setting/setting', 'general.contact_block', 'Th??ng tin li??n h????', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1296, 1, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'T??n trang (t????i ??a 120 ki?? t????)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1297, 1, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1298, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'V?? d???: UA-42767940-2', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1299, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'M?? x??c nh???n trang web d??ng cho Google Webmaster Tool', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1300, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Ti??u ????? SEO (t????i ??a 120 ki?? t????)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1301, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'M?? t??? SEO (t????i ??a 120 ki?? t????)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1302, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_keywords', 'T??? kho?? SEO (t????i ??a 60 ki?? t????, ph??n ca??ch t???? kho??a b????ng d????u ph????y)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1303, 1, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho ph??p thay ?????i giao di???n qu???n tr????', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1304, 1, 'vi', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Cho ph??p thay ?????i ng??n ng??? trang qu???n tr????', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1305, 1, 'vi', 'core/setting/setting', 'general.enable', 'B???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1306, 1, 'vi', 'core/setting/setting', 'general.disable', 'T???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1307, 1, 'vi', 'core/setting/setting', 'general.enable_cache', 'B???t b??? nh??? ?????m?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1308, 1, 'vi', 'core/setting/setting', 'general.cache_time', 'Th???i gian l??u b??? nh??? ?????m (ph??t)', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1309, 1, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Th???i gian l??u s?? ????? trang trong b??? nh??? ?????m', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1310, 1, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang qu???n tr???', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1311, 1, 'vi', 'core/setting/setting', 'general.admin_title', 'Ti??u ????? trang qu???n tr???', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1312, 1, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Ti??u ????? hi???n th??? tr??n th??? tr??nh duy???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1313, 1, 'vi', 'core/setting/setting', 'general.rich_editor', 'B??? so???n th???o v??n b???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1314, 1, 'vi', 'core/setting/setting', 'general.cache_block', 'B??? nh??? ?????m', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1315, 1, 'vi', 'core/setting/setting', 'general.yes', 'B???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1316, 1, 'vi', 'core/setting/setting', 'general.no', 'T???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1317, 1, 'vi', 'core/setting/setting', 'email.subject', 'Ti??u ?????', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1318, 1, 'vi', 'core/setting/setting', 'email.content', 'N???i dung', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1319, 1, 'vi', 'core/setting/setting', 'email.title', 'C???u h??nh email template', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1320, 1, 'vi', 'core/setting/setting', 'email.description', 'C???u tr??c file template s??? d???ng HTML v?? c??c bi???n trong h??? th???ng.', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1321, 1, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Kh??i ph???c v??? m???c ?????nh', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1322, 1, 'vi', 'core/setting/setting', 'email.back', 'Tr??? l???i trang c??i ?????t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1323, 1, 'vi', 'core/setting/setting', 'email.reset_success', 'Kh??i ph???c m???c ?????nh th??nh c??ng', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1324, 1, 'vi', 'core/setting/setting', 'email.confirm_reset', 'X??c nh???n kh??i ph???c m???c ?????nh?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1325, 1, 'vi', 'core/setting/setting', 'email.confirm_message', 'B???n c?? ch???c ch???n mu???n kh??i ph???c v??? b???n m???c ?????nh?', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1326, 1, 'vi', 'core/setting/setting', 'email.continue', 'Ti???p t???c', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1327, 1, 'vi', 'core/setting/setting', 'email.sender_name', 'T??n ng?????i g???i', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1328, 1, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'T??n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1329, 1, 'vi', 'core/setting/setting', 'email.sender_email', 'Email c???a ng?????i g???i', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1330, 1, 'vi', 'core/setting/setting', 'email.driver', 'Lo???i', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1331, 1, 'vi', 'core/setting/setting', 'email.port', 'C???ng', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1332, 1, 'vi', 'core/setting/setting', 'email.port_placeholder', 'V?? d???: 587', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1333, 1, 'vi', 'core/setting/setting', 'email.host', 'M??y ch???', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1334, 1, 'vi', 'core/setting/setting', 'email.host_placeholder', 'V?? d???: smtp.gmail.com', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1335, 1, 'vi', 'core/setting/setting', 'email.username', 'T??n ????ng nh???p', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1336, 1, 'vi', 'core/setting/setting', 'email.username_placeholder', 'T??n ????ng nh???p v??o m??y ch??? mail', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1337, 1, 'vi', 'core/setting/setting', 'email.password', 'M???t kh???u', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1338, 1, 'vi', 'core/setting/setting', 'email.password_placeholder', 'M???t kh???u ????ng nh???p v??o m??y ch??? mail', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1339, 1, 'vi', 'core/setting/setting', 'email.encryption', 'M?? ho??', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1340, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'T??n mi???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1341, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'T??n mi???n', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1342, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chu???i b?? m???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1343, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chu???i b?? m???t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1344, 1, 'vi', 'core/setting/setting', 'email.template_title', 'M???u giao di???n email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1345, 1, 'vi', 'core/setting/setting', 'email.template_description', 'Giao di???n m???c ?????nh cho t???t c??? email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1346, 1, 'vi', 'core/setting/setting', 'email.template_header', 'M???u cho ph???n tr??n c???a email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1347, 1, 'vi', 'core/setting/setting', 'email.template_header_description', 'Ph???n tr??n c???a t???t c??? email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1348, 1, 'vi', 'core/setting/setting', 'email.template_footer', 'M???u cho ph???n d?????i c???a email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1349, 1, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Ph???n d?????i c???a t???t c??? email', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1350, 1, 'vi', 'core/setting/setting', 'save_settings', 'L??u c??i ?????t', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1351, 1, 'vi', 'core/setting/setting', 'template', 'M???u', '2020-10-09 03:54:25', '2020-10-09 03:54:25'),
(1352, 1, 'vi', 'core/setting/setting', 'description', 'M?? t???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1353, 1, 'vi', 'core/setting/setting', 'enable', 'B???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1354, 1, 'vi', 'core/setting/setting', 'test_send_mail', 'G???i th??? nghi???m', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1355, 1, 'en', 'core/table/general', 'operations', 'Operations', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1356, 1, 'en', 'core/table/general', 'loading_data', 'Loading data from server', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1357, 1, 'en', 'core/table/general', 'display', 'Display', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1358, 1, 'en', 'core/table/general', 'all', 'All', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1359, 1, 'en', 'core/table/general', 'edit_entry', 'Edit', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1360, 1, 'en', 'core/table/general', 'delete_entry', 'Delete', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1361, 1, 'en', 'core/table/general', 'show_from', 'Showing from', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1362, 1, 'en', 'core/table/general', 'to', 'to', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1363, 1, 'en', 'core/table/general', 'in', 'in', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1364, 1, 'en', 'core/table/general', 'records', 'records', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1365, 1, 'en', 'core/table/general', 'no_data', 'No data to display', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1366, 1, 'en', 'core/table/general', 'no_record', 'No record', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1367, 1, 'en', 'core/table/general', 'loading', 'Loading data from server', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1368, 1, 'en', 'core/table/general', 'confirm_delete', 'Confirm delete', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1369, 1, 'en', 'core/table/general', 'confirm_delete_msg', 'Do you really want to delete this record?', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1370, 1, 'en', 'core/table/general', 'cancel', 'Cancel', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1371, 1, 'en', 'core/table/general', 'delete', 'Delete', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1372, 1, 'en', 'core/table/general', 'close', 'Close', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1373, 1, 'en', 'core/table/general', 'contains', 'Contains', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1374, 1, 'en', 'core/table/general', 'is_equal_to', 'Is equal to', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1375, 1, 'en', 'core/table/general', 'greater_than', 'Greater than', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1376, 1, 'en', 'core/table/general', 'less_than', 'Less than', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1377, 1, 'en', 'core/table/general', 'value', 'Value', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1378, 1, 'en', 'core/table/general', 'select_field', 'Select field', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1379, 1, 'en', 'core/table/general', 'reset', 'Reset', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1380, 1, 'en', 'core/table/general', 'add_additional_filter', 'Add additional filter', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1381, 1, 'en', 'core/table/general', 'apply', 'Apply', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1382, 1, 'en', 'core/table/general', 'filters', 'Filters', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1383, 1, 'en', 'core/table/general', 'bulk_change', 'Bulk changes', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1384, 1, 'en', 'core/table/general', 'select_option', 'Select option', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1385, 1, 'en', 'core/table/general', 'bulk_actions', 'Bulk Actions', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1386, 1, 'en', 'core/table/general', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1387, 1, 'en', 'core/table/general', 'please_select_record', 'Please select at least one record to perform this action!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1388, 1, 'en', 'core/table/general', 'filtered', '(filtered from _MAX_ total records)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1389, 1, 'en', 'core/table/general', 'search', 'Search...', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1390, 1, 'vi', 'core/table/general', 'operations', 'H??nh ?????ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1391, 1, 'vi', 'core/table/general', 'loading_data', '??ang t???i d??? li???u t??? h??? th???ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1392, 1, 'vi', 'core/table/general', 'display', 'Hi???n th???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1393, 1, 'vi', 'core/table/general', 'all', 'T???t c???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1394, 1, 'vi', 'core/table/general', 'edit_entry', 'S???a', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1395, 1, 'vi', 'core/table/general', 'delete_entry', 'Xo??', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1396, 1, 'vi', 'core/table/general', 'show_from', 'Hi???n th??? t???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1397, 1, 'vi', 'core/table/general', 'to', '?????n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1398, 1, 'vi', 'core/table/general', 'in', 'trong t???ng s???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1399, 1, 'vi', 'core/table/general', 'records', 'b???n ghi', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1400, 1, 'vi', 'core/table/general', 'no_data', 'Kh??ng c?? d??? li???u ????? hi???n th???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1401, 1, 'vi', 'core/table/general', 'no_record', 'kh??ng c?? b???n ghi n??o', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1402, 1, 'vi', 'core/table/general', 'loading', '??ang t???i d??? li???u t??? h??? th???ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1403, 1, 'vi', 'core/table/general', 'confirm_delete', 'X??c nh???n xo??', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1404, 1, 'vi', 'core/table/general', 'confirm_delete_msg', 'B???n c?? ch???c ch???n mu???n xo?? b???n ghi n??y?', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1405, 1, 'vi', 'core/table/general', 'cancel', 'Hu??? b???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1406, 1, 'vi', 'core/table/general', 'delete', 'Xo??', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1407, 1, 'vi', 'core/table/general', 'close', '????ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1408, 1, 'vi', 'core/table/general', 'is_equal_to', 'B???ng v???i', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1409, 1, 'vi', 'core/table/general', 'greater_than', 'L???n h??n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1410, 1, 'vi', 'core/table/general', 'less_than', 'Nh??? h??n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1411, 1, 'vi', 'core/table/general', 'value', 'Gi?? tr???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1412, 1, 'vi', 'core/table/general', 'select_field', 'Ch???n tr?????ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1413, 1, 'vi', 'core/table/general', 'reset', 'L??m m???i', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1414, 1, 'vi', 'core/table/general', 'add_additional_filter', 'Th??m b??? l???c', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1415, 1, 'vi', 'core/table/general', 'apply', '??p d???ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1416, 1, 'vi', 'core/table/general', 'select_option', 'L???a ch???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1417, 1, 'vi', 'core/table/general', 'filters', 'L???c d??? li???u', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1418, 1, 'vi', 'core/table/general', 'bulk_change', 'Thay ?????i h??ng lo???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1419, 1, 'vi', 'core/table/general', 'bulk_actions', 'H??nh ?????ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1420, 1, 'vi', 'core/table/general', 'contains', 'Bao g???m', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1421, 1, 'vi', 'core/table/general', 'filtered', '(???? ???????c l???c t??? _MAX_ b???n ghi)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1422, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1423, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1424, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1425, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1426, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1427, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1428, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1429, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1430, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1431, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1432, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1433, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1434, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1435, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1436, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1437, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1438, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1439, 1, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1440, 1, 'vi', 'packages/menu/menu', 'name', 'Menu', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1441, 1, 'vi', 'packages/menu/menu', 'cancel', 'Hu??y bo??', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1442, 1, 'vi', 'packages/menu/menu', 'add_link', 'Th??m li??n k???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1443, 1, 'vi', 'packages/menu/menu', 'add_to_menu', 'Th??m v??o tr??nh ????n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1444, 1, 'vi', 'packages/menu/menu', 'basic_info', 'Th??ng tin c?? b???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1445, 1, 'vi', 'packages/menu/menu', 'blank_open_link', 'M??? li??n k???t trong tab m???i', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1446, 1, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1447, 1, 'vi', 'packages/menu/menu', 'custom_link', 'Li??n k???t t??y ch???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1448, 1, 'vi', 'packages/menu/menu', 'icon', 'Bi???u t?????ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1449, 1, 'vi', 'packages/menu/menu', 'key_name', 'T??n menu (key::key)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1450, 1, 'vi', 'packages/menu/menu', 'remove', 'X??a', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1451, 1, 'vi', 'packages/menu/menu', 'self_open_link', 'M??? li??n k???t trong tab hi???n t???i', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1452, 1, 'vi', 'packages/menu/menu', 'structure', 'C???u tr??c tr??nh ????n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1453, 1, 'vi', 'packages/menu/menu', 'target', 'Target', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1454, 1, 'vi', 'packages/menu/menu', 'title', 'Ti??u ?????', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1455, 1, 'vi', 'packages/menu/menu', 'url', 'URL', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1456, 1, 'vi', 'packages/menu/menu', 'create', 'T???o tr??nh ????n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1457, 1, 'vi', 'packages/menu/menu', 'edit', 'S???a tr??nh ????n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1458, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1459, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1460, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1461, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1462, 1, 'en', 'packages/page/pages', 'edit', 'Edit page', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1463, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1464, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1465, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1466, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1467, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1468, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1469, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1470, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1471, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1472, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1473, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1474, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1475, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1476, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1477, 1, 'en', 'packages/page/pages', 'settings.select', '??? Select ???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1478, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1479, 1, 'vi', 'packages/page/pages', 'model', 'Trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1480, 1, 'vi', 'packages/page/pages', 'models', 'Trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1481, 1, 'vi', 'packages/page/pages', 'list', 'Danh sa??ch trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1482, 1, 'vi', 'packages/page/pages', 'create', 'Th??m trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1483, 1, 'vi', 'packages/page/pages', 'edit', 'S????a trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1484, 1, 'vi', 'packages/page/pages', 'form.name', 'Ti??u ????? trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1485, 1, 'vi', 'packages/page/pages', 'form.note', 'N????i dung ghi chu??', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1486, 1, 'vi', 'packages/page/pages', 'form.name_placeholder', 'T??n trang (t???i ??a 120 k?? t???)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1487, 1, 'vi', 'packages/page/pages', 'form.content', 'N???i dung', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1488, 1, 'vi', 'packages/page/pages', 'notices.no_select', 'Cho??n i??t nh????t 1 trang ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1489, 1, 'vi', 'packages/page/pages', 'notices.update_success_message', 'C????p nh????t tha??nh c??ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1490, 1, 'vi', 'packages/page/pages', 'deleted', 'Xo??a trang tha??nh c??ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1491, 1, 'vi', 'packages/page/pages', 'cannot_delete', 'Kh??ng th???? xo??a trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1492, 1, 'vi', 'packages/page/pages', 'menu', 'Trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1493, 1, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1494, 1, 'vi', 'packages/page/pages', 'edit_this_page', 'S???a trang n??y', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1495, 1, 'vi', 'packages/page/pages', 'pages', 'Trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1496, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1497, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1498, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1499, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1500, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1501, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1502, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1503, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1504, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1505, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1506, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1507, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1508, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1509, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1510, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1511, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1512, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1513, 1, 'vi', 'packages/plugin-management/plugin', 'activate', 'K??ch ho???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1514, 1, 'vi', 'packages/plugin-management/plugin', 'author', 'T??c gi???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1515, 1, 'vi', 'packages/plugin-management/plugin', 'version', 'Phi??n b???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1516, 1, 'vi', 'packages/plugin-management/plugin', 'activated', '???? k??ch ho???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1517, 1, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'H???y k??ch ho???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1518, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated', '???? v?? hi???u', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1519, 1, 'vi', 'packages/plugin-management/plugin', 'disabled_in_demo_mode', 'B???n kh??ng th??? th???c hi???n h??nh ?????ng n??y ??? ch??? ????? demo', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1520, 1, 'vi', 'packages/plugin-management/plugin', 'enabled', 'K??ch ho???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1521, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'G??i m??? r???ng kh??ng h???p l???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1522, 1, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'C???p nh???t tr???ng th??i g??i m??? r???ng th??nh c??ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1523, 1, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui l??ng k??ch ho???t c??c ti???n ??ch m??? r???ng :plugins tr?????c khi k??ch ho???t ti???n ??ch n??y', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1524, 1, 'vi', 'packages/plugin-management/plugin', 'plugins', 'Ti???n ??ch m??? r???ng', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1525, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1526, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1527, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1528, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1529, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1530, 1, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'T???i ??u ho?? b??? m??y t??m ki???m (SEO)', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1531, 1, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Ch???nh s???a SEO', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1532, 1, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thi???t l???p c??c th??? m?? t??? gi??p ng?????i d??ng d??? d??ng t??m th???y tr??n c??ng c??? t??m ki???m nh?? Google.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1533, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Ti??u ????? trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1534, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'M?? t??? trang', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1535, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1536, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1537, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1538, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1539, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1540, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1541, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1542, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1543, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1544, 1, 'en', 'packages/theme/theme', 'active_success', 'Active theme successfully!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1545, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1546, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1547, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1548, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1549, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1550, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1551, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1552, 1, 'en', 'packages/theme/theme', 'theme_is_note_existed', 'This theme is not existed!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1553, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1554, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1555, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1556, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1557, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1558, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1559, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1560, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1561, 1, 'vi', 'packages/theme/theme', 'activated', '???? k??ch ho???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1562, 1, 'vi', 'packages/theme/theme', 'active', 'K??ch ho???t', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1563, 1, 'vi', 'packages/theme/theme', 'active_success', 'K??ch ho???t giao di???n th??nh c??ng!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1564, 1, 'vi', 'packages/theme/theme', 'author', 'T??c gi???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1565, 1, 'vi', 'packages/theme/theme', 'description', 'M?? t???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1566, 1, 'vi', 'packages/theme/theme', 'theme', 'Giao di???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1567, 1, 'vi', 'packages/theme/theme', 'theme_options', 'Tu??? ch???n giao di???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1568, 1, 'vi', 'packages/theme/theme', 'version', 'Phi??n b???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1569, 1, 'vi', 'packages/theme/theme', 'save_changes', 'L??u thay ?????i', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1570, 1, 'vi', 'packages/theme/theme', 'developer_mode', '??ang k??ch ho???t ch??? ????? th??? nghi???m', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1571, 1, 'vi', 'packages/theme/theme', 'custom_css', 'Tu??? ch???nh CSS', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1572, 1, 'en', 'packages/widget/global', 'name', 'Widgets', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1573, 1, 'en', 'packages/widget/global', 'create', 'New widget', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1574, 1, 'en', 'packages/widget/global', 'edit', 'Edit widget', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1575, 1, 'en', 'packages/widget/global', 'delete', 'Delete', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1576, 1, 'en', 'packages/widget/global', 'available', 'Available Widgets', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1577, 1, 'en', 'packages/widget/global', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1578, 1, 'en', 'packages/widget/global', 'number_tag_display', 'Number tags will be display', '2020-10-09 03:54:26', '2020-10-09 03:54:26');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1579, 1, 'en', 'packages/widget/global', 'number_post_display', 'Number posts will be display', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1580, 1, 'en', 'packages/widget/global', 'select_menu', 'Select Menu', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1581, 1, 'en', 'packages/widget/global', 'widget_text', 'Text', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1582, 1, 'en', 'packages/widget/global', 'widget_text_description', 'Arbitrary text or HTML.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1583, 1, 'en', 'packages/widget/global', 'widget_recent_post', 'Recent Posts', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1584, 1, 'en', 'packages/widget/global', 'widget_recent_post_description', 'Recent posts widget.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1585, 1, 'en', 'packages/widget/global', 'widget_custom_menu', 'Custom Menu', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1586, 1, 'en', 'packages/widget/global', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1587, 1, 'en', 'packages/widget/global', 'widget_tag', 'Tags', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1588, 1, 'en', 'packages/widget/global', 'widget_tag_description', 'Popular tags', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1589, 1, 'en', 'packages/widget/global', 'save_success', 'Save widget successfully!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1590, 1, 'en', 'packages/widget/global', 'delete_success', 'Delete widget successfully!', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1591, 1, 'vi', 'packages/widget/global', 'name', 'Widgets', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1592, 1, 'vi', 'packages/widget/global', 'create', 'New widget', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1593, 1, 'vi', 'packages/widget/global', 'edit', 'Edit widget', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1594, 1, 'vi', 'packages/widget/global', 'available', 'Ti???n ??ch c?? s???n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1595, 1, 'vi', 'packages/widget/global', 'delete', 'X??a', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1596, 1, 'vi', 'packages/widget/global', 'instruction', '????? k??ch ho???t ti???n ??ch, h??y k??o n?? v??o sidebar ho???c nh???n v??o n??. ????? h???y k??ch ho???t ti???n ??ch v?? x??a c??c thi???t l???p c???a ti???n ??ch, k??o n?? quay tr??? l???i.', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1597, 1, 'vi', 'packages/widget/global', 'number_post_display', 'S??? b??i vi???t s??? hi???n th???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1598, 1, 'vi', 'packages/widget/global', 'number_tag_display', 'S??? th??? s??? hi???n th???', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1599, 1, 'vi', 'packages/widget/global', 'select_menu', 'L???a ch???n tr??nh ????n', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1600, 1, 'vi', 'packages/widget/global', 'widget_custom_menu', 'Menu t??y ch???nh', '2020-10-09 03:54:26', '2020-10-09 03:54:26'),
(1601, 1, 'vi', 'packages/widget/global', 'widget_custom_menu_description', 'Th??m menu t??y ch???nh v??o khu v???c ti???n ??ch c???a b???n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1602, 1, 'vi', 'packages/widget/global', 'widget_recent_post', 'B??i vi???t g???n ????y', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1603, 1, 'vi', 'packages/widget/global', 'widget_recent_post_description', 'Ti???n ??ch b??i vi???t g???n ????y', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1604, 1, 'vi', 'packages/widget/global', 'widget_tag', 'Th???', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1605, 1, 'vi', 'packages/widget/global', 'widget_tag_description', 'Th??? ph??? bi???n, s??? d???ng nhi???u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1606, 1, 'vi', 'packages/widget/global', 'widget_text', 'V??n b???n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1607, 1, 'vi', 'packages/widget/global', 'widget_text_description', 'V??n b???n t??y ?? ho???c HTML.', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1608, 1, 'vi', 'packages/widget/global', 'delete_success', 'Xo?? ti???n ??ch th??nh c??ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1609, 1, 'vi', 'packages/widget/global', 'save_success', 'L??u ti???n ??ch th??nh c??ng!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1610, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1611, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1612, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1613, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1614, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1615, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1616, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1617, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1618, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1619, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1620, 1, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1621, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1622, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1623, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1624, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1625, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1626, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1627, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1628, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1629, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1630, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1631, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1632, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1633, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1634, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1635, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1636, 1, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung b??nh', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1637, 1, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'T??? l??? tho??t', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1638, 1, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phi??n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1639, 1, 'vi', 'plugins/analytics/analytics', 'pageviews', 'L?????t xem', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1640, 1, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phi??n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1641, 1, 'vi', 'plugins/analytics/analytics', 'views', 'l?????t xem', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1642, 1, 'vi', 'plugins/analytics/analytics', 'visitors', 'Ng?????i truy c???p', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1643, 1, 'vi', 'plugins/analytics/analytics', 'visits', 'l?????t gh?? th??m', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1644, 1, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Th??ng tin c??i ?????t kh??ng h???p l???. T??i li???u h?????ng d???n t???i ????y: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1645, 1, 'vi', 'plugins/analytics/analytics', 'new_users', 'L?????t kh??ch m???i', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1646, 1, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'T??? l??? kh??ch m???i', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1647, 1, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ng??y b???t ?????u :start_date kh??ng th??? sau ng??y k???t th??c :end_date', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1648, 1, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'B???n ph???i cung c???p View ID h???p l??. T??i li???u h?????ng d???n t???i ????y: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1649, 1, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', '????? xem d??? li???u th???ng k?? Google Analytics, b???n c???n l???y th??ng tin Client ID v?? th??m n?? v??o trong ph???n c??i ?????t. B???n c??ng c???n th??ng tin x??c th???c d???ng JSON. T??i li???u h?????ng d???n t???i ????y: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1650, 1, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1651, 1, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1652, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1653, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1654, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1655, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1656, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1657, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1658, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Tr??nh duy???t truy c???p nhi???u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1659, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Th???ng k?? truy c???p', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1660, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang ???????c xem nhi???u nh???t', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1661, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang gi???i thi???u nhi???u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1662, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1663, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1664, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1665, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1666, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1667, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1668, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1669, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1670, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1671, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1672, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1673, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1674, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1675, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1676, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1677, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1678, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1679, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1680, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1681, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1682, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1683, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1684, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1685, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1686, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1687, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1688, 1, 'vi', 'plugins/audit-log/history', 'name', 'L???ch s??? ho???t ?????ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1689, 1, 'vi', 'plugins/audit-log/history', 'created', ' ???? t???o', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1690, 1, 'vi', 'plugins/audit-log/history', 'updated', ' ???? c???p nh???t', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1691, 1, 'vi', 'plugins/audit-log/history', 'deleted', ' ???? x??a', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1692, 1, 'vi', 'plugins/audit-log/history', 'attached', '????nh k??m', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1693, 1, 'vi', 'plugins/audit-log/history', 'backup', 'sao l??u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1694, 1, 'vi', 'plugins/audit-log/history', 'category', 'danh m???c', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1695, 1, 'vi', 'plugins/audit-log/history', 'changed password', 'thay ?????i m???t kh???u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1696, 1, 'vi', 'plugins/audit-log/history', 'contact', 'li??n h???', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1697, 1, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung m??? r???ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1698, 1, 'vi', 'plugins/audit-log/history', 'logged in', '????ng nh???p', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1699, 1, 'vi', 'plugins/audit-log/history', 'logged out', '????ng xu???t', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1700, 1, 'vi', 'plugins/audit-log/history', 'menu', 'tr??nh ????n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1701, 1, 'vi', 'plugins/audit-log/history', 'of the system', 'kh???i h??? th???ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1702, 1, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1703, 1, 'vi', 'plugins/audit-log/history', 'post', 'b??i vi???t', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1704, 1, 'vi', 'plugins/audit-log/history', 'shared', '???? chia s???', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1705, 1, 'vi', 'plugins/audit-log/history', 'tag', 'th???', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1706, 1, 'vi', 'plugins/audit-log/history', 'to the system', 'v??o h??? th???ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1707, 1, 'vi', 'plugins/audit-log/history', 'updated profile', 'c???p nh???t t??i kho???n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1708, 1, 'vi', 'plugins/audit-log/history', 'user', 'th??nh vi??n', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1709, 1, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'L???ch s??? ho???t ?????ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1710, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1711, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1712, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1713, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1714, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1715, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1716, 1, 'en', 'plugins/backup/backup', 'create', 'Create backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1717, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1718, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1719, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1720, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1721, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1722, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1723, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1724, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1725, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1726, 1, 'en', 'plugins/backup/backup', 'settings.title', 'Backup', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1727, 1, 'en', 'plugins/backup/backup', 'settings.description', 'Settings for backup function', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1728, 1, 'en', 'plugins/backup/backup', 'settings.backup_mysql_execute_path', 'MySQL execute path', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1729, 1, 'en', 'plugins/backup/backup', 'settings.backup_mysql_execute_path_placeholder', 'Default: /usr/mysql/bin. Ignore it if you aren\'t sure about it', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1730, 1, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao l??u c?? s??? d??? li???u v?? th?? m???c /uploads', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1731, 1, 'vi', 'plugins/backup/backup', 'create', 'T???o b???n sao l??u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1732, 1, 'vi', 'plugins/backup/backup', 'create_backup_success', 'T???o b???n sao l??u th??nh c??ng!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1733, 1, 'vi', 'plugins/backup/backup', 'create_btn', 'T???o', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1734, 1, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'X??a b???n sao l??u th??nh c??ng!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1735, 1, 'vi', 'plugins/backup/backup', 'generate_btn', 'T???o sao l??u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1736, 1, 'vi', 'plugins/backup/backup', 'name', 'Sao l??u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1737, 1, 'vi', 'plugins/backup/backup', 'restore', 'Kh??i ph???c b???n sao l??u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1738, 1, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Kh??i ph???c b???n sao l??u th??nh c??ng', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1739, 1, 'vi', 'plugins/backup/backup', 'restore_btn', 'Kh??i ph???c', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1740, 1, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'B???n c?? ch???c ch???n mu???n kh??i ph???c h??? th???ng v??? th???i ??i???m t???o b???n sao l??u n??y?', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1741, 1, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Kh??i ph???c b???n sao l??u n??y', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1742, 1, 'vi', 'plugins/backup/backup', 'download_database', 'T???i v??? b???n sao l??u CSDL', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1743, 1, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'T???i v??? b???n sao l??u th?? m???c uploads', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1744, 1, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao l??u', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1745, 1, 'vi', 'plugins/backup/backup', 'demo_alert', 'Ch??o kh??ch, n???u b???n th???y trang demo b??? ph?? ho???i, h??y t???i <a href=\":link\">trang sao l??u</a> v?? kh??i ph???c b???n sao l??u cu???i c??ng. C???m ??n b???n nhi???u!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1746, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1747, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1748, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1749, 1, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1750, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1751, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1752, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1753, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1754, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1755, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1756, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1757, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1758, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1759, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1760, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1761, 1, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1762, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1763, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1764, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1765, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1766, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1767, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1768, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1769, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1770, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1771, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1772, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1773, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1774, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1775, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1776, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1777, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1778, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1779, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1780, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1781, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1782, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1783, 1, 'en', 'plugins/blog/settings', 'select', '-- Select --', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1784, 1, 'en', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1785, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1786, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1787, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1788, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1789, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1790, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1791, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1792, 1, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1793, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1794, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1795, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1796, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1797, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2020-10-09 03:54:27', '2020-10-09 03:54:27'),
(1798, 1, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1799, 1, 'vi', 'plugins/blog/categories', 'model', 'Danh m???c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1800, 1, 'vi', 'plugins/blog/categories', 'models', 'Danh m???c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1801, 1, 'vi', 'plugins/blog/categories', 'list', 'Danh sa??ch danh mu??c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1802, 1, 'vi', 'plugins/blog/categories', 'create', 'Th??m danh mu??c m????i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1803, 1, 'vi', 'plugins/blog/categories', 'edit', 'S????a danh mu??c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1804, 1, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh m???c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1805, 1, 'vi', 'plugins/blog/categories', 'edit_this_category', 'S???a danh m???c n??y', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1806, 1, 'vi', 'plugins/blog/categories', 'menu', 'Danh m???c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1807, 1, 'vi', 'plugins/blog/posts', 'model', 'B??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1808, 1, 'vi', 'plugins/blog/posts', 'models', 'B??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1809, 1, 'vi', 'plugins/blog/posts', 'list', 'Danh sa??ch ba??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1810, 1, 'vi', 'plugins/blog/posts', 'create', 'Th??m ba??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1811, 1, 'vi', 'plugins/blog/posts', 'edit', 'S????a ba??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1812, 1, 'vi', 'plugins/blog/posts', 'form.name', 'T??n', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1813, 1, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'T??n b??i vi???t (T???i ??a 120 k?? t???)', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1814, 1, 'vi', 'plugins/blog/posts', 'form.description', 'M?? t???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1815, 1, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'M?? t??? ng???n cho b??i vi???t (T???i ??a 400 k?? t???)', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1816, 1, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuy??n m???c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1817, 1, 'vi', 'plugins/blog/posts', 'form.tags', 'T??? kh??a', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1818, 1, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Th??m t??? kh??a', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1819, 1, 'vi', 'plugins/blog/posts', 'form.content', 'N???i dung', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1820, 1, 'vi', 'plugins/blog/posts', 'form.featured', 'B??i vi???t n???i b???t?', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1821, 1, 'vi', 'plugins/blog/posts', 'form.note', 'N????i dung ghi chu??', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1822, 1, 'vi', 'plugins/blog/posts', 'form.format_type', '?????nh d???ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1823, 1, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xo??a ba??i vi????t tha??nh c??ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1824, 1, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Kh??ng th???? xo??a ba??i vi????t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1825, 1, 'vi', 'plugins/blog/posts', 'menu_name', 'B??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1826, 1, 'vi', 'plugins/blog/posts', 'edit_this_post', 'S???a b??i vi???t n??y', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1827, 1, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hi???n t???i kh??ng c?? b??i vi???t m???i!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1828, 1, 'vi', 'plugins/blog/posts', 'posts', 'B??i vi???t', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1829, 1, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'B??i vi???t g???n ????y', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1830, 1, 'vi', 'plugins/blog/posts', 'author', 'T??c gi???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1831, 1, 'vi', 'plugins/blog/tags', 'model', 'Th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1832, 1, 'vi', 'plugins/blog/tags', 'models', 'Th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1833, 1, 'vi', 'plugins/blog/tags', 'list', 'Danh sa??ch th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1834, 1, 'vi', 'plugins/blog/tags', 'create', 'Th??m th??? m????i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1835, 1, 'vi', 'plugins/blog/tags', 'edit', 'S????a th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1836, 1, 'vi', 'plugins/blog/tags', 'form.name', 'T??n', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1837, 1, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'T??n th??? (T???i ??a 120 k?? t???)', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1838, 1, 'vi', 'plugins/blog/tags', 'form.description', 'M?? t???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1839, 1, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'M?? t??? ng???n cho tag (T???i ??a 400 k?? t???)', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1840, 1, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuy??n m???c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1841, 1, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Cho??n i??t nh????t 1 ba??i vi????t ?????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1842, 1, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Kh??ng th???? xo??a th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1843, 1, 'vi', 'plugins/blog/tags', 'deleted', 'Xo??a th??? tha??nh c??ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1844, 1, 'vi', 'plugins/blog/tags', 'menu_name', 'Th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1845, 1, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'S???a th??? n??y', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1846, 1, 'vi', 'plugins/blog/tags', 'menu', 'Th???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1847, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1848, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1849, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1850, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1851, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1852, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1853, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1854, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1855, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1856, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1857, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1858, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1859, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1860, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1861, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1862, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1863, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1864, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1865, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1866, 1, 'en', 'plugins/contact/contact', 'email.success', 'Send message successfully!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1867, 1, 'en', 'plugins/contact/contact', 'email.failed', 'Can\'t send message on this time, please try again later!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1868, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1869, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1870, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1871, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1872, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1873, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1874, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1875, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1876, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1877, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1878, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1879, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1880, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1881, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1882, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1883, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1884, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1885, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1886, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1887, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1888, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1889, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1890, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'UnRead', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1891, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1892, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1893, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1894, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1895, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1896, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1897, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1898, 1, 'vi', 'plugins/contact/contact', 'menu', 'Li??n h????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1899, 1, 'vi', 'plugins/contact/contact', 'model', 'Li??n h????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1900, 1, 'vi', 'plugins/contact/contact', 'models', 'Li??n h????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1901, 1, 'vi', 'plugins/contact/contact', 'list', 'Danh sa??ch li??n h????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1902, 1, 'vi', 'plugins/contact/contact', 'edit', 'Xem li??n h????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1903, 1, 'vi', 'plugins/contact/contact', 'tables.phone', '??i????n thoa??i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1904, 1, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1905, 1, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Ho?? t??n', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1906, 1, 'vi', 'plugins/contact/contact', 'tables.time', 'Th???i gian', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1907, 1, 'vi', 'plugins/contact/contact', 'tables.address', '??i??a ?????a ch???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1908, 1, 'vi', 'plugins/contact/contact', 'tables.subject', 'Ti??u ?????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1909, 1, 'vi', 'plugins/contact/contact', 'tables.content', 'N????i dung', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1910, 1, 'vi', 'plugins/contact/contact', 'form.is_read', '??a?? xem?', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1911, 1, 'vi', 'plugins/contact/contact', 'form.status', 'Tr???ng th??i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1912, 1, 'vi', 'plugins/contact/contact', 'notices.no_select', 'Cho??n i??t nh????t 1 li??n h???? ????? th????c hi????n ha??nh ??????ng na??y!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1913, 1, 'vi', 'plugins/contact/contact', 'notices.update_success_message', 'C????p nh????t tha??nh c??ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1914, 1, 'vi', 'plugins/contact/contact', 'cannot_delete', 'Kh??ng th??? xo??a li??n h???? na??y', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1915, 1, 'vi', 'plugins/contact/contact', 'deleted', 'Li??n h???? ??a?? ????????c xo??a', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1916, 1, 'vi', 'plugins/contact/contact', 'contact_information', 'Th??ng tin li??n h????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1917, 1, 'vi', 'plugins/contact/contact', 'email.title', 'Th??ng tin li??n h???? m????i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1918, 1, 'vi', 'plugins/contact/contact', 'email.success', 'G????i tin nh????n tha??nh c??ng!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1919, 1, 'vi', 'plugins/contact/contact', 'email.failed', 'Co?? l????i trong qua?? tri??nh g????i tin nh????n!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1920, 1, 'vi', 'plugins/contact/contact', 'email.required', 'Email kh??ng ????????c ?????? tr????ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1921, 1, 'vi', 'plugins/contact/contact', 'email.email', '??i??a chi?? email kh??ng h????p l????', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1922, 1, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1923, 1, 'vi', 'plugins/contact/contact', 'name.required', 'Ho?? t??n kh??ng ????????c ????? tr???ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1924, 1, 'vi', 'plugins/contact/contact', 'content.required', 'N????i dung tin nh????n kh??ng ????????c ????? tr???ng', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1925, 1, 'vi', 'plugins/contact/contact', 'g-recaptcha-response.required', 'Ha??y xa??c minh kh??ng pha??i la?? robot tr??????c khi g???i tin nh???n.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1926, 1, 'vi', 'plugins/contact/contact', 'g-recaptcha-response.captcha', 'Ba??n ch??a xa??c minh kh??ng ph???i la?? robot tha??nh c??ng.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1927, 1, 'vi', 'plugins/contact/contact', 'confirm_not_robot', 'X??c nh???n kh??ng ph???i ng?????i m??y', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1928, 1, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Li??n h??? n??y ???????c g???i t???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1929, 1, 'vi', 'plugins/contact/contact', 'form_address', '?????a ch???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1930, 1, 'vi', 'plugins/contact/contact', 'form_email', 'Th?? ??i???n t???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1931, 1, 'vi', 'plugins/contact/contact', 'form_message', 'Th??ng ??i???p', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1932, 1, 'vi', 'plugins/contact/contact', 'form_name', 'H??? t??n', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1933, 1, 'vi', 'plugins/contact/contact', 'form_phone', 'S??? ??i???n tho???i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1934, 1, 'vi', 'plugins/contact/contact', 'message_content', 'N???i dung th??ng ??i???p', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1935, 1, 'vi', 'plugins/contact/contact', 'required_field', 'Nh???ng tr?????ng c?? d???u (<span style=\"color: red\">*</span>) l?? b???t bu???c.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1936, 1, 'vi', 'plugins/contact/contact', 'send_btn', 'G???i tin nh???n', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1937, 1, 'vi', 'plugins/contact/contact', 'sender', 'Ng?????i g???i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1938, 1, 'vi', 'plugins/contact/contact', 'sender_address', '?????a ch???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1939, 1, 'vi', 'plugins/contact/contact', 'sender_email', 'Th?? ??i???n t???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1940, 1, 'vi', 'plugins/contact/contact', 'sender_phone', 'S??? ??i???n tho???i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1941, 1, 'vi', 'plugins/contact/contact', 'sent_from', 'Th?? ???????c g???i t???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1942, 1, 'vi', 'plugins/contact/contact', 'mark_as_read', '????nh d???u ???? ?????c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1943, 1, 'vi', 'plugins/contact/contact', 'mark_as_unread', '????nh d???u ch??a ?????c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1944, 1, 'vi', 'plugins/contact/contact', 'address', '?????a ch???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1945, 1, 'vi', 'plugins/contact/contact', 'message', 'Li??n h???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1946, 1, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'B???n c?? <span class=\"bold\">:count</span> tin nh???n m???i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1947, 1, 'vi', 'plugins/contact/contact', 'phone', '??i???n tho???i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1948, 1, 'vi', 'plugins/contact/contact', 'statuses.read', '???? ?????c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1949, 1, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Ch??a ?????c', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1950, 1, 'vi', 'plugins/contact/contact', 'view_all', 'Xem t???t c???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1951, 1, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Li??n h???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1952, 1, 'vi', 'plugins/contact/contact', 'settings.email.description', 'C???u h??nh th??ng tin cho m???c li??n h???', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1953, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Th??ng b??o t???i admin', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1954, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'M???u n???i dung email g???i t???i admin khi c?? li??n h??? m???i', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1955, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'settings.title', 'Cookie Consent', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1956, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'settings.description', 'Settings for cookie consent', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1957, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'settings.enable', 'Enable cookie consent?', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1958, 1, 'en', 'plugins/ecommerce/brands', 'name', 'Brands', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1959, 1, 'en', 'plugins/ecommerce/brands', 'create', 'New brand', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1960, 1, 'en', 'plugins/ecommerce/brands', 'edit', 'Edit brand', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1961, 1, 'en', 'plugins/ecommerce/brands', 'form.name', 'Name', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1962, 1, 'en', 'plugins/ecommerce/brands', 'form.name_placeholder', 'Brand\'s name (Maximum 255 characters)', '2020-10-09 03:54:28', '2020-10-09 03:54:28');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1963, 1, 'en', 'plugins/ecommerce/brands', 'form.description', 'Description', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1964, 1, 'en', 'plugins/ecommerce/brands', 'form.description_placeholder', 'Short description for brand (Maximum 400 characters)', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1965, 1, 'en', 'plugins/ecommerce/brands', 'form.website', 'Website', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1966, 1, 'en', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1967, 1, 'en', 'plugins/ecommerce/brands', 'form.is_featured', 'Is featured', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1968, 1, 'en', 'plugins/ecommerce/brands', 'logo', 'Logo', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1969, 1, 'en', 'plugins/ecommerce/brands', 'website', 'Website', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1970, 1, 'en', 'plugins/ecommerce/brands', 'notices.no_select', 'Please select at least one record to take this action!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1971, 1, 'en', 'plugins/ecommerce/brands', 'notices.update_success_message', 'Update successfully', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1972, 1, 'en', 'plugins/ecommerce/brands', 'cannot_delete', 'Brand could not be deleted', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1973, 1, 'en', 'plugins/ecommerce/brands', 'brand_deleted', 'Brand deleted', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1974, 1, 'en', 'plugins/ecommerce/brands', 'menu', 'Brands', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1975, 1, 'en', 'plugins/ecommerce/brands', 'no_brand', 'No brand', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1976, 1, 'en', 'plugins/ecommerce/brands', 'intro.title', 'Manage brands', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1977, 1, 'en', 'plugins/ecommerce/brands', 'intro.description', 'Manage product brands such as Nike, Adidas, Bitis ...', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1978, 1, 'en', 'plugins/ecommerce/brands', 'intro.button_text', 'Create brand', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1979, 1, 'en', 'plugins/ecommerce/currency', 'currencies', 'Currencies', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1980, 1, 'en', 'plugins/ecommerce/currency', 'setting_description', 'List of currencies using on website', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1981, 1, 'en', 'plugins/ecommerce/currency', 'name', 'Name', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1982, 1, 'en', 'plugins/ecommerce/currency', 'symbol', 'Symbol', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1983, 1, 'en', 'plugins/ecommerce/currency', 'number_of_decimals', 'Number of decimals', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1984, 1, 'en', 'plugins/ecommerce/currency', 'exchange_rate', 'Exchange rate', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1985, 1, 'en', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'Position of symbol', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1986, 1, 'en', 'plugins/ecommerce/currency', 'is_default', 'Is default?', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1987, 1, 'en', 'plugins/ecommerce/currency', 'remove', 'Remove', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1988, 1, 'en', 'plugins/ecommerce/currency', 'new_currency', 'Add a new currency', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1989, 1, 'en', 'plugins/ecommerce/currency', 'save_settings', 'Save settings', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1990, 1, 'en', 'plugins/ecommerce/currency', 'before_number', 'Before number', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1991, 1, 'en', 'plugins/ecommerce/currency', 'after_number', 'After number', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1992, 1, 'en', 'plugins/ecommerce/customer', 'name', 'Customers', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1993, 1, 'en', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1994, 1, 'en', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1995, 1, 'en', 'plugins/ecommerce/customer', 'email', 'Email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1996, 1, 'en', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1997, 1, 'en', 'plugins/ecommerce/customer', 'password', 'Password', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1998, 1, 'en', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(1999, 1, 'en', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2000, 1, 'en', 'plugins/ecommerce/customer', 'intro.title', 'Manage customers', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2001, 1, 'en', 'plugins/ecommerce/customer', 'intro.description', 'When a customer buy your product(s), you will know their order histories.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2002, 1, 'en', 'plugins/ecommerce/customer', 'intro.button_text', 'Create customer', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2003, 1, 'en', 'plugins/ecommerce/discount', 'name', 'Discounts', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2004, 1, 'en', 'plugins/ecommerce/discount', 'create', 'Create discount', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2005, 1, 'en', 'plugins/ecommerce/discount', 'invalid_coupon', 'This coupon is invalid or expired!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2006, 1, 'en', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'Cannot use this coupon in the same time with other discount program!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2007, 1, 'en', 'plugins/ecommerce/discount', 'not_used', 'This coupon is not used yet!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2008, 1, 'en', 'plugins/ecommerce/discount', 'detail', 'Detail', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2009, 1, 'en', 'plugins/ecommerce/discount', 'used', 'Used', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2010, 1, 'en', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2011, 1, 'en', 'plugins/ecommerce/discount', 'end_date', 'End date', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2012, 1, 'en', 'plugins/ecommerce/discount', 'intro.title', 'Manage discount/coupon code', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2013, 1, 'en', 'plugins/ecommerce/discount', 'intro.description', 'Create coupon code or promotion for your products.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2014, 1, 'en', 'plugins/ecommerce/discount', 'intro.button_text', 'Create discount', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2015, 1, 'en', 'plugins/ecommerce/ecommerce', 'settings', 'Settings', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2016, 1, 'en', 'plugins/ecommerce/ecommerce', 'name', 'Ecommerce', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2017, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2018, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2019, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2020, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2021, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2022, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2023, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2024, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2025, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2026, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2027, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_address', 'Store address', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2028, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_phone', 'Store phone', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2029, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_id', 'Order ID', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2030, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_token', 'Order token', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2031, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_name', 'Customer name', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2032, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_email', 'Customer email', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2033, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_phone', 'Customer phone', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2034, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_address', 'Customer address', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2035, 1, 'en', 'plugins/ecommerce/ecommerce', 'product_list', 'List products in order', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2036, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Payment detail', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2037, 1, 'en', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Shipping method', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2038, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_method', 'Payment method', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2039, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Standard & Format', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2040, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'Standards and formats are used to calculate things like product prices, shipping weights, and order times.', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2041, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Edit order code format (optional)', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2042, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'The default order code starts at: number. You can change the start or end string to create the order code you want, for example \"DH-: number\" or \": number-A\"', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2043, 1, 'en', 'plugins/ecommerce/ecommerce', 'start_with', 'Start with', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2044, 1, 'en', 'plugins/ecommerce/ecommerce', 'end_with', 'End with', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2045, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'Your order code will be shown', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2046, 1, 'en', 'plugins/ecommerce/ecommerce', 'weight_unit', 'Unit of weight', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2047, 1, 'en', 'plugins/ecommerce/ecommerce', 'height_unit', 'Unit length / height', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2048, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_title', 'Order confirmation', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2049, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_description', 'Send email confirmation to customer when an order placed', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2050, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_title', 'Order cancellation', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2051, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_description', 'Send to custom when they cancelled order', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2052, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'Delivering confirmation', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2053, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_description', 'Send to customer when order is delivering', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2054, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_title', 'Notice about new order', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2055, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_description', 'Send to administrators when an order placed', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2056, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_title', 'Order confirmation', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2057, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_description', 'Send to customer when they order was confirmed by admins', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2058, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_title', 'Payment confirmation', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2059, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Send to customer when their payment was confirmed', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2060, 1, 'en', 'plugins/ecommerce/email', 'order_recover_title', 'Incomplete order', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2061, 1, 'en', 'plugins/ecommerce/email', 'order_recover_description', 'Send to custom to remind them about incomplete orders', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2062, 1, 'en', 'plugins/ecommerce/messages', 'cart.add_product_success', 'Add product :product to cart successfully!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2063, 1, 'en', 'plugins/ecommerce/messages', 'cart.update_cart_success', 'Update cart successfully!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2064, 1, 'en', 'plugins/ecommerce/messages', 'cart.remove_cart_success', 'Remove item from cart successfully!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2065, 1, 'en', 'plugins/ecommerce/messages', 'cart.empty_cart_success', 'Empty cart successfully!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2066, 1, 'en', 'plugins/ecommerce/messages', 'cart.product_not_found', 'This product is out of stock or not exists!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2067, 1, 'en', 'plugins/ecommerce/messages', 'cart.product_is_out_of_stock', 'Product :product is out of stock!', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2068, 1, 'en', 'plugins/ecommerce/messages', 'order.customer_cancel_error', 'The order is delivering or completed', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2069, 1, 'en', 'plugins/ecommerce/messages', 'order.customer_cancel_success', 'You do cancel the order successful', '2020-10-09 03:54:28', '2020-10-09 03:54:28'),
(2070, 1, 'en', 'plugins/ecommerce/order', 'statuses.pending', 'Pending', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2071, 1, 'en', 'plugins/ecommerce/order', 'statuses.processing', 'Processing', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2072, 1, 'en', 'plugins/ecommerce/order', 'statuses.delivering', 'Delivering', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2073, 1, 'en', 'plugins/ecommerce/order', 'statuses.delivered', 'Delivered', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2074, 1, 'en', 'plugins/ecommerce/order', 'statuses.completed', 'Completed', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2075, 1, 'en', 'plugins/ecommerce/order', 'statuses.canceled', 'Canceled', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2076, 1, 'en', 'plugins/ecommerce/order', 'name', 'Orders', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2077, 1, 'en', 'plugins/ecommerce/order', 'create', 'Create an order', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2078, 1, 'en', 'plugins/ecommerce/order', 'customer.messages.cancel_error', 'The order is delivering or completed', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2079, 1, 'en', 'plugins/ecommerce/order', 'customer.messages.cancel_success', 'You do cancel the order successful', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2080, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order', 'Incomplete orders', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2081, 1, 'en', 'plugins/ecommerce/order', 'order_id', 'Order ID', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2082, 1, 'en', 'plugins/ecommerce/order', 'customer_label', 'Customer', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2083, 1, 'en', 'plugins/ecommerce/order', 'amount', 'Amount', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2084, 1, 'en', 'plugins/ecommerce/order', 'tax_amount', 'Tax Amount', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2085, 1, 'en', 'plugins/ecommerce/order', 'shipping_amount', 'Shipping amount', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2086, 1, 'en', 'plugins/ecommerce/order', 'payment_method', 'Payment method', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2087, 1, 'en', 'plugins/ecommerce/order', 'payment_status_label', 'Payment status', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2088, 1, 'en', 'plugins/ecommerce/order', 'manage_orders', 'Manage orders', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2089, 1, 'en', 'plugins/ecommerce/order', 'order_intro_description', 'Once your store has orders, this is where you will process and track those orders.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2090, 1, 'en', 'plugins/ecommerce/order', 'create_new_order', 'Create a new order', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2091, 1, 'en', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Manage incomplete orders', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2092, 1, 'en', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', 'Incomplete order is an order created when a customer adds a product to the cart, proceeds to fill out the purchase information but does not complete the checkout process.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2093, 1, 'en', 'plugins/ecommerce/payment', 'name', 'Payments', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2094, 1, 'en', 'plugins/ecommerce/payment', 'payment_method', 'Payment methods', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2095, 1, 'en', 'plugins/ecommerce/payment', 'view_payment', 'View payment #', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2096, 1, 'en', 'plugins/ecommerce/payment', 'charge_id', 'Charge ID', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2097, 1, 'en', 'plugins/ecommerce/payment', 'amount', 'Amount', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2098, 1, 'en', 'plugins/ecommerce/payment', 'currency', 'Currency', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2099, 1, 'en', 'plugins/ecommerce/payment', 'user', 'User', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2100, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_required', 'PayPal\'s name is required!', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2101, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_max', 'PayPal\'s name is too long!', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2102, 1, 'en', 'plugins/ecommerce/payment', 'stripe_name_required', 'Stripe\'s name is required!', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2103, 1, 'en', 'plugins/ecommerce/payment', 'stripe_name_max', 'Stripe\'s name is too long!', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2104, 1, 'en', 'plugins/ecommerce/payment', 'status', 'Status', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2105, 1, 'en', 'plugins/ecommerce/payment', 'enabled', 'Enabled', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2106, 1, 'en', 'plugins/ecommerce/payment', 'disabled', 'Disabled', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2107, 1, 'en', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2108, 1, 'en', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2109, 1, 'en', 'plugins/ecommerce/payment', 'mode', 'Mode', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2110, 1, 'en', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2111, 1, 'en', 'plugins/ecommerce/payment', 'live', 'Live', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2112, 1, 'en', 'plugins/ecommerce/payment', 'enable_payment_log', 'Enable Payment Log', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2113, 1, 'en', 'plugins/ecommerce/payment', 'yes', 'Yes', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2114, 1, 'en', 'plugins/ecommerce/payment', 'no', 'No', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2115, 1, 'en', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2116, 1, 'en', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2117, 1, 'en', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2118, 1, 'en', 'plugins/ecommerce/payment', 'action', 'Action', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2119, 1, 'en', 'plugins/ecommerce/payment', 'go_back', 'Go back', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2120, 1, 'en', 'plugins/ecommerce/payment', 'view', 'View', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2121, 1, 'en', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Cash on delivery (COD)', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2122, 1, 'en', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Via bank transfer', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2123, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_cart', 'Payment via card', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2124, 1, 'en', 'plugins/ecommerce/payment', 'card_number', 'Card number', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2125, 1, 'en', 'plugins/ecommerce/payment', 'full_name', 'Full name', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2126, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Payment via PayPal', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2127, 1, 'en', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2128, 1, 'en', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2129, 1, 'en', 'plugins/ecommerce/payment', 'details', 'Details', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2130, 1, 'en', 'plugins/ecommerce/payment', 'payer_name', 'Payer Name', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2131, 1, 'en', 'plugins/ecommerce/payment', 'email', 'Email', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2132, 1, 'en', 'plugins/ecommerce/payment', 'phone', 'Phone', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2133, 1, 'en', 'plugins/ecommerce/payment', 'country', 'Country', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2134, 1, 'en', 'plugins/ecommerce/payment', 'shipping_address', 'Shipping Address', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2135, 1, 'en', 'plugins/ecommerce/payment', 'payment_details', 'Payment Details', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2136, 1, 'en', 'plugins/ecommerce/payment', 'card', 'Card', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2137, 1, 'en', 'plugins/ecommerce/payment', 'address', 'Address', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2138, 1, 'en', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2139, 1, 'en', 'plugins/ecommerce/payment', 'new_payment', 'Payment for order :id', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2140, 1, 'en', 'plugins/ecommerce/payment', 'payment_id', 'Payment ID', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2141, 1, 'en', 'plugins/ecommerce/prices', 'name', 'Price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2142, 1, 'en', 'plugins/ecommerce/prices', 'create', 'New price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2143, 1, 'en', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2144, 1, 'en', 'plugins/ecommerce/prices', 'list', 'List price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2145, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2146, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2147, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2148, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2149, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2150, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2151, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2152, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2153, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2154, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2155, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2156, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2157, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2158, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2159, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2160, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2161, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2162, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2163, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2164, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2165, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2166, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2167, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2168, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2169, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2170, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2171, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2172, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2173, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2174, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2175, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2176, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2177, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2178, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2179, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2180, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2181, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2182, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2183, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2184, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2185, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2186, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2187, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2188, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'display_layout', 'Display Layout', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2189, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'searchable', 'Searchable', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2190, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'comparable', 'Comparable', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2191, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'use_in_product_listing', 'Used in product listing', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2192, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes_list', 'Attributes list', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2193, 1, 'en', 'plugins/ecommerce/product-attributes', 'name', 'Product attributes', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2194, 1, 'en', 'plugins/ecommerce/product-attributes', 'create', 'New product attribute', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2195, 1, 'en', 'plugins/ecommerce/product-attributes', 'edit', 'Edit product attribute', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2196, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.title', 'Manage product attributes', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2197, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.description', 'Product attribute such as color, width, height ...', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2198, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'Create product attribute', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2199, 1, 'en', 'plugins/ecommerce/product-categories', 'name', 'Product categories', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2200, 1, 'en', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2201, 1, 'en', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2202, 1, 'en', 'plugins/ecommerce/product-categories', 'list', 'List product categories', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2203, 1, 'en', 'plugins/ecommerce/product-categories', 'none', 'None', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2204, 1, 'en', 'plugins/ecommerce/product-categories', 'menu', 'Product categories', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2205, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.title', 'Manage product categories', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2206, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.description', 'Such as clothes, shoes, bags, jewelry ...', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2207, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.button_text', 'Create product category', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2208, 1, 'en', 'plugins/ecommerce/product-collections', 'name', 'Product collections', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2209, 1, 'en', 'plugins/ecommerce/product-collections', 'create', 'New product collection', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2210, 1, 'en', 'plugins/ecommerce/product-collections', 'edit', 'Edit product collection', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2211, 1, 'en', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2212, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.title', 'Manage product collections', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2213, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.description', 'Group your products into collections to make it easier for customers to find them by category.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2214, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.button_text', 'Create product collection', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2215, 1, 'en', 'plugins/ecommerce/product-tag', 'name', 'Product tags', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2216, 1, 'en', 'plugins/ecommerce/product-tag', 'create', 'New product tag', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2217, 1, 'en', 'plugins/ecommerce/product-tag', 'edit', 'Edit product tag', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2218, 1, 'en', 'plugins/ecommerce/products', 'name', 'Products', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2219, 1, 'en', 'plugins/ecommerce/products', 'create', 'New product', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2220, 1, 'en', 'plugins/ecommerce/products', 'edit', 'Edit product - :name', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2221, 1, 'en', 'plugins/ecommerce/products', 'form.name', 'Name', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2222, 1, 'en', 'plugins/ecommerce/products', 'form.name_placeholder', 'Product\'s name (Maximum 120 characters)', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2223, 1, 'en', 'plugins/ecommerce/products', 'form.description', 'Description', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2224, 1, 'en', 'plugins/ecommerce/products', 'form.description_placeholder', 'Short description for product (Maximum 400 characters)', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2225, 1, 'en', 'plugins/ecommerce/products', 'form.categories', 'Categories', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2226, 1, 'en', 'plugins/ecommerce/products', 'form.content', 'Content', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2227, 1, 'en', 'plugins/ecommerce/products', 'form.price', 'Price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2228, 1, 'en', 'plugins/ecommerce/products', 'form.quantity', 'Quantity', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2229, 1, 'en', 'plugins/ecommerce/products', 'form.brand', 'Brand', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2230, 1, 'en', 'plugins/ecommerce/products', 'form.width', 'Width', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2231, 1, 'en', 'plugins/ecommerce/products', 'form.height', 'Height', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2232, 1, 'en', 'plugins/ecommerce/products', 'form.weight', 'Weight', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2233, 1, 'en', 'plugins/ecommerce/products', 'form.date.end', 'From date', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2234, 1, 'en', 'plugins/ecommerce/products', 'form.date.start', 'To date', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2235, 1, 'en', 'plugins/ecommerce/products', 'form.image', 'Images', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2236, 1, 'en', 'plugins/ecommerce/products', 'form.label', 'Product collections', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2237, 1, 'en', 'plugins/ecommerce/products', 'form.price_sale', 'Price sale', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2238, 1, 'en', 'plugins/ecommerce/products', 'form.product_type.title', 'Product type', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2239, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.height', 'Height', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2240, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.length', 'Length', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2241, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.title', 'Shipping', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2242, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.weight', 'Weight', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2243, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.wide', 'Wide', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2244, 1, 'en', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Allow customer checkout when this product out of stock', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2245, 1, 'en', 'plugins/ecommerce/products', 'form.stock.in_stock', 'In stock', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2246, 1, 'en', 'plugins/ecommerce/products', 'form.stock.out_stock', 'Out stock', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2247, 1, 'en', 'plugins/ecommerce/products', 'form.stock.title', 'Stock status', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2248, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'No storehouse management', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2249, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'With storehouse management', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2250, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.title', 'Storehouse', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2251, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'Quantity', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2252, 1, 'en', 'plugins/ecommerce/products', 'form.tax', 'Tax', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2253, 1, 'en', 'plugins/ecommerce/products', 'price', 'Price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2254, 1, 'en', 'plugins/ecommerce/products', 'quantity', 'Quantity', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2255, 1, 'en', 'plugins/ecommerce/products', 'type', 'Type', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2256, 1, 'en', 'plugins/ecommerce/products', 'image', 'Thumbnail', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2257, 1, 'en', 'plugins/ecommerce/products', 'sku', 'Sku', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2258, 1, 'en', 'plugins/ecommerce/products', 'brand', 'Brand', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2259, 1, 'en', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2260, 1, 'en', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2261, 1, 'en', 'plugins/ecommerce/products', 'product_collections', 'Product collections', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2262, 1, 'en', 'plugins/ecommerce/products', 'products', 'Products', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2263, 1, 'en', 'plugins/ecommerce/products', 'menu', 'Products', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2264, 1, 'en', 'plugins/ecommerce/products', 'control.button_add_image', 'Add image', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2265, 1, 'en', 'plugins/ecommerce/products', 'price_sale', 'Sale price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2266, 1, 'en', 'plugins/ecommerce/products', 'price_group_title', 'Manager product price', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2267, 1, 'en', 'plugins/ecommerce/products', 'store_house_group_title', 'Manager store house', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2268, 1, 'en', 'plugins/ecommerce/products', 'shipping_group_title', 'Manager shipping', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2269, 1, 'en', 'plugins/ecommerce/products', 'overview', 'Overview', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2270, 1, 'en', 'plugins/ecommerce/products', 'attributes', 'Attributes', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2271, 1, 'en', 'plugins/ecommerce/products', 'product_has_variations', 'Product has variations', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2272, 1, 'en', 'plugins/ecommerce/products', 'manage_products', 'Manage products', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2273, 1, 'en', 'plugins/ecommerce/products', 'add_new_product', 'Add a new product', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2274, 1, 'en', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'Start by adding new products.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2275, 1, 'en', 'plugins/ecommerce/products', 'edit_this_product', 'Edit this product', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2276, 1, 'en', 'plugins/ecommerce/reports', 'name', 'Report', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2277, 1, 'en', 'plugins/ecommerce/reports', 'widget.order.title', 'Orders', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2278, 1, 'en', 'plugins/ecommerce/reports', 'count.revenue', 'Today revenue', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2279, 1, 'en', 'plugins/ecommerce/reports', 'count.orders', 'Today orders', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2280, 1, 'en', 'plugins/ecommerce/reports', 'count.products', 'Total products', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2281, 1, 'en', 'plugins/ecommerce/reports', 'count.customers', 'Total customers', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2282, 1, 'en', 'plugins/ecommerce/reports', 'product_name', 'Product name', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2283, 1, 'en', 'plugins/ecommerce/reports', 'quantity', 'Quantity', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2284, 1, 'en', 'plugins/ecommerce/reports', 'revenue_statistics', 'Revenue statistics', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2285, 1, 'en', 'plugins/ecommerce/reports', 'top_selling_products', 'Top selling products in this month', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2286, 1, 'en', 'plugins/ecommerce/review', 'name', 'Reviews', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2287, 1, 'en', 'plugins/ecommerce/review', 'add_review', 'Add review', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2288, 1, 'en', 'plugins/ecommerce/review', 'delete_review', 'Delete review', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2289, 1, 'en', 'plugins/ecommerce/review', 'create_review', 'Create Review', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2290, 1, 'en', 'plugins/ecommerce/review', 'please_select_rating', 'Please select rating', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2291, 1, 'en', 'plugins/ecommerce/review', 'comment', 'Comment', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2292, 1, 'en', 'plugins/ecommerce/review', 'approve', 'Approve', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2293, 1, 'en', 'plugins/ecommerce/review', 'approved', 'Approved', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2294, 1, 'en', 'plugins/ecommerce/review', 'disapprove', 'Disapprove', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2295, 1, 'en', 'plugins/ecommerce/review', 'disapproved', 'Disapproved', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2296, 1, 'en', 'plugins/ecommerce/review', 'product', 'Product', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2297, 1, 'en', 'plugins/ecommerce/review', 'user', 'User', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2298, 1, 'en', 'plugins/ecommerce/review', 'star', 'Star', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2299, 1, 'en', 'plugins/ecommerce/review', 'status', 'Status', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2300, 1, 'en', 'plugins/ecommerce/review', 'list_review', 'Customer reviews', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2301, 1, 'en', 'plugins/ecommerce/review', 'intro.title', 'Manage customer reviews', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2302, 1, 'en', 'plugins/ecommerce/review', 'intro.description', 'Customer reviews will be shown here and you can manage it to show/hide in product detail page.', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2303, 1, 'en', 'plugins/ecommerce/shipping', 'name', 'Shipping Rules', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2304, 1, 'en', 'plugins/ecommerce/shipping', 'shipping', 'Shipping', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2305, 1, 'en', 'plugins/ecommerce/shipping', 'title', 'Title', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2306, 1, 'en', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2307, 1, 'en', 'plugins/ecommerce/shipping', 'currency', 'Currency', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2308, 1, 'en', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2309, 1, 'en', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2310, 1, 'en', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2311, 1, 'en', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2312, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2313, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping #', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2314, 1, 'en', 'plugins/ecommerce/shipping', 'status', 'Status', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2315, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_methods', 'Shipping methods', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2316, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping_method', 'Create shipping method', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2317, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'Edit shipping method', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2318, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Add shipping region', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2319, 1, 'en', 'plugins/ecommerce/shipping', 'country', 'Country', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2320, 1, 'en', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2321, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2020-10-09 03:54:29', '2020-10-09 03:54:29'),
(2322, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2323, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2324, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2325, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2326, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2327, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2328, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2329, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2330, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2331, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2332, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2333, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2334, 1, 'en', 'plugins/ecommerce/shipping', 'cross_checking_statuses.pending', 'Pending', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2335, 1, 'en', 'plugins/ecommerce/shipping', 'cross_checking_statuses.completed', 'Completed', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2336, 1, 'en', 'plugins/ecommerce/store-locator', 'name', 'Store locators', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2337, 1, 'en', 'plugins/ecommerce/store-locator', 'description', 'This address will appear on your invoice and will be used to calculate your shipping price.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2338, 1, 'en', 'plugins/ecommerce/store-locator', 'shop_name', 'Shop name', '2020-10-09 03:54:30', '2020-10-09 03:54:30');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2339, 1, 'en', 'plugins/ecommerce/store-locator', 'phone', 'Phone', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2340, 1, 'en', 'plugins/ecommerce/store-locator', 'address', 'Address', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2341, 1, 'en', 'plugins/ecommerce/tax', 'name', 'Taxes', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2342, 1, 'en', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2343, 1, 'en', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2344, 1, 'en', 'plugins/ecommerce/tax', 'title', 'Title', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2345, 1, 'en', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2346, 1, 'en', 'plugins/ecommerce/tax', 'priority', 'Priority', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2347, 1, 'en', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2348, 1, 'vi', 'plugins/ecommerce/brands', 'name', 'Th????ng hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2349, 1, 'vi', 'plugins/ecommerce/brands', 'create', 'Th??m th????ng hi???u m???i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2350, 1, 'vi', 'plugins/ecommerce/brands', 'edit', 'S???a th????ng hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2351, 1, 'vi', 'plugins/ecommerce/brands', 'list', 'Danh s??ch th????ng hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2352, 1, 'vi', 'plugins/ecommerce/brands', 'form.name', 'T??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2353, 1, 'vi', 'plugins/ecommerce/brands', 'form.name_placeholder', 'T??n th????ng hi???u (t???i ??a 255 k?? t???)', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2354, 1, 'vi', 'plugins/ecommerce/brands', 'form.description', 'M?? t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2355, 1, 'vi', 'plugins/ecommerce/brands', 'form.description_placeholder', 'M?? t??? ng???n cho th????ng hi???u n??y (t???i ??a 400 k?? t???)', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2356, 1, 'vi', 'plugins/ecommerce/brands', 'form.website', 'Website', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2357, 1, 'vi', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2358, 1, 'vi', 'plugins/ecommerce/brands', 'form.is_featured', 'N???i b???t?', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2359, 1, 'vi', 'plugins/ecommerce/brands', 'logo', 'Logo', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2360, 1, 'vi', 'plugins/ecommerce/brands', 'website', 'Website', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2361, 1, 'vi', 'plugins/ecommerce/brands', 'notices.no_select', 'Kh??ng c?? b???n ghi n??o ???????c ch???n!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2362, 1, 'vi', 'plugins/ecommerce/brands', 'notices.update_success_message', 'C???p nh???t th??nh c??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2363, 1, 'vi', 'plugins/ecommerce/brands', 'cannot_delete', 'Xo?? kh??ng th??nh c??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2364, 1, 'vi', 'plugins/ecommerce/brands', 'brand_deleted', 'Xo?? th????ng hi???u th??nh c??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2365, 1, 'vi', 'plugins/ecommerce/brands', 'menu', 'Th????ng hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2366, 1, 'vi', 'plugins/ecommerce/brands', 'intro.title', 'Qu???n l?? danh s??ch th????ng hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2367, 1, 'vi', 'plugins/ecommerce/brands', 'intro.description', 'C??c th????ng hi???u c???a s???n ph???m nh?? Nike, Adidas, Bitis ...', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2368, 1, 'vi', 'plugins/ecommerce/brands', 'intro.button_text', 'T???o th????ng hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2369, 1, 'vi', 'plugins/ecommerce/currencies', 'name', 'Ti???n t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2370, 1, 'vi', 'plugins/ecommerce/currencies', 'create', 'Th??m lo???i ti???n t??? m???i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2371, 1, 'vi', 'plugins/ecommerce/currencies', 'edit', 'S???a ti???n t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2372, 1, 'vi', 'plugins/ecommerce/currencies', 'list', 'Danh s??ch ti???n t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2373, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.title', 'T??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2374, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.code', 'M??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2375, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.symbol', 'K?? hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2376, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.is_prefix_symbol', 'S??? d???ng k?? hi???u tr?????c s??? ti???n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2377, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.status', 'Tr???ng th??i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2378, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.order', 'S???p x???p', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2379, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.title', 'Ti??u ?????', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2380, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.code', 'M??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2381, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.symbol', 'K?? hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2382, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.is_prefix_symbol', 'S??? d???ng k?? hi???u tr?????c s??? ti???n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2383, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.status', 'Tr???ng th??i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2384, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.order', 'S???p x???p', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2385, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.decimals', 'S??? k?? t??? sau d???u ph??n c??ch', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2386, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.activated', '???? k??ch ho???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2387, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.deactivated', '???? b??? hu??? k??ch ho???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2388, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.yes', 'C??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2389, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.no', 'Kh??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2390, 1, 'vi', 'plugins/ecommerce/currency', 'currencies', 'Ti???n t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2391, 1, 'vi', 'plugins/ecommerce/currency', 'setting_description', 'C??c lo???i ti???n t??? ???????c s??? d???ng tr??n website.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2392, 1, 'vi', 'plugins/ecommerce/currency', 'name', 'T??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2393, 1, 'vi', 'plugins/ecommerce/currency', 'symbol', 'K?? hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2394, 1, 'vi', 'plugins/ecommerce/currency', 'number_of_decimals', 'S??? th???p ph??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2395, 1, 'vi', 'plugins/ecommerce/currency', 'exchange_rate', 'T??? gi??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2396, 1, 'vi', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'V??? tr?? k?? hi???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2397, 1, 'vi', 'plugins/ecommerce/currency', 'is_default', 'M???c ?????nh?', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2398, 1, 'vi', 'plugins/ecommerce/currency', 'remove', 'Xo??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2399, 1, 'vi', 'plugins/ecommerce/currency', 'new_currency', 'Th??m ti???n t??? m???i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2400, 1, 'vi', 'plugins/ecommerce/currency', 'save_settings', 'L??u c??i ?????t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2401, 1, 'vi', 'plugins/ecommerce/currency', 'before_number', 'Tr?????c s???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2402, 1, 'vi', 'plugins/ecommerce/currency', 'after_number', 'Sau s???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2403, 1, 'vi', 'plugins/ecommerce/customer', 'name', 'Kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2404, 1, 'vi', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2405, 1, 'vi', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2406, 1, 'vi', 'plugins/ecommerce/customer', 'email', 'Email', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2407, 1, 'vi', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2408, 1, 'vi', 'plugins/ecommerce/customer', 'password', 'Password', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2409, 1, 'vi', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2410, 1, 'vi', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2411, 1, 'vi', 'plugins/ecommerce/customer', 'intro.title', 'Qu???n l?? danh s??ch kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2412, 1, 'vi', 'plugins/ecommerce/customer', 'intro.description', 'Khi kh??ch h??ng ?????t h??ng, b???n s??? bi???t ???????c th??ng tin v?? l???ch s??? mua h??ng c???a kh??ch h??ng.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2413, 1, 'vi', 'plugins/ecommerce/customer', 'intro.button_text', 'T???o kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2414, 1, 'vi', 'plugins/ecommerce/discount', 'name', 'Khuy???n m??i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2415, 1, 'vi', 'plugins/ecommerce/discount', 'invalid_coupon', 'M?? khuy???n m??i kh??ng h???p l??? ho???c ???? h???t h???n!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2416, 1, 'vi', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'M?? khuy???n m??i n??y kh??ng th??? s??? d???ng chung v???i ch????ng tr??nh khuy???n m??i!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2417, 1, 'vi', 'plugins/ecommerce/discount', 'not_used', 'Ch??a s??? d???ng m?? gi???m gi?? n??y', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2418, 1, 'vi', 'plugins/ecommerce/discount', 'detail', 'Detail', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2419, 1, 'vi', 'plugins/ecommerce/discount', 'used', 'Used', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2420, 1, 'vi', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2421, 1, 'vi', 'plugins/ecommerce/discount', 'end_date', 'End date', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2422, 1, 'vi', 'plugins/ecommerce/discount', 'intro.title', 'Ch????ng tr??nh khuy???n m??i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2423, 1, 'vi', 'plugins/ecommerce/discount', 'intro.description', 'T???o ra c??c m?? coupon, c??i ?????t m???t s???n ph???m, ho???c m???t nh??m s???n ph???m khuy???n m??i d??nh cho c??c kh??ch h??ng th??n thi???t c???a b???n.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2424, 1, 'vi', 'plugins/ecommerce/discount', 'intro.button_text', 'T???o khuy???n m??i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2425, 1, 'vi', 'plugins/ecommerce/ecommerce', 'settings', 'C??i ?????t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2426, 1, 'vi', 'plugins/ecommerce/ecommerce', 'name', 'Th????ng m???i ??i???n t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2427, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2428, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2429, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2430, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2431, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2432, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2433, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2434, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2435, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2436, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2437, 1, 'vi', 'plugins/ecommerce/ecommerce', 'store_address', '?????a ch??? c???a h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2438, 1, 'vi', 'plugins/ecommerce/ecommerce', 'store_phone', 'S??? ??i???n tho???i c???a h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2439, 1, 'vi', 'plugins/ecommerce/ecommerce', 'order_id', 'M?? ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2440, 1, 'vi', 'plugins/ecommerce/ecommerce', 'order_token', 'Chu???i m?? ho?? ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2441, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_name', 'T??n kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2442, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_email', 'Email kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2443, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_phone', 'S??? ??i???n tho???i kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2444, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_address', '?????a ch??? kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2445, 1, 'vi', 'plugins/ecommerce/ecommerce', 'product_list', 'Danh s??ch s???n ph???m trong ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2446, 1, 'vi', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Chi ti???t thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2447, 1, 'vi', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Ph????ng th???c v???n chuy???n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2448, 1, 'vi', 'plugins/ecommerce/ecommerce', 'payment_method', 'Ph????ng th???c thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2449, 1, 'vi', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Ti??u chu???n & ?????nh d???ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2450, 1, 'vi', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'C??c ti??u chu???n v?? c??c ?????nh d???ng ???????c s??? d???ng ????? t??nh to??n nh???ng th??? nh?? gi?? c??? s???n ph???m, tr???ng l?????ng v???n chuy???n v?? th???i gian ????n h??ng ???????c ?????t.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2451, 1, 'vi', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Ch???nh s???a ?????nh d???ng m?? ????n h??ng (t??y ch???n)', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2452, 1, 'vi', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'M?? ????n h??ng m???c ?????nh b???t ?????u t??? :number. B???n c?? th??? thay ?????i chu???i b???t ?????u ho???c k???t th??c ????? t???o m?? ????n h??ng theo ?? b???n, v?? d??? \"DH-:number\" ho???c \":number-A\"', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2453, 1, 'vi', 'plugins/ecommerce/ecommerce', 'start_with', 'B???t ?????u b???ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2454, 1, 'vi', 'plugins/ecommerce/ecommerce', 'end_with', 'K???t th??c b???ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2455, 1, 'vi', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'M?? ????n h??ng c???a b???n s??? hi???n th??? theo m???u', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2456, 1, 'vi', 'plugins/ecommerce/ecommerce', 'weight_unit', '????n v??? c??n n???ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2457, 1, 'vi', 'plugins/ecommerce/ecommerce', 'height_unit', '????n v??? chi???u d??i/chi???u cao', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2458, 1, 'vi', 'plugins/ecommerce/email', 'customer_new_order_title', 'X??c nh???n ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2459, 1, 'vi', 'plugins/ecommerce/email', 'customer_new_order_description', '???????c g???i khi kh??ch h??ng t???o ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2460, 1, 'vi', 'plugins/ecommerce/email', 'customer_new_order_subject', '????n h??ng m???i {{ order_id }}', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2461, 1, 'vi', 'plugins/ecommerce/email', 'order_cancellation_title', 'H???y ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2462, 1, 'vi', 'plugins/ecommerce/email', 'order_cancellation_description', '???????c g???i khi kh??ch h??ng h???y ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2463, 1, 'vi', 'plugins/ecommerce/email', 'order_cancellation_subject', '????n h??ng ???? ???????c hu??? {{ order_id }}', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2464, 1, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'X??c nh???n giao h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2465, 1, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_description', '???????c g???i ?????n kh??ch h??ng khi b???t ?????u giao h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2466, 1, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_subject', '????n h??ng ??ang ???????c giao {{ order_id }}', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2467, 1, 'vi', 'plugins/ecommerce/email', 'admin_new_order_title', 'Th??ng b??o c?? ????n h??ng m???i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2468, 1, 'vi', 'plugins/ecommerce/email', 'admin_new_order_description', '???????c g???i cho qu???n tr??? vi??n khi c?? kh??ch mua h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2469, 1, 'vi', 'plugins/ecommerce/email', 'admin_new_order_subject', '????n h??ng m???i {{ order_id }}', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2470, 1, 'vi', 'plugins/ecommerce/email', 'order_confirmation_title', 'X??c nh???n ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2471, 1, 'vi', 'plugins/ecommerce/email', 'order_confirmation_description', 'Email ???????c g???i ?????n kh??ch h??ng khi ????n h??ng x??c nh???n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2472, 1, 'vi', 'plugins/ecommerce/email', 'order_confirmation_subject', '????n h??ng ???? ???????c x??c nh???n {{ order_id }}', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2473, 1, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_title', 'X??c nh???n thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2474, 1, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Email ???????c g???i ?????n kh??ch h??ng khi ????n h??ng x??c nh???n thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2475, 1, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_subject', '????n h??ng ???? ???????c x??c nh???n thanh to??n {{ order_id }}', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2476, 1, 'vi', 'plugins/ecommerce/email', 'order_recover_title', '????n h??ng ??ang ch??? ho??n t???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2477, 1, 'vi', 'plugins/ecommerce/email', 'order_recover_description', 'Email nh???c nh??? kh??ch h??ng ho??n t???t ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2478, 1, 'vi', 'plugins/ecommerce/email', 'order_recover_subject', '????n h??ng ??ang ch??? ho??n t???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2479, 1, 'vi', 'plugins/ecommerce/order', 'statuses.pending', 'Ch??a x??? l??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2480, 1, 'vi', 'plugins/ecommerce/order', 'statuses.processing', '??ang x??? l??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2481, 1, 'vi', 'plugins/ecommerce/order', 'statuses.delivering', '??ang giao h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2482, 1, 'vi', 'plugins/ecommerce/order', 'statuses.delivered', '???? giao h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2483, 1, 'vi', 'plugins/ecommerce/order', 'statuses.completed', 'Ho??n th??nh', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2484, 1, 'vi', 'plugins/ecommerce/order', 'statuses.canceled', 'B??? hu???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2485, 1, 'vi', 'plugins/ecommerce/order', 'name', '????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2486, 1, 'vi', 'plugins/ecommerce/order', 'customer.messages.cancel_error', '????n h??ng ??ang ???????c giao ho???c ???? ho??n th??nh', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2487, 1, 'vi', 'plugins/ecommerce/order', 'customer.messages.cancel_success', 'Hu??? ????n h??ng th??nh c??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2488, 1, 'vi', 'plugins/ecommerce/order', 'incomplete_order', '????n h??ng ch??a ho??n t???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2489, 1, 'vi', 'plugins/ecommerce/order', 'order_id', 'M?? ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2490, 1, 'vi', 'plugins/ecommerce/order', 'customer_label', 'Kh??ch h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2491, 1, 'vi', 'plugins/ecommerce/order', 'amount', 'T???ng c???ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2492, 1, 'vi', 'plugins/ecommerce/order', 'shipping_amount', 'Ph?? v???n chuy???n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2493, 1, 'vi', 'plugins/ecommerce/order', 'payment_method', 'Ph????ng th???c thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2494, 1, 'vi', 'plugins/ecommerce/order', 'payment_status_label', 'Tr???ng th??i thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2495, 1, 'vi', 'plugins/ecommerce/order', 'manage_orders', 'Qu???n l?? ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2496, 1, 'vi', 'plugins/ecommerce/order', 'order_intro_description', 'M???t khi c???a h??ng c???a b???n c?? ????n ?????t h??ng, ????y s??? l?? n??i b???n x??? l?? v?? theo d??i nh???ng ????n ?????t h??ng ????.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2497, 1, 'vi', 'plugins/ecommerce/order', 'create_new_order', 'T???o ????n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2498, 1, 'vi', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Qu???n l?? ????n h??ng ch??a ho??n t???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2499, 1, 'vi', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', '????n h??ng ch??a ho??n t???t l?? ????n h??ng ???????c t???o khi kh??ch h??ng th??m s???n ph???m v??o gi??? h??ng, ti???n h??nh ??i???n th??ng tin mua h??ng nh??ng kh??ng ho??n t???t qu?? tr??nh thanh to??n.', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2500, 1, 'vi', 'plugins/ecommerce/payment', 'name', 'Thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2501, 1, 'vi', 'plugins/ecommerce/payment', 'all_payment', 'T???t c??? thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2502, 1, 'vi', 'plugins/ecommerce/payment', 'payment_method', 'Ph????ng th???c thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2503, 1, 'vi', 'plugins/ecommerce/payment', 'checkout_success', 'Thanh to??n th??nh c??ng!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2504, 1, 'vi', 'plugins/ecommerce/payment', 'view_payment', 'Xem thanh to??n #', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2505, 1, 'vi', 'plugins/ecommerce/payment', 'charge_id', 'M?? giao d???ch', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2506, 1, 'vi', 'plugins/ecommerce/payment', 'amount', 'S??? ti???n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2507, 1, 'vi', 'plugins/ecommerce/payment', 'currency', '????n v??? ti???n t???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2508, 1, 'vi', 'plugins/ecommerce/payment', 'user', 'Ng?????i d??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2509, 1, 'vi', 'plugins/ecommerce/payment', 'paypal_name_required', 'T??n c???a ph????ng th???c PayPal l?? b???t bu???c!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2510, 1, 'vi', 'plugins/ecommerce/payment', 'paypal_name_max', 'T??n c???a ph????ng th???c PayPal qu?? d??i!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2511, 1, 'vi', 'plugins/ecommerce/payment', 'stripe_name_required', 'T??n c???a ph????ng th???c Stripe l?? b???t bu???c!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2512, 1, 'vi', 'plugins/ecommerce/payment', 'stripe_name_max', 'T??n c???a ph????ng th???c Stripe qu?? d??i!', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2513, 1, 'vi', 'plugins/ecommerce/payment', 'status', 'Tr???ng th??i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2514, 1, 'vi', 'plugins/ecommerce/payment', 'enabled', 'B???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2515, 1, 'vi', 'plugins/ecommerce/payment', 'disabled', 'T???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2516, 1, 'vi', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2517, 1, 'vi', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2518, 1, 'vi', 'plugins/ecommerce/payment', 'mode', 'Ch??? ?????', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2519, 1, 'vi', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2520, 1, 'vi', 'plugins/ecommerce/payment', 'live', 'Live', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2521, 1, 'vi', 'plugins/ecommerce/payment', 'enable_payment_log', 'B???t l??u nh???t k?? thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2522, 1, 'vi', 'plugins/ecommerce/payment', 'yes', 'C??', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2523, 1, 'vi', 'plugins/ecommerce/payment', 'no', 'Kh??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2524, 1, 'vi', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2525, 1, 'vi', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2526, 1, 'vi', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2527, 1, 'vi', 'plugins/ecommerce/payment', 'action', 'H??nh ?????ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2528, 1, 'vi', 'plugins/ecommerce/payment', 'go_back', 'Quay l???i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2529, 1, 'vi', 'plugins/ecommerce/payment', 'view', 'Xem', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2530, 1, 'vi', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Thanh to??n khi nh???n h??ng (COD)', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2531, 1, 'vi', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Th??ng qua chuy???n kho???n ng??n h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2532, 1, 'vi', 'plugins/ecommerce/payment', 'payment_via_cart', 'Thanh to??n b???ng th???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2533, 1, 'vi', 'plugins/ecommerce/payment', 'card_number', 'S??? th???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2534, 1, 'vi', 'plugins/ecommerce/payment', 'full_name', 'T??n tr??n th???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2535, 1, 'vi', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Thanh to??n th??ng qua PayPal', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2536, 1, 'vi', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2537, 1, 'vi', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2538, 1, 'vi', 'plugins/ecommerce/payment', 'details', 'Chi ti???t', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2539, 1, 'vi', 'plugins/ecommerce/payment', 'payer_name', 'Ng?????i thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2540, 1, 'vi', 'plugins/ecommerce/payment', 'email', '?????a ch??? email', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2541, 1, 'vi', 'plugins/ecommerce/payment', 'phone', '??i???n tho???i', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2542, 1, 'vi', 'plugins/ecommerce/payment', 'country', 'Qu???c gia', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2543, 1, 'vi', 'plugins/ecommerce/payment', 'shipping_address', '?????a ch??? giao h??ng', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2544, 1, 'vi', 'plugins/ecommerce/payment', 'payment_details', 'Chi ti???t giao d???ch', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2545, 1, 'vi', 'plugins/ecommerce/payment', 'card', 'Th???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2546, 1, 'vi', 'plugins/ecommerce/payment', 'address', '?????a ch???', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2547, 1, 'vi', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Kh??ng th??? l???y m?? Stripe ????? thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2548, 1, 'vi', 'plugins/ecommerce/payment', 'new_payment', 'Thanh to??n cho ????n h??ng :id', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2549, 1, 'vi', 'plugins/ecommerce/payment', 'payment_id', 'M?? thanh to??n', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2550, 1, 'vi', 'plugins/ecommerce/prices', 'name', 'Price', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2551, 1, 'vi', 'plugins/ecommerce/prices', 'create', 'New price', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2552, 1, 'vi', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2553, 1, 'vi', 'plugins/ecommerce/prices', 'list', 'List price', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2554, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2555, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2556, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2557, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2558, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2559, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2560, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2561, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2562, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2563, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2564, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2565, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2566, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2020-10-09 03:54:30', '2020-10-09 03:54:30'),
(2567, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2568, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2569, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2570, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2571, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2572, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2573, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2574, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2575, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2576, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2577, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2578, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2579, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2580, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2581, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2582, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2583, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2584, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2585, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2586, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2587, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2588, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2589, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2590, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2591, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2592, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2593, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2594, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2595, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2596, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2597, 1, 'vi', 'plugins/ecommerce/product-attributes', 'name', 'Thu???c t??nh s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2598, 1, 'vi', 'plugins/ecommerce/product-attributes', 'create', 'T???o', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2599, 1, 'vi', 'plugins/ecommerce/product-attributes', 'edit', 'S???a', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2600, 1, 'vi', 'plugins/ecommerce/product-attributes', 'intro.title', 'Qu???n l?? danh s??ch thu???c t??nh s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2601, 1, 'vi', 'plugins/ecommerce/product-attributes', 'intro.description', 'C??c thu???c t??nh c???a s???n ph???m nh?? m??u s???c, k??ch th?????c ...', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2602, 1, 'vi', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'T???o thu???c t??nh s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2603, 1, 'vi', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2604, 1, 'vi', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2605, 1, 'vi', 'plugins/ecommerce/product-categories', 'name', 'Danh m???c s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2606, 1, 'vi', 'plugins/ecommerce/product-categories', 'none', 'Kh??ng c??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2607, 1, 'vi', 'plugins/ecommerce/product-categories', 'menu', 'Danh m???c s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2608, 1, 'vi', 'plugins/ecommerce/product-categories', 'intro.title', 'Qu???n l?? danh s??ch danh m???c s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2609, 1, 'vi', 'plugins/ecommerce/product-categories', 'intro.description', 'Danh m???c s???n ph???m nh?? qu???n ??o, gi??y d??p, linh ki???n ??i???n t??? ...', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2610, 1, 'vi', 'plugins/ecommerce/product-categories', 'intro.button_text', 'T???o danh m???c s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2611, 1, 'vi', 'plugins/ecommerce/product-collections', 'name', 'Nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2612, 1, 'vi', 'plugins/ecommerce/product-collections', 'create', 'Th??m nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2613, 1, 'vi', 'plugins/ecommerce/product-collections', 'edit', 'S???a nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2614, 1, 'vi', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2615, 1, 'vi', 'plugins/ecommerce/product-collections', 'intro.title', 'Qu???n l?? nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2616, 1, 'vi', 'plugins/ecommerce/product-collections', 'intro.description', 'Nh??m s???n ph???m gi??p qu???n l?? s???n ph???m v?? kh??ch h??ng t??m ki???m s???n ph???m m???t c??ch d??? d??ng.', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2617, 1, 'vi', 'plugins/ecommerce/product-collections', 'intro.button_text', 'T???o nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2618, 1, 'vi', 'plugins/ecommerce/products', 'name', 'S???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2619, 1, 'vi', 'plugins/ecommerce/products', 'create', 'Th??m s???n ph???m m???i', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2620, 1, 'vi', 'plugins/ecommerce/products', 'edit', 'S???a s???n ph???m - :name', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2621, 1, 'vi', 'plugins/ecommerce/products', 'form.name', 'T??n s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2622, 1, 'vi', 'plugins/ecommerce/products', 'form.name_placeholder', 'T??n s???n ph???m (T???i ??a 120 ch??? c??i)', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2623, 1, 'vi', 'plugins/ecommerce/products', 'form.description', 'M?? t??? ng???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2624, 1, 'vi', 'plugins/ecommerce/products', 'form.description_placeholder', 'M?? t??? ng???n g???n cho s???n ph???m (T???i ??a 400 ch??? c??i)', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2625, 1, 'vi', 'plugins/ecommerce/products', 'form.categories', 'Danh m???c', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2626, 1, 'vi', 'plugins/ecommerce/products', 'form.content', 'Chi ti???t s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2627, 1, 'vi', 'plugins/ecommerce/products', 'form.price', 'Gi?? c?? b???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2628, 1, 'vi', 'plugins/ecommerce/products', 'form.price_sale', 'Gi?? gi???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2629, 1, 'vi', 'plugins/ecommerce/products', 'form.quantity', 'S??? l?????ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2630, 1, 'vi', 'plugins/ecommerce/products', 'form.brand', 'Th????ng hi???u', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2631, 1, 'vi', 'plugins/ecommerce/products', 'form.width', 'R???ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2632, 1, 'vi', 'plugins/ecommerce/products', 'form.height', 'Cao', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2633, 1, 'vi', 'plugins/ecommerce/products', 'form.weight', 'C??n n???ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2634, 1, 'vi', 'plugins/ecommerce/products', 'form.image', 'H??nh ???nh', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2635, 1, 'vi', 'plugins/ecommerce/products', 'form.label', 'Nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2636, 1, 'vi', 'plugins/ecommerce/products', 'form.product_type.title', 'Lo???i s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2637, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.title', 'T??nh tr???ng kho', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2638, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.in_stock', 'C??n h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2639, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.out_stock', 'H???t h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2640, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Cho ph??p ?????t h??ng khi h???t', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2641, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.title', 'Qu???n l?? kho', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2642, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'Kh??ng qu???n l?? kho', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2643, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'Qu???n l?? kho', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2644, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'S??? l?????ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2645, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.title', 'Giao h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2646, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.length', 'Chi???u d??i', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2647, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.wide', 'Chi???u r???ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2648, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.height', 'Chi???u cao', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2649, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.weight', 'C??n n???ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2650, 1, 'vi', 'plugins/ecommerce/products', 'form.date.start', 'Ng??y b???t ?????u', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2651, 1, 'vi', 'plugins/ecommerce/products', 'form.date.end', 'Ng??y k???t th??c', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2652, 1, 'vi', 'plugins/ecommerce/products', 'form.tags', 'Nh??n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2653, 1, 'vi', 'plugins/ecommerce/products', 'form.tax', 'Thu???', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2654, 1, 'vi', 'plugins/ecommerce/products', 'price', 'Gi?? c?? b???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2655, 1, 'vi', 'plugins/ecommerce/products', 'price_sale', 'Gi?? gi???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2656, 1, 'vi', 'plugins/ecommerce/products', 'quantity', 'S??? l?????ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2657, 1, 'vi', 'plugins/ecommerce/products', 'type', 'Lo???i s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2658, 1, 'vi', 'plugins/ecommerce/products', 'image', '???nh', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2659, 1, 'vi', 'plugins/ecommerce/products', 'sku', 'M?? s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2660, 1, 'vi', 'plugins/ecommerce/products', 'brand', 'Th????ng hi???u', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2661, 1, 'vi', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2662, 1, 'vi', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2663, 1, 'vi', 'plugins/ecommerce/products', 'product_collections', 'Nh??m s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2664, 1, 'vi', 'plugins/ecommerce/products', 'products', 'S???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2665, 1, 'vi', 'plugins/ecommerce/products', 'menu', 'S???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2666, 1, 'vi', 'plugins/ecommerce/products', 'control.button_add_image', 'Th??m h??nh ???nh', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2667, 1, 'vi', 'plugins/ecommerce/products', 'overview', 'T???ng quan', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2668, 1, 'vi', 'plugins/ecommerce/products', 'attributes', 'Thu???c t??nh', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2669, 1, 'vi', 'plugins/ecommerce/products', 'product_has_variations', 'S???n ph???m c?? nhi???u phi??n b???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2670, 1, 'vi', 'plugins/ecommerce/products', 'manage_products', 'Qu???n l?? danh s??ch s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2671, 1, 'vi', 'plugins/ecommerce/products', 'add_new_product', 'T???o s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2672, 1, 'vi', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'B???t ?????u b??n h??ng b???ng vi???c th??m s???n ph???m.', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2673, 1, 'vi', 'plugins/ecommerce/reports', 'name', 'B??o c??o', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2674, 1, 'vi', 'plugins/ecommerce/reports', 'widget.order.title', '????n h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2675, 1, 'vi', 'plugins/ecommerce/reports', 'count.revenue', 'Doanh thu h??m nay', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2676, 1, 'vi', 'plugins/ecommerce/reports', 'count.orders', '????n h??ng h??m nay', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2677, 1, 'vi', 'plugins/ecommerce/reports', 'count.products', 'S???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2678, 1, 'vi', 'plugins/ecommerce/reports', 'count.customers', 'Kh??ch h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2679, 1, 'vi', 'plugins/ecommerce/reports', 'product_name', 'T??n s???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2680, 1, 'vi', 'plugins/ecommerce/reports', 'quantity', 'S??? l?????ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2681, 1, 'vi', 'plugins/ecommerce/reports', 'revenue_statistics', 'Th???ng k?? doanh thu', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2682, 1, 'vi', 'plugins/ecommerce/reports', 'top_selling_products', 'S???n ph???m b??n ch???y trong th??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2683, 1, 'vi', 'plugins/ecommerce/review', 'name', '????nh gi??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2684, 1, 'vi', 'plugins/ecommerce/review', 'list_review', 'Kh??ch h??ng ????nh gi??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2685, 1, 'vi', 'plugins/ecommerce/review', 'add_review', 'Th??m ????nh gi??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2686, 1, 'vi', 'plugins/ecommerce/review', 'delete_review', 'X??a ????nh gi??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2687, 1, 'vi', 'plugins/ecommerce/review', 'create_review', 'T???o ????nh gi??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2688, 1, 'vi', 'plugins/ecommerce/review', 'please_select_rating', 'Ch???n ????nh gi??', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2689, 1, 'vi', 'plugins/ecommerce/review', 'comment', 'B??nh lu???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2690, 1, 'vi', 'plugins/ecommerce/review', 'require_login', 'H??y :login ????? ????nh gi?? s???n ph???m!', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2691, 1, 'vi', 'plugins/ecommerce/review', 'you_reviewed', 'B???n ???? ????nh gi?? s???n ph???m n??y r???i!', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2692, 1, 'vi', 'plugins/ecommerce/review', 'add_success', '????nh gi?? s???n ph???m th??nh c??ng!', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2693, 1, 'vi', 'plugins/ecommerce/review', 'delete_success', 'X??a ????nh g??a th??nh c??ng!', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2694, 1, 'vi', 'plugins/ecommerce/review', 'approve', 'Ch???p thu???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2695, 1, 'vi', 'plugins/ecommerce/review', 'approved', '???? ch???p thu???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2696, 1, 'vi', 'plugins/ecommerce/review', 'disapprove', 'Kh??ng ch???p thu???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2697, 1, 'vi', 'plugins/ecommerce/review', 'disapproved', '???? kh??ng ch???p thu???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2698, 1, 'vi', 'plugins/ecommerce/review', 'product', 'S???n ph???m', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2699, 1, 'vi', 'plugins/ecommerce/review', 'user', 'Ng?????i d??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2700, 1, 'vi', 'plugins/ecommerce/review', 'star', 'Sao', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2701, 1, 'vi', 'plugins/ecommerce/review', 'status', 'Tr???ng th??i', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2702, 1, 'vi', 'plugins/ecommerce/review', 'intro.title', 'Qu???n l?? danh s??ch nh???n x??t c???a kh??ch h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2703, 1, 'vi', 'plugins/ecommerce/review', 'intro.description', 'L??u tr??? c??c nh???n x??t, ????nh gi?? c???a kh??ch h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2704, 1, 'vi', 'plugins/ecommerce/shipping', 'name', 'Ph?? v???n chuy???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2705, 1, 'vi', 'plugins/ecommerce/shipping', 'shipping', 'V???n chuy???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2706, 1, 'vi', 'plugins/ecommerce/shipping', 'title', 'Title', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2707, 1, 'vi', 'plugins/ecommerce/shipping', 'country', 'Qu???c gia', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2708, 1, 'vi', 'plugins/ecommerce/shipping', 'state', 'State', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2709, 1, 'vi', 'plugins/ecommerce/shipping', 'city', 'City', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2710, 1, 'vi', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2711, 1, 'vi', 'plugins/ecommerce/shipping', 'currency', 'Currency', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2712, 1, 'vi', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2713, 1, 'vi', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2714, 1, 'vi', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2020-10-09 03:54:31', '2020-10-09 03:54:31');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2715, 1, 'vi', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2716, 1, 'vi', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2717, 1, 'vi', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping #', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2718, 1, 'vi', 'plugins/ecommerce/shipping', 'status', 'Status', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2719, 1, 'vi', 'plugins/ecommerce/shipping', 'shipping_methods', 'Ph????ng th???c v???n chuy???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2720, 1, 'vi', 'plugins/ecommerce/shipping', 'create_shipping_method', 'T???o ph????ng th???c v???n chuy???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2721, 1, 'vi', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'S???a ph????ng th???c v???n chuy???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2722, 1, 'vi', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Th??m khu v???c v???n chuy???n', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2723, 1, 'vi', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2724, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2725, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2726, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2727, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2728, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2729, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2730, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2731, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2732, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2733, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2734, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2735, 1, 'vi', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2736, 1, 'vi', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2737, 1, 'vi', 'plugins/ecommerce/shipping', 'cross_checking_statuses.pending', 'Pending', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2738, 1, 'vi', 'plugins/ecommerce/shipping', 'cross_checking_statuses.completed', 'Completed', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2739, 1, 'vi', 'plugins/ecommerce/store-locator', 'name', '?????a ch??? c???a h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2740, 1, 'vi', 'plugins/ecommerce/store-locator', 'description', '?????a ch??? n??y s??? xu???t hi???n tr??n ho?? ????n c???a b???n v?? s??? ???????c s??? d???ng ????? t??nh to??n m???c gi?? v???n chuy???n c???a b???n.', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2741, 1, 'vi', 'plugins/ecommerce/store-locator', 'shop_name', 'T??n c???a h??ng', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2742, 1, 'vi', 'plugins/ecommerce/store-locator', 'phone', '??i???n tho???i', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2743, 1, 'vi', 'plugins/ecommerce/store-locator', 'address', '?????a ch???', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2744, 1, 'vi', 'plugins/ecommerce/tax', 'name', 'Thu???', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2745, 1, 'vi', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2746, 1, 'vi', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2747, 1, 'vi', 'plugins/ecommerce/tax', 'title', 'Title', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2748, 1, 'vi', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2749, 1, 'vi', 'plugins/ecommerce/tax', 'priority', 'Priority', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2750, 1, 'vi', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2751, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2752, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2753, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2754, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2755, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2756, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2757, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2758, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2759, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2760, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2761, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2762, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2763, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2764, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2765, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2766, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2767, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2768, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2769, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2770, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2771, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2772, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2773, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Payment via PayPal', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2774, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2775, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2776, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2777, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2778, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2779, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2780, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2781, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2782, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2783, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2784, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2785, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2786, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2787, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2788, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2789, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2790, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2020-10-09 03:54:31', '2020-10-09 03:54:31'),
(2791, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2792, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2793, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2794, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2795, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2796, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2797, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2798, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2799, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2800, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2801, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2802, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2803, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2804, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2805, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2806, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2807, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2808, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2809, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2810, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2811, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2812, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2813, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2814, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2815, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2816, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2817, 1, 'en', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2818, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2819, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2820, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2821, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2822, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2823, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2824, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2825, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2826, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2827, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2828, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2829, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2830, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2831, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2832, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2833, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2834, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2835, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2836, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2837, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2838, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2839, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2840, 1, 'en', 'plugins/payment/payment', 'callback_url', 'Callback URL', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2841, 1, 'en', 'plugins/payment/payment', 'return_url', 'Return URL', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2842, 1, 'vi', 'plugins/payment/payment', 'payments', 'Thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2843, 1, 'vi', 'plugins/payment/payment', 'checkout_success', 'Thanh to??n th??nh c??ng!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2844, 1, 'vi', 'plugins/payment/payment', 'view_payment', 'Xem thanh to??n #', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2845, 1, 'vi', 'plugins/payment/payment', 'charge_id', 'M?? thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2846, 1, 'vi', 'plugins/payment/payment', 'amount', 'S??? ti???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2847, 1, 'vi', 'plugins/payment/payment', 'currency', 'Lo???i ti???n t???', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2848, 1, 'vi', 'plugins/payment/payment', 'user', 'Ng?????i d??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2849, 1, 'vi', 'plugins/payment/payment', 'stripe', 'Stripe', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2850, 1, 'vi', 'plugins/payment/payment', 'paypal', 'PayPal', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2851, 1, 'vi', 'plugins/payment/payment', 'action', 'H??nh ?????ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2852, 1, 'vi', 'plugins/payment/payment', 'payment_via_card', 'Thanh to??n qua th???', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2853, 1, 'vi', 'plugins/payment/payment', 'card_number', 'S??? th???', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2854, 1, 'vi', 'plugins/payment/payment', 'full_name', 'H??? t??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2855, 1, 'vi', 'plugins/payment/payment', 'payment_via_paypal', 'Thanh to??n qua PayPal', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2856, 1, 'vi', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2857, 1, 'vi', 'plugins/payment/payment', 'cvc', 'CVC', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2858, 1, 'vi', 'plugins/payment/payment', 'details', 'Chi ti???t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2859, 1, 'vi', 'plugins/payment/payment', 'payer_name', 'T??n ng?????i mua', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2860, 1, 'vi', 'plugins/payment/payment', 'email', 'Email', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2861, 1, 'vi', 'plugins/payment/payment', 'phone', '??i???n tho???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2862, 1, 'vi', 'plugins/payment/payment', 'country', 'Qu???c gia', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2863, 1, 'vi', 'plugins/payment/payment', 'shipping_address', '?????a ch??? giao h??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2864, 1, 'vi', 'plugins/payment/payment', 'payment_details', 'Chi ti???t thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2865, 1, 'vi', 'plugins/payment/payment', 'card', 'Th???', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2866, 1, 'vi', 'plugins/payment/payment', 'address', '?????a ch???', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2867, 1, 'vi', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Kh??ng th??? l???y m?? Stripe ????? thanh to??n.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2868, 1, 'vi', 'plugins/payment/payment', 'payment_id', 'M?? thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2869, 1, 'vi', 'plugins/payment/payment', 'payment_methods', 'Ph????ng th???c thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2870, 1, 'vi', 'plugins/payment/payment', 'payment_methods_description', 'C??i ?????t c??c ph????ng th???c thanh to??n cho website', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2871, 1, 'vi', 'plugins/payment/payment', 'paypal_description', 'Kh??ch h??ng c?? th??? mua h??ng v?? thanh to??n tr???c ti???p th??ng qua c???ng thanh to??n PayPal', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2872, 1, 'vi', 'plugins/payment/payment', 'use', 'D??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2873, 1, 'vi', 'plugins/payment/payment', 'stripe_description', 'Kh??ch h??ng c?? th??? mua h??ng v?? thanh to??n b???ng Visa, Credit card th??ng qua c???ng thanh to??n Stripe', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2874, 1, 'vi', 'plugins/payment/payment', 'edit', 'Ch???nh s???a', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2875, 1, 'vi', 'plugins/payment/payment', 'settings', 'C??i ?????t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2876, 1, 'vi', 'plugins/payment/payment', 'activate', 'K??ch ho???t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2877, 1, 'vi', 'plugins/payment/payment', 'deactivate', 'Hu??? k??ch ho???t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2878, 1, 'vi', 'plugins/payment/payment', 'update', 'C???p nh???t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2879, 1, 'vi', 'plugins/payment/payment', 'configuration_instruction', 'H?????ng d???n c???u h??nh :name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2880, 1, 'vi', 'plugins/payment/payment', 'configuration_requirement', '????? s??? d???ng :name b???n c???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2881, 1, 'vi', 'plugins/payment/payment', 'service_registration', '????ng k?? d???ch v??? v???i :name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2882, 1, 'vi', 'plugins/payment/payment', 'after_service_registration_msg', 'Sau khi ho??n t???t c??c b?????c ????ng k?? t???i :name, b???n s??? c?? c??c th??ng s??? Client ID, Client Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2883, 1, 'vi', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Nh???p c??c th??ng s??? Client ID, Secret v??o ?? b??n ph???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2884, 1, 'vi', 'plugins/payment/payment', 'method_name', 'T??n ph????ng th???c', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2885, 1, 'vi', 'plugins/payment/payment', 'please_provide_information', 'Xin vui l??ng cung c???p th??ng tin', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2886, 1, 'vi', 'plugins/payment/payment', 'client_id', 'Client ID', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2887, 1, 'vi', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2888, 1, 'vi', 'plugins/payment/payment', 'secret', 'Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2889, 1, 'vi', 'plugins/payment/payment', 'pay_online_via', 'Thanh to??n online qua :name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2890, 1, 'vi', 'plugins/payment/payment', 'sandbox_mode', 'Ch??? ????? th??? nghi???m', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2891, 1, 'vi', 'plugins/payment/payment', 'deactivate_payment_method', 'Hu??? k??ch ho???t ph????ng th???c', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2892, 1, 'vi', 'plugins/payment/payment', 'deactivate_payment_method_description', 'B???n c?? ch???c ch???n mu???n hu??? ph????ng th???c th??nh to??n n??y?', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2893, 1, 'vi', 'plugins/payment/payment', 'agree', '?????ng ??', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2894, 1, 'vi', 'plugins/payment/payment', 'name', 'Thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2895, 1, 'vi', 'plugins/payment/payment', 'create', 'Th??m thanh to??n m???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2896, 1, 'vi', 'plugins/payment/payment', 'go_back', 'Tr??? l???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2897, 1, 'vi', 'plugins/payment/payment', 'information', 'Th??ng tin', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2898, 1, 'vi', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2899, 1, 'vi', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2900, 1, 'vi', 'plugins/payment/payment', 'methods.cod', 'Thanh to??n khi giao h??ng (COD)', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2901, 1, 'vi', 'plugins/payment/payment', 'methods.bank_transfer', 'Chuy???n kho???n qua ng??n h??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2902, 1, 'vi', 'plugins/payment/payment', 'statuses.pending', 'Ch??a ho??n t???t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2903, 1, 'vi', 'plugins/payment/payment', 'statuses.completed', '???? ho??n th??nh', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2904, 1, 'vi', 'plugins/payment/payment', 'statuses.refunding', '??ang ho??n ti???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2905, 1, 'vi', 'plugins/payment/payment', 'statuses.refunded', '???? ho??n ti???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2906, 1, 'vi', 'plugins/payment/payment', 'statuses.fraud', 'Gian l???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2907, 1, 'vi', 'plugins/payment/payment', 'statuses.failed', 'Th???t b???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2908, 1, 'vi', 'plugins/payment/payment', 'payment_methods_instruction', 'H?????ng d???n kh??ch h??ng thanh to??n tr???c ti???p. C?? th??? ch???n thanh to??n khi giao h??ng ho???c chuy???n kho???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2909, 1, 'vi', 'plugins/payment/payment', 'payment_method_description', 'H?????ng d???n thanh to??n ??? (Hi???n th??? ??? trang th??ng b??o mua h??ng th??nh c??ng v?? trang thanh to??n)', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2910, 1, 'vi', 'plugins/payment/payment', 'payment_via_cod', 'Thanh to??n khi nh???n h??ng (COD)', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2911, 1, 'vi', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Chuy???n kho???n qua ng??n h??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2912, 1, 'vi', 'plugins/payment/payment', 'payment_pending', 'Th???c hi???n th??nh c??ng. Thanh to??n c???a b???n ??ang ???????c x??? l?? v?? s??? ???????c x??c nh???n b???i nh??n vi??n.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2913, 1, 'vi', 'plugins/payment/payment', 'created_at', 'Ng??y t???o', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2914, 1, 'vi', 'plugins/payment/payment', 'payment_channel', 'Ph????ng th???c thanh to??n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2915, 1, 'vi', 'plugins/payment/payment', 'total', 'T???ng c???ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2916, 1, 'vi', 'plugins/payment/payment', 'status', 'Tr???ng th??i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2917, 1, 'vi', 'plugins/payment/payment', 'default_payment_method', 'Ph????ng th???c thanh to??n m???c ?????nh', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2918, 1, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2919, 1, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2920, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2921, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2922, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2923, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2924, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2925, 1, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2926, 1, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2927, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2928, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2929, 1, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2930, 1, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2931, 1, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2932, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2933, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2934, 1, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2935, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2936, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2937, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2938, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2939, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2940, 1, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2941, 1, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2942, 1, 'en', 'plugins/testimonial/testimonial', 'name', 'Testimonials', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2943, 1, 'en', 'plugins/testimonial/testimonial', 'create', 'New testimonial', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2944, 1, 'en', 'plugins/testimonial/testimonial', 'edit', 'Edit testimonial', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2945, 1, 'en', 'plugins/testimonial/testimonial', 'company', 'Position/Company', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2946, 1, 'vi', 'plugins/testimonial/testimonial', 'name', 'Nh???n x??t c???a kh??ch h??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2947, 1, 'vi', 'plugins/testimonial/testimonial', 'create', 'Th??m nh???n x??t m???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2948, 1, 'vi', 'plugins/testimonial/testimonial', 'edit', 'S???a nh???n x??t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2949, 1, 'vi', 'plugins/testimonial/testimonial', 'company', 'Ch???c v???/C??ng ty', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2950, 1, 'en', 'plugins/testimonials/forms', 'name', 'Customer name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2951, 1, 'en', 'plugins/testimonials/forms', 'company', 'Company/Working place', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2952, 1, 'en', 'plugins/testimonials/forms', 'avatar', 'Avatar', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2953, 1, 'en', 'plugins/testimonials/forms', 'title', 'Title', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2954, 1, 'en', 'plugins/testimonials/forms', 'content', 'Content', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2955, 1, 'en', 'plugins/testimonials/forms', 'publish', 'Publish', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2956, 1, 'en', 'plugins/testimonials/forms', 'unpublish', 'Unpublish', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2957, 1, 'en', 'plugins/testimonials/testimonials', 'name', 'Testimonials', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2958, 1, 'en', 'plugins/testimonials/testimonials', 'create', 'New testimonials', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2959, 1, 'en', 'plugins/testimonials/testimonials', 'edit', 'Edit testimonials', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2960, 1, 'vi', 'plugins/testimonials/forms', 'name', 'T??n kh??ch h??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2961, 1, 'vi', 'plugins/testimonials/forms', 'company', 'C??ng ty/N??i l??m vi???c', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2962, 1, 'vi', 'plugins/testimonials/forms', 'avatar', 'Avatar', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2963, 1, 'vi', 'plugins/testimonials/forms', 'title', 'Ti??u ?????', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2964, 1, 'vi', 'plugins/testimonials/forms', 'content', 'N???i dung', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2965, 1, 'vi', 'plugins/testimonials/forms', 'publish', 'Xu???t b???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2966, 1, 'vi', 'plugins/testimonials/forms', 'unpublish', 'Kh??ng xu???t b???n', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2967, 1, 'vi', 'plugins/testimonials/testimonials', 'name', 'Nh???n x??t kh??ch h??ng', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2968, 1, 'vi', 'plugins/testimonials/testimonials', 'create', 'T???o m???i', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2969, 1, 'vi', 'plugins/testimonials/testimonials', 'edit', 'S???a nh???n x??t', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2970, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2971, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2972, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2973, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2974, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2975, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2976, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2977, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2978, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2979, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2980, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2981, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2982, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2983, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2984, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2985, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2986, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2987, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Admin translations', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2988, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2989, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2990, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2991, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2992, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2993, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2994, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2995, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2996, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2997, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2998, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(2999, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3000, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3001, 1, 'vi', 'auth', 'failed', 'Th??ng tin t??i kho???n kh??ng t??m th???y trong h??? th???ng.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3002, 1, 'vi', 'auth', 'throttle', 'V?????t qu?? s??? l???n ????ng nh???p cho ph??p. Vui l??ng th??? l???i sau :seconds gi??y.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3003, 1, 'vi', 'pagination', 'previous', '&laquo; Tr?????c', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3004, 1, 'vi', 'pagination', 'next', 'Sau &raquo;', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3005, 1, 'vi', 'passwords', 'password', 'M????t kh????u pha??i i??t nh????t 6 ki?? t???? va?? tru??ng kh????p v????i xa??c nh????n m????t kh????u.', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3006, 1, 'vi', 'passwords', 'reset', 'M????t kh????u cu??a ba??n ??a?? ????????c kh??i phu??c', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3007, 1, 'vi', 'passwords', 'sent', 'H???? th????ng ??a?? g????i m????t email cho ba??n ch????a li??n k????t kh??i phu??c m????t kh????u!', '2020-10-09 03:54:32', '2020-10-09 03:54:32'),
(3008, 1, 'vi', 'passwords', 'token', 'Ma?? kh??i phu??c m????t kh????u kh??ng h????p l????.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3009, 1, 'vi', 'passwords', 'user', 'Kh??ng th???? ti??m th????y ng??????i du??ng v????i ??i??a chi?? email na??y.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3010, 1, 'vi', 'validation', 'accepted', 'Tr?????ng :attribute ph???i ???????c ch???p nh???n.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3011, 1, 'vi', 'validation', 'active_url', 'Tr?????ng :attribute kh??ng ph???i l?? m???t URL h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3012, 1, 'vi', 'validation', 'after', 'Tr?????ng :attribute ph???i l?? m???t ng??y sau ng??y :date.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3013, 1, 'vi', 'validation', 'alpha', 'Tr?????ng :attribute ch??? c?? th??? ch???a c??c ch??? c??i.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3014, 1, 'vi', 'validation', 'alpha_dash', 'Tr?????ng :attribute ch??? c?? th??? ch???a ch??? c??i, s??? v?? d???u g???ch ngang.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3015, 1, 'vi', 'validation', 'alpha_num', 'Tr?????ng :attribute ch??? c?? th??? ch???a ch??? c??i v?? s???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3016, 1, 'vi', 'validation', 'array', 'Ki???u d??? li???u c???a tr?????ng :attribute ph???i l?? d???ng m???ng.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3017, 1, 'vi', 'validation', 'before', 'Tr?????ng :attribute ph???i l?? m???t ng??y tr?????c ng??y :date.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3018, 1, 'vi', 'validation', 'between.numeric', 'Tr?????ng :attribute ph???i n???m trong kho???ng :min - :max.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3019, 1, 'vi', 'validation', 'between.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i t??? :min - :max kB.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3020, 1, 'vi', 'validation', 'between.string', 'Tr?????ng :attribute ph???i t??? :min - :max k?? t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3021, 1, 'vi', 'validation', 'between.array', 'Tr?????ng :attribute ph???i c?? t??? :min - :max ph???n t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3022, 1, 'vi', 'validation', 'boolean', 'Tr?????ng :attribute ph???i l?? true ho???c false.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3023, 1, 'vi', 'validation', 'confirmed', 'Gi?? tr??? x??c nh???n trong tr?????ng :attribute kh??ng kh???p.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3024, 1, 'vi', 'validation', 'date', 'Tr?????ng :attribute kh??ng ph???i l?? ?????nh d???ng c???a ng??y-th??ng.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3025, 1, 'vi', 'validation', 'date_format', 'Tr?????ng :attribute kh??ng gi???ng v???i ?????nh d???ng :format.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3026, 1, 'vi', 'validation', 'different', 'Tr?????ng :attribute v?? :other ph???i kh??c nhau.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3027, 1, 'vi', 'validation', 'digits', '????? d??i c???a tr?????ng :attribute ph???i g???m :digits ch??? s???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3028, 1, 'vi', 'validation', 'digits_between', '????? d??i c???a tr?????ng :attribute ph???i n???m trong kho???ng :min and :max ch??? s???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3029, 1, 'vi', 'validation', 'email', 'Tr?????ng :attribute ph???i l?? m???t ?????a ch??? email h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3030, 1, 'vi', 'validation', 'exists', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3031, 1, 'vi', 'validation', 'file', 'Tr??????ng :attribute pha??i la?? m????t t????p tin.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3032, 1, 'vi', 'validation', 'image', 'C??c t???p tin trong tr?????ng :attribute ph???i l?? ?????nh d???ng h??nh ???nh.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3033, 1, 'vi', 'validation', 'in', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3034, 1, 'vi', 'validation', 'integer', 'Tr?????ng :attribute ph???i l?? m???t s??? nguy??n.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3035, 1, 'vi', 'validation', 'ip', 'Tr?????ng :attribute ph???i l?? m???t ?????a ch???a IP.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3036, 1, 'vi', 'validation', 'max.numeric', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3037, 1, 'vi', 'validation', 'max.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute kh??ng ???????c l???n h??n :max kB.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3038, 1, 'vi', 'validation', 'max.string', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max k?? t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3039, 1, 'vi', 'validation', 'max.array', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max ph???n t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3040, 1, 'vi', 'validation', 'mimes', 'Tr?????ng :attribute ph???i l?? m???t t???p tin c?? ?????nh d???ng: :values.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3041, 1, 'vi', 'validation', 'min.numeric', 'Tr?????ng :attribute ph???i t???i thi???u l?? :min.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3042, 1, 'vi', 'validation', 'min.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i t???i thi???u :min kB.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3043, 1, 'vi', 'validation', 'min.string', 'Tr?????ng :attribute ph???i c?? t???i thi???u :min k?? t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3044, 1, 'vi', 'validation', 'min.array', 'Tr?????ng :attribute ph???i c?? t???i thi???u :min ph???n t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3045, 1, 'vi', 'validation', 'not_in', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3046, 1, 'vi', 'validation', 'numeric', 'Tr?????ng :attribute ph???i l?? m???t s???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3047, 1, 'vi', 'validation', 'regex', '?????nh d???ng tr?????ng :attribute kh??ng h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3048, 1, 'vi', 'validation', 'required', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3049, 1, 'vi', 'validation', 'required_if', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :other l?? :value.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3050, 1, 'vi', 'validation', 'required_with', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :values c?? gi?? tr???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3051, 1, 'vi', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3052, 1, 'vi', 'validation', 'required_without', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :values kh??ng c?? gi?? tr???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3053, 1, 'vi', 'validation', 'required_without_all', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi t???t c??? :values kh??ng c?? gi?? tr???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3054, 1, 'vi', 'validation', 'same', 'Tr?????ng :attribute v?? :other ph???i gi???ng nhau.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3055, 1, 'vi', 'validation', 'size.numeric', 'Tr?????ng :attribute ph???i b???ng :size.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3056, 1, 'vi', 'validation', 'size.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i b???ng :size kB.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3057, 1, 'vi', 'validation', 'size.string', 'Tr?????ng :attribute ph???i ch???a :size k?? t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3058, 1, 'vi', 'validation', 'size.array', 'Tr?????ng :attribute ph???i ch???a :size ph???n t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3059, 1, 'vi', 'validation', 'timezone', 'Tr?????ng :attribute ph???i l?? m???t m??i gi??? h???p l???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3060, 1, 'vi', 'validation', 'unique', 'Tr?????ng :attribute ???? c?? trong CSDL.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3061, 1, 'vi', 'validation', 'url', 'Tr?????ng :attribute kh??ng gi???ng v???i ?????nh d???ng m???t URL.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3062, 1, 'vi', 'validation', 'uploaded', 'Kh??ng th??? t???i l??n, h??y th??? l???i.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3063, 1, 'vi', 'validation', 'custom.email.email', '?????a ch??? email kh??ng h???p l???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3064, 1, 'vi', 'validation', 'custom.email.required', 'Email kh??ng ???????c ????? tr???ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3065, 1, 'vi', 'validation', 'custom.email.unique', 'Email ???? ???????c s??? d???ng, vui l??ng ch???n email kh??c!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3066, 1, 'vi', 'validation', 'custom.password.min', 'M???t kh???u ph???i ??t nh???t :min k?? t???.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3067, 1, 'vi', 'validation', 'custom.password.required', 'M???t kh???u kh??ng ???????c ????? tr???ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3068, 1, 'vi', 'validation', 'custom.repassword.same', 'M???t kh???u v?? x??c nh???n m???t kh???u kh??ng tr??ng kh???p', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3069, 1, 'vi', 'validation', 'custom.username.min', 'T??n ph???i ??t nh???t 6 k?? t???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3070, 1, 'vi', 'validation', 'custom.username.required', 'T??n ????ng nh???p kh??ng ???????c ????? tr???ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3071, 1, 'vi', 'validation', 'custom.username.unique', 'T??n n??y ???? ???????c s??? d???ng, vui l??ng ch???n t??n kh??c!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3072, 1, 'vi', 'validation', 'attributes', 'Thu???c t??nh', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3073, 1, 'vi', 'validation', 'after_or_equal', 'Thu???c t??nh :attribute ph???i l?? ng??y l???n h??n ho???c b???ng :date', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3074, 1, 'vi', 'validation', 'before_or_equal', 'Tr?????ng :attribute ph???i l?? ng??y tr?????c ho???c b???ng ng??y :date', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3075, 1, 'vi', '_json', 'Home', 'Trang ch???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3076, 1, 'vi', '_json', 'Page could not be found', 'Kh??ng t??m th???y trang y??u c???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3077, 1, 'vi', '_json', 'Page could not be loaded', 'Kh??ng th??? t???i trang', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3078, 1, 'vi', '_json', 'This may have occurred because of several reasons', '??i???u n??y c?? th??? x???y ra v?? m???t v??i l?? do', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3079, 1, 'vi', '_json', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\":link\">clicking here</a>.', 'H??y th??? l???i sau v??i ph??t, ho???c tr??? v??? trang ch??? b???ng c??ch nh???n <a href=\":link\">v??o ????y</a>.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3080, 1, 'vi', '_json', 'The page you requested does not exist.', 'Trang b???n y??u c???u kh??ng t???n t???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3081, 1, 'vi', '_json', 'The link you clicked is no longer.', 'Li??n k???t m?? b???n nh???n v??o kh??ng c??n ???????c s??? d???ng n???a', '2020-10-09 03:54:33', '2020-10-09 03:54:33');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3082, 1, 'vi', '_json', 'The page may have moved to a new location.', 'Trang n??y ???? ???????c thay ?????i sang ???????ng d???n kh??c', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3083, 1, 'vi', '_json', 'An error may have occurred.', '???? c?? l???i h??? th???ng x???y ra', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3084, 1, 'vi', '_json', 'You are not authorized to view the requested resource.', 'B???n kh??ng c?? quy???n truy c???p t???i t??i nguy??n n??y', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3085, 1, 'vi', '_json', 'Service Unavailable', 'Service Unavailable', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3086, 1, 'vi', '_json', 'Sorry, we are doing some maintenance. Please check back soon.', 'Xin l???i, ch??ng t??i ??ang th???c hi???n b???o tr??. Vui l??ng quay l???i sau.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3087, 1, 'vi', '_json', 'Oh no', 'Oh no', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3088, 1, 'vi', '_json', 'Subject', 'Ti??u ?????', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3089, 1, 'vi', '_json', 'Message', 'N???i dung', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3090, 1, 'vi', '_json', 'Please confirm you are not robot', 'Vui l??ng x??c nh???n kh??ng ph???i l?? ng?????i m??y', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3091, 1, 'vi', '_json', 'The field with (<span style=\"color:#FF0000;\">*</span>) is required.', 'C??c m???c c?? (<span style=\"color:#FF0000;\">*</span>) l?? b???t bu???c.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3092, 1, 'vi', '_json', 'Send', 'G???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3093, 1, 'vi', '_json', 'Send message successfully!', 'G???i li??n h??? th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3094, 1, 'vi', '_json', 'Can\'t send message on this time, please try again later!', 'Kh??ng th??? g???i li??n h??? l??c n??y, vui l??ng th??? l???i sau!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3095, 1, 'vi', '_json', 'This product is out of stock or not exists!', 'S???n ph???m ???? h???t h??ng ho???c kh??ng t???n t???i!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3096, 1, 'vi', '_json', 'Product :product is out of stock!', 'S???n ph???m :product ???? h???t h??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3097, 1, 'vi', '_json', 'Maximum quantity is', 'S??? l?????ng t???i ??a l??', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3098, 1, 'vi', '_json', 'Please choose attributes to buy this product', 'Vui l??ng ch???n thu???c t??nh tr?????c khi th??m s???n ph???m v??o gi??? h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3099, 1, 'vi', '_json', 'Added product :product to cart successfully!', '???? th??m th??nh c??ng s???n ph???m :product v??o gi??? h??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3100, 1, 'vi', '_json', 'One or all products are not enough quantity so cannot update!', 'M???t ho???c t???t c??? s???n ph???m kh??ng ????? s??? l?????ng n??n kh??ng th??? c???p nh???t!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3101, 1, 'vi', '_json', 'Update cart successfully!', 'C???p nh???t gi??? h??ng th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3102, 1, 'vi', '_json', 'Cart item is not existed!', 'S???n ph???m kh??ng t???n t???i!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3103, 1, 'vi', '_json', 'Removed item from cart successfully!', 'X??a s???n ph???m kh???i gi??? h??ng th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3104, 1, 'vi', '_json', 'Empty cart successfully!', 'X??a to??n b??? s???n ph???m trong gi??? h??ng th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3105, 1, 'vi', '_json', 'No products in cart', 'Kh??ng c?? s???n ph???m n??o trong gi??? h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3106, 1, 'vi', '_json', 'There is an issue when ordering. Please try again later!', 'C?? l???i trong qu?? tr??nh ?????t h??ng, vui l??ng th??? l???i sau!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3107, 1, 'vi', '_json', 'Applied coupon \":code\" successfully!', '??p d???ng m?? gi???m gi?? \":code\" th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3108, 1, 'vi', '_json', 'Removed coupon :code successfully!', 'X??a m?? gi???m gi?? :code th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3109, 1, 'vi', '_json', 'You have reviewed this product already!', 'B???n ???? ????nh gi?? s???n ph???m n??y r???i!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3110, 1, 'vi', '_json', 'Added review successfully!', 'Th??m ????nh gi?? th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3111, 1, 'vi', '_json', 'Deleted review successfully!', 'X??a ????nh gi?? th??nh c??ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3112, 1, 'vi', '_json', 'Your cart is empty!', 'Gi??? h??ng c???a b???n ??ang tr???ng!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3113, 0, 'vi', '_json', 'Sub Total', 'T???m t??nh', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3114, 1, 'vi', '_json', 'View cart', 'Xem gi??? h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3115, 1, 'vi', '_json', 'Checkout', 'Thanh to??n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3116, 1, 'vi', '_json', 'Address', '?????a ch???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3117, 1, 'vi', '_json', 'Hotline', '???????ng d??y n??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3118, 1, 'vi', '_json', 'Subscribe & Receive 10% off your first order', 'Theo d??i v?? nh???n gi???m gi?? 10% cho ????n h??ng ?????u ti??n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3119, 1, 'vi', '_json', 'Please enter your email address', 'Vui l??ng nh???p ?????a ch??? email c???a b???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3120, 1, 'vi', '_json', 'Go', 'G???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3121, 1, 'vi', '_json', 'Connect with us', 'Li??n k???t v???i ch??ng t??i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3122, 1, 'vi', '_json', 'Search for', 'T??m ki???m', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3123, 1, 'vi', '_json', 'Shopping Cart', 'Gi??? h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3124, 1, 'vi', '_json', 'View', 'Xem', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3125, 1, 'vi', '_json', 'Add to cart', 'Th??m v??o gi??? h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3126, 1, 'vi', '_json', 'Related Posts', 'B??i vi???t li??n quan', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3127, 1, 'vi', '_json', 'Search result for', 'K???t qu??? t??m ki???m cho t??? kh??a', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3128, 1, 'vi', '_json', 'There is no data to display!', 'Kh??ng c?? d??? li???u ????? hi???n th???!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3129, 1, 'vi', '_json', 'Enjoy Shopping with us', 'Th???a s???c mua s???m v???i ch??ng t??i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3130, 1, 'vi', '_json', 'Filter Products', 'L???c s???n ph???m', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3131, 1, 'vi', '_json', 'No products!', 'Kh??ng c?? s???n ph???m!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3132, 1, 'vi', '_json', 'Image', 'H??nh ???nh', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3133, 1, 'vi', '_json', 'Name', 'T??n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3134, 1, 'vi', '_json', 'Price', 'Gi??', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3135, 1, 'vi', '_json', 'Quantity', 'S??? l?????ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3136, 1, 'vi', '_json', 'Discount promotion', 'Ch????ng tr??nh khuy???n m??i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3137, 1, 'vi', '_json', 'Total', 'T???ng c???ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3138, 1, 'vi', '_json', 'It is not include shipping fee', 'Kh??ng bao g???m ph?? v???n chuy???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3139, 1, 'vi', '_json', 'Update cart', 'C???p nh???t gi??? h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3140, 1, 'vi', '_json', 'SKU', 'M?? s???n ph???m', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3141, 1, 'vi', '_json', 'Remove from wishlist', 'X??a s???n ph???m kh???i m???c y??u th??ch', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3142, 1, 'vi', '_json', 'Add to wishlist', 'Th??m v??o m???c y??u th??ch', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3143, 1, 'vi', '_json', 'Qty', 'S??? l?????ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3144, 1, 'vi', '_json', 'Tags', 'Th???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3145, 1, 'vi', '_json', 'Share', 'Chia s???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3146, 1, 'vi', '_json', 'Description', 'M?? t???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3147, 1, 'vi', '_json', 'Reviews', '????nh gi??', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3148, 1, 'vi', '_json', 'Review', '????nh gi??', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3149, 1, 'vi', '_json', 'Please', 'Vui l??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3150, 1, 'vi', '_json', 'login', '????ng nh???p', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3151, 1, 'vi', '_json', 'to write review!', '????? vi???t ????nh gi??!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3152, 1, 'vi', '_json', 'Add your rate', 'Th??m ????nh gi?? c???a b???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3153, 1, 'vi', '_json', 'Write your review', 'Vi???t ????nh gi?? c???a b???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3154, 1, 'vi', '_json', 'Submit', 'G???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3155, 1, 'vi', '_json', 'Related Products', 'S???n ph???m li??n quan', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3156, 1, 'vi', '_json', 'Search result for \":query\"', 'K???t qu??? t??m ki???m cho t??? kh??a \":query\"', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3157, 1, 'vi', '_json', 'Select', 'L???a ch???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3158, 1, 'vi', '_json', 'Change password', '?????i m???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3159, 1, 'vi', '_json', 'Current Password', 'M???t kh???u hi???n t???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3160, 1, 'vi', '_json', 'Password confirmation', 'X??c nh???n m???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3161, 1, 'vi', '_json', 'New password', 'M???t kh???u m???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3162, 1, 'vi', '_json', 'Account information', 'Th??ng tin t??i kho???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3163, 0, 'vi', '_json', 'Full Name', 'H??? v?? t??n', '2020-10-09 03:54:33', '2020-10-09 03:54:34'),
(3164, 1, 'vi', '_json', 'Date of birth', 'Ng??y sinh', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3165, 1, 'vi', '_json', 'Email', 'Email', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3166, 1, 'vi', '_json', 'Phone', 'S??? ??i???n tho???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3167, 1, 'vi', '_json', 'Update', 'C???p nh???t', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3168, 1, 'vi', '_json', 'Please enter your email address and password', 'Vui l??ng nh???p email v?? m???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3169, 1, 'vi', '_json', 'Email Address', '?????a ch??? email', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3170, 1, 'vi', '_json', 'Password', 'M???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3171, 1, 'vi', '_json', 'Please enter your password', 'Vui l??ng nh???p m???t kh???u c???a b???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3172, 1, 'vi', '_json', 'Forgot password?', 'Qu??n m???t kh???u?', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3173, 1, 'vi', '_json', 'Don\'t have an account?', 'Ch??a c?? t??i kho???n?', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3174, 1, 'vi', '_json', 'Create one', 'T???o m???t t??i kho???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3175, 1, 'vi', '_json', 'Overview', 'T???ng quan', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3176, 1, 'vi', '_json', 'Profile', 'Th??ng tin c?? nh??n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3177, 1, 'vi', '_json', 'Orders', '????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3178, 1, 'vi', '_json', 'Address books', 'S??? ?????a ch???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3179, 1, 'vi', '_json', 'Wishlist', 'Danh s??ch ??a th??ch', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3180, 1, 'vi', '_json', 'Logout', '????ng xu???t', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3181, 1, 'vi', '_json', 'Profile Image', '???nh ?????i di???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3182, 1, 'vi', '_json', 'New image', '???nh m???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3183, 1, 'vi', '_json', 'Loading', '??ang t???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3184, 1, 'vi', '_json', 'Close', '????ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3185, 1, 'vi', '_json', 'Save', 'L??u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3186, 1, 'vi', '_json', 'N/A', 'N/A', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3187, 1, 'vi', '_json', 'Register', '????ng k??', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3188, 1, 'vi', '_json', 'Please fill in the information below', 'Vui l??ng ??i???n c??c th??ng tin b??n d?????i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3189, 1, 'vi', '_json', 'Please enter your name', 'Vui l??ng nh???p t??n c???a b???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3190, 1, 'vi', '_json', 'Please enter your password confirmation', 'Vui l??ng nh???p x??c nh???n m???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3191, 1, 'vi', '_json', 'Product', 'S???n ph???m', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3192, 1, 'vi', '_json', 'Remove', 'X??a', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3193, 1, 'vi', '_json', 'No item in wishlist!', 'Kh??ng c?? s???n ph???m n??o trong danh s??ch ??a th??ch!', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3194, 1, 'vi', '_json', 'Add a new address', 'Th??m ?????a ch??? m???i', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3195, 1, 'vi', '_json', 'Country', 'Qu???c gia', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3196, 1, 'vi', '_json', 'Select country...', 'L???a ch???n qu???c gia...', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3197, 1, 'vi', '_json', 'State', 'T???nh/Th??nh ph???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3198, 1, 'vi', '_json', 'City', 'Qu???n/Huy???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3199, 1, 'vi', '_json', 'Use this address as default.', 'S??? d???ng l??m ?????a ch??? m???c ?????nh.', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3200, 1, 'vi', '_json', 'Default', 'M???c ?????nh', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3201, 1, 'vi', '_json', 'Edit', 'S???a', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3202, 1, 'vi', '_json', 'You have an account already?', 'B???n ???? c?? t??i kho???n?', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3203, 1, 'vi', '_json', 'Select available addresses', 'L???a ch???n ?????a ch???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3204, 1, 'vi', '_json', 'Add new address...', 'Th??m ?????a ch??? m???i...', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3205, 1, 'vi', '_json', 'Order information', 'Th??ng tin ????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3206, 1, 'vi', '_json', 'Order number', 'M?? ????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3207, 1, 'vi', '_json', 'Time', 'Th???i gian', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3208, 1, 'vi', '_json', 'Order status', 'Tr???ng th??i ????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3209, 1, 'vi', '_json', 'Payment method', 'Ph????ng th???c thanh to??n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3210, 1, 'vi', '_json', 'Payment status', 'Tr???ng th??i thanh to??n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3211, 1, 'vi', '_json', 'Amount', 'S??? ti???n', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3212, 1, 'vi', '_json', 'Tax', 'Thu???', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3213, 1, 'vi', '_json', 'Shipping fee', 'Ph?? giao h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3214, 1, 'vi', '_json', 'Customer information', 'Th??ng tin kh??ch h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3215, 1, 'vi', '_json', 'Order detail', 'Chi ti???t ????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3216, 1, 'vi', '_json', 'Print order', 'In ????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3217, 1, 'vi', '_json', 'Cancel order', 'H???y ????n h??ng', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3218, 1, 'vi', '_json', 'Reset Password', 'Kh??i ph???c m???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3219, 1, 'vi', '_json', 'Send Password Reset Link', 'G???i li??n k???t kh??i ph???c m???t kh???u', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3220, 1, 'vi', '_json', 'Product Categories', 'Danh m???c s???n ph???m', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3221, 1, 'vi', '_json', 'All Products', 'T???t c??? s???n ph???m', '2020-10-09 03:54:33', '2020-10-09 03:54:33'),
(3222, 1, 'vi', '_json', 'Brands', 'Th????ng hi???u', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3223, 1, 'vi', '_json', 'Product Tags', 'Th???', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3224, 1, 'vi', '_json', 'Filter By Price', 'L???c theo gi??', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3225, 1, 'vi', '_json', 'Oldest', 'C?? nh???t', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3226, 1, 'vi', '_json', 'Newest', 'M???i nh???t', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3227, 1, 'vi', '_json', 'low to high', 'th???p ?????n cao', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3228, 1, 'vi', '_json', 'high to low', 'cao ?????n th???p', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3229, 1, 'vi', '_json', 'Warning', 'Ch?? ??', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3230, 1, 'vi', '_json', 'Are you sure you want to remove this product from cart?', 'B???n c?? ch???c mu???n x??a s???n ph???m n??y kh???i gi??? h??ng?', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3231, 1, 'vi', '_json', 'Cancel', 'H???y', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3232, 1, 'vi', '_json', 'Yes, remove it!', 'V??ng, x??a!', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3233, 1, 'vi', '_json', 'Shop Now', 'Mua h??ng', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3234, 1, 'vi', '_json', 'ID number', 'M??', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3235, 1, 'vi', '_json', 'Date', 'Ng??y', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3236, 1, 'vi', '_json', 'Status', 'Tr???ng th??i', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3237, 1, 'vi', '_json', 'Order tracking', 'Theo d??i ????n h??ng', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3238, 1, 'vi', '_json', 'Tracking your order status', 'Theo d??i tr???ng th??i ????n h??ng c???a b???n', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3239, 1, 'vi', '_json', 'Order not found!', 'Kh??ng t??m th???y ????n h??ng!', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3240, 1, 'vi', '_json', 'Find', 'T??m ki???m', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3241, 1, 'vi', '_json', 'Sort by', 'S???p x???p', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3242, 1, 'vi', '_json', 'A-Z', 'A-Z', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3243, 1, 'vi', '_json', 'Z-A', 'Z-A', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3244, 1, 'vi', '_json', 'Products', 'S???n ph???m', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3245, 1, 'vi', '_json', 'By', 'Theo', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3246, 1, 'vi', '_json', 'By Price', 'Theo gi??', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3247, 1, 'vi', '_json', 'Shipping information', 'Th??ng tin v???n chuy???n', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3248, 1, 'vi', '_json', 'Payment information', 'Th??ng tin thanh to??n', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3249, 1, 'vi', '_json', 'You have a coupon code?', 'B???n c?? m?? gi???m gi???', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3250, 1, 'vi', '_json', 'Subtotal', 'T???m t??nh', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3251, 1, 'vi', '_json', 'Back to cart', 'Quay l???i trang gi??? h??ng', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3252, 1, 'vi', '_json', 'Register an account with above information?', 'T???o t??i kho???n v???i c??c th??ng tin tr??n?', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3253, 1, 'vi', '_json', 'Cart', 'Gi??? h??ng', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3254, 1, 'vi', '_json', 'Note', 'Ghi ch??', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3255, 1, 'vi', '_json', 'Note...', 'Ghi ch??...', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3256, 1, 'vi', '_json', 'Shipping', 'Ph????ng th???c v???n chuy???n', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3257, 1, 'vi', '_json', 'Your order is successfully placed', '?????t h??ng th??nh c??ng', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3258, 1, 'vi', '_json', 'Shipping method', 'Ph????ng th???c v???n chuy???n', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3259, 1, 'vi', '_json', 'Thank you for purchasing our products!', 'C???m ??n b???n ???? mua s???n ph???m c???a ch??ng t??i!', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3260, 1, 'vi', '_json', 'Discount', 'Gi???m gi??', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3261, 1, 'vi', '_json', 'Total amount', 'T???ng c???ng', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3262, 1, 'vi', '_json', 'Sub amount', 'T???m t??nh', '2020-10-09 03:54:34', '2020-10-09 03:54:34'),
(3263, 1, 'vi', '_json', 'Order successfully. Order number :id', '?????t h??ng th??nh c??ng, m?? ????n h??ng :id', '2020-10-09 03:54:34', '2020-10-09 03:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `permissions`, `last_login`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`) VALUES
(1, 'admin@botble.com', NULL, '$2y$10$ImzIboJy/AXT/v0lTOCeR.3zOfzDvAtXCmA84fUomq8xjOkPf2OTm', 'oFoDn6Z7risleiUUHOzeZfFDj7fEh6tVzlSa9hzfrQooghpjWX68dYpEWpsF', '2020-09-07 18:08:39', '2020-10-07 19:54:40', NULL, '2020-10-07 19:53:18', 'James', 'Cameron', 'botble', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(10, 'CustomMenuWidget', 'footer_sidebar', 'shopwise', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}', '2020-09-21 03:08:26', '2020-09-21 03:08:26'),
(11, 'CustomMenuWidget', 'footer_sidebar', 'shopwise', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"Categories\",\"menu_id\":\"categories\"}', '2020-09-21 03:08:26', '2020-09-21 03:08:26'),
(12, 'CustomMenuWidget', 'footer_sidebar', 'shopwise', 2, '{\"id\":\"CustomMenuWidget\",\"name\":\"My Account\",\"menu_id\":\"my-account\"}', '2020-09-21 03:08:26', '2020-09-21 03:08:26'),
(17, 'BlogSearchWidget', 'primary_sidebar', 'shopwise', 0, '{\"id\":\"BlogSearchWidget\",\"name\":\"Blog Search\"}', '2020-10-02 07:43:28', '2020-10-02 07:43:28'),
(18, 'RecentPostsWidget', 'primary_sidebar', 'shopwise', 1, '{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":\"5\"}', '2020-10-02 07:43:28', '2020-10-02 07:43:28'),
(19, 'TagsWidget', 'primary_sidebar', 'shopwise', 2, '{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":\"5\"}', '2020-10-02 07:43:28', '2020-10-02 07:43:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_cart`
--
ALTER TABLE `ec_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customers`
--
ALTER TABLE `ec_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_customers_email_unique` (`email`);

--
-- Indexes for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customer_password_resets`
--
ALTER TABLE `ec_customer_password_resets`
  ADD KEY `ec_customer_password_resets_email_index` (`email`),
  ADD KEY `ec_customer_password_resets_token_index` (`token`);

--
-- Indexes for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_discounts_code_unique` (`code`);

--
-- Indexes for table `ec_discount_customers`
--
ALTER TABLE `ec_discount_customers`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Indexes for table `ec_discount_products`
--
ALTER TABLE `ec_discount_products`
  ADD PRIMARY KEY (`discount_id`,`product_id`);

--
-- Indexes for table `ec_discount_product_collections`
--
ALTER TABLE `ec_discount_product_collections`
  ADD PRIMARY KEY (`discount_id`,`product_collection_id`);

--
-- Indexes for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_orders`
--
ALTER TABLE `ec_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_products`
--
ALTER TABLE `ec_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_category_product_category_id_index` (`category_id`),
  ADD KEY `ec_product_category_product_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_tag_product`
--
ALTER TABLE `ec_product_tag_product`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `ec_product_tag_product_product_id_index` (`product_id`),
  ADD KEY `ec_product_tag_product_tag_id_index` (`tag_id`);

--
-- Indexes for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `menu_nodes_related_id_index` (`reference_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_content_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_customers`
--
ALTER TABLE `ec_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_orders`
--
ALTER TABLE `ec_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_products`
--
ALTER TABLE `ec_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4099;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3264;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
