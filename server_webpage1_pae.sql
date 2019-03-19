-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2019 at 12:25 AM
-- Server version: 5.6.43
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webpage1_pae`
--

-- --------------------------------------------------------

--
-- Table structure for table `pae_blogmeta`
--

CREATE TABLE `pae_blogmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_blogs`
--

CREATE TABLE `pae_blogs` (
  `blog_id` bigint(20) NOT NULL,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `domain` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public` tinyint(2) NOT NULL DEFAULT '1',
  `archived` tinyint(2) NOT NULL DEFAULT '0',
  `mature` tinyint(2) NOT NULL DEFAULT '0',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `pae_blogs`
--

INSERT INTO `pae_blogs` (`blog_id`, `site_id`, `domain`, `path`, `registered`, `last_updated`, `public`, `archived`, `mature`, `spam`, `deleted`, `lang_id`) VALUES
(1, 1, 'printandembroid.com', '/', '2019-01-01 15:53:04', '2019-03-16 03:54:05', 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pae_blog_versions`
--

CREATE TABLE `pae_blog_versions` (
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `db_version` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `pae_blog_versions`
--

INSERT INTO `pae_blog_versions` (`blog_id`, `db_version`, `last_updated`) VALUES
(1, '44719', '2019-03-16 04:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `pae_commentmeta`
--

CREATE TABLE `pae_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pae_comments`
--

CREATE TABLE `pae_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_comments`
--

INSERT INTO `pae_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-12-20 22:45:17', '2018-12-20 22:45:17', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pae_fpd_products`
--

CREATE TABLE `pae_fpd_products` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `options` text CHARACTER SET utf8,
  `thumbnail` text CHARACTER SET utf8
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `pae_fpd_products`
--

INSERT INTO `pae_fpd_products` (`ID`, `title`, `options`, `thumbnail`) VALUES
(1, 'number', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pae_fpd_views`
--

CREATE TABLE `pae_fpd_views` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `title` text CHARACTER SET utf8 NOT NULL,
  `thumbnail` text CHARACTER SET utf8 NOT NULL,
  `elements` longtext CHARACTER SET utf8,
  `view_order` int(11) DEFAULT NULL,
  `options` text CHARACTER SET utf8
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `pae_fpd_views`
--

INSERT INTO `pae_fpd_views` (`ID`, `product_id`, `title`, `thumbnail`, `elements`, `view_order`, `options`) VALUES
(1, 1, 'front', 'https://printandembroid.com/wp-content/uploads/2019/01/t-shirt-template-20.jpg', '[{\"title\":\"front color\",\"source\":\"https://printandembroid.com/wp-content/uploads/2019/01/front-color.svg\",\"type\":\"image\",\"parameters\":{\"left\":501,\"top\":312,\"z\":-1,\"fill\":\"#c36f6f\",\"colors\":0,\"colorLinkGroup\":0,\"draggable\":0,\"rotatable\":0,\"resizable\":0,\"removable\":0,\"zChangeable\":0,\"scaleX\":1.0530164534,\"scaleY\":1.0530164534,\"lockUniScaling\":false,\"uniScalingUnlockable\":0,\"angle\":0,\"price\":0,\"autoCenter\":0,\"replaceInAllViews\":0,\"autoSelect\":0,\"topped\":0,\"boundingBoxMode\":\"inside\",\"opacity\":1,\"excludeFromExport\":0,\"locked\":0,\"showInColorSelection\":0,\"boundingBox\":0,\"resizeToW\":0,\"resizeToH\":0,\"filter\":0,\"scaleMode\":\"fit\",\"minScaleLimit\":0.01,\"advancedEditing\":0,\"uploadZone\":0,\"uploadZoneMovable\":0}},{\"title\":\"front t\",\"source\":\"https://printandembroid.com/wp-content/uploads/2019/01/front.svg\",\"type\":\"image\",\"parameters\":{\"left\":500,\"top\":309,\"z\":-1,\"fill\":\"rgb(0,0,0)\",\"colors\":0,\"colorLinkGroup\":0,\"draggable\":0,\"rotatable\":0,\"resizable\":0,\"removable\":0,\"zChangeable\":0,\"scaleX\":1.0453720508,\"scaleY\":1.0453720508,\"lockUniScaling\":false,\"uniScalingUnlockable\":0,\"angle\":0,\"price\":0,\"autoCenter\":0,\"replaceInAllViews\":0,\"autoSelect\":0,\"topped\":0,\"boundingBoxMode\":\"inside\",\"opacity\":1,\"excludeFromExport\":0,\"locked\":0,\"showInColorSelection\":0,\"boundingBox\":0,\"resizeToW\":0,\"resizeToH\":0,\"filter\":0,\"scaleMode\":\"fit\",\"minScaleLimit\":0.01,\"advancedEditing\":0,\"svgFill\":[\"#231f20\",\"#231f20\",\"#231f20\",\"#231f20\",\"#231f20\",\"#231f20\",\"#231f20\",\"#231f20\",\"#231f20\",\"#000000\"],\"uploadZone\":0,\"uploadZoneMovable\":0}},{\"title\":\"curved top\",\"source\":\"yourname\",\"type\":\"text\",\"parameters\":{\"left\":496,\"top\":150,\"z\":-1,\"fill\":\"#000000\",\"colors\":false,\"colorLinkGroup\":false,\"draggable\":false,\"rotatable\":false,\"resizable\":false,\"removable\":false,\"zChangeable\":false,\"scaleX\":1,\"scaleY\":1,\"lockUniScaling\":true,\"uniScalingUnlockable\":false,\"angle\":0,\"price\":0,\"autoCenter\":false,\"replaceInAllViews\":false,\"autoSelect\":false,\"topped\":false,\"boundingBoxMode\":\"inside\",\"opacity\":1,\"excludeFromExport\":false,\"locked\":false,\"showInColorSelection\":false,\"boundingBox\":false,\"fontFamily\":\"Eagle Lake\",\"fontSize\":15,\"editable\":true,\"lineHeight\":1,\"textDecoration\":\"normal\",\"maxLength\":20,\"fontWeight\":\"normal\",\"fontStyle\":\"normal\",\"textAlign\":\"center\",\"curvable\":true,\"curved\":1,\"curveSpacing\":10,\"curveRadius\":80,\"curveReverse\":false,\"stroke\":null,\"strokeWidth\":0,\"maxLines\":1,\"letterSpacing\":0,\"chargeAfterEditing\":1,\"minFontSize\":1,\"maxFontSize\":1000,\"textTransform\":\"lowercase\",\"widthFontSize\":0,\"textBox\":false,\"width\":133.1548213727764,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0,\"strokeColors\":[]}},{\"title\":\"23\",\"source\":\"23\",\"type\":\"text\",\"parameters\":{\"left\":511,\"top\":335,\"z\":-1,\"fill\":\"#000000\",\"colors\":[\"#000000\",\"#00ff00\"],\"colorLinkGroup\":0,\"draggable\":0,\"rotatable\":0,\"resizable\":0,\"removable\":0,\"zChangeable\":false,\"scaleX\":1,\"scaleY\":1,\"lockUniScaling\":1,\"uniScalingUnlockable\":0,\"angle\":0,\"price\":0,\"autoCenter\":0,\"replaceInAllViews\":0,\"autoSelect\":1,\"topped\":1,\"boundingBoxMode\":\"inside\",\"opacity\":1,\"excludeFromExport\":0,\"locked\":0,\"showInColorSelection\":0,\"boundingBox\":0,\"fontFamily\":\"Arial\",\"fontSize\":217,\"editable\":1,\"lineHeight\":1,\"textDecoration\":\"normal\",\"maxLength\":0,\"fontWeight\":\"normal\",\"fontStyle\":\"normal\",\"textAlign\":\"left\",\"curvable\":0,\"curved\":0,\"curveSpacing\":10,\"curveRadius\":80,\"curveReverse\":0,\"stroke\":0,\"strokeWidth\":0,\"maxLines\":0,\"letterSpacing\":0,\"chargeAfterEditing\":1,\"minFontSize\":1,\"maxFontSize\":1000,\"textTransform\":\"none\",\"widthFontSize\":0,\"textBox\":0,\"width\":241.3701171875,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0,\"textNumberPlaceholder\":\"number\",\"numberPlaceholderMin\":0,\"numberPlaceholderMax\":99,\"strokeColors\":0}}]', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `pae_links`
--

CREATE TABLE `pae_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pae_loginizer_logs`
--

CREATE TABLE `pae_loginizer_logs` (
  `username` varchar(255) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  `lockout` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_loginizer_logs`
--

INSERT INTO `pae_loginizer_logs` (`username`, `time`, `count`, `lockout`, `ip`, `url`) VALUES
('pae', 1546293154, 9, 3, '69.172.78.9', 'http://printandembroid.com/xmlrpc.php');

-- --------------------------------------------------------

--
-- Table structure for table `pae_options`
--

CREATE TABLE `pae_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_options`
--

INSERT INTO `pae_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'https://printandembroid.com', 'yes'),
(2, 'home', 'https://printandembroid.com', 'yes'),
(3, 'blogname', 'Print and Embroid', 'yes'),
(4, 'blogdescription', 'Custom T-shirt Printing and Embroidery', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'support@printandembroid.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/blog/%category%/%postname%', 'yes'),
(29, 'rewrite_rules', 'a:171:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:52:\"blog/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:47:\"blog/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:28:\"blog/category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:40:\"blog/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:37:\"blog/category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:22:\"blog/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:49:\"blog/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:44:\"blog/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:25:\"blog/tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:37:\"blog/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:34:\"blog/tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:19:\"blog/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:50:\"blog/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:45:\"blog/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:26:\"blog/type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:38:\"blog/type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:20:\"blog/type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:36:\"shop/.+?/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"shop/.+?/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"shop/.+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"shop/.+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"shop/.+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"shop/.+?/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"shop/(.+?)/([^/]+)/embed/?$\";s:64:\"index.php?product_cat=$matches[1]&product=$matches[2]&embed=true\";s:31:\"shop/(.+?)/([^/]+)/trackback/?$\";s:58:\"index.php?product_cat=$matches[1]&product=$matches[2]&tb=1\";s:51:\"shop/(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:70:\"index.php?product_cat=$matches[1]&product=$matches[2]&feed=$matches[3]\";s:46:\"shop/(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:70:\"index.php?product_cat=$matches[1]&product=$matches[2]&feed=$matches[3]\";s:39:\"shop/(.+?)/([^/]+)/page/?([0-9]{1,})/?$\";s:71:\"index.php?product_cat=$matches[1]&product=$matches[2]&paged=$matches[3]\";s:46:\"shop/(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:71:\"index.php?product_cat=$matches[1]&product=$matches[2]&cpage=$matches[3]\";s:36:\"shop/(.+?)/([^/]+)/wc-api(/(.*))?/?$\";s:72:\"index.php?product_cat=$matches[1]&product=$matches[2]&wc-api=$matches[4]\";s:40:\"shop/.+?/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:51:\"shop/.+?/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:35:\"shop/(.+?)/([^/]+)(?:/([0-9]+))?/?$\";s:70:\"index.php?product_cat=$matches[1]&product=$matches[2]&page=$matches[3]\";s:25:\"shop/.+?/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"shop/.+?/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"shop/.+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"shop/.+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"shop/.+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"shop/.+?/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:65:\"blog/fpd_design_category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?fpd_design_category=$matches[1]&feed=$matches[2]\";s:60:\"blog/fpd_design_category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?fpd_design_category=$matches[1]&feed=$matches[2]\";s:41:\"blog/fpd_design_category/([^/]+)/embed/?$\";s:52:\"index.php?fpd_design_category=$matches[1]&embed=true\";s:53:\"blog/fpd_design_category/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?fpd_design_category=$matches[1]&paged=$matches[2]\";s:35:\"blog/fpd_design_category/([^/]+)/?$\";s:41:\"index.php?fpd_design_category=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:16:\".*wp-signup.php$\";s:21:\"index.php?signup=true\";s:18:\".*wp-activate.php$\";s:23:\"index.php?activate=true\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=15&cpage=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:25:\"saved_products(/(.*))?/?$\";s:37:\"index.php?&saved_products=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:52:\"blog/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:47:\"blog/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:28:\"blog/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:40:\"blog/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:37:\"blog/author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:22:\"blog/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:74:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:69:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:50:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:62:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:59:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:44:\"blog/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:61:\"blog/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:56:\"blog/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:37:\"blog/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:49:\"blog/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:46:\"blog/([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:31:\"blog/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:48:\"blog/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:43:\"blog/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:24:\"blog/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:36:\"blog/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:33:\"blog/([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:18:\"blog/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:33:\"(.?.+?)/saved_products(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&saved_products=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:36:\"blog/.+?/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"blog/.+?/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"blog/.+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"blog/.+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"blog/.+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"blog/.+?/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"blog/(.+?)/([^/]+)/embed/?$\";s:63:\"index.php?category_name=$matches[1]&name=$matches[2]&embed=true\";s:31:\"blog/(.+?)/([^/]+)/trackback/?$\";s:57:\"index.php?category_name=$matches[1]&name=$matches[2]&tb=1\";s:51:\"blog/(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:46:\"blog/(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:39:\"blog/(.+?)/([^/]+)/page/?([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:46:\"blog/(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:36:\"blog/(.+?)/([^/]+)/wc-api(/(.*))?/?$\";s:71:\"index.php?category_name=$matches[1]&name=$matches[2]&wc-api=$matches[4]\";s:40:\"blog/.+?/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:51:\"blog/.+?/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:35:\"blog/(.+?)/([^/]+)(?:/([0-9]+))?/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]\";s:25:\"blog/.+?/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"blog/.+?/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"blog/.+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"blog/.+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"blog/.+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"blog/.+?/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:43:\"blog/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:38:\"blog/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:19:\"blog/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:31:\"blog/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:38:\"blog/(.+?)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&cpage=$matches[2]\";s:28:\"blog/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:13:\"blog/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:19:\"akismet/akismet.php\";i:1;s:59:\"fancy-product-designer-plus/fancy-product-designer-plus.php\";i:2;s:49:\"fancy-product-designer/fancy-product-designer.php\";i:3;s:19:\"jetpack/jetpack.php\";i:5;s:45:\"woocommerce-services/woocommerce-services.php\";i:6;s:27:\"woocommerce/woocommerce.php\";i:7;s:43:\"wp-extra-file-types/wp-extra-file-types.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'understrap', 'yes'),
(41, 'stylesheet', 'understrap', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:2:{s:23:\"loginizer/loginizer.php\";s:22:\"loginizer_deactivation\";s:45:\"woocommerce-services/woocommerce-services.php\";a:2:{i:0;s:17:\"WC_Connect_Loader\";i:1;s:16:\"plugin_uninstall\";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '16', 'yes'),
(84, 'page_on_front', '15', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '43764', 'yes'),
(94, 'pae_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:115:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:26:\"edit_fancy_product_desiger\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:93:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:8:{s:19:\"wp_inactive_widgets\";a:0:{}s:13:\"right-sidebar\";a:4:{i:0;s:8:\"search-2\";i:1;s:32:\"woocommerce_product_categories-2\";i:2;s:14:\"recent-posts-2\";i:3;s:6:\"meta-2\";}s:12:\"left-sidebar\";a:0:{}s:4:\"hero\";a:0:{}s:10:\"herocanvas\";a:0:{}s:10:\"statichero\";a:0:{}s:10:\"footerfull\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:0:{}}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'cron', 'a:17:{i:1552950748;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1552952656;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1552952881;a:1:{s:21:\"a2w_synch_event_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1552952925;a:1:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1552953600;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1552954103;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1552957703;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1552968167;a:1:{s:21:\"update_network_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1552969077;a:1:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1552969087;a:1:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1552979877;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1552990677;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1552992317;a:2:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1553020560;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1553026159;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1554163200;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}', 'yes'),
(112, 'loginizer_version', '1.4.0', 'yes'),
(113, 'loginizer_options', 'a:0:{}', 'yes'),
(114, 'loginizer_last_reset', '1546281319', 'yes'),
(115, 'loginizer_whitelist', 'a:0:{}', 'yes'),
(116, 'loginizer_blacklist', 'a:0:{}', 'yes'),
(117, 'loginizer_ins_time', '1545484103', 'yes'),
(118, 'loginizer_promo_time', '1545484103', 'yes'),
(127, 'theme_mods_twentynineteen', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:18;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1546562446;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:4:{i:0;s:8:\"search-2\";i:1;s:32:\"woocommerce_product_categories-2\";i:2;s:14:\"recent-posts-2\";i:3;s:6:\"meta-2\";}}}}', 'yes'),
(803, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(9213, '_transient_is_multi_author', '0', 'yes'),
(9214, '_transient_understrap_categories', '1', 'yes'),
(9236, '_transient_timeout_jetpack_file_data_7.1.1', '1555246904', 'no');
INSERT INTO `pae_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(9237, '_transient_jetpack_file_data_7.1.1', 'a:62:{s:32:\"c22c48d7cfe9d38dff2864cfea64636a\";a:15:{s:4:\"name\";s:20:\"Spelling and Grammar\";s:11:\"description\";s:39:\"Check your spelling, style, and grammar\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"6\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:115:\"after the deadline, afterthedeadline, spell, spellchecker, spelling, grammar, proofreading, style, language, cliche\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"933d4f6d290580156e0652ce850af1b2\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"fb5c4814ddc3946a3f22cc838fcb2af3\";a:15:{s:4:\"name\";s:8:\"Carousel\";s:11:\"description\";s:75:\"Display images and galleries in a gorgeous, full-screen browsing experience\";s:14:\"jumpstart_desc\";s:79:\"Brings your photos and images to life as full-size, easily navigable galleries.\";s:4:\"sort\";s:2:\"22\";s:20:\"recommendation_order\";s:2:\"12\";s:10:\"introduced\";s:3:\"1.5\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:17:\"Photos and Videos\";s:7:\"feature\";s:21:\"Appearance, Jumpstart\";s:25:\"additional_search_queries\";s:80:\"gallery, carousel, diaporama, slideshow, images, lightbox, exif, metadata, image\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"5813eda53235a9a81a69b1f6a4a15db6\";a:15:{s:4:\"name\";s:13:\"Comment Likes\";s:11:\"description\";s:64:\"Increase visitor engagement by adding a Like button to comments.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"39\";s:20:\"recommendation_order\";s:2:\"17\";s:10:\"introduced\";s:3:\"5.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:6:\"Social\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:37:\"like widget, like button, like, likes\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"7ef4ca32a1c84fc10ef50c8293cae5df\";a:15:{s:4:\"name\";s:8:\"Comments\";s:11:\"description\";s:80:\"Let readers use WordPress.com, Twitter, Facebook, or Google+ accounts to comment\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"20\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.4\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:6:\"Social\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:53:\"comments, comment, facebook, twitter, google+, social\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"c5331bfc2648dfeeebe486736d79a72c\";a:15:{s:4:\"name\";s:12:\"Contact Form\";s:11:\"description\";s:81:\"Add a customizable contact form to any post or page using the Jetpack Form Block.\";s:14:\"jumpstart_desc\";s:111:\"Adds a button to your post and page editors, allowing you to build simple forms to help visitors stay in touch.\";s:4:\"sort\";s:2:\"15\";s:20:\"recommendation_order\";s:2:\"14\";s:10:\"introduced\";s:3:\"1.3\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:5:\"Other\";s:7:\"feature\";s:18:\"Writing, Jumpstart\";s:25:\"additional_search_queries\";s:214:\"contact, form, grunion, feedback, submission, contact form, email, feedback, contact form plugin, custom form, custom form plugin, form builder, forms, form maker, survey, contact by jetpack, contact us, forms free\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"275642ae868612fff9f668ce23aef464\";a:15:{s:4:\"name\";s:9:\"Copy Post\";s:11:\"description\";s:53:\"Copy an existing post\'s content into a new draft post\";s:14:\"jumpstart_desc\";s:53:\"Copy an existing post\'s content into a new draft post\";s:4:\"sort\";s:2:\"15\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"7.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:15:\"copy, duplicate\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"707c77d2e8cb0c12d094e5423c8beda8\";a:15:{s:4:\"name\";s:20:\"Custom content types\";s:11:\"description\";s:74:\"Display different types of content on your site with custom content types.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"34\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"3.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:72:\"cpt, custom post types, portfolio, portfolios, testimonial, testimonials\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"cd499b1678cfe3aabfc8ca0d3eb7e8b9\";a:15:{s:4:\"name\";s:10:\"Custom CSS\";s:11:\"description\";s:53:\"Tweak your site’s CSS without modifying your theme.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"2\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.7\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:10:\"Appearance\";s:7:\"feature\";s:10:\"Appearance\";s:25:\"additional_search_queries\";s:108:\"css, customize, custom, style, editor, less, sass, preprocessor, font, mobile, appearance, theme, stylesheet\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"7d266d6546645f42cf52a66387699c50\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"5d436678d5e010ac6b0f157aa1021554\";a:15:{s:4:\"name\";s:21:\"Enhanced Distribution\";s:11:\"description\";s:27:\"Increase reach and traffic.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"5\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.2\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:6:\"Public\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:54:\"google, seo, firehose, search, broadcast, broadcasting\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"2c9ff765b826940496a65c0f927a594a\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"092b94702bb483a5472578283c2103d6\";a:15:{s:4:\"name\";s:16:\"Google Analytics\";s:11:\"description\";s:56:\"Set up Google Analytics without touching a line of code.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"37\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"4.5\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:37:\"webmaster, google, analytics, console\";s:12:\"plan_classes\";s:17:\"business, premium\";}s:32:\"6bd77e09440df2b63044cf8cb7963773\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"ee1a10e2ef5733ab19eb1eb552d5ecb3\";a:15:{s:4:\"name\";s:19:\"Gravatar Hovercards\";s:11:\"description\";s:58:\"Enable pop-up business cards over commenters’ Gravatars.\";s:14:\"jumpstart_desc\";s:131:\"Let commenters link their profiles to their Gravatar accounts, making it easy for your visitors to learn more about your community.\";s:4:\"sort\";s:2:\"11\";s:20:\"recommendation_order\";s:2:\"13\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:18:\"Social, Appearance\";s:7:\"feature\";s:21:\"Appearance, Jumpstart\";s:25:\"additional_search_queries\";s:20:\"gravatar, hovercards\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"284c08538b0bdc266315b2cf80b9c044\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"0ce5c3ac630dea9f41215e48bb0f52f3\";a:15:{s:4:\"name\";s:15:\"Infinite Scroll\";s:11:\"description\";s:53:\"Automatically load new content when a visitor scrolls\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"26\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:10:\"Appearance\";s:7:\"feature\";s:10:\"Appearance\";s:25:\"additional_search_queries\";s:33:\"scroll, infinite, infinite scroll\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"87da2858d4f9cadb6a44fdcf32e8d2b5\";a:15:{s:4:\"name\";s:8:\"JSON API\";s:11:\"description\";s:51:\"Allow applications to securely access your content.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"19\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.9\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:6:\"Public\";s:11:\"module_tags\";s:19:\"Writing, Developers\";s:7:\"feature\";s:7:\"General\";s:25:\"additional_search_queries\";s:50:\"api, rest, develop, developers, json, klout, oauth\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"004962cb7cb9ec2b64769ac4df509217\";a:15:{s:4:\"name\";s:14:\"Beautiful Math\";s:11:\"description\";s:57:\"Use LaTeX markup for complex equations and other geekery.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"12\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:47:\"latex, math, equation, equations, formula, code\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"7f408184bee8850d439c01322867e72c\";a:15:{s:4:\"name\";s:11:\"Lazy Images\";s:11:\"description\";s:137:\"Speed up your site and create a smoother viewing experience by loading images as visitors scroll down the screen, instead of all at once.\";s:14:\"jumpstart_desc\";s:164:\"Lazy-loading images improve your site\'s speed and create a smoother viewing experience. Images will load as visitors scroll down the screen, instead of all at once.\";s:4:\"sort\";s:2:\"24\";s:20:\"recommendation_order\";s:2:\"14\";s:10:\"introduced\";s:5:\"5.6.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:23:\"Appearance, Recommended\";s:7:\"feature\";s:21:\"Appearance, Jumpstart\";s:25:\"additional_search_queries\";s:150:\"mobile, theme, fast images, fast image, image, lazy, lazy load, lazyload, images, lazy images, thumbnail, image lazy load, lazy loading, load, loading\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"2ad914b747f382ae918ed3b37077d4a1\";a:15:{s:4:\"name\";s:5:\"Likes\";s:11:\"description\";s:63:\"Give visitors an easy way to show they appreciate your content.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"23\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.2\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:6:\"Social\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:26:\"like, likes, wordpress.com\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"b347263e3470979442ebf0514e41e893\";a:15:{s:4:\"name\";s:6:\"Manage\";s:11:\"description\";s:54:\"Manage all of your sites from a centralized dashboard.\";s:14:\"jumpstart_desc\";s:151:\"Helps you remotely manage plugins, turn on automated updates, and more from <a href=\"https://wordpress.com/plugins/\" target=\"_blank\">wordpress.com</a>.\";s:4:\"sort\";s:1:\"1\";s:20:\"recommendation_order\";s:1:\"3\";s:10:\"introduced\";s:3:\"3.4\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:35:\"Centralized Management, Recommended\";s:7:\"feature\";s:7:\"General\";s:25:\"additional_search_queries\";s:26:\"manage, management, remote\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"589982245aa6f495b72ab7cf57a1a48e\";a:15:{s:4:\"name\";s:8:\"Markdown\";s:11:\"description\";s:50:\"Write posts or pages in plain-text Markdown syntax\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"31\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.8\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:12:\"md, markdown\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"d3bec8e063d637bc285018241b783725\";a:15:{s:4:\"name\";s:21:\"WordPress.com Toolbar\";s:11:\"description\";s:91:\"Replaces the admin bar with a useful toolbar to quickly manage your site via WordPress.com.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"38\";s:20:\"recommendation_order\";s:2:\"16\";s:10:\"introduced\";s:3:\"4.8\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:7:\"General\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:19:\"adminbar, masterbar\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"6ab1c3e749bcfba2dedbaebe6c9fc614\";a:15:{s:4:\"name\";s:12:\"Mobile Theme\";s:11:\"description\";s:31:\"Enable the Jetpack Mobile theme\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"21\";s:20:\"recommendation_order\";s:2:\"11\";s:10:\"introduced\";s:3:\"1.8\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:31:\"Appearance, Mobile, Recommended\";s:7:\"feature\";s:10:\"Appearance\";s:25:\"additional_search_queries\";s:24:\"mobile, theme, minileven\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"b7be7da643ec641511839ecc6afb6def\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"d54f83ff429a8a37ace796de98459411\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"0f8b373fa12c825162c0b0bc20b8bbdd\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"5d7b0750cb34a4a72a44fa67790de639\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"f07fde8db279ffb0116c727df72c6374\";a:15:{s:4:\"name\";s:7:\"Monitor\";s:11:\"description\";s:118:\"Jetpack’s downtime monitoring will continuously watch your site, and alert you the moment that downtime is detected.\";s:14:\"jumpstart_desc\";s:61:\"Receive immediate notifications if your site goes down, 24/7.\";s:4:\"sort\";s:2:\"28\";s:20:\"recommendation_order\";s:2:\"10\";s:10:\"introduced\";s:3:\"2.6\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:11:\"Recommended\";s:7:\"feature\";s:19:\"Security, Jumpstart\";s:25:\"additional_search_queries\";s:123:\"monitor, uptime, downtime, monitoring, maintenance, maintenance mode, offline, site is down, site down, down, repair, error\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"136a5445a49150db75472862f3d3aefb\";a:15:{s:4:\"name\";s:13:\"Notifications\";s:11:\"description\";s:57:\"Receive instant notifications of site comments and likes.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"13\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.9\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:5:\"Other\";s:7:\"feature\";s:7:\"General\";s:25:\"additional_search_queries\";s:62:\"notification, notifications, toolbar, adminbar, push, comments\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"395d8ae651afabb54d1e98440674b384\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"0b7b5e3ff80355a67c5485b0d00cd1a2\";a:15:{s:4:\"name\";s:9:\"Asset CDN\";s:11:\"description\";s:154:\"Jetpack’s Site Accelerator loads your site faster by optimizing your images and serving your images and static files from our global network of servers.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"26\";s:20:\"recommendation_order\";s:1:\"1\";s:10:\"introduced\";s:3:\"6.6\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:42:\"Photos and Videos, Appearance, Recommended\";s:7:\"feature\";s:23:\"Recommended, Appearance\";s:25:\"additional_search_queries\";s:160:\"site accelerator, accelerate, static, assets, javascript, css, files, performance, seo, bandwidth, content delivery network, pagespeed, combine js, optimize css\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"4484ac68583fbbaab0ef698cdc986950\";a:15:{s:4:\"name\";s:9:\"Image CDN\";s:11:\"description\";s:141:\"Mirrors and serves your images from our free and fast image CDN, improving your site’s performance with no additional load on your servers.\";s:14:\"jumpstart_desc\";s:141:\"Mirrors and serves your images from our free and fast image CDN, improving your site’s performance with no additional load on your servers.\";s:4:\"sort\";s:2:\"25\";s:20:\"recommendation_order\";s:1:\"1\";s:10:\"introduced\";s:3:\"2.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:42:\"Photos and Videos, Appearance, Recommended\";s:7:\"feature\";s:34:\"Recommended, Jumpstart, Appearance\";s:25:\"additional_search_queries\";s:171:\"photon, photo cdn, image cdn, speed, compression, resize, responsive images, responsive, content distribution network, optimize, page speed, image optimize, photon jetpack\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"509aac35e28ac722a331f67613cd27ec\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"6f30193afa5b1360e3fa2676501b5e3a\";a:15:{s:4:\"name\";s:13:\"Post by email\";s:11:\"description\";s:33:\"Publish posts by sending an email\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"14\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:7:\"Writing\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:20:\"post by email, email\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"3e9f8bd3755d92e8e5d06966a957beb8\";a:15:{s:4:\"name\";s:7:\"Protect\";s:11:\"description\";s:135:\"Protect yourself from brute force and distributed brute force attacks, which are the most common way for hackers to get into your site.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:20:\"recommendation_order\";s:1:\"4\";s:10:\"introduced\";s:3:\"3.4\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:11:\"Recommended\";s:7:\"feature\";s:8:\"Security\";s:25:\"additional_search_queries\";s:173:\"security, jetpack protect, secure, protection, botnet, brute force, protect, login, bot, password, passwords, strong passwords, strong password, wp-login.php,  protect admin\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"0cacc8ab2145ad11cb54d181a98aa550\";a:15:{s:4:\"name\";s:9:\"Publicize\";s:11:\"description\";s:128:\"Publicize makes it easy to share your site’s posts on several social media networks automatically when you publish a new post.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"10\";s:20:\"recommendation_order\";s:1:\"7\";s:10:\"introduced\";s:3:\"2.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:19:\"Social, Recommended\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:220:\"facebook, jetpack publicize, twitter, tumblr, linkedin, social, tweet, connections, sharing, social media, automated, automated sharing, auto publish, auto tweet and like, auto tweet, facebook auto post, facebook posting\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"a528c2f803a92c5c2effa67cd33ab33a\";a:15:{s:4:\"name\";s:20:\"Progressive Web Apps\";s:11:\"description\";s:85:\"Speed up and improve the reliability of your site using the latest in web technology.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"38\";s:20:\"recommendation_order\";s:2:\"18\";s:10:\"introduced\";s:5:\"5.6.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:10:\"Developers\";s:7:\"feature\";s:7:\"Traffic\";s:25:\"additional_search_queries\";s:26:\"manifest, pwa, progressive\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"329b8efce059081d46936ece0c6736b3\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"5fdd42d482712fbdaf000b28ea7adce9\";a:15:{s:4:\"name\";s:13:\"Related posts\";s:11:\"description\";s:113:\"Keep visitors engaged on your blog by highlighting relevant and new content at the bottom of each published post.\";s:14:\"jumpstart_desc\";s:113:\"Keep visitors engaged on your blog by highlighting relevant and new content at the bottom of each published post.\";s:4:\"sort\";s:2:\"29\";s:20:\"recommendation_order\";s:1:\"9\";s:10:\"introduced\";s:3:\"2.9\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:11:\"Recommended\";s:7:\"feature\";s:21:\"Engagement, Jumpstart\";s:25:\"additional_search_queries\";s:360:\"related, jetpack related posts, related posts for wordpress, related posts, popular posts, popular, related content, related post, contextual, context, contextual related posts, related articles, similar posts, easy related posts, related page, simple related posts, free related posts, related thumbnails, similar, engagement, yet another related posts plugin\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"2c5096ef610018e98a8bcccfbea4471e\";a:15:{s:4:\"name\";s:6:\"Search\";s:11:\"description\";s:87:\"Enhanced search, powered by Elasticsearch, a powerful replacement for WordPress search.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"34\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"5.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:5:\"false\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:6:\"Search\";s:25:\"additional_search_queries\";s:110:\"search, elastic, elastic search, elasticsearch, fast search, search results, search performance, google search\";s:12:\"plan_classes\";s:8:\"business\";}s:32:\"0d81dd7df3ad2f245e84fd4fb66bf829\";a:15:{s:4:\"name\";s:9:\"SEO Tools\";s:11:\"description\";s:50:\"Better results on search engines and social media.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"35\";s:20:\"recommendation_order\";s:2:\"15\";s:10:\"introduced\";s:3:\"4.4\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:18:\"Social, Appearance\";s:7:\"feature\";s:7:\"Traffic\";s:25:\"additional_search_queries\";s:81:\"search engine optimization, social preview, meta description, custom title format\";s:12:\"plan_classes\";s:17:\"business, premium\";}s:32:\"32aaa676b3b6c9f3ef22430e1e0bca24\";a:15:{s:4:\"name\";s:7:\"Sharing\";s:11:\"description\";s:120:\"Add Twitter, Facebook and Google+ buttons at the bottom of each post, making it easy for visitors to share your content.\";s:14:\"jumpstart_desc\";s:119:\"Twitter, Facebook and many other buttons at the bottom of each post, making it easy for visitors to share your content.\";s:4:\"sort\";s:1:\"7\";s:20:\"recommendation_order\";s:1:\"6\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:3:\"1.2\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:19:\"Social, Recommended\";s:7:\"feature\";s:21:\"Engagement, Jumpstart\";s:25:\"additional_search_queries\";s:229:\"share, sharing, sharedaddy, social buttons, buttons, share facebook, share twitter, social media sharing, social media share, social share, icons, email, facebook, twitter, linkedin, pinterest, pocket, social widget, social media\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"948472b453cda59b38bb7c37af889af0\";a:15:{s:4:\"name\";s:16:\"Shortcode Embeds\";s:11:\"description\";s:50:\"Embed media from popular sites without any coding.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"3\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:3:\"1.2\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:46:\"Photos and Videos, Social, Writing, Appearance\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:236:\"shortcodes, shortcode, embeds, media, bandcamp, dailymotion, facebook, flickr, google calendars, google maps, google+, polldaddy, recipe, recipes, scribd, slideshare, slideshow, slideshows, soundcloud, ted, twitter, vimeo, vine, youtube\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"7d00a6ca0a79fbe893275aaf6ed6ae42\";a:15:{s:4:\"name\";s:16:\"WP.me Shortlinks\";s:11:\"description\";s:54:\"Create short and simple links for all posts and pages.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"8\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:6:\"Social\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:17:\"shortlinks, wp.me\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"372e711395f23c466e04d4fd07f73099\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"2ea687cec293289a2a3e5f0459e79768\";a:15:{s:4:\"name\";s:8:\"Sitemaps\";s:11:\"description\";s:50:\"Make it easy for search engines to find your site.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"13\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"3.9\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:6:\"Public\";s:11:\"module_tags\";s:20:\"Recommended, Traffic\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:39:\"sitemap, traffic, search, site map, seo\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"2fe9dc2c7389d4f0825a0b23bc8b19d1\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"e7cf8a7e0f151ccf7cbdc6d8f118f316\";a:15:{s:4:\"name\";s:14:\"Secure Sign On\";s:11:\"description\";s:62:\"Allow users to log into this site using WordPress.com accounts\";s:14:\"jumpstart_desc\";s:98:\"Lets you log in to all your Jetpack-enabled sites with one click using your WordPress.com account.\";s:4:\"sort\";s:2:\"30\";s:20:\"recommendation_order\";s:1:\"5\";s:10:\"introduced\";s:3:\"2.6\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:10:\"Developers\";s:7:\"feature\";s:19:\"Security, Jumpstart\";s:25:\"additional_search_queries\";s:34:\"sso, single sign on, login, log in\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"34fb073ed896af853ed48bd5739240cb\";a:15:{s:4:\"name\";s:10:\"Site Stats\";s:11:\"description\";s:44:\"Collect valuable traffic stats and insights.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:20:\"recommendation_order\";s:1:\"2\";s:10:\"introduced\";s:3:\"1.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:23:\"Site Stats, Recommended\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:54:\"statistics, tracking, analytics, views, traffic, stats\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"8de0dfff24a17cf0fa0011dfc691a3f3\";a:15:{s:4:\"name\";s:13:\"Subscriptions\";s:11:\"description\";s:87:\"Allow users to subscribe to your posts and comments and receive notifications via email\";s:14:\"jumpstart_desc\";s:126:\"Give visitors two easy subscription options — while commenting, or via a separate email subscription widget you can display.\";s:4:\"sort\";s:1:\"9\";s:20:\"recommendation_order\";s:1:\"8\";s:10:\"introduced\";s:3:\"1.2\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:6:\"Social\";s:7:\"feature\";s:21:\"Engagement, Jumpstart\";s:25:\"additional_search_queries\";s:74:\"subscriptions, subscription, email, follow, followers, subscribers, signup\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"4744f348db095538d3edcacb0ed99c89\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"d89db0d934b39f86065ff58e73594070\";a:15:{s:4:\"name\";s:15:\"Tiled Galleries\";s:11:\"description\";s:61:\"Display image galleries in a variety of elegant arrangements.\";s:14:\"jumpstart_desc\";s:61:\"Display image galleries in a variety of elegant arrangements.\";s:4:\"sort\";s:2:\"24\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.1\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:17:\"Photos and Videos\";s:7:\"feature\";s:21:\"Appearance, Jumpstart\";s:25:\"additional_search_queries\";s:43:\"gallery, tiles, tiled, grid, mosaic, images\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"01987a7ba5e19786f2992501add8181a\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"20459cc462babfc5a82adf6b34f6e8b1\";a:15:{s:4:\"name\";s:20:\"Backups and Scanning\";s:11:\"description\";s:100:\"Protect your site with daily or real-time backups and automated virus scanning and threat detection.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"32\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:5:\"0:1.2\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:5:\"false\";s:4:\"free\";s:5:\"false\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:16:\"Security, Health\";s:25:\"additional_search_queries\";s:386:\"backup, cloud backup, database backup, restore, wordpress backup, backup plugin, wordpress backup plugin, back up, backup wordpress, backwpup, vaultpress, backups, off-site backups, offsite backup, offsite, off-site, antivirus, malware scanner, security, virus, viruses, prevent viruses, scan, anti-virus, antimalware, protection, safe browsing, malware, wp security, wordpress security\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"836245eb0a8f0c5272542305a88940c1\";a:15:{s:4:\"name\";s:17:\"Site verification\";s:11:\"description\";s:58:\"Establish your site\'s authenticity with external services.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"33\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"3.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:10:\"Engagement\";s:25:\"additional_search_queries\";s:56:\"webmaster, seo, google, bing, pinterest, search, console\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"e94397a5c47c1be995eff613e65a674f\";a:15:{s:4:\"name\";s:10:\"VideoPress\";s:11:\"description\";s:101:\"Save on hosting storage and bandwidth costs by streaming fast, ad-free video from our global network.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"27\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.5\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:5:\"false\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:17:\"Photos and Videos\";s:7:\"feature\";s:7:\"Writing\";s:25:\"additional_search_queries\";s:118:\"video, videos, videopress, video gallery, video player, videoplayer, mobile video, vimeo, youtube, html5 video, stream\";s:12:\"plan_classes\";s:17:\"business, premium\";}s:32:\"032cd76e08467c732ccb026efda0c9cd\";a:15:{s:4:\"name\";s:17:\"Widget Visibility\";s:11:\"description\";s:42:\"Control where widgets appear on your site.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:2:\"17\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"2.4\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:10:\"Appearance\";s:7:\"feature\";s:10:\"Appearance\";s:25:\"additional_search_queries\";s:54:\"widget visibility, logic, conditional, widgets, widget\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"9b3e84beedf2e96f1ac5dd6498d2b1aa\";a:15:{s:4:\"name\";s:21:\"Extra Sidebar Widgets\";s:11:\"description\";s:54:\"Add images, Twitter streams, and more to your sidebar.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"4\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:3:\"1.2\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:2:\"No\";s:13:\"auto_activate\";s:3:\"Yes\";s:11:\"module_tags\";s:18:\"Social, Appearance\";s:7:\"feature\";s:10:\"Appearance\";s:25:\"additional_search_queries\";s:65:\"widget, widgets, facebook, gallery, twitter, gravatar, image, rss\";s:12:\"plan_classes\";s:0:\"\";}s:32:\"7724fd9600745cf93e37cc09282e1a37\";a:15:{s:4:\"name\";s:3:\"Ads\";s:11:\"description\";s:60:\"Earn income by allowing Jetpack to display high quality ads.\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:5:\"4.5.0\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:3:\"Yes\";s:13:\"auto_activate\";s:2:\"No\";s:11:\"module_tags\";s:19:\"Traffic, Appearance\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:26:\"advertising, ad codes, ads\";s:12:\"plan_classes\";s:17:\"premium, business\";}s:32:\"5b8f8e5b5a1887e3c0393cb78d5143a3\";a:15:{s:4:\"name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:14:\"jumpstart_desc\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:20:\"recommendation_order\";s:0:\"\";s:10:\"introduced\";s:0:\"\";s:7:\"changed\";s:0:\"\";s:10:\"deactivate\";s:0:\"\";s:4:\"free\";s:0:\"\";s:19:\"requires_connection\";s:0:\"\";s:13:\"auto_activate\";s:0:\"\";s:11:\"module_tags\";s:0:\"\";s:7:\"feature\";s:0:\"\";s:25:\"additional_search_queries\";s:0:\"\";s:12:\"plan_classes\";s:0:\"\";}}', 'no'),
(123, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1546348424;s:7:\"checked\";a:3:{s:14:\"twentynineteen\";s:3:\"1.1\";s:15:\"twentyseventeen\";s:3:\"1.9\";s:13:\"twentysixteen\";s:3:\"1.7\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(1140, 'woocommerce_thumbnail_cropping', 'uncropped', 'yes'),
(4593, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(7278, '_transient_timeout_wc_term_counts', '1554349527', 'no'),
(860, 'current_theme', 'UnderStrap', 'yes'),
(861, 'theme_mods_wp-bootstrap-4', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:18;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1546529778;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:7:{i:0;s:8:\"search-2\";i:1;s:32:\"woocommerce_product_categories-2\";i:2;s:14:\"recent-posts-2\";i:3;s:17:\"recent-comments-2\";i:4;s:10:\"archives-2\";i:5;s:12:\"categories-2\";i:6;s:6:\"meta-2\";}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}}}}', 'yes'),
(862, 'theme_switched', '', 'yes'),
(1358, 'fpd_plus_bulk_add_form_placement', 'none', 'yes'),
(264, 'recently_activated', 'a:1:{s:45:\"woo-product-designer/woo-product-designer.php\";i:1552708650;}', 'yes'),
(128, 'category_children', 'a:0:{}', 'yes'),
(265, 'a2w_addons_data', 'a:3:{s:6:\"addons\";a:6:{i:0;a:6:{s:2:\"id\";s:8:\"ebay2woo\";s:3:\"url\";s:77:\"https://codecanyon.net/item/woocommerce-aliexpress-shipment-tracking/22040640\";s:9:\"image_url\";s:61:\"https://s3.envato.com/files/247974804/banner_canyon_80_80.png\";s:5:\"title\";s:40:\"WooCommerce AliExpress Shipment Tracking\";s:11:\"description\";s:167:\"This plugin utilize functional to add tracking numbers to WooCommerce orders, track them using special tracking service and send those data to your customers by email.\";s:5:\"price\";s:3:\"$25\";}i:1;a:6:{s:2:\"id\";s:8:\"ebay2woo\";s:3:\"url\";s:66:\"https://codecanyon.net/item/ebay-dropship-for-woocommerce/21805662\";s:9:\"image_url\";s:61:\"https://s3.envato.com/files/245477931/banner_canyon_80_80.png\";s:5:\"title\";s:29:\"eBay Dropship for WooCommerce\";s:11:\"description\";s:146:\"Allows you to easily import dropshipped or affiliated eBay products directly into your WooCommerce store and ship them directly to your customers.\";s:5:\"price\";s:3:\"$25\";}i:2;a:6:{s:2:\"id\";s:29:\"woo_variation_swatches_images\";s:3:\"url\";s:74:\"https://codecanyon.net/item/woocommerce-variation-swatches-images/20327701\";s:9:\"image_url\";s:63:\"https://s3.envato.com/files/230286575/banner_canyon_80_80_2.png\";s:5:\"title\";s:37:\"WooCommerce Variation Swatches Images\";s:11:\"description\";s:147:\"Convert your normal variable attribute dropdown select to nicely looking color or image select. You can display images or color in all common size.\";s:5:\"price\";s:3:\"$24\";}i:3;a:6:{s:2:\"id\";s:25:\"woo_gravity_forms_product\";s:3:\"url\";s:70:\"https://codecanyon.net/item/woocommerce-gravity-forms-product/19349744\";s:9:\"image_url\";s:58:\"https://s3.envato.com/files/223794443/Woocommerce_mini.png\";s:5:\"title\";s:33:\"WooCommerce Gravity Forms Product\";s:11:\"description\";s:172:\"This is the add-on for Garvity Forms plugin. With the WooCommerce Gravity Forms Product plugin a product gravity form can be built and linked to any product in WooCommerce.\";s:5:\"price\";s:3:\"$25\";}i:4;a:6:{s:2:\"id\";s:16:\"gf_auto_complete\";s:3:\"url\";s:63:\"https://codecanyon.net/item/gravity-forms-autocomplete/19220825\";s:9:\"image_url\";s:60:\"https://s3.envato.com/files/223794554/Auto_Complete_mini.png\";s:5:\"title\";s:44:\"Gravity Forms Auto Complete (+address field)\";s:11:\"description\";s:172:\"This plugin is an add-on for Gravity Forms that enables a field autocomplete feature. So it suggests possible completions for the field that the user has started typing in.\";s:5:\"price\";s:3:\"$20\";}i:5;a:6:{s:2:\"id\";s:26:\"gf_schedule_entries_export\";s:3:\"url\";s:74:\"https://codecanyon.net/item/gravity-forms-schedule-entries-export/19029817\";s:9:\"image_url\";s:55:\"https://s3.envato.com/files/223794608/Schedule_mini.png\";s:5:\"title\";s:37:\"Gravity Forms Schedule Entries Export\";s:11:\"description\";s:153:\"This plugin is the add-on for Gravity Forms that exports any gravity form entries to a .CSV file or/and send the file to email address(es) on a schedule.\";s:5:\"price\";s:3:\"$20\";}}s:11:\"next_update\";i:1546358328;s:13:\"viewed_addons\";a:6:{i:0;s:8:\"ebay2woo\";i:1;s:8:\"ebay2woo\";i:2;s:29:\"woo_variation_swatches_images\";i:3;s:25:\"woo_gravity_forms_product\";i:4;s:16:\"gf_auto_complete\";i:5;s:26:\"gf_schedule_entries_export\";}}', 'yes'),
(124, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.2\";s:7:\"version\";s:5:\"5.0.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1546348424;s:15:\"version_checked\";s:5:\"5.0.2\";s:12:\"translations\";a:0:{}}', 'no'),
(9203, 'db_upgraded', '', 'yes'),
(9299, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1552802686', 'no'),
(9296, '_transient_timeout_feed_9bbd59226dc36b9b26cd43f15694c5c3', '1552802685', 'no'),
(1353, 'fpd_plus_names_numbers_dropdown', 'Name|13', 'yes'),
(1354, 'fpd_plus_names_numbers_entry_price', '0', 'yes'),
(1355, 'fpd_plus_dynamic_views_unit', 'mm', 'yes'),
(276, 'woocommerce_store_address', '', 'yes'),
(277, 'woocommerce_store_address_2', '', 'yes'),
(278, 'woocommerce_store_city', '', 'yes'),
(279, 'woocommerce_default_country', 'GB', 'yes'),
(280, 'woocommerce_store_postcode', '', 'yes'),
(281, 'woocommerce_allowed_countries', 'all', 'yes'),
(282, 'woocommerce_all_except_countries', '', 'yes'),
(283, 'woocommerce_specific_allowed_countries', '', 'yes'),
(284, 'woocommerce_ship_to_countries', '', 'yes'),
(285, 'woocommerce_specific_ship_to_countries', '', 'yes');
INSERT INTO `pae_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(266, 'a2w_settings', 'a:59:{s:12:\"api_endpoint\";s:28:\"http://ma-group5.com/api/v1/\";s:18:\"item_purchase_code\";s:0:\"\";s:21:\"envato_personal_token\";s:0:\"\";s:12:\"account_type\";s:10:\"aliexpress\";s:18:\"use_custom_account\";b:0;s:12:\"account_data\";a:2:{s:10:\"aliexpress\";a:2:{s:6:\"appkey\";s:0:\"\";s:10:\"trackingid\";s:0:\"\";}s:7:\"admitad\";a:1:{s:12:\"cashback_url\";s:0:\"\";}}s:15:\"import_language\";s:2:\"en\";s:14:\"local_currency\";s:3:\"usd\";s:20:\"default_product_type\";s:6:\"simple\";s:22:\"default_product_status\";s:7:\"publish\";s:21:\"not_import_attributes\";b:0;s:22:\"not_import_description\";b:0;s:29:\"not_import_description_images\";b:0;s:25:\"import_extended_attribute\";b:0;s:35:\"import_extended_variation_attribute\";b:1;s:27:\"import_product_images_limit\";i:0;s:23:\"use_external_image_urls\";b:1;s:7:\"use_cdn\";b:0;s:16:\"use_random_stock\";b:0;s:20:\"use_random_stock_min\";i:5;s:20:\"use_random_stock_max\";i:15;s:22:\"split_attribute_values\";b:1;s:26:\"attribute_values_separator\";s:1:\",\";s:26:\"currency_conversion_factor\";i:1;s:11:\"auto_update\";b:0;s:28:\"not_available_product_status\";s:5:\"trash\";s:9:\"sync_type\";s:15:\"price_and_stock\";s:20:\"fulfillment_prefship\";s:12:\"EMS_ZX_ZX_US\";s:22:\"fulfillment_phone_code\";s:0:\"\";s:24:\"fulfillment_phone_number\";s:0:\"\";s:23:\"fulfillment_custom_note\";s:0:\"\";s:25:\"use_extended_price_markup\";b:0;s:25:\"use_compared_price_markup\";b:0;s:11:\"price_cents\";i:-1;s:20:\"price_compared_cents\";i:-1;s:15:\"default_formula\";b:0;s:12:\"formula_list\";a:0:{}s:11:\"phrase_list\";a:0:{}s:11:\"load_review\";b:0;s:13:\"review_status\";b:0;s:17:\"review_translated\";b:0;s:20:\"review_avatar_import\";b:0;s:22:\"review_max_per_product\";i:20;s:19:\"review_raiting_from\";i:1;s:17:\"review_raiting_to\";i:5;s:21:\"review_noavatar_photo\";s:78:\"https://printandembroid.com/wp-content/plugins/ali2woo/assets/img/noavatar.png\";s:22:\"review_load_attributes\";b:0;s:22:\"review_show_image_list\";b:0;s:20:\"review_allow_country\";s:0:\"\";s:16:\"aliship_frontend\";b:0;s:14:\"aliship_shipto\";s:2:\"US\";s:13:\"json_api_base\";s:7:\"a2w_api\";s:20:\"json_api_controllers\";s:9:\"core,auth\";s:26:\"system_message_last_update\";i:1546363330;s:21:\"image_editor_srickers\";a:22:{i:0;s:53:\"https://static.alidropship.com/stickers/stick-001.png\";i:1;s:53:\"https://static.alidropship.com/stickers/stick-002.png\";i:2;s:53:\"https://static.alidropship.com/stickers/stick-003.png\";i:3;s:53:\"https://static.alidropship.com/stickers/stick-004.png\";i:4;s:53:\"https://static.alidropship.com/stickers/stick-005.png\";i:5;s:53:\"https://static.alidropship.com/stickers/stick-006.png\";i:6;s:53:\"https://static.alidropship.com/stickers/stick-007.png\";i:7;s:53:\"https://static.alidropship.com/stickers/stick-008.png\";i:8;s:53:\"https://static.alidropship.com/stickers/stick-009.png\";i:9;s:53:\"https://static.alidropship.com/stickers/stick-010.png\";i:10;s:53:\"https://static.alidropship.com/stickers/stick-011.png\";i:11;s:53:\"https://static.alidropship.com/stickers/stick-012.png\";i:12;s:53:\"https://static.alidropship.com/stickers/stick-013.png\";i:13;s:53:\"https://static.alidropship.com/stickers/stick-014.png\";i:14;s:53:\"https://static.alidropship.com/stickers/stick-015.png\";i:15;s:53:\"https://static.alidropship.com/stickers/stick-016.png\";i:16;s:53:\"https://static.alidropship.com/stickers/stick-017.png\";i:17;s:53:\"https://static.alidropship.com/stickers/stick-018.png\";i:18;s:53:\"https://static.alidropship.com/stickers/stick-019.png\";i:19;s:53:\"https://static.alidropship.com/stickers/stick-020.png\";i:20;s:53:\"https://static.alidropship.com/stickers/stick-021.png\";i:21;s:53:\"https://static.alidropship.com/stickers/stick-022.png\";}s:14:\"system_message\";a:0:{}s:8:\"accounts\";a:0:{}s:17:\"a2w_json_api_base\";s:7:\"a2w_api\";s:24:\"a2w_json_api_controllers\";s:9:\"core,auth\";}', 'yes'),
(267, 'a2w_db_version', '1.4.7', 'yes'),
(286, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(649, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1546357532;s:7:\"checked\";a:13:{s:19:\"akismet/akismet.php\";s:3:\"4.1\";s:19:\"ali2woo/ali2woo.php\";s:5:\"1.4.7\";s:49:\"fancy-product-designer/fancy-product-designer.php\";s:5:\"3.9.5\";s:59:\"fancy-product-designer-plus/fancy-product-designer-plus.php\";s:5:\"1.2.0\";s:9:\"hello.php\";s:5:\"1.7.1\";s:19:\"jetpack/jetpack.php\";s:5:\"6.8.1\";s:23:\"loginizer/loginizer.php\";s:5:\"1.4.0\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:6:\"2.1.11\";s:65:\"multistep-product-configurator/multistep-product-configurator.php\";s:5:\"1.1.3\";s:27:\"woocommerce/woocommerce.php\";s:5:\"3.5.3\";s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";s:5:\"1.6.5\";s:45:\"woo-product-designer/woo-product-designer.php\";s:3:\"2.1\";s:45:\"woocommerce-services/woocommerce-services.php\";s:6:\"1.18.0\";}s:8:\"response\";a:1:{s:23:\"loginizer/loginizer.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:23:\"w.org/plugins/loginizer\";s:4:\"slug\";s:9:\"loginizer\";s:6:\"plugin\";s:23:\"loginizer/loginizer.php\";s:11:\"new_version\";s:5:\"1.4.1\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/loginizer/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/loginizer.1.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/loginizer/assets/icon-256x256.png?rev=1381093\";s:2:\"1x\";s:62:\"https://ps.w.org/loginizer/assets/icon-128x128.png?rev=1381093\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/loginizer/assets/banner-1544x500.jpg?rev=1517954\";s:2:\"1x\";s:64:\"https://ps.w.org/loginizer/assets/banner-772x250.jpg?rev=1517954\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.0.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:7:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"4.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"jetpack/jetpack.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/jetpack\";s:4:\"slug\";s:7:\"jetpack\";s:6:\"plugin\";s:19:\"jetpack/jetpack.php\";s:11:\"new_version\";s:5:\"6.8.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/jetpack/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/jetpack.6.8.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/jetpack/assets/icon-256x256.png?rev=1791404\";s:2:\"1x\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=1791404\";s:3:\"svg\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=1791404\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/jetpack/assets/banner-1544x500.png?rev=1791404\";s:2:\"1x\";s:62:\"https://ps.w.org/jetpack/assets/banner-772x250.png?rev=1791404\";}s:11:\"banners_rtl\";a:0:{}}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:39:\"w.org/plugins/mailchimp-for-woocommerce\";s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:6:\"plugin\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:11:\"new_version\";s:6:\"2.1.11\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/mailchimp-for-woocommerce/\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/plugin/mailchimp-for-woocommerce.2.1.11.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";s:2:\"1x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-1544x500.png?rev=1950415\";s:2:\"1x\";s:80:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-772x250.jpg?rev=1950415\";}s:11:\"banners_rtl\";a:0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"3.5.3\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.3.5.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=1440831\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=1440831\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=1629184\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=1629184\";}s:11:\"banners_rtl\";a:0:{}}s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:57:\"w.org/plugins/woocommerce-gateway-paypal-express-checkout\";s:4:\"slug\";s:43:\"woocommerce-gateway-paypal-express-checkout\";s:6:\"plugin\";s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";s:11:\"new_version\";s:5:\"1.6.5\";s:3:\"url\";s:74:\"https://wordpress.org/plugins/woocommerce-gateway-paypal-express-checkout/\";s:7:\"package\";s:92:\"https://downloads.wordpress.org/plugin/woocommerce-gateway-paypal-express-checkout.1.6.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:96:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/icon-256x256.png?rev=1900204\";s:2:\"1x\";s:96:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/icon-128x128.png?rev=1900204\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:99:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/banner-1544x500.png?rev=1948167\";s:2:\"1x\";s:98:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/banner-772x250.png?rev=1948167\";}s:11:\"banners_rtl\";a:0:{}}s:45:\"woocommerce-services/woocommerce-services.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:34:\"w.org/plugins/woocommerce-services\";s:4:\"slug\";s:20:\"woocommerce-services\";s:6:\"plugin\";s:45:\"woocommerce-services/woocommerce-services.php\";s:11:\"new_version\";s:6:\"1.18.0\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/woocommerce-services/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/woocommerce-services.1.18.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-256x256.png?rev=1910075\";s:2:\"1x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-128x128.png?rev=1910075\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/woocommerce-services/assets/banner-1544x500.png?rev=1962920\";s:2:\"1x\";s:75:\"https://ps.w.org/woocommerce-services/assets/banner-772x250.png?rev=1962920\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(287, 'woocommerce_calc_taxes', 'no', 'yes'),
(288, 'woocommerce_enable_coupons', 'yes', 'yes'),
(289, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(290, 'woocommerce_currency', 'GBP', 'yes'),
(291, 'woocommerce_currency_pos', 'left', 'yes'),
(292, 'woocommerce_price_thousand_sep', ',', 'yes'),
(293, 'woocommerce_price_decimal_sep', '.', 'yes'),
(294, 'woocommerce_price_num_decimals', '2', 'yes'),
(295, 'woocommerce_shop_page_id', '', 'yes'),
(296, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(297, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(298, 'woocommerce_placeholder_image', '', 'yes'),
(299, 'woocommerce_weight_unit', 'kg', 'yes'),
(300, 'woocommerce_dimension_unit', 'cm', 'yes'),
(301, 'woocommerce_enable_reviews', 'yes', 'yes'),
(302, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(303, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(304, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(305, 'woocommerce_review_rating_required', 'yes', 'no'),
(306, 'woocommerce_manage_stock', 'yes', 'yes'),
(307, 'woocommerce_hold_stock_minutes', '60', 'no'),
(308, 'woocommerce_notify_low_stock', 'yes', 'no'),
(309, 'woocommerce_notify_no_stock', 'yes', 'no'),
(310, 'woocommerce_stock_email_recipient', 'support@printandembroid.com', 'no'),
(311, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(312, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(313, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(314, 'woocommerce_stock_format', '', 'yes'),
(315, 'woocommerce_file_download_method', 'force', 'no'),
(316, 'woocommerce_downloads_require_login', 'no', 'no'),
(317, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(318, 'woocommerce_prices_include_tax', 'no', 'yes'),
(319, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(320, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(321, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(322, 'woocommerce_tax_classes', 'Reduced rate\nZero rate', 'yes'),
(323, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(324, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(325, 'woocommerce_price_display_suffix', '', 'yes'),
(326, 'woocommerce_tax_total_display', 'itemized', 'no'),
(327, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(328, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(329, 'woocommerce_ship_to_destination', 'billing', 'no'),
(330, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(331, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(332, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(333, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(334, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(335, 'woocommerce_registration_generate_username', 'yes', 'no'),
(336, 'woocommerce_registration_generate_password', 'yes', 'no'),
(337, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(338, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(339, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(340, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(341, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(342, 'woocommerce_trash_pending_orders', '', 'no'),
(343, 'woocommerce_trash_failed_orders', '', 'no'),
(344, 'woocommerce_trash_cancelled_orders', '', 'no'),
(345, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(346, 'woocommerce_email_from_name', 'Print and Embroid', 'no'),
(347, 'woocommerce_email_from_address', 'support@printandembroid.com', 'no'),
(348, 'woocommerce_email_header_image', '', 'no'),
(349, 'woocommerce_email_footer_text', '{site_title}<br/>Powered by <a href=\"https://woocommerce.com/\">WooCommerce</a>', 'no'),
(350, 'woocommerce_email_base_color', '#96588a', 'no'),
(351, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(352, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(353, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(354, 'woocommerce_cart_page_id', '', 'yes'),
(355, 'woocommerce_checkout_page_id', '', 'yes'),
(356, 'woocommerce_myaccount_page_id', '', 'yes'),
(357, 'woocommerce_terms_page_id', '', 'no'),
(358, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(359, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(360, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(361, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(362, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(363, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(364, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(365, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(366, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(367, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(368, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(369, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(370, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(371, 'woocommerce_api_enabled', 'no', 'yes'),
(372, 'woocommerce_single_image_width', '600', 'yes'),
(373, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(374, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(375, 'woocommerce_demo_store', 'yes', 'yes'),
(376, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:19:\"/shop/%product_cat%\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:1;}', 'yes'),
(377, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(378, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(379, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(423, 'product_cat_children', 'a:0:{}', 'yes'),
(381, 'default_product_cat', '15', 'yes'),
(9198, 'woocommerce_version', '3.5.6', 'yes'),
(727, 'woocommerce_db_version', '3.5.3', 'yes'),
(386, 'woocommerce_admin_notices', 'a:1:{i:0;s:6:\"update\";}', 'yes'),
(387, '_transient_woocommerce_webhook_ids', 'a:0:{}', 'yes'),
(388, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(389, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(390, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(391, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(392, 'widget_woocommerce_product_categories', 'a:2:{i:2;a:8:{s:5:\"title\";s:18:\"Product categories\";s:7:\"orderby\";s:4:\"name\";s:8:\"dropdown\";i:1;s:5:\"count\";i:1;s:12:\"hierarchical\";i:1;s:18:\"show_children_only\";i:0;s:10:\"hide_empty\";i:0;s:9:\"max_depth\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(393, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(394, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(395, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(396, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(397, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(398, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(399, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(738, '_transient_product-transient-version', '1546553423', 'yes'),
(1081, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(408, '_transient_as_comment_count', 'O:8:\"stdClass\":7:{s:8:\"approved\";s:1:\"1\";s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(406, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(416, 'wc_ppec_version', '1.6.5', 'yes'),
(9059, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1552750876', 'no'),
(982, 'fancyproductdesigner_version', '3.9.5', 'yes'),
(984, 'fpd_hide_run_updater', 'yes', 'yes'),
(9031, '_transient_timeout_fpd_google_webfonts', '1553298493', 'no');
INSERT INTO `pae_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(9032, '_transient_fpd_google_webfonts', 'a:2536:{s:15:\"ABeeZee:regular\";s:15:\"ABeeZee regular\";s:14:\"ABeeZee:italic\";s:14:\"ABeeZee italic\";s:12:\"Abel:regular\";s:12:\"Abel regular\";s:20:\"Abhaya+Libre:regular\";s:20:\"Abhaya Libre regular\";s:16:\"Abhaya+Libre:500\";s:16:\"Abhaya Libre 500\";s:16:\"Abhaya+Libre:600\";s:16:\"Abhaya Libre 600\";s:16:\"Abhaya+Libre:700\";s:16:\"Abhaya Libre 700\";s:16:\"Abhaya+Libre:800\";s:16:\"Abhaya Libre 800\";s:21:\"Abril+Fatface:regular\";s:21:\"Abril Fatface regular\";s:16:\"Aclonica:regular\";s:16:\"Aclonica regular\";s:12:\"Acme:regular\";s:12:\"Acme regular\";s:13:\"Actor:regular\";s:13:\"Actor regular\";s:15:\"Adamina:regular\";s:15:\"Adamina regular\";s:14:\"Advent+Pro:100\";s:14:\"Advent Pro 100\";s:14:\"Advent+Pro:200\";s:14:\"Advent Pro 200\";s:14:\"Advent+Pro:300\";s:14:\"Advent Pro 300\";s:18:\"Advent+Pro:regular\";s:18:\"Advent Pro regular\";s:14:\"Advent+Pro:500\";s:14:\"Advent Pro 500\";s:14:\"Advent+Pro:600\";s:14:\"Advent Pro 600\";s:14:\"Advent+Pro:700\";s:14:\"Advent Pro 700\";s:23:\"Aguafina+Script:regular\";s:23:\"Aguafina Script regular\";s:15:\"Akronim:regular\";s:15:\"Akronim regular\";s:14:\"Aladin:regular\";s:14:\"Aladin regular\";s:15:\"Aldrich:regular\";s:15:\"Aldrich regular\";s:12:\"Alef:regular\";s:12:\"Alef regular\";s:8:\"Alef:700\";s:8:\"Alef 700\";s:16:\"Alegreya:regular\";s:16:\"Alegreya regular\";s:15:\"Alegreya:italic\";s:15:\"Alegreya italic\";s:12:\"Alegreya:500\";s:12:\"Alegreya 500\";s:18:\"Alegreya:500italic\";s:18:\"Alegreya 500italic\";s:12:\"Alegreya:700\";s:12:\"Alegreya 700\";s:18:\"Alegreya:700italic\";s:18:\"Alegreya 700italic\";s:12:\"Alegreya:800\";s:12:\"Alegreya 800\";s:18:\"Alegreya:800italic\";s:18:\"Alegreya 800italic\";s:12:\"Alegreya:900\";s:12:\"Alegreya 900\";s:18:\"Alegreya:900italic\";s:18:\"Alegreya 900italic\";s:19:\"Alegreya+SC:regular\";s:19:\"Alegreya SC regular\";s:18:\"Alegreya+SC:italic\";s:18:\"Alegreya SC italic\";s:15:\"Alegreya+SC:500\";s:15:\"Alegreya SC 500\";s:21:\"Alegreya+SC:500italic\";s:21:\"Alegreya SC 500italic\";s:15:\"Alegreya+SC:700\";s:15:\"Alegreya SC 700\";s:21:\"Alegreya+SC:700italic\";s:21:\"Alegreya SC 700italic\";s:15:\"Alegreya+SC:800\";s:15:\"Alegreya SC 800\";s:21:\"Alegreya+SC:800italic\";s:21:\"Alegreya SC 800italic\";s:15:\"Alegreya+SC:900\";s:15:\"Alegreya SC 900\";s:21:\"Alegreya+SC:900italic\";s:21:\"Alegreya SC 900italic\";s:17:\"Alegreya+Sans:100\";s:17:\"Alegreya Sans 100\";s:23:\"Alegreya+Sans:100italic\";s:23:\"Alegreya Sans 100italic\";s:17:\"Alegreya+Sans:300\";s:17:\"Alegreya Sans 300\";s:23:\"Alegreya+Sans:300italic\";s:23:\"Alegreya Sans 300italic\";s:21:\"Alegreya+Sans:regular\";s:21:\"Alegreya Sans regular\";s:20:\"Alegreya+Sans:italic\";s:20:\"Alegreya Sans italic\";s:17:\"Alegreya+Sans:500\";s:17:\"Alegreya Sans 500\";s:23:\"Alegreya+Sans:500italic\";s:23:\"Alegreya Sans 500italic\";s:17:\"Alegreya+Sans:700\";s:17:\"Alegreya Sans 700\";s:23:\"Alegreya+Sans:700italic\";s:23:\"Alegreya Sans 700italic\";s:17:\"Alegreya+Sans:800\";s:17:\"Alegreya Sans 800\";s:23:\"Alegreya+Sans:800italic\";s:23:\"Alegreya Sans 800italic\";s:17:\"Alegreya+Sans:900\";s:17:\"Alegreya Sans 900\";s:23:\"Alegreya+Sans:900italic\";s:23:\"Alegreya Sans 900italic\";s:20:\"Alegreya+Sans+SC:100\";s:20:\"Alegreya Sans SC 100\";s:26:\"Alegreya+Sans+SC:100italic\";s:26:\"Alegreya Sans SC 100italic\";s:20:\"Alegreya+Sans+SC:300\";s:20:\"Alegreya Sans SC 300\";s:26:\"Alegreya+Sans+SC:300italic\";s:26:\"Alegreya Sans SC 300italic\";s:24:\"Alegreya+Sans+SC:regular\";s:24:\"Alegreya Sans SC regular\";s:23:\"Alegreya+Sans+SC:italic\";s:23:\"Alegreya Sans SC italic\";s:20:\"Alegreya+Sans+SC:500\";s:20:\"Alegreya Sans SC 500\";s:26:\"Alegreya+Sans+SC:500italic\";s:26:\"Alegreya Sans SC 500italic\";s:20:\"Alegreya+Sans+SC:700\";s:20:\"Alegreya Sans SC 700\";s:26:\"Alegreya+Sans+SC:700italic\";s:26:\"Alegreya Sans SC 700italic\";s:20:\"Alegreya+Sans+SC:800\";s:20:\"Alegreya Sans SC 800\";s:26:\"Alegreya+Sans+SC:800italic\";s:26:\"Alegreya Sans SC 800italic\";s:20:\"Alegreya+Sans+SC:900\";s:20:\"Alegreya Sans SC 900\";s:26:\"Alegreya+Sans+SC:900italic\";s:26:\"Alegreya Sans SC 900italic\";s:8:\"Aleo:300\";s:8:\"Aleo 300\";s:14:\"Aleo:300italic\";s:14:\"Aleo 300italic\";s:12:\"Aleo:regular\";s:12:\"Aleo regular\";s:11:\"Aleo:italic\";s:11:\"Aleo italic\";s:8:\"Aleo:700\";s:8:\"Aleo 700\";s:14:\"Aleo:700italic\";s:14:\"Aleo 700italic\";s:18:\"Alex+Brush:regular\";s:18:\"Alex Brush regular\";s:21:\"Alfa+Slab+One:regular\";s:21:\"Alfa Slab One regular\";s:13:\"Alice:regular\";s:13:\"Alice regular\";s:13:\"Alike:regular\";s:13:\"Alike regular\";s:21:\"Alike+Angular:regular\";s:21:\"Alike Angular regular\";s:13:\"Allan:regular\";s:13:\"Allan regular\";s:9:\"Allan:700\";s:9:\"Allan 700\";s:15:\"Allerta:regular\";s:15:\"Allerta regular\";s:23:\"Allerta+Stencil:regular\";s:23:\"Allerta Stencil regular\";s:14:\"Allura:regular\";s:14:\"Allura regular\";s:16:\"Almendra:regular\";s:16:\"Almendra regular\";s:15:\"Almendra:italic\";s:15:\"Almendra italic\";s:12:\"Almendra:700\";s:12:\"Almendra 700\";s:18:\"Almendra:700italic\";s:18:\"Almendra 700italic\";s:24:\"Almendra+Display:regular\";s:24:\"Almendra Display regular\";s:19:\"Almendra+SC:regular\";s:19:\"Almendra SC regular\";s:16:\"Amarante:regular\";s:16:\"Amarante regular\";s:16:\"Amaranth:regular\";s:16:\"Amaranth regular\";s:15:\"Amaranth:italic\";s:15:\"Amaranth italic\";s:12:\"Amaranth:700\";s:12:\"Amaranth 700\";s:18:\"Amaranth:700italic\";s:18:\"Amaranth 700italic\";s:17:\"Amatic+SC:regular\";s:17:\"Amatic SC regular\";s:13:\"Amatic+SC:700\";s:13:\"Amatic SC 700\";s:17:\"Amethysta:regular\";s:17:\"Amethysta regular\";s:13:\"Amiko:regular\";s:13:\"Amiko regular\";s:9:\"Amiko:600\";s:9:\"Amiko 600\";s:9:\"Amiko:700\";s:9:\"Amiko 700\";s:13:\"Amiri:regular\";s:13:\"Amiri regular\";s:12:\"Amiri:italic\";s:12:\"Amiri italic\";s:9:\"Amiri:700\";s:9:\"Amiri 700\";s:15:\"Amiri:700italic\";s:15:\"Amiri 700italic\";s:13:\"Amita:regular\";s:13:\"Amita regular\";s:9:\"Amita:700\";s:9:\"Amita 700\";s:15:\"Anaheim:regular\";s:15:\"Anaheim regular\";s:14:\"Andada:regular\";s:14:\"Andada regular\";s:14:\"Andika:regular\";s:14:\"Andika regular\";s:14:\"Angkor:regular\";s:14:\"Angkor regular\";s:32:\"Annie+Use+Your+Telescope:regular\";s:32:\"Annie Use Your Telescope regular\";s:21:\"Anonymous+Pro:regular\";s:21:\"Anonymous Pro regular\";s:20:\"Anonymous+Pro:italic\";s:20:\"Anonymous Pro italic\";s:17:\"Anonymous+Pro:700\";s:17:\"Anonymous Pro 700\";s:23:\"Anonymous+Pro:700italic\";s:23:\"Anonymous Pro 700italic\";s:13:\"Antic:regular\";s:13:\"Antic regular\";s:20:\"Antic+Didone:regular\";s:20:\"Antic Didone regular\";s:18:\"Antic+Slab:regular\";s:18:\"Antic Slab regular\";s:13:\"Anton:regular\";s:13:\"Anton regular\";s:14:\"Arapey:regular\";s:14:\"Arapey regular\";s:13:\"Arapey:italic\";s:13:\"Arapey italic\";s:15:\"Arbutus:regular\";s:15:\"Arbutus regular\";s:20:\"Arbutus+Slab:regular\";s:20:\"Arbutus Slab regular\";s:27:\"Architects+Daughter:regular\";s:27:\"Architects Daughter regular\";s:15:\"Archivo:regular\";s:15:\"Archivo regular\";s:14:\"Archivo:italic\";s:14:\"Archivo italic\";s:11:\"Archivo:500\";s:11:\"Archivo 500\";s:17:\"Archivo:500italic\";s:17:\"Archivo 500italic\";s:11:\"Archivo:600\";s:11:\"Archivo 600\";s:17:\"Archivo:600italic\";s:17:\"Archivo 600italic\";s:11:\"Archivo:700\";s:11:\"Archivo 700\";s:17:\"Archivo:700italic\";s:17:\"Archivo 700italic\";s:21:\"Archivo+Black:regular\";s:21:\"Archivo Black regular\";s:22:\"Archivo+Narrow:regular\";s:22:\"Archivo Narrow regular\";s:21:\"Archivo+Narrow:italic\";s:21:\"Archivo Narrow italic\";s:18:\"Archivo+Narrow:500\";s:18:\"Archivo Narrow 500\";s:24:\"Archivo+Narrow:500italic\";s:24:\"Archivo Narrow 500italic\";s:18:\"Archivo+Narrow:600\";s:18:\"Archivo Narrow 600\";s:24:\"Archivo+Narrow:600italic\";s:24:\"Archivo Narrow 600italic\";s:18:\"Archivo+Narrow:700\";s:18:\"Archivo Narrow 700\";s:24:\"Archivo+Narrow:700italic\";s:24:\"Archivo Narrow 700italic\";s:18:\"Aref+Ruqaa:regular\";s:18:\"Aref Ruqaa regular\";s:14:\"Aref+Ruqaa:700\";s:14:\"Aref Ruqaa 700\";s:17:\"Arima+Madurai:100\";s:17:\"Arima Madurai 100\";s:17:\"Arima+Madurai:200\";s:17:\"Arima Madurai 200\";s:17:\"Arima+Madurai:300\";s:17:\"Arima Madurai 300\";s:21:\"Arima+Madurai:regular\";s:21:\"Arima Madurai regular\";s:17:\"Arima+Madurai:500\";s:17:\"Arima Madurai 500\";s:17:\"Arima+Madurai:700\";s:17:\"Arima Madurai 700\";s:17:\"Arima+Madurai:800\";s:17:\"Arima Madurai 800\";s:17:\"Arima+Madurai:900\";s:17:\"Arima Madurai 900\";s:13:\"Arimo:regular\";s:13:\"Arimo regular\";s:12:\"Arimo:italic\";s:12:\"Arimo italic\";s:9:\"Arimo:700\";s:9:\"Arimo 700\";s:15:\"Arimo:700italic\";s:15:\"Arimo 700italic\";s:16:\"Arizonia:regular\";s:16:\"Arizonia regular\";s:14:\"Armata:regular\";s:14:\"Armata regular\";s:15:\"Arsenal:regular\";s:15:\"Arsenal regular\";s:14:\"Arsenal:italic\";s:14:\"Arsenal italic\";s:11:\"Arsenal:700\";s:11:\"Arsenal 700\";s:17:\"Arsenal:700italic\";s:17:\"Arsenal 700italic\";s:16:\"Artifika:regular\";s:16:\"Artifika regular\";s:12:\"Arvo:regular\";s:12:\"Arvo regular\";s:11:\"Arvo:italic\";s:11:\"Arvo italic\";s:8:\"Arvo:700\";s:8:\"Arvo 700\";s:14:\"Arvo:700italic\";s:14:\"Arvo 700italic\";s:12:\"Arya:regular\";s:12:\"Arya regular\";s:8:\"Arya:700\";s:8:\"Arya 700\";s:12:\"Asap:regular\";s:12:\"Asap regular\";s:11:\"Asap:italic\";s:11:\"Asap italic\";s:8:\"Asap:500\";s:8:\"Asap 500\";s:14:\"Asap:500italic\";s:14:\"Asap 500italic\";s:8:\"Asap:600\";s:8:\"Asap 600\";s:14:\"Asap:600italic\";s:14:\"Asap 600italic\";s:8:\"Asap:700\";s:8:\"Asap 700\";s:14:\"Asap:700italic\";s:14:\"Asap 700italic\";s:22:\"Asap+Condensed:regular\";s:22:\"Asap Condensed regular\";s:21:\"Asap+Condensed:italic\";s:21:\"Asap Condensed italic\";s:18:\"Asap+Condensed:500\";s:18:\"Asap Condensed 500\";s:24:\"Asap+Condensed:500italic\";s:24:\"Asap Condensed 500italic\";s:18:\"Asap+Condensed:600\";s:18:\"Asap Condensed 600\";s:24:\"Asap+Condensed:600italic\";s:24:\"Asap Condensed 600italic\";s:18:\"Asap+Condensed:700\";s:18:\"Asap Condensed 700\";s:24:\"Asap+Condensed:700italic\";s:24:\"Asap Condensed 700italic\";s:12:\"Asar:regular\";s:12:\"Asar regular\";s:13:\"Asset:regular\";s:13:\"Asset regular\";s:13:\"Assistant:200\";s:13:\"Assistant 200\";s:13:\"Assistant:300\";s:13:\"Assistant 300\";s:17:\"Assistant:regular\";s:17:\"Assistant regular\";s:13:\"Assistant:600\";s:13:\"Assistant 600\";s:13:\"Assistant:700\";s:13:\"Assistant 700\";s:13:\"Assistant:800\";s:13:\"Assistant 800\";s:15:\"Astloch:regular\";s:15:\"Astloch regular\";s:11:\"Astloch:700\";s:11:\"Astloch 700\";s:12:\"Asul:regular\";s:12:\"Asul regular\";s:8:\"Asul:700\";s:8:\"Asul 700\";s:10:\"Athiti:200\";s:10:\"Athiti 200\";s:10:\"Athiti:300\";s:10:\"Athiti 300\";s:14:\"Athiti:regular\";s:14:\"Athiti regular\";s:10:\"Athiti:500\";s:10:\"Athiti 500\";s:10:\"Athiti:600\";s:10:\"Athiti 600\";s:10:\"Athiti:700\";s:10:\"Athiti 700\";s:8:\"Atma:300\";s:8:\"Atma 300\";s:12:\"Atma:regular\";s:12:\"Atma regular\";s:8:\"Atma:500\";s:8:\"Atma 500\";s:8:\"Atma:600\";s:8:\"Atma 600\";s:8:\"Atma:700\";s:8:\"Atma 700\";s:18:\"Atomic+Age:regular\";s:18:\"Atomic Age regular\";s:14:\"Aubrey:regular\";s:14:\"Aubrey regular\";s:17:\"Audiowide:regular\";s:17:\"Audiowide regular\";s:18:\"Autour+One:regular\";s:18:\"Autour One regular\";s:15:\"Average:regular\";s:15:\"Average regular\";s:20:\"Average+Sans:regular\";s:20:\"Average Sans regular\";s:27:\"Averia+Gruesa+Libre:regular\";s:27:\"Averia Gruesa Libre regular\";s:16:\"Averia+Libre:300\";s:16:\"Averia Libre 300\";s:22:\"Averia+Libre:300italic\";s:22:\"Averia Libre 300italic\";s:20:\"Averia+Libre:regular\";s:20:\"Averia Libre regular\";s:19:\"Averia+Libre:italic\";s:19:\"Averia Libre italic\";s:16:\"Averia+Libre:700\";s:16:\"Averia Libre 700\";s:22:\"Averia+Libre:700italic\";s:22:\"Averia Libre 700italic\";s:21:\"Averia+Sans+Libre:300\";s:21:\"Averia Sans Libre 300\";s:27:\"Averia+Sans+Libre:300italic\";s:27:\"Averia Sans Libre 300italic\";s:25:\"Averia+Sans+Libre:regular\";s:25:\"Averia Sans Libre regular\";s:24:\"Averia+Sans+Libre:italic\";s:24:\"Averia Sans Libre italic\";s:21:\"Averia+Sans+Libre:700\";s:21:\"Averia Sans Libre 700\";s:27:\"Averia+Sans+Libre:700italic\";s:27:\"Averia Sans Libre 700italic\";s:22:\"Averia+Serif+Libre:300\";s:22:\"Averia Serif Libre 300\";s:28:\"Averia+Serif+Libre:300italic\";s:28:\"Averia Serif Libre 300italic\";s:26:\"Averia+Serif+Libre:regular\";s:26:\"Averia Serif Libre regular\";s:25:\"Averia+Serif+Libre:italic\";s:25:\"Averia Serif Libre italic\";s:22:\"Averia+Serif+Libre:700\";s:22:\"Averia Serif Libre 700\";s:28:\"Averia+Serif+Libre:700italic\";s:28:\"Averia Serif Libre 700italic\";s:12:\"B612:regular\";s:12:\"B612 regular\";s:11:\"B612:italic\";s:11:\"B612 italic\";s:8:\"B612:700\";s:8:\"B612 700\";s:14:\"B612:700italic\";s:14:\"B612 700italic\";s:17:\"B612+Mono:regular\";s:17:\"B612 Mono regular\";s:16:\"B612+Mono:italic\";s:16:\"B612 Mono italic\";s:13:\"B612+Mono:700\";s:13:\"B612 Mono 700\";s:19:\"B612+Mono:700italic\";s:19:\"B612 Mono 700italic\";s:18:\"Bad+Script:regular\";s:18:\"Bad Script regular\";s:15:\"Bahiana:regular\";s:15:\"Bahiana regular\";s:16:\"Bai+Jamjuree:200\";s:16:\"Bai Jamjuree 200\";s:22:\"Bai+Jamjuree:200italic\";s:22:\"Bai Jamjuree 200italic\";s:16:\"Bai+Jamjuree:300\";s:16:\"Bai Jamjuree 300\";s:22:\"Bai+Jamjuree:300italic\";s:22:\"Bai Jamjuree 300italic\";s:20:\"Bai+Jamjuree:regular\";s:20:\"Bai Jamjuree regular\";s:19:\"Bai+Jamjuree:italic\";s:19:\"Bai Jamjuree italic\";s:16:\"Bai+Jamjuree:500\";s:16:\"Bai Jamjuree 500\";s:22:\"Bai+Jamjuree:500italic\";s:22:\"Bai Jamjuree 500italic\";s:16:\"Bai+Jamjuree:600\";s:16:\"Bai Jamjuree 600\";s:22:\"Bai+Jamjuree:600italic\";s:22:\"Bai Jamjuree 600italic\";s:16:\"Bai+Jamjuree:700\";s:16:\"Bai Jamjuree 700\";s:22:\"Bai+Jamjuree:700italic\";s:22:\"Bai Jamjuree 700italic\";s:13:\"Baloo:regular\";s:13:\"Baloo regular\";s:18:\"Baloo+Bhai:regular\";s:18:\"Baloo Bhai regular\";s:22:\"Baloo+Bhaijaan:regular\";s:22:\"Baloo Bhaijaan regular\";s:20:\"Baloo+Bhaina:regular\";s:20:\"Baloo Bhaina regular\";s:21:\"Baloo+Chettan:regular\";s:21:\"Baloo Chettan regular\";s:16:\"Baloo+Da:regular\";s:16:\"Baloo Da regular\";s:19:\"Baloo+Paaji:regular\";s:19:\"Baloo Paaji regular\";s:19:\"Baloo+Tamma:regular\";s:19:\"Baloo Tamma regular\";s:21:\"Baloo+Tammudu:regular\";s:21:\"Baloo Tammudu regular\";s:20:\"Baloo+Thambi:regular\";s:20:\"Baloo Thambi regular\";s:17:\"Balthazar:regular\";s:17:\"Balthazar regular\";s:15:\"Bangers:regular\";s:15:\"Bangers regular\";s:10:\"Barlow:100\";s:10:\"Barlow 100\";s:16:\"Barlow:100italic\";s:16:\"Barlow 100italic\";s:10:\"Barlow:200\";s:10:\"Barlow 200\";s:16:\"Barlow:200italic\";s:16:\"Barlow 200italic\";s:10:\"Barlow:300\";s:10:\"Barlow 300\";s:16:\"Barlow:300italic\";s:16:\"Barlow 300italic\";s:14:\"Barlow:regular\";s:14:\"Barlow regular\";s:13:\"Barlow:italic\";s:13:\"Barlow italic\";s:10:\"Barlow:500\";s:10:\"Barlow 500\";s:16:\"Barlow:500italic\";s:16:\"Barlow 500italic\";s:10:\"Barlow:600\";s:10:\"Barlow 600\";s:16:\"Barlow:600italic\";s:16:\"Barlow 600italic\";s:10:\"Barlow:700\";s:10:\"Barlow 700\";s:16:\"Barlow:700italic\";s:16:\"Barlow 700italic\";s:10:\"Barlow:800\";s:10:\"Barlow 800\";s:16:\"Barlow:800italic\";s:16:\"Barlow 800italic\";s:10:\"Barlow:900\";s:10:\"Barlow 900\";s:16:\"Barlow:900italic\";s:16:\"Barlow 900italic\";s:20:\"Barlow+Condensed:100\";s:20:\"Barlow Condensed 100\";s:26:\"Barlow+Condensed:100italic\";s:26:\"Barlow Condensed 100italic\";s:20:\"Barlow+Condensed:200\";s:20:\"Barlow Condensed 200\";s:26:\"Barlow+Condensed:200italic\";s:26:\"Barlow Condensed 200italic\";s:20:\"Barlow+Condensed:300\";s:20:\"Barlow Condensed 300\";s:26:\"Barlow+Condensed:300italic\";s:26:\"Barlow Condensed 300italic\";s:24:\"Barlow+Condensed:regular\";s:24:\"Barlow Condensed regular\";s:23:\"Barlow+Condensed:italic\";s:23:\"Barlow Condensed italic\";s:20:\"Barlow+Condensed:500\";s:20:\"Barlow Condensed 500\";s:26:\"Barlow+Condensed:500italic\";s:26:\"Barlow Condensed 500italic\";s:20:\"Barlow+Condensed:600\";s:20:\"Barlow Condensed 600\";s:26:\"Barlow+Condensed:600italic\";s:26:\"Barlow Condensed 600italic\";s:20:\"Barlow+Condensed:700\";s:20:\"Barlow Condensed 700\";s:26:\"Barlow+Condensed:700italic\";s:26:\"Barlow Condensed 700italic\";s:20:\"Barlow+Condensed:800\";s:20:\"Barlow Condensed 800\";s:26:\"Barlow+Condensed:800italic\";s:26:\"Barlow Condensed 800italic\";s:20:\"Barlow+Condensed:900\";s:20:\"Barlow Condensed 900\";s:26:\"Barlow+Condensed:900italic\";s:26:\"Barlow Condensed 900italic\";s:25:\"Barlow+Semi+Condensed:100\";s:25:\"Barlow Semi Condensed 100\";s:31:\"Barlow+Semi+Condensed:100italic\";s:31:\"Barlow Semi Condensed 100italic\";s:25:\"Barlow+Semi+Condensed:200\";s:25:\"Barlow Semi Condensed 200\";s:31:\"Barlow+Semi+Condensed:200italic\";s:31:\"Barlow Semi Condensed 200italic\";s:25:\"Barlow+Semi+Condensed:300\";s:25:\"Barlow Semi Condensed 300\";s:31:\"Barlow+Semi+Condensed:300italic\";s:31:\"Barlow Semi Condensed 300italic\";s:29:\"Barlow+Semi+Condensed:regular\";s:29:\"Barlow Semi Condensed regular\";s:28:\"Barlow+Semi+Condensed:italic\";s:28:\"Barlow Semi Condensed italic\";s:25:\"Barlow+Semi+Condensed:500\";s:25:\"Barlow Semi Condensed 500\";s:31:\"Barlow+Semi+Condensed:500italic\";s:31:\"Barlow Semi Condensed 500italic\";s:25:\"Barlow+Semi+Condensed:600\";s:25:\"Barlow Semi Condensed 600\";s:31:\"Barlow+Semi+Condensed:600italic\";s:31:\"Barlow Semi Condensed 600italic\";s:25:\"Barlow+Semi+Condensed:700\";s:25:\"Barlow Semi Condensed 700\";s:31:\"Barlow+Semi+Condensed:700italic\";s:31:\"Barlow Semi Condensed 700italic\";s:25:\"Barlow+Semi+Condensed:800\";s:25:\"Barlow Semi Condensed 800\";s:31:\"Barlow+Semi+Condensed:800italic\";s:31:\"Barlow Semi Condensed 800italic\";s:25:\"Barlow+Semi+Condensed:900\";s:25:\"Barlow Semi Condensed 900\";s:31:\"Barlow+Semi+Condensed:900italic\";s:31:\"Barlow Semi Condensed 900italic\";s:14:\"Barrio:regular\";s:14:\"Barrio regular\";s:13:\"Basic:regular\";s:13:\"Basic regular\";s:18:\"Battambang:regular\";s:18:\"Battambang regular\";s:14:\"Battambang:700\";s:14:\"Battambang 700\";s:15:\"Baumans:regular\";s:15:\"Baumans regular\";s:13:\"Bayon:regular\";s:13:\"Bayon regular\";s:16:\"Belgrano:regular\";s:16:\"Belgrano regular\";s:17:\"Bellefair:regular\";s:17:\"Bellefair regular\";s:15:\"Belleza:regular\";s:15:\"Belleza regular\";s:13:\"BenchNine:300\";s:13:\"BenchNine 300\";s:17:\"BenchNine:regular\";s:17:\"BenchNine regular\";s:13:\"BenchNine:700\";s:13:\"BenchNine 700\";s:15:\"Bentham:regular\";s:15:\"Bentham regular\";s:23:\"Berkshire+Swash:regular\";s:23:\"Berkshire Swash regular\";s:13:\"Bevan:regular\";s:13:\"Bevan regular\";s:21:\"Bigelow+Rules:regular\";s:21:\"Bigelow Rules regular\";s:19:\"Bigshot+One:regular\";s:19:\"Bigshot One regular\";s:13:\"Bilbo:regular\";s:13:\"Bilbo regular\";s:24:\"Bilbo+Swash+Caps:regular\";s:24:\"Bilbo Swash Caps regular\";s:12:\"BioRhyme:200\";s:12:\"BioRhyme 200\";s:12:\"BioRhyme:300\";s:12:\"BioRhyme 300\";s:16:\"BioRhyme:regular\";s:16:\"BioRhyme regular\";s:12:\"BioRhyme:700\";s:12:\"BioRhyme 700\";s:12:\"BioRhyme:800\";s:12:\"BioRhyme 800\";s:21:\"BioRhyme+Expanded:200\";s:21:\"BioRhyme Expanded 200\";s:21:\"BioRhyme+Expanded:300\";s:21:\"BioRhyme Expanded 300\";s:25:\"BioRhyme+Expanded:regular\";s:25:\"BioRhyme Expanded regular\";s:21:\"BioRhyme+Expanded:700\";s:21:\"BioRhyme Expanded 700\";s:21:\"BioRhyme+Expanded:800\";s:21:\"BioRhyme Expanded 800\";s:11:\"Biryani:200\";s:11:\"Biryani 200\";s:11:\"Biryani:300\";s:11:\"Biryani 300\";s:15:\"Biryani:regular\";s:15:\"Biryani regular\";s:11:\"Biryani:600\";s:11:\"Biryani 600\";s:11:\"Biryani:700\";s:11:\"Biryani 700\";s:11:\"Biryani:800\";s:11:\"Biryani 800\";s:11:\"Biryani:900\";s:11:\"Biryani 900\";s:14:\"Bitter:regular\";s:14:\"Bitter regular\";s:13:\"Bitter:italic\";s:13:\"Bitter italic\";s:10:\"Bitter:700\";s:10:\"Bitter 700\";s:31:\"Black+And+White+Picture:regular\";s:31:\"Black And White Picture regular\";s:22:\"Black+Han+Sans:regular\";s:22:\"Black Han Sans regular\";s:21:\"Black+Ops+One:regular\";s:21:\"Black Ops One regular\";s:13:\"Bokor:regular\";s:13:\"Bokor regular\";s:14:\"Bonbon:regular\";s:14:\"Bonbon regular\";s:16:\"Boogaloo:regular\";s:16:\"Boogaloo regular\";s:18:\"Bowlby+One:regular\";s:18:\"Bowlby One regular\";s:21:\"Bowlby+One+SC:regular\";s:21:\"Bowlby One SC regular\";s:15:\"Brawler:regular\";s:15:\"Brawler regular\";s:18:\"Bree+Serif:regular\";s:18:\"Bree Serif regular\";s:22:\"Bubblegum+Sans:regular\";s:22:\"Bubblegum Sans regular\";s:19:\"Bubbler+One:regular\";s:19:\"Bubbler One regular\";s:8:\"Buda:300\";s:8:\"Buda 300\";s:15:\"Buenard:regular\";s:15:\"Buenard regular\";s:11:\"Buenard:700\";s:11:\"Buenard 700\";s:14:\"Bungee:regular\";s:14:\"Bungee regular\";s:23:\"Bungee+Hairline:regular\";s:23:\"Bungee Hairline regular\";s:21:\"Bungee+Inline:regular\";s:21:\"Bungee Inline regular\";s:22:\"Bungee+Outline:regular\";s:22:\"Bungee Outline regular\";s:20:\"Bungee+Shade:regular\";s:20:\"Bungee Shade regular\";s:18:\"Butcherman:regular\";s:18:\"Butcherman regular\";s:22:\"Butterfly+Kids:regular\";s:22:\"Butterfly Kids regular\";s:13:\"Cabin:regular\";s:13:\"Cabin regular\";s:12:\"Cabin:italic\";s:12:\"Cabin italic\";s:9:\"Cabin:500\";s:9:\"Cabin 500\";s:15:\"Cabin:500italic\";s:15:\"Cabin 500italic\";s:9:\"Cabin:600\";s:9:\"Cabin 600\";s:15:\"Cabin:600italic\";s:15:\"Cabin 600italic\";s:9:\"Cabin:700\";s:9:\"Cabin 700\";s:15:\"Cabin:700italic\";s:15:\"Cabin 700italic\";s:23:\"Cabin+Condensed:regular\";s:23:\"Cabin Condensed regular\";s:19:\"Cabin+Condensed:500\";s:19:\"Cabin Condensed 500\";s:19:\"Cabin+Condensed:600\";s:19:\"Cabin Condensed 600\";s:19:\"Cabin+Condensed:700\";s:19:\"Cabin Condensed 700\";s:20:\"Cabin+Sketch:regular\";s:20:\"Cabin Sketch regular\";s:16:\"Cabin+Sketch:700\";s:16:\"Cabin Sketch 700\";s:23:\"Caesar+Dressing:regular\";s:23:\"Caesar Dressing regular\";s:18:\"Cagliostro:regular\";s:18:\"Cagliostro regular\";s:9:\"Cairo:200\";s:9:\"Cairo 200\";s:9:\"Cairo:300\";s:9:\"Cairo 300\";s:13:\"Cairo:regular\";s:13:\"Cairo regular\";s:9:\"Cairo:600\";s:9:\"Cairo 600\";s:9:\"Cairo:700\";s:9:\"Cairo 700\";s:9:\"Cairo:900\";s:9:\"Cairo 900\";s:22:\"Calligraffitti:regular\";s:22:\"Calligraffitti regular\";s:14:\"Cambay:regular\";s:14:\"Cambay regular\";s:13:\"Cambay:italic\";s:13:\"Cambay italic\";s:10:\"Cambay:700\";s:10:\"Cambay 700\";s:16:\"Cambay:700italic\";s:16:\"Cambay 700italic\";s:13:\"Cambo:regular\";s:13:\"Cambo regular\";s:14:\"Candal:regular\";s:14:\"Candal regular\";s:17:\"Cantarell:regular\";s:17:\"Cantarell regular\";s:16:\"Cantarell:italic\";s:16:\"Cantarell italic\";s:13:\"Cantarell:700\";s:13:\"Cantarell 700\";s:19:\"Cantarell:700italic\";s:19:\"Cantarell 700italic\";s:19:\"Cantata+One:regular\";s:19:\"Cantata One regular\";s:19:\"Cantora+One:regular\";s:19:\"Cantora One regular\";s:16:\"Capriola:regular\";s:16:\"Capriola regular\";s:13:\"Cardo:regular\";s:13:\"Cardo regular\";s:12:\"Cardo:italic\";s:12:\"Cardo italic\";s:9:\"Cardo:700\";s:9:\"Cardo 700\";s:13:\"Carme:regular\";s:13:\"Carme regular\";s:22:\"Carrois+Gothic:regular\";s:22:\"Carrois Gothic regular\";s:25:\"Carrois+Gothic+SC:regular\";s:25:\"Carrois Gothic SC regular\";s:18:\"Carter+One:regular\";s:18:\"Carter One regular\";s:13:\"Catamaran:100\";s:13:\"Catamaran 100\";s:13:\"Catamaran:200\";s:13:\"Catamaran 200\";s:13:\"Catamaran:300\";s:13:\"Catamaran 300\";s:17:\"Catamaran:regular\";s:17:\"Catamaran regular\";s:13:\"Catamaran:500\";s:13:\"Catamaran 500\";s:13:\"Catamaran:600\";s:13:\"Catamaran 600\";s:13:\"Catamaran:700\";s:13:\"Catamaran 700\";s:13:\"Catamaran:800\";s:13:\"Catamaran 800\";s:13:\"Catamaran:900\";s:13:\"Catamaran 900\";s:14:\"Caudex:regular\";s:14:\"Caudex regular\";s:13:\"Caudex:italic\";s:13:\"Caudex italic\";s:10:\"Caudex:700\";s:10:\"Caudex 700\";s:16:\"Caudex:700italic\";s:16:\"Caudex 700italic\";s:14:\"Caveat:regular\";s:14:\"Caveat regular\";s:10:\"Caveat:700\";s:10:\"Caveat 700\";s:20:\"Caveat+Brush:regular\";s:20:\"Caveat Brush regular\";s:26:\"Cedarville+Cursive:regular\";s:26:\"Cedarville Cursive regular\";s:19:\"Ceviche+One:regular\";s:19:\"Ceviche One regular\";s:16:\"Chakra+Petch:300\";s:16:\"Chakra Petch 300\";s:22:\"Chakra+Petch:300italic\";s:22:\"Chakra Petch 300italic\";s:20:\"Chakra+Petch:regular\";s:20:\"Chakra Petch regular\";s:19:\"Chakra+Petch:italic\";s:19:\"Chakra Petch italic\";s:16:\"Chakra+Petch:500\";s:16:\"Chakra Petch 500\";s:22:\"Chakra+Petch:500italic\";s:22:\"Chakra Petch 500italic\";s:16:\"Chakra+Petch:600\";s:16:\"Chakra Petch 600\";s:22:\"Chakra+Petch:600italic\";s:22:\"Chakra Petch 600italic\";s:16:\"Chakra+Petch:700\";s:16:\"Chakra Petch 700\";s:22:\"Chakra+Petch:700italic\";s:22:\"Chakra Petch 700italic\";s:10:\"Changa:200\";s:10:\"Changa 200\";s:10:\"Changa:300\";s:10:\"Changa 300\";s:14:\"Changa:regular\";s:14:\"Changa regular\";s:10:\"Changa:500\";s:10:\"Changa 500\";s:10:\"Changa:600\";s:10:\"Changa 600\";s:10:\"Changa:700\";s:10:\"Changa 700\";s:10:\"Changa:800\";s:10:\"Changa 800\";s:18:\"Changa+One:regular\";s:18:\"Changa One regular\";s:17:\"Changa+One:italic\";s:17:\"Changa One italic\";s:14:\"Chango:regular\";s:14:\"Chango regular\";s:13:\"Charm:regular\";s:13:\"Charm regular\";s:9:\"Charm:700\";s:9:\"Charm 700\";s:18:\"Charmonman:regular\";s:18:\"Charmonman regular\";s:14:\"Charmonman:700\";s:14:\"Charmonman 700\";s:12:\"Chathura:100\";s:12:\"Chathura 100\";s:12:\"Chathura:300\";s:12:\"Chathura 300\";s:16:\"Chathura:regular\";s:16:\"Chathura regular\";s:12:\"Chathura:700\";s:12:\"Chathura 700\";s:12:\"Chathura:800\";s:12:\"Chathura 800\";s:26:\"Chau+Philomene+One:regular\";s:26:\"Chau Philomene One regular\";s:25:\"Chau+Philomene+One:italic\";s:25:\"Chau Philomene One italic\";s:17:\"Chela+One:regular\";s:17:\"Chela One regular\";s:22:\"Chelsea+Market:regular\";s:22:\"Chelsea Market regular\";s:14:\"Chenla:regular\";s:14:\"Chenla regular\";s:25:\"Cherry+Cream+Soda:regular\";s:25:\"Cherry Cream Soda regular\";s:20:\"Cherry+Swash:regular\";s:20:\"Cherry Swash regular\";s:16:\"Cherry+Swash:700\";s:16:\"Cherry Swash 700\";s:13:\"Chewy:regular\";s:13:\"Chewy regular\";s:14:\"Chicle:regular\";s:14:\"Chicle regular\";s:9:\"Chivo:300\";s:9:\"Chivo 300\";s:15:\"Chivo:300italic\";s:15:\"Chivo 300italic\";s:13:\"Chivo:regular\";s:13:\"Chivo regular\";s:12:\"Chivo:italic\";s:12:\"Chivo italic\";s:9:\"Chivo:700\";s:9:\"Chivo 700\";s:15:\"Chivo:700italic\";s:15:\"Chivo 700italic\";s:9:\"Chivo:900\";s:9:\"Chivo 900\";s:15:\"Chivo:900italic\";s:15:\"Chivo 900italic\";s:16:\"Chonburi:regular\";s:16:\"Chonburi regular\";s:14:\"Cinzel:regular\";s:14:\"Cinzel regular\";s:10:\"Cinzel:700\";s:10:\"Cinzel 700\";s:10:\"Cinzel:900\";s:10:\"Cinzel 900\";s:25:\"Cinzel+Decorative:regular\";s:25:\"Cinzel Decorative regular\";s:21:\"Cinzel+Decorative:700\";s:21:\"Cinzel Decorative 700\";s:21:\"Cinzel+Decorative:900\";s:21:\"Cinzel Decorative 900\";s:22:\"Clicker+Script:regular\";s:22:\"Clicker Script regular\";s:12:\"Coda:regular\";s:12:\"Coda regular\";s:8:\"Coda:800\";s:8:\"Coda 800\";s:16:\"Coda+Caption:800\";s:16:\"Coda Caption 800\";s:12:\"Codystar:300\";s:12:\"Codystar 300\";s:16:\"Codystar:regular\";s:16:\"Codystar regular\";s:13:\"Coiny:regular\";s:13:\"Coiny regular\";s:13:\"Combo:regular\";s:13:\"Combo regular\";s:13:\"Comfortaa:300\";s:13:\"Comfortaa 300\";s:17:\"Comfortaa:regular\";s:17:\"Comfortaa regular\";s:13:\"Comfortaa:700\";s:13:\"Comfortaa 700\";s:19:\"Coming+Soon:regular\";s:19:\"Coming Soon regular\";s:19:\"Concert+One:regular\";s:19:\"Concert One regular\";s:17:\"Condiment:regular\";s:17:\"Condiment regular\";s:15:\"Content:regular\";s:15:\"Content regular\";s:11:\"Content:700\";s:11:\"Content 700\";s:20:\"Contrail+One:regular\";s:20:\"Contrail One regular\";s:19:\"Convergence:regular\";s:19:\"Convergence regular\";s:14:\"Cookie:regular\";s:14:\"Cookie regular\";s:13:\"Copse:regular\";s:13:\"Copse regular\";s:14:\"Corben:regular\";s:14:\"Corben regular\";s:10:\"Corben:700\";s:10:\"Corben 700\";s:13:\"Cormorant:300\";s:13:\"Cormorant 300\";s:19:\"Cormorant:300italic\";s:19:\"Cormorant 300italic\";s:17:\"Cormorant:regular\";s:17:\"Cormorant regular\";s:16:\"Cormorant:italic\";s:16:\"Cormorant italic\";s:13:\"Cormorant:500\";s:13:\"Cormorant 500\";s:19:\"Cormorant:500italic\";s:19:\"Cormorant 500italic\";s:13:\"Cormorant:600\";s:13:\"Cormorant 600\";s:19:\"Cormorant:600italic\";s:19:\"Cormorant 600italic\";s:13:\"Cormorant:700\";s:13:\"Cormorant 700\";s:19:\"Cormorant:700italic\";s:19:\"Cormorant 700italic\";s:22:\"Cormorant+Garamond:300\";s:22:\"Cormorant Garamond 300\";s:28:\"Cormorant+Garamond:300italic\";s:28:\"Cormorant Garamond 300italic\";s:26:\"Cormorant+Garamond:regular\";s:26:\"Cormorant Garamond regular\";s:25:\"Cormorant+Garamond:italic\";s:25:\"Cormorant Garamond italic\";s:22:\"Cormorant+Garamond:500\";s:22:\"Cormorant Garamond 500\";s:28:\"Cormorant+Garamond:500italic\";s:28:\"Cormorant Garamond 500italic\";s:22:\"Cormorant+Garamond:600\";s:22:\"Cormorant Garamond 600\";s:28:\"Cormorant+Garamond:600italic\";s:28:\"Cormorant Garamond 600italic\";s:22:\"Cormorant+Garamond:700\";s:22:\"Cormorant Garamond 700\";s:28:\"Cormorant+Garamond:700italic\";s:28:\"Cormorant Garamond 700italic\";s:20:\"Cormorant+Infant:300\";s:20:\"Cormorant Infant 300\";s:26:\"Cormorant+Infant:300italic\";s:26:\"Cormorant Infant 300italic\";s:24:\"Cormorant+Infant:regular\";s:24:\"Cormorant Infant regular\";s:23:\"Cormorant+Infant:italic\";s:23:\"Cormorant Infant italic\";s:20:\"Cormorant+Infant:500\";s:20:\"Cormorant Infant 500\";s:26:\"Cormorant+Infant:500italic\";s:26:\"Cormorant Infant 500italic\";s:20:\"Cormorant+Infant:600\";s:20:\"Cormorant Infant 600\";s:26:\"Cormorant+Infant:600italic\";s:26:\"Cormorant Infant 600italic\";s:20:\"Cormorant+Infant:700\";s:20:\"Cormorant Infant 700\";s:26:\"Cormorant+Infant:700italic\";s:26:\"Cormorant Infant 700italic\";s:16:\"Cormorant+SC:300\";s:16:\"Cormorant SC 300\";s:20:\"Cormorant+SC:regular\";s:20:\"Cormorant SC regular\";s:16:\"Cormorant+SC:500\";s:16:\"Cormorant SC 500\";s:16:\"Cormorant+SC:600\";s:16:\"Cormorant SC 600\";s:16:\"Cormorant+SC:700\";s:16:\"Cormorant SC 700\";s:21:\"Cormorant+Unicase:300\";s:21:\"Cormorant Unicase 300\";s:25:\"Cormorant+Unicase:regular\";s:25:\"Cormorant Unicase regular\";s:21:\"Cormorant+Unicase:500\";s:21:\"Cormorant Unicase 500\";s:21:\"Cormorant+Unicase:600\";s:21:\"Cormorant Unicase 600\";s:21:\"Cormorant+Unicase:700\";s:21:\"Cormorant Unicase 700\";s:21:\"Cormorant+Upright:300\";s:21:\"Cormorant Upright 300\";s:25:\"Cormorant+Upright:regular\";s:25:\"Cormorant Upright regular\";s:21:\"Cormorant+Upright:500\";s:21:\"Cormorant Upright 500\";s:21:\"Cormorant+Upright:600\";s:21:\"Cormorant Upright 600\";s:21:\"Cormorant+Upright:700\";s:21:\"Cormorant Upright 700\";s:17:\"Courgette:regular\";s:17:\"Courgette regular\";s:15:\"Cousine:regular\";s:15:\"Cousine regular\";s:14:\"Cousine:italic\";s:14:\"Cousine italic\";s:11:\"Cousine:700\";s:11:\"Cousine 700\";s:17:\"Cousine:700italic\";s:17:\"Cousine 700italic\";s:16:\"Coustard:regular\";s:16:\"Coustard regular\";s:12:\"Coustard:900\";s:12:\"Coustard 900\";s:29:\"Covered+By+Your+Grace:regular\";s:29:\"Covered By Your Grace regular\";s:20:\"Crafty+Girls:regular\";s:20:\"Crafty Girls regular\";s:17:\"Creepster:regular\";s:17:\"Creepster regular\";s:19:\"Crete+Round:regular\";s:19:\"Crete Round regular\";s:18:\"Crete+Round:italic\";s:18:\"Crete Round italic\";s:20:\"Crimson+Text:regular\";s:20:\"Crimson Text regular\";s:19:\"Crimson+Text:italic\";s:19:\"Crimson Text italic\";s:16:\"Crimson+Text:600\";s:16:\"Crimson Text 600\";s:22:\"Crimson+Text:600italic\";s:22:\"Crimson Text 600italic\";s:16:\"Crimson+Text:700\";s:16:\"Crimson Text 700\";s:22:\"Crimson+Text:700italic\";s:22:\"Crimson Text 700italic\";s:21:\"Croissant+One:regular\";s:21:\"Croissant One regular\";s:15:\"Crushed:regular\";s:15:\"Crushed regular\";s:14:\"Cuprum:regular\";s:14:\"Cuprum regular\";s:13:\"Cuprum:italic\";s:13:\"Cuprum italic\";s:10:\"Cuprum:700\";s:10:\"Cuprum 700\";s:16:\"Cuprum:700italic\";s:16:\"Cuprum 700italic\";s:17:\"Cute+Font:regular\";s:17:\"Cute Font regular\";s:14:\"Cutive:regular\";s:14:\"Cutive regular\";s:19:\"Cutive+Mono:regular\";s:19:\"Cutive Mono regular\";s:14:\"Damion:regular\";s:14:\"Damion regular\";s:22:\"Dancing+Script:regular\";s:22:\"Dancing Script regular\";s:18:\"Dancing+Script:700\";s:18:\"Dancing Script 700\";s:15:\"Dangrek:regular\";s:15:\"Dangrek regular\";s:19:\"David+Libre:regular\";s:19:\"David Libre regular\";s:15:\"David+Libre:500\";s:15:\"David Libre 500\";s:15:\"David+Libre:700\";s:15:\"David Libre 700\";s:28:\"Dawning+of+a+New+Day:regular\";s:28:\"Dawning of a New Day regular\";s:16:\"Days+One:regular\";s:16:\"Days One regular\";s:13:\"Dekko:regular\";s:13:\"Dekko regular\";s:14:\"Delius:regular\";s:14:\"Delius regular\";s:25:\"Delius+Swash+Caps:regular\";s:25:\"Delius Swash Caps regular\";s:22:\"Delius+Unicase:regular\";s:22:\"Delius Unicase regular\";s:18:\"Delius+Unicase:700\";s:18:\"Delius Unicase 700\";s:21:\"Della+Respira:regular\";s:21:\"Della Respira regular\";s:16:\"Denk+One:regular\";s:16:\"Denk One regular\";s:18:\"Devonshire:regular\";s:18:\"Devonshire regular\";s:16:\"Dhurjati:regular\";s:16:\"Dhurjati regular\";s:21:\"Didact+Gothic:regular\";s:21:\"Didact Gothic regular\";s:17:\"Diplomata:regular\";s:17:\"Diplomata regular\";s:20:\"Diplomata+SC:regular\";s:20:\"Diplomata SC regular\";s:16:\"Do+Hyeon:regular\";s:16:\"Do Hyeon regular\";s:13:\"Dokdo:regular\";s:13:\"Dokdo regular\";s:14:\"Domine:regular\";s:14:\"Domine regular\";s:10:\"Domine:700\";s:10:\"Domine 700\";s:19:\"Donegal+One:regular\";s:19:\"Donegal One regular\";s:18:\"Doppio+One:regular\";s:18:\"Doppio One regular\";s:13:\"Dorsa:regular\";s:13:\"Dorsa regular\";s:9:\"Dosis:200\";s:9:\"Dosis 200\";s:9:\"Dosis:300\";s:9:\"Dosis 300\";s:13:\"Dosis:regular\";s:13:\"Dosis regular\";s:9:\"Dosis:500\";s:9:\"Dosis 500\";s:9:\"Dosis:600\";s:9:\"Dosis 600\";s:9:\"Dosis:700\";s:9:\"Dosis 700\";s:9:\"Dosis:800\";s:9:\"Dosis 800\";s:19:\"Dr+Sugiyama:regular\";s:19:\"Dr Sugiyama regular\";s:17:\"Duru+Sans:regular\";s:17:\"Duru Sans regular\";s:17:\"Dynalight:regular\";s:17:\"Dynalight regular\";s:19:\"EB+Garamond:regular\";s:19:\"EB Garamond regular\";s:18:\"EB+Garamond:italic\";s:18:\"EB Garamond italic\";s:15:\"EB+Garamond:500\";s:15:\"EB Garamond 500\";s:21:\"EB+Garamond:500italic\";s:21:\"EB Garamond 500italic\";s:15:\"EB+Garamond:600\";s:15:\"EB Garamond 600\";s:21:\"EB+Garamond:600italic\";s:21:\"EB Garamond 600italic\";s:15:\"EB+Garamond:700\";s:15:\"EB Garamond 700\";s:21:\"EB+Garamond:700italic\";s:21:\"EB Garamond 700italic\";s:15:\"EB+Garamond:800\";s:15:\"EB Garamond 800\";s:21:\"EB+Garamond:800italic\";s:21:\"EB Garamond 800italic\";s:18:\"Eagle+Lake:regular\";s:18:\"Eagle Lake regular\";s:22:\"East+Sea+Dokdo:regular\";s:22:\"East Sea Dokdo regular\";s:13:\"Eater:regular\";s:13:\"Eater regular\";s:17:\"Economica:regular\";s:17:\"Economica regular\";s:16:\"Economica:italic\";s:16:\"Economica italic\";s:13:\"Economica:700\";s:13:\"Economica 700\";s:19:\"Economica:700italic\";s:19:\"Economica 700italic\";s:13:\"Eczar:regular\";s:13:\"Eczar regular\";s:9:\"Eczar:500\";s:9:\"Eczar 500\";s:9:\"Eczar:600\";s:9:\"Eczar 600\";s:9:\"Eczar:700\";s:9:\"Eczar 700\";s:9:\"Eczar:800\";s:9:\"Eczar 800\";s:18:\"El+Messiri:regular\";s:18:\"El Messiri regular\";s:14:\"El+Messiri:500\";s:14:\"El Messiri 500\";s:14:\"El+Messiri:600\";s:14:\"El Messiri 600\";s:14:\"El+Messiri:700\";s:14:\"El Messiri 700\";s:19:\"Electrolize:regular\";s:19:\"Electrolize regular\";s:13:\"Elsie:regular\";s:13:\"Elsie regular\";s:9:\"Elsie:900\";s:9:\"Elsie 900\";s:24:\"Elsie+Swash+Caps:regular\";s:24:\"Elsie Swash Caps regular\";s:20:\"Elsie+Swash+Caps:900\";s:20:\"Elsie Swash Caps 900\";s:19:\"Emblema+One:regular\";s:19:\"Emblema One regular\";s:20:\"Emilys+Candy:regular\";s:20:\"Emilys Candy regular\";s:15:\"Encode+Sans:100\";s:15:\"Encode Sans 100\";s:15:\"Encode+Sans:200\";s:15:\"Encode Sans 200\";s:15:\"Encode+Sans:300\";s:15:\"Encode Sans 300\";s:19:\"Encode+Sans:regular\";s:19:\"Encode Sans regular\";s:15:\"Encode+Sans:500\";s:15:\"Encode Sans 500\";s:15:\"Encode+Sans:600\";s:15:\"Encode Sans 600\";s:15:\"Encode+Sans:700\";s:15:\"Encode Sans 700\";s:15:\"Encode+Sans:800\";s:15:\"Encode Sans 800\";s:15:\"Encode+Sans:900\";s:15:\"Encode Sans 900\";s:25:\"Encode+Sans+Condensed:100\";s:25:\"Encode Sans Condensed 100\";s:25:\"Encode+Sans+Condensed:200\";s:25:\"Encode Sans Condensed 200\";s:25:\"Encode+Sans+Condensed:300\";s:25:\"Encode Sans Condensed 300\";s:29:\"Encode+Sans+Condensed:regular\";s:29:\"Encode Sans Condensed regular\";s:25:\"Encode+Sans+Condensed:500\";s:25:\"Encode Sans Condensed 500\";s:25:\"Encode+Sans+Condensed:600\";s:25:\"Encode Sans Condensed 600\";s:25:\"Encode+Sans+Condensed:700\";s:25:\"Encode Sans Condensed 700\";s:25:\"Encode+Sans+Condensed:800\";s:25:\"Encode Sans Condensed 800\";s:25:\"Encode+Sans+Condensed:900\";s:25:\"Encode Sans Condensed 900\";s:24:\"Encode+Sans+Expanded:100\";s:24:\"Encode Sans Expanded 100\";s:24:\"Encode+Sans+Expanded:200\";s:24:\"Encode Sans Expanded 200\";s:24:\"Encode+Sans+Expanded:300\";s:24:\"Encode Sans Expanded 300\";s:28:\"Encode+Sans+Expanded:regular\";s:28:\"Encode Sans Expanded regular\";s:24:\"Encode+Sans+Expanded:500\";s:24:\"Encode Sans Expanded 500\";s:24:\"Encode+Sans+Expanded:600\";s:24:\"Encode Sans Expanded 600\";s:24:\"Encode+Sans+Expanded:700\";s:24:\"Encode Sans Expanded 700\";s:24:\"Encode+Sans+Expanded:800\";s:24:\"Encode Sans Expanded 800\";s:24:\"Encode+Sans+Expanded:900\";s:24:\"Encode Sans Expanded 900\";s:30:\"Encode+Sans+Semi+Condensed:100\";s:30:\"Encode Sans Semi Condensed 100\";s:30:\"Encode+Sans+Semi+Condensed:200\";s:30:\"Encode Sans Semi Condensed 200\";s:30:\"Encode+Sans+Semi+Condensed:300\";s:30:\"Encode Sans Semi Condensed 300\";s:34:\"Encode+Sans+Semi+Condensed:regular\";s:34:\"Encode Sans Semi Condensed regular\";s:30:\"Encode+Sans+Semi+Condensed:500\";s:30:\"Encode Sans Semi Condensed 500\";s:30:\"Encode+Sans+Semi+Condensed:600\";s:30:\"Encode Sans Semi Condensed 600\";s:30:\"Encode+Sans+Semi+Condensed:700\";s:30:\"Encode Sans Semi Condensed 700\";s:30:\"Encode+Sans+Semi+Condensed:800\";s:30:\"Encode Sans Semi Condensed 800\";s:30:\"Encode+Sans+Semi+Condensed:900\";s:30:\"Encode Sans Semi Condensed 900\";s:29:\"Encode+Sans+Semi+Expanded:100\";s:29:\"Encode Sans Semi Expanded 100\";s:29:\"Encode+Sans+Semi+Expanded:200\";s:29:\"Encode Sans Semi Expanded 200\";s:29:\"Encode+Sans+Semi+Expanded:300\";s:29:\"Encode Sans Semi Expanded 300\";s:33:\"Encode+Sans+Semi+Expanded:regular\";s:33:\"Encode Sans Semi Expanded regular\";s:29:\"Encode+Sans+Semi+Expanded:500\";s:29:\"Encode Sans Semi Expanded 500\";s:29:\"Encode+Sans+Semi+Expanded:600\";s:29:\"Encode Sans Semi Expanded 600\";s:29:\"Encode+Sans+Semi+Expanded:700\";s:29:\"Encode Sans Semi Expanded 700\";s:29:\"Encode+Sans+Semi+Expanded:800\";s:29:\"Encode Sans Semi Expanded 800\";s:29:\"Encode+Sans+Semi+Expanded:900\";s:29:\"Encode Sans Semi Expanded 900\";s:18:\"Engagement:regular\";s:18:\"Engagement regular\";s:17:\"Englebert:regular\";s:17:\"Englebert regular\";s:17:\"Enriqueta:regular\";s:17:\"Enriqueta regular\";s:13:\"Enriqueta:700\";s:13:\"Enriqueta 700\";s:17:\"Erica+One:regular\";s:17:\"Erica One regular\";s:15:\"Esteban:regular\";s:15:\"Esteban regular\";s:23:\"Euphoria+Script:regular\";s:23:\"Euphoria Script regular\";s:13:\"Ewert:regular\";s:13:\"Ewert regular\";s:7:\"Exo:100\";s:7:\"Exo 100\";s:13:\"Exo:100italic\";s:13:\"Exo 100italic\";s:7:\"Exo:200\";s:7:\"Exo 200\";s:13:\"Exo:200italic\";s:13:\"Exo 200italic\";s:7:\"Exo:300\";s:7:\"Exo 300\";s:13:\"Exo:300italic\";s:13:\"Exo 300italic\";s:11:\"Exo:regular\";s:11:\"Exo regular\";s:10:\"Exo:italic\";s:10:\"Exo italic\";s:7:\"Exo:500\";s:7:\"Exo 500\";s:13:\"Exo:500italic\";s:13:\"Exo 500italic\";s:7:\"Exo:600\";s:7:\"Exo 600\";s:13:\"Exo:600italic\";s:13:\"Exo 600italic\";s:7:\"Exo:700\";s:7:\"Exo 700\";s:13:\"Exo:700italic\";s:13:\"Exo 700italic\";s:7:\"Exo:800\";s:7:\"Exo 800\";s:13:\"Exo:800italic\";s:13:\"Exo 800italic\";s:7:\"Exo:900\";s:7:\"Exo 900\";s:13:\"Exo:900italic\";s:13:\"Exo 900italic\";s:9:\"Exo+2:100\";s:9:\"Exo 2 100\";s:15:\"Exo+2:100italic\";s:15:\"Exo 2 100italic\";s:9:\"Exo+2:200\";s:9:\"Exo 2 200\";s:15:\"Exo+2:200italic\";s:15:\"Exo 2 200italic\";s:9:\"Exo+2:300\";s:9:\"Exo 2 300\";s:15:\"Exo+2:300italic\";s:15:\"Exo 2 300italic\";s:13:\"Exo+2:regular\";s:13:\"Exo 2 regular\";s:12:\"Exo+2:italic\";s:12:\"Exo 2 italic\";s:9:\"Exo+2:500\";s:9:\"Exo 2 500\";s:15:\"Exo+2:500italic\";s:15:\"Exo 2 500italic\";s:9:\"Exo+2:600\";s:9:\"Exo 2 600\";s:15:\"Exo+2:600italic\";s:15:\"Exo 2 600italic\";s:9:\"Exo+2:700\";s:9:\"Exo 2 700\";s:15:\"Exo+2:700italic\";s:15:\"Exo 2 700italic\";s:9:\"Exo+2:800\";s:9:\"Exo 2 800\";s:15:\"Exo+2:800italic\";s:15:\"Exo 2 800italic\";s:9:\"Exo+2:900\";s:9:\"Exo 2 900\";s:15:\"Exo+2:900italic\";s:15:\"Exo 2 900italic\";s:21:\"Expletus+Sans:regular\";s:21:\"Expletus Sans regular\";s:20:\"Expletus+Sans:italic\";s:20:\"Expletus Sans italic\";s:17:\"Expletus+Sans:500\";s:17:\"Expletus Sans 500\";s:23:\"Expletus+Sans:500italic\";s:23:\"Expletus Sans 500italic\";s:17:\"Expletus+Sans:600\";s:17:\"Expletus Sans 600\";s:23:\"Expletus+Sans:600italic\";s:23:\"Expletus Sans 600italic\";s:17:\"Expletus+Sans:700\";s:17:\"Expletus Sans 700\";s:23:\"Expletus+Sans:700italic\";s:23:\"Expletus Sans 700italic\";s:12:\"Fahkwang:200\";s:12:\"Fahkwang 200\";s:18:\"Fahkwang:200italic\";s:18:\"Fahkwang 200italic\";s:12:\"Fahkwang:300\";s:12:\"Fahkwang 300\";s:18:\"Fahkwang:300italic\";s:18:\"Fahkwang 300italic\";s:16:\"Fahkwang:regular\";s:16:\"Fahkwang regular\";s:15:\"Fahkwang:italic\";s:15:\"Fahkwang italic\";s:12:\"Fahkwang:500\";s:12:\"Fahkwang 500\";s:18:\"Fahkwang:500italic\";s:18:\"Fahkwang 500italic\";s:12:\"Fahkwang:600\";s:12:\"Fahkwang 600\";s:18:\"Fahkwang:600italic\";s:18:\"Fahkwang 600italic\";s:12:\"Fahkwang:700\";s:12:\"Fahkwang 700\";s:18:\"Fahkwang:700italic\";s:18:\"Fahkwang 700italic\";s:20:\"Fanwood+Text:regular\";s:20:\"Fanwood Text regular\";s:19:\"Fanwood+Text:italic\";s:19:\"Fanwood Text italic\";s:14:\"Farsan:regular\";s:14:\"Farsan regular\";s:17:\"Fascinate:regular\";s:17:\"Fascinate regular\";s:24:\"Fascinate+Inline:regular\";s:24:\"Fascinate Inline regular\";s:18:\"Faster+One:regular\";s:18:\"Faster One regular\";s:16:\"Fasthand:regular\";s:16:\"Fasthand regular\";s:17:\"Fauna+One:regular\";s:17:\"Fauna One regular\";s:16:\"Faustina:regular\";s:16:\"Faustina regular\";s:15:\"Faustina:italic\";s:15:\"Faustina italic\";s:12:\"Faustina:500\";s:12:\"Faustina 500\";s:18:\"Faustina:500italic\";s:18:\"Faustina 500italic\";s:12:\"Faustina:600\";s:12:\"Faustina 600\";s:18:\"Faustina:600italic\";s:18:\"Faustina 600italic\";s:12:\"Faustina:700\";s:12:\"Faustina 700\";s:18:\"Faustina:700italic\";s:18:\"Faustina 700italic\";s:16:\"Federant:regular\";s:16:\"Federant regular\";s:14:\"Federo:regular\";s:14:\"Federo regular\";s:14:\"Felipa:regular\";s:14:\"Felipa regular\";s:13:\"Fenix:regular\";s:13:\"Fenix regular\";s:20:\"Finger+Paint:regular\";s:20:\"Finger Paint regular\";s:17:\"Fira+Mono:regular\";s:17:\"Fira Mono regular\";s:13:\"Fira+Mono:500\";s:13:\"Fira Mono 500\";s:13:\"Fira+Mono:700\";s:13:\"Fira Mono 700\";s:13:\"Fira+Sans:100\";s:13:\"Fira Sans 100\";s:19:\"Fira+Sans:100italic\";s:19:\"Fira Sans 100italic\";s:13:\"Fira+Sans:200\";s:13:\"Fira Sans 200\";s:19:\"Fira+Sans:200italic\";s:19:\"Fira Sans 200italic\";s:13:\"Fira+Sans:300\";s:13:\"Fira Sans 300\";s:19:\"Fira+Sans:300italic\";s:19:\"Fira Sans 300italic\";s:17:\"Fira+Sans:regular\";s:17:\"Fira Sans regular\";s:16:\"Fira+Sans:italic\";s:16:\"Fira Sans italic\";s:13:\"Fira+Sans:500\";s:13:\"Fira Sans 500\";s:19:\"Fira+Sans:500italic\";s:19:\"Fira Sans 500italic\";s:13:\"Fira+Sans:600\";s:13:\"Fira Sans 600\";s:19:\"Fira+Sans:600italic\";s:19:\"Fira Sans 600italic\";s:13:\"Fira+Sans:700\";s:13:\"Fira Sans 700\";s:19:\"Fira+Sans:700italic\";s:19:\"Fira Sans 700italic\";s:13:\"Fira+Sans:800\";s:13:\"Fira Sans 800\";s:19:\"Fira+Sans:800italic\";s:19:\"Fira Sans 800italic\";s:13:\"Fira+Sans:900\";s:13:\"Fira Sans 900\";s:19:\"Fira+Sans:900italic\";s:19:\"Fira Sans 900italic\";s:23:\"Fira+Sans+Condensed:100\";s:23:\"Fira Sans Condensed 100\";s:29:\"Fira+Sans+Condensed:100italic\";s:29:\"Fira Sans Condensed 100italic\";s:23:\"Fira+Sans+Condensed:200\";s:23:\"Fira Sans Condensed 200\";s:29:\"Fira+Sans+Condensed:200italic\";s:29:\"Fira Sans Condensed 200italic\";s:23:\"Fira+Sans+Condensed:300\";s:23:\"Fira Sans Condensed 300\";s:29:\"Fira+Sans+Condensed:300italic\";s:29:\"Fira Sans Condensed 300italic\";s:27:\"Fira+Sans+Condensed:regular\";s:27:\"Fira Sans Condensed regular\";s:26:\"Fira+Sans+Condensed:italic\";s:26:\"Fira Sans Condensed italic\";s:23:\"Fira+Sans+Condensed:500\";s:23:\"Fira Sans Condensed 500\";s:29:\"Fira+Sans+Condensed:500italic\";s:29:\"Fira Sans Condensed 500italic\";s:23:\"Fira+Sans+Condensed:600\";s:23:\"Fira Sans Condensed 600\";s:29:\"Fira+Sans+Condensed:600italic\";s:29:\"Fira Sans Condensed 600italic\";s:23:\"Fira+Sans+Condensed:700\";s:23:\"Fira Sans Condensed 700\";s:29:\"Fira+Sans+Condensed:700italic\";s:29:\"Fira Sans Condensed 700italic\";s:23:\"Fira+Sans+Condensed:800\";s:23:\"Fira Sans Condensed 800\";s:29:\"Fira+Sans+Condensed:800italic\";s:29:\"Fira Sans Condensed 800italic\";s:23:\"Fira+Sans+Condensed:900\";s:23:\"Fira Sans Condensed 900\";s:29:\"Fira+Sans+Condensed:900italic\";s:29:\"Fira Sans Condensed 900italic\";s:29:\"Fira+Sans+Extra+Condensed:100\";s:29:\"Fira Sans Extra Condensed 100\";s:35:\"Fira+Sans+Extra+Condensed:100italic\";s:35:\"Fira Sans Extra Condensed 100italic\";s:29:\"Fira+Sans+Extra+Condensed:200\";s:29:\"Fira Sans Extra Condensed 200\";s:35:\"Fira+Sans+Extra+Condensed:200italic\";s:35:\"Fira Sans Extra Condensed 200italic\";s:29:\"Fira+Sans+Extra+Condensed:300\";s:29:\"Fira Sans Extra Condensed 300\";s:35:\"Fira+Sans+Extra+Condensed:300italic\";s:35:\"Fira Sans Extra Condensed 300italic\";s:33:\"Fira+Sans+Extra+Condensed:regular\";s:33:\"Fira Sans Extra Condensed regular\";s:32:\"Fira+Sans+Extra+Condensed:italic\";s:32:\"Fira Sans Extra Condensed italic\";s:29:\"Fira+Sans+Extra+Condensed:500\";s:29:\"Fira Sans Extra Condensed 500\";s:35:\"Fira+Sans+Extra+Condensed:500italic\";s:35:\"Fira Sans Extra Condensed 500italic\";s:29:\"Fira+Sans+Extra+Condensed:600\";s:29:\"Fira Sans Extra Condensed 600\";s:35:\"Fira+Sans+Extra+Condensed:600italic\";s:35:\"Fira Sans Extra Condensed 600italic\";s:29:\"Fira+Sans+Extra+Condensed:700\";s:29:\"Fira Sans Extra Condensed 700\";s:35:\"Fira+Sans+Extra+Condensed:700italic\";s:35:\"Fira Sans Extra Condensed 700italic\";s:29:\"Fira+Sans+Extra+Condensed:800\";s:29:\"Fira Sans Extra Condensed 800\";s:35:\"Fira+Sans+Extra+Condensed:800italic\";s:35:\"Fira Sans Extra Condensed 800italic\";s:29:\"Fira+Sans+Extra+Condensed:900\";s:29:\"Fira Sans Extra Condensed 900\";s:35:\"Fira+Sans+Extra+Condensed:900italic\";s:35:\"Fira Sans Extra Condensed 900italic\";s:18:\"Fjalla+One:regular\";s:18:\"Fjalla One regular\";s:17:\"Fjord+One:regular\";s:17:\"Fjord One regular\";s:12:\"Flamenco:300\";s:12:\"Flamenco 300\";s:16:\"Flamenco:regular\";s:16:\"Flamenco regular\";s:15:\"Flavors:regular\";s:15:\"Flavors regular\";s:18:\"Fondamento:regular\";s:18:\"Fondamento regular\";s:17:\"Fondamento:italic\";s:17:\"Fondamento italic\";s:24:\"Fontdiner+Swanky:regular\";s:24:\"Fontdiner Swanky regular\";s:13:\"Forum:regular\";s:13:\"Forum regular\";s:20:\"Francois+One:regular\";s:20:\"Francois One regular\";s:20:\"Frank+Ruhl+Libre:300\";s:20:\"Frank Ruhl Libre 300\";s:24:\"Frank+Ruhl+Libre:regular\";s:24:\"Frank Ruhl Libre regular\";s:20:\"Frank+Ruhl+Libre:500\";s:20:\"Frank Ruhl Libre 500\";s:20:\"Frank+Ruhl+Libre:700\";s:20:\"Frank Ruhl Libre 700\";s:20:\"Frank+Ruhl+Libre:900\";s:20:\"Frank Ruhl Libre 900\";s:20:\"Freckle+Face:regular\";s:20:\"Freckle Face regular\";s:28:\"Fredericka+the+Great:regular\";s:28:\"Fredericka the Great regular\";s:19:\"Fredoka+One:regular\";s:19:\"Fredoka One regular\";s:16:\"Freehand:regular\";s:16:\"Freehand regular\";s:14:\"Fresca:regular\";s:14:\"Fresca regular\";s:15:\"Frijole:regular\";s:15:\"Frijole regular\";s:15:\"Fruktur:regular\";s:15:\"Fruktur regular\";s:17:\"Fugaz+One:regular\";s:17:\"Fugaz One regular\";s:17:\"GFS+Didot:regular\";s:17:\"GFS Didot regular\";s:23:\"GFS+Neohellenic:regular\";s:23:\"GFS Neohellenic regular\";s:22:\"GFS+Neohellenic:italic\";s:22:\"GFS Neohellenic italic\";s:19:\"GFS+Neohellenic:700\";s:19:\"GFS Neohellenic 700\";s:25:\"GFS+Neohellenic:700italic\";s:25:\"GFS Neohellenic 700italic\";s:16:\"Gabriela:regular\";s:16:\"Gabriela regular\";s:9:\"Gaegu:300\";s:9:\"Gaegu 300\";s:13:\"Gaegu:regular\";s:13:\"Gaegu regular\";s:9:\"Gaegu:700\";s:9:\"Gaegu 700\";s:14:\"Gafata:regular\";s:14:\"Gafata regular\";s:14:\"Galada:regular\";s:14:\"Galada regular\";s:16:\"Galdeano:regular\";s:16:\"Galdeano regular\";s:15:\"Galindo:regular\";s:15:\"Galindo regular\";s:20:\"Gamja+Flower:regular\";s:20:\"Gamja Flower regular\";s:21:\"Gentium+Basic:regular\";s:21:\"Gentium Basic regular\";s:20:\"Gentium+Basic:italic\";s:20:\"Gentium Basic italic\";s:17:\"Gentium+Basic:700\";s:17:\"Gentium Basic 700\";s:23:\"Gentium+Basic:700italic\";s:23:\"Gentium Basic 700italic\";s:26:\"Gentium+Book+Basic:regular\";s:26:\"Gentium Book Basic regular\";s:25:\"Gentium+Book+Basic:italic\";s:25:\"Gentium Book Basic italic\";s:22:\"Gentium+Book+Basic:700\";s:22:\"Gentium Book Basic 700\";s:28:\"Gentium+Book+Basic:700italic\";s:28:\"Gentium Book Basic 700italic\";s:11:\"Geo:regular\";s:11:\"Geo regular\";s:10:\"Geo:italic\";s:10:\"Geo italic\";s:15:\"Geostar:regular\";s:15:\"Geostar regular\";s:20:\"Geostar+Fill:regular\";s:20:\"Geostar Fill regular\";s:20:\"Germania+One:regular\";s:20:\"Germania One regular\";s:14:\"Gidugu:regular\";s:14:\"Gidugu regular\";s:21:\"Gilda+Display:regular\";s:21:\"Gilda Display regular\";s:22:\"Give+You+Glory:regular\";s:22:\"Give You Glory regular\";s:21:\"Glass+Antiqua:regular\";s:21:\"Glass Antiqua regular\";s:14:\"Glegoo:regular\";s:14:\"Glegoo regular\";s:10:\"Glegoo:700\";s:10:\"Glegoo 700\";s:25:\"Gloria+Hallelujah:regular\";s:25:\"Gloria Hallelujah regular\";s:18:\"Goblin+One:regular\";s:18:\"Goblin One regular\";s:18:\"Gochi+Hand:regular\";s:18:\"Gochi Hand regular\";s:16:\"Gorditas:regular\";s:16:\"Gorditas regular\";s:12:\"Gorditas:700\";s:12:\"Gorditas 700\";s:13:\"Gothic+A1:100\";s:13:\"Gothic A1 100\";s:13:\"Gothic+A1:200\";s:13:\"Gothic A1 200\";s:13:\"Gothic+A1:300\";s:13:\"Gothic A1 300\";s:17:\"Gothic+A1:regular\";s:17:\"Gothic A1 regular\";s:13:\"Gothic+A1:500\";s:13:\"Gothic A1 500\";s:13:\"Gothic+A1:600\";s:13:\"Gothic A1 600\";s:13:\"Gothic+A1:700\";s:13:\"Gothic A1 700\";s:13:\"Gothic+A1:800\";s:13:\"Gothic A1 800\";s:13:\"Gothic+A1:900\";s:13:\"Gothic A1 900\";s:29:\"Goudy+Bookletter+1911:regular\";s:29:\"Goudy Bookletter 1911 regular\";s:16:\"Graduate:regular\";s:16:\"Graduate regular\";s:19:\"Grand+Hotel:regular\";s:19:\"Grand Hotel regular\";s:20:\"Gravitas+One:regular\";s:20:\"Gravitas One regular\";s:19:\"Great+Vibes:regular\";s:19:\"Great Vibes regular\";s:14:\"Griffy:regular\";s:14:\"Griffy regular\";s:14:\"Gruppo:regular\";s:14:\"Gruppo regular\";s:13:\"Gudea:regular\";s:13:\"Gudea regular\";s:12:\"Gudea:italic\";s:12:\"Gudea italic\";s:9:\"Gudea:700\";s:9:\"Gudea 700\";s:12:\"Gugi:regular\";s:12:\"Gugi regular\";s:16:\"Gurajada:regular\";s:16:\"Gurajada regular\";s:14:\"Habibi:regular\";s:14:\"Habibi regular\";s:10:\"Halant:300\";s:10:\"Halant 300\";s:14:\"Halant:regular\";s:14:\"Halant regular\";s:10:\"Halant:500\";s:10:\"Halant 500\";s:10:\"Halant:600\";s:10:\"Halant 600\";s:10:\"Halant:700\";s:10:\"Halant 700\";s:23:\"Hammersmith+One:regular\";s:23:\"Hammersmith One regular\";s:15:\"Hanalei:regular\";s:15:\"Hanalei regular\";s:20:\"Hanalei+Fill:regular\";s:20:\"Hanalei Fill regular\";s:15:\"Handlee:regular\";s:15:\"Handlee regular\";s:15:\"Hanuman:regular\";s:15:\"Hanuman regular\";s:11:\"Hanuman:700\";s:11:\"Hanuman 700\";s:20:\"Happy+Monkey:regular\";s:20:\"Happy Monkey regular\";s:17:\"Harmattan:regular\";s:17:\"Harmattan regular\";s:20:\"Headland+One:regular\";s:20:\"Headland One regular\";s:9:\"Heebo:100\";s:9:\"Heebo 100\";s:9:\"Heebo:300\";s:9:\"Heebo 300\";s:13:\"Heebo:regular\";s:13:\"Heebo regular\";s:9:\"Heebo:500\";s:9:\"Heebo 500\";s:9:\"Heebo:700\";s:9:\"Heebo 700\";s:9:\"Heebo:800\";s:9:\"Heebo 800\";s:9:\"Heebo:900\";s:9:\"Heebo 900\";s:19:\"Henny+Penny:regular\";s:19:\"Henny Penny regular\";s:28:\"Herr+Von+Muellerhoff:regular\";s:28:\"Herr Von Muellerhoff regular\";s:17:\"Hi+Melody:regular\";s:17:\"Hi Melody regular\";s:8:\"Hind:300\";s:8:\"Hind 300\";s:12:\"Hind:regular\";s:12:\"Hind regular\";s:8:\"Hind:500\";s:8:\"Hind 500\";s:8:\"Hind:600\";s:8:\"Hind 600\";s:8:\"Hind:700\";s:8:\"Hind 700\";s:15:\"Hind+Guntur:300\";s:15:\"Hind Guntur 300\";s:19:\"Hind+Guntur:regular\";s:19:\"Hind Guntur regular\";s:15:\"Hind+Guntur:500\";s:15:\"Hind Guntur 500\";s:15:\"Hind+Guntur:600\";s:15:\"Hind Guntur 600\";s:15:\"Hind+Guntur:700\";s:15:\"Hind Guntur 700\";s:16:\"Hind+Madurai:300\";s:16:\"Hind Madurai 300\";s:20:\"Hind+Madurai:regular\";s:20:\"Hind Madurai regular\";s:16:\"Hind+Madurai:500\";s:16:\"Hind Madurai 500\";s:16:\"Hind+Madurai:600\";s:16:\"Hind Madurai 600\";s:16:\"Hind+Madurai:700\";s:16:\"Hind Madurai 700\";s:17:\"Hind+Siliguri:300\";s:17:\"Hind Siliguri 300\";s:21:\"Hind+Siliguri:regular\";s:21:\"Hind Siliguri regular\";s:17:\"Hind+Siliguri:500\";s:17:\"Hind Siliguri 500\";s:17:\"Hind+Siliguri:600\";s:17:\"Hind Siliguri 600\";s:17:\"Hind+Siliguri:700\";s:17:\"Hind Siliguri 700\";s:17:\"Hind+Vadodara:300\";s:17:\"Hind Vadodara 300\";s:21:\"Hind+Vadodara:regular\";s:21:\"Hind Vadodara regular\";s:17:\"Hind+Vadodara:500\";s:17:\"Hind Vadodara 500\";s:17:\"Hind+Vadodara:600\";s:17:\"Hind Vadodara 600\";s:17:\"Hind+Vadodara:700\";s:17:\"Hind Vadodara 700\";s:23:\"Holtwood+One+SC:regular\";s:23:\"Holtwood One SC regular\";s:22:\"Homemade+Apple:regular\";s:22:\"Homemade Apple regular\";s:16:\"Homenaje:regular\";s:16:\"Homenaje regular\";s:17:\"IBM+Plex+Mono:100\";s:17:\"IBM Plex Mono 100\";s:23:\"IBM+Plex+Mono:100italic\";s:23:\"IBM Plex Mono 100italic\";s:17:\"IBM+Plex+Mono:200\";s:17:\"IBM Plex Mono 200\";s:23:\"IBM+Plex+Mono:200italic\";s:23:\"IBM Plex Mono 200italic\";s:17:\"IBM+Plex+Mono:300\";s:17:\"IBM Plex Mono 300\";s:23:\"IBM+Plex+Mono:300italic\";s:23:\"IBM Plex Mono 300italic\";s:21:\"IBM+Plex+Mono:regular\";s:21:\"IBM Plex Mono regular\";s:20:\"IBM+Plex+Mono:italic\";s:20:\"IBM Plex Mono italic\";s:17:\"IBM+Plex+Mono:500\";s:17:\"IBM Plex Mono 500\";s:23:\"IBM+Plex+Mono:500italic\";s:23:\"IBM Plex Mono 500italic\";s:17:\"IBM+Plex+Mono:600\";s:17:\"IBM Plex Mono 600\";s:23:\"IBM+Plex+Mono:600italic\";s:23:\"IBM Plex Mono 600italic\";s:17:\"IBM+Plex+Mono:700\";s:17:\"IBM Plex Mono 700\";s:23:\"IBM+Plex+Mono:700italic\";s:23:\"IBM Plex Mono 700italic\";s:17:\"IBM+Plex+Sans:100\";s:17:\"IBM Plex Sans 100\";s:23:\"IBM+Plex+Sans:100italic\";s:23:\"IBM Plex Sans 100italic\";s:17:\"IBM+Plex+Sans:200\";s:17:\"IBM Plex Sans 200\";s:23:\"IBM+Plex+Sans:200italic\";s:23:\"IBM Plex Sans 200italic\";s:17:\"IBM+Plex+Sans:300\";s:17:\"IBM Plex Sans 300\";s:23:\"IBM+Plex+Sans:300italic\";s:23:\"IBM Plex Sans 300italic\";s:21:\"IBM+Plex+Sans:regular\";s:21:\"IBM Plex Sans regular\";s:20:\"IBM+Plex+Sans:italic\";s:20:\"IBM Plex Sans italic\";s:17:\"IBM+Plex+Sans:500\";s:17:\"IBM Plex Sans 500\";s:23:\"IBM+Plex+Sans:500italic\";s:23:\"IBM Plex Sans 500italic\";s:17:\"IBM+Plex+Sans:600\";s:17:\"IBM Plex Sans 600\";s:23:\"IBM+Plex+Sans:600italic\";s:23:\"IBM Plex Sans 600italic\";s:17:\"IBM+Plex+Sans:700\";s:17:\"IBM Plex Sans 700\";s:23:\"IBM+Plex+Sans:700italic\";s:23:\"IBM Plex Sans 700italic\";s:27:\"IBM+Plex+Sans+Condensed:100\";s:27:\"IBM Plex Sans Condensed 100\";s:33:\"IBM+Plex+Sans+Condensed:100italic\";s:33:\"IBM Plex Sans Condensed 100italic\";s:27:\"IBM+Plex+Sans+Condensed:200\";s:27:\"IBM Plex Sans Condensed 200\";s:33:\"IBM+Plex+Sans+Condensed:200italic\";s:33:\"IBM Plex Sans Condensed 200italic\";s:27:\"IBM+Plex+Sans+Condensed:300\";s:27:\"IBM Plex Sans Condensed 300\";s:33:\"IBM+Plex+Sans+Condensed:300italic\";s:33:\"IBM Plex Sans Condensed 300italic\";s:31:\"IBM+Plex+Sans+Condensed:regular\";s:31:\"IBM Plex Sans Condensed regular\";s:30:\"IBM+Plex+Sans+Condensed:italic\";s:30:\"IBM Plex Sans Condensed italic\";s:27:\"IBM+Plex+Sans+Condensed:500\";s:27:\"IBM Plex Sans Condensed 500\";s:33:\"IBM+Plex+Sans+Condensed:500italic\";s:33:\"IBM Plex Sans Condensed 500italic\";s:27:\"IBM+Plex+Sans+Condensed:600\";s:27:\"IBM Plex Sans Condensed 600\";s:33:\"IBM+Plex+Sans+Condensed:600italic\";s:33:\"IBM Plex Sans Condensed 600italic\";s:27:\"IBM+Plex+Sans+Condensed:700\";s:27:\"IBM Plex Sans Condensed 700\";s:33:\"IBM+Plex+Sans+Condensed:700italic\";s:33:\"IBM Plex Sans Condensed 700italic\";s:18:\"IBM+Plex+Serif:100\";s:18:\"IBM Plex Serif 100\";s:24:\"IBM+Plex+Serif:100italic\";s:24:\"IBM Plex Serif 100italic\";s:18:\"IBM+Plex+Serif:200\";s:18:\"IBM Plex Serif 200\";s:24:\"IBM+Plex+Serif:200italic\";s:24:\"IBM Plex Serif 200italic\";s:18:\"IBM+Plex+Serif:300\";s:18:\"IBM Plex Serif 300\";s:24:\"IBM+Plex+Serif:300italic\";s:24:\"IBM Plex Serif 300italic\";s:22:\"IBM+Plex+Serif:regular\";s:22:\"IBM Plex Serif regular\";s:21:\"IBM+Plex+Serif:italic\";s:21:\"IBM Plex Serif italic\";s:18:\"IBM+Plex+Serif:500\";s:18:\"IBM Plex Serif 500\";s:24:\"IBM+Plex+Serif:500italic\";s:24:\"IBM Plex Serif 500italic\";s:18:\"IBM+Plex+Serif:600\";s:18:\"IBM Plex Serif 600\";s:24:\"IBM+Plex+Serif:600italic\";s:24:\"IBM Plex Serif 600italic\";s:18:\"IBM+Plex+Serif:700\";s:18:\"IBM Plex Serif 700\";s:24:\"IBM+Plex+Serif:700italic\";s:24:\"IBM Plex Serif 700italic\";s:23:\"IM+Fell+DW+Pica:regular\";s:23:\"IM Fell DW Pica regular\";s:22:\"IM+Fell+DW+Pica:italic\";s:22:\"IM Fell DW Pica italic\";s:26:\"IM+Fell+DW+Pica+SC:regular\";s:26:\"IM Fell DW Pica SC regular\";s:27:\"IM+Fell+Double+Pica:regular\";s:27:\"IM Fell Double Pica regular\";s:26:\"IM+Fell+Double+Pica:italic\";s:26:\"IM Fell Double Pica italic\";s:30:\"IM+Fell+Double+Pica+SC:regular\";s:30:\"IM Fell Double Pica SC regular\";s:23:\"IM+Fell+English:regular\";s:23:\"IM Fell English regular\";s:22:\"IM+Fell+English:italic\";s:22:\"IM Fell English italic\";s:26:\"IM+Fell+English+SC:regular\";s:26:\"IM Fell English SC regular\";s:28:\"IM+Fell+French+Canon:regular\";s:28:\"IM Fell French Canon regular\";s:27:\"IM+Fell+French+Canon:italic\";s:27:\"IM Fell French Canon italic\";s:31:\"IM+Fell+French+Canon+SC:regular\";s:31:\"IM Fell French Canon SC regular\";s:28:\"IM+Fell+Great+Primer:regular\";s:28:\"IM Fell Great Primer regular\";s:27:\"IM+Fell+Great+Primer:italic\";s:27:\"IM Fell Great Primer italic\";s:31:\"IM+Fell+Great+Primer+SC:regular\";s:31:\"IM Fell Great Primer SC regular\";s:15:\"Iceberg:regular\";s:15:\"Iceberg regular\";s:15:\"Iceland:regular\";s:15:\"Iceland regular\";s:15:\"Imprima:regular\";s:15:\"Imprima regular\";s:19:\"Inconsolata:regular\";s:19:\"Inconsolata regular\";s:15:\"Inconsolata:700\";s:15:\"Inconsolata 700\";s:13:\"Inder:regular\";s:13:\"Inder regular\";s:20:\"Indie+Flower:regular\";s:20:\"Indie Flower regular\";s:13:\"Inika:regular\";s:13:\"Inika regular\";s:9:\"Inika:700\";s:9:\"Inika 700\";s:18:\"Inknut+Antiqua:300\";s:18:\"Inknut Antiqua 300\";s:22:\"Inknut+Antiqua:regular\";s:22:\"Inknut Antiqua regular\";s:18:\"Inknut+Antiqua:500\";s:18:\"Inknut Antiqua 500\";s:18:\"Inknut+Antiqua:600\";s:18:\"Inknut Antiqua 600\";s:18:\"Inknut+Antiqua:700\";s:18:\"Inknut Antiqua 700\";s:18:\"Inknut+Antiqua:800\";s:18:\"Inknut Antiqua 800\";s:18:\"Inknut+Antiqua:900\";s:18:\"Inknut Antiqua 900\";s:20:\"Irish+Grover:regular\";s:20:\"Irish Grover regular\";s:17:\"Istok+Web:regular\";s:17:\"Istok Web regular\";s:16:\"Istok+Web:italic\";s:16:\"Istok Web italic\";s:13:\"Istok+Web:700\";s:13:\"Istok Web 700\";s:19:\"Istok+Web:700italic\";s:19:\"Istok Web 700italic\";s:16:\"Italiana:regular\";s:16:\"Italiana regular\";s:17:\"Italianno:regular\";s:17:\"Italianno regular\";s:12:\"Itim:regular\";s:12:\"Itim regular\";s:24:\"Jacques+Francois:regular\";s:24:\"Jacques Francois regular\";s:31:\"Jacques+Francois+Shadow:regular\";s:31:\"Jacques Francois Shadow regular\";s:13:\"Jaldi:regular\";s:13:\"Jaldi regular\";s:9:\"Jaldi:700\";s:9:\"Jaldi 700\";s:22:\"Jim+Nightshade:regular\";s:22:\"Jim Nightshade regular\";s:18:\"Jockey+One:regular\";s:18:\"Jockey One regular\";s:20:\"Jolly+Lodger:regular\";s:20:\"Jolly Lodger regular\";s:16:\"Jomhuria:regular\";s:16:\"Jomhuria regular\";s:16:\"Josefin+Sans:100\";s:16:\"Josefin Sans 100\";s:22:\"Josefin+Sans:100italic\";s:22:\"Josefin Sans 100italic\";s:16:\"Josefin+Sans:300\";s:16:\"Josefin Sans 300\";s:22:\"Josefin+Sans:300italic\";s:22:\"Josefin Sans 300italic\";s:20:\"Josefin+Sans:regular\";s:20:\"Josefin Sans regular\";s:19:\"Josefin+Sans:italic\";s:19:\"Josefin Sans italic\";s:16:\"Josefin+Sans:600\";s:16:\"Josefin Sans 600\";s:22:\"Josefin+Sans:600italic\";s:22:\"Josefin Sans 600italic\";s:16:\"Josefin+Sans:700\";s:16:\"Josefin Sans 700\";s:22:\"Josefin+Sans:700italic\";s:22:\"Josefin Sans 700italic\";s:16:\"Josefin+Slab:100\";s:16:\"Josefin Slab 100\";s:22:\"Josefin+Slab:100italic\";s:22:\"Josefin Slab 100italic\";s:16:\"Josefin+Slab:300\";s:16:\"Josefin Slab 300\";s:22:\"Josefin+Slab:300italic\";s:22:\"Josefin Slab 300italic\";s:20:\"Josefin+Slab:regular\";s:20:\"Josefin Slab regular\";s:19:\"Josefin+Slab:italic\";s:19:\"Josefin Slab italic\";s:16:\"Josefin+Slab:600\";s:16:\"Josefin Slab 600\";s:22:\"Josefin+Slab:600italic\";s:22:\"Josefin Slab 600italic\";s:16:\"Josefin+Slab:700\";s:16:\"Josefin Slab 700\";s:22:\"Josefin+Slab:700italic\";s:22:\"Josefin Slab 700italic\";s:16:\"Joti+One:regular\";s:16:\"Joti One regular\";s:11:\"Jua:regular\";s:11:\"Jua regular\";s:14:\"Judson:regular\";s:14:\"Judson regular\";s:13:\"Judson:italic\";s:13:\"Judson italic\";s:10:\"Judson:700\";s:10:\"Judson 700\";s:13:\"Julee:regular\";s:13:\"Julee regular\";s:23:\"Julius+Sans+One:regular\";s:23:\"Julius Sans One regular\";s:13:\"Junge:regular\";s:13:\"Junge regular\";s:8:\"Jura:300\";s:8:\"Jura 300\";s:12:\"Jura:regular\";s:12:\"Jura regular\";s:8:\"Jura:500\";s:8:\"Jura 500\";s:8:\"Jura:600\";s:8:\"Jura 600\";s:8:\"Jura:700\";s:8:\"Jura 700\";s:25:\"Just+Another+Hand:regular\";s:25:\"Just Another Hand regular\";s:31:\"Just+Me+Again+Down+Here:regular\";s:31:\"Just Me Again Down Here regular\";s:7:\"K2D:100\";s:7:\"K2D 100\";s:13:\"K2D:100italic\";s:13:\"K2D 100italic\";s:7:\"K2D:200\";s:7:\"K2D 200\";s:13:\"K2D:200italic\";s:13:\"K2D 200italic\";s:7:\"K2D:300\";s:7:\"K2D 300\";s:13:\"K2D:300italic\";s:13:\"K2D 300italic\";s:11:\"K2D:regular\";s:11:\"K2D regular\";s:10:\"K2D:italic\";s:10:\"K2D italic\";s:7:\"K2D:500\";s:7:\"K2D 500\";s:13:\"K2D:500italic\";s:13:\"K2D 500italic\";s:7:\"K2D:600\";s:7:\"K2D 600\";s:13:\"K2D:600italic\";s:13:\"K2D 600italic\";s:7:\"K2D:700\";s:7:\"K2D 700\";s:13:\"K2D:700italic\";s:13:\"K2D 700italic\";s:7:\"K2D:800\";s:7:\"K2D 800\";s:13:\"K2D:800italic\";s:13:\"K2D 800italic\";s:13:\"Kadwa:regular\";s:13:\"Kadwa regular\";s:9:\"Kadwa:700\";s:9:\"Kadwa 700\";s:9:\"Kalam:300\";s:9:\"Kalam 300\";s:13:\"Kalam:regular\";s:13:\"Kalam regular\";s:9:\"Kalam:700\";s:9:\"Kalam 700\";s:15:\"Kameron:regular\";s:15:\"Kameron regular\";s:11:\"Kameron:700\";s:11:\"Kameron 700\";s:9:\"Kanit:100\";s:9:\"Kanit 100\";s:15:\"Kanit:100italic\";s:15:\"Kanit 100italic\";s:9:\"Kanit:200\";s:9:\"Kanit 200\";s:15:\"Kanit:200italic\";s:15:\"Kanit 200italic\";s:9:\"Kanit:300\";s:9:\"Kanit 300\";s:15:\"Kanit:300italic\";s:15:\"Kanit 300italic\";s:13:\"Kanit:regular\";s:13:\"Kanit regular\";s:12:\"Kanit:italic\";s:12:\"Kanit italic\";s:9:\"Kanit:500\";s:9:\"Kanit 500\";s:15:\"Kanit:500italic\";s:15:\"Kanit 500italic\";s:9:\"Kanit:600\";s:9:\"Kanit 600\";s:15:\"Kanit:600italic\";s:15:\"Kanit 600italic\";s:9:\"Kanit:700\";s:9:\"Kanit 700\";s:15:\"Kanit:700italic\";s:15:\"Kanit 700italic\";s:9:\"Kanit:800\";s:9:\"Kanit 800\";s:15:\"Kanit:800italic\";s:15:\"Kanit 800italic\";s:9:\"Kanit:900\";s:9:\"Kanit 900\";s:15:\"Kanit:900italic\";s:15:\"Kanit 900italic\";s:13:\"Kantumruy:300\";s:13:\"Kantumruy 300\";s:17:\"Kantumruy:regular\";s:17:\"Kantumruy regular\";s:13:\"Kantumruy:700\";s:13:\"Kantumruy 700\";s:13:\"Karla:regular\";s:13:\"Karla regular\";s:12:\"Karla:italic\";s:12:\"Karla italic\";s:9:\"Karla:700\";s:9:\"Karla 700\";s:15:\"Karla:700italic\";s:15:\"Karla 700italic\";s:9:\"Karma:300\";s:9:\"Karma 300\";s:13:\"Karma:regular\";s:13:\"Karma regular\";s:9:\"Karma:500\";s:9:\"Karma 500\";s:9:\"Karma:600\";s:9:\"Karma 600\";s:9:\"Karma:700\";s:9:\"Karma 700\";s:15:\"Katibeh:regular\";s:15:\"Katibeh regular\";s:22:\"Kaushan+Script:regular\";s:22:\"Kaushan Script regular\";s:17:\"Kavivanar:regular\";s:17:\"Kavivanar regular\";s:14:\"Kavoon:regular\";s:14:\"Kavoon regular\";s:18:\"Kdam+Thmor:regular\";s:18:\"Kdam Thmor regular\";s:18:\"Keania+One:regular\";s:18:\"Keania One regular\";s:18:\"Kelly+Slab:regular\";s:18:\"Kelly Slab regular\";s:13:\"Kenia:regular\";s:13:\"Kenia regular\";s:9:\"Khand:300\";s:9:\"Khand 300\";s:13:\"Khand:regular\";s:13:\"Khand regular\";s:9:\"Khand:500\";s:9:\"Khand 500\";s:9:\"Khand:600\";s:9:\"Khand 600\";s:9:\"Khand:700\";s:9:\"Khand 700\";s:13:\"Khmer:regular\";s:13:\"Khmer regular\";s:9:\"Khula:300\";s:9:\"Khula 300\";s:13:\"Khula:regular\";s:13:\"Khula regular\";s:9:\"Khula:600\";s:9:\"Khula 600\";s:9:\"Khula:700\";s:9:\"Khula 700\";s:9:\"Khula:800\";s:9:\"Khula 800\";s:22:\"Kirang+Haerang:regular\";s:22:\"Kirang Haerang regular\";s:16:\"Kite+One:regular\";s:16:\"Kite One regular\";s:15:\"Knewave:regular\";s:15:\"Knewave regular\";s:8:\"KoHo:200\";s:8:\"KoHo 200\";s:14:\"KoHo:200italic\";s:14:\"KoHo 200italic\";s:8:\"KoHo:300\";s:8:\"KoHo 300\";s:14:\"KoHo:300italic\";s:14:\"KoHo 300italic\";s:12:\"KoHo:regular\";s:12:\"KoHo regular\";s:11:\"KoHo:italic\";s:11:\"KoHo italic\";s:8:\"KoHo:500\";s:8:\"KoHo 500\";s:14:\"KoHo:500italic\";s:14:\"KoHo 500italic\";s:8:\"KoHo:600\";s:8:\"KoHo 600\";s:14:\"KoHo:600italic\";s:14:\"KoHo 600italic\";s:8:\"KoHo:700\";s:8:\"KoHo 700\";s:14:\"KoHo:700italic\";s:14:\"KoHo 700italic\";s:13:\"Kodchasan:200\";s:13:\"Kodchasan 200\";s:19:\"Kodchasan:200italic\";s:19:\"Kodchasan 200italic\";s:13:\"Kodchasan:300\";s:13:\"Kodchasan 300\";s:19:\"Kodchasan:300italic\";s:19:\"Kodchasan 300italic\";s:17:\"Kodchasan:regular\";s:17:\"Kodchasan regular\";s:16:\"Kodchasan:italic\";s:16:\"Kodchasan italic\";s:13:\"Kodchasan:500\";s:13:\"Kodchasan 500\";s:19:\"Kodchasan:500italic\";s:19:\"Kodchasan 500italic\";s:13:\"Kodchasan:600\";s:13:\"Kodchasan 600\";s:19:\"Kodchasan:600italic\";s:19:\"Kodchasan 600italic\";s:13:\"Kodchasan:700\";s:13:\"Kodchasan 700\";s:19:\"Kodchasan:700italic\";s:19:\"Kodchasan 700italic\";s:14:\"Kosugi:regular\";s:14:\"Kosugi regular\";s:19:\"Kosugi+Maru:regular\";s:19:\"Kosugi Maru regular\";s:17:\"Kotta+One:regular\";s:17:\"Kotta One regular\";s:14:\"Koulen:regular\";s:14:\"Koulen regular\";s:14:\"Kranky:regular\";s:14:\"Kranky regular\";s:9:\"Kreon:300\";s:9:\"Kreon 300\";s:13:\"Kreon:regular\";s:13:\"Kreon regular\";s:9:\"Kreon:700\";s:9:\"Kreon 700\";s:14:\"Kristi:regular\";s:14:\"Kristi regular\";s:17:\"Krona+One:regular\";s:17:\"Krona One regular\";s:8:\"Krub:200\";s:8:\"Krub 200\";s:14:\"Krub:200italic\";s:14:\"Krub 200italic\";s:8:\"Krub:300\";s:8:\"Krub 300\";s:14:\"Krub:300italic\";s:14:\"Krub 300italic\";s:12:\"Krub:regular\";s:12:\"Krub regular\";s:11:\"Krub:italic\";s:11:\"Krub italic\";s:8:\"Krub:500\";s:8:\"Krub 500\";s:14:\"Krub:500italic\";s:14:\"Krub 500italic\";s:8:\"Krub:600\";s:8:\"Krub 600\";s:14:\"Krub:600italic\";s:14:\"Krub 600italic\";s:8:\"Krub:700\";s:8:\"Krub 700\";s:14:\"Krub:700italic\";s:14:\"Krub 700italic\";s:17:\"Kumar+One:regular\";s:17:\"Kumar One regular\";s:25:\"Kumar+One+Outline:regular\";s:25:\"Kumar One Outline regular\";s:14:\"Kurale:regular\";s:14:\"Kurale regular\";s:23:\"La+Belle+Aurore:regular\";s:23:\"La Belle Aurore regular\";s:9:\"Laila:300\";s:9:\"Laila 300\";s:13:\"Laila:regular\";s:13:\"Laila regular\";s:9:\"Laila:500\";s:9:\"Laila 500\";s:9:\"Laila:600\";s:9:\"Laila 600\";s:9:\"Laila:700\";s:9:\"Laila 700\";s:19:\"Lakki+Reddy:regular\";s:19:\"Lakki Reddy regular\";s:15:\"Lalezar:regular\";s:15:\"Lalezar regular\";s:16:\"Lancelot:regular\";s:16:\"Lancelot regular\";s:14:\"Lateef:regular\";s:14:\"Lateef regular\";s:8:\"Lato:100\";s:8:\"Lato 100\";s:14:\"Lato:100italic\";s:14:\"Lato 100italic\";s:8:\"Lato:300\";s:8:\"Lato 300\";s:14:\"Lato:300italic\";s:14:\"Lato 300italic\";s:12:\"Lato:regular\";s:12:\"Lato regular\";s:11:\"Lato:italic\";s:11:\"Lato italic\";s:8:\"Lato:700\";s:8:\"Lato 700\";s:14:\"Lato:700italic\";s:14:\"Lato 700italic\";s:8:\"Lato:900\";s:8:\"Lato 900\";s:14:\"Lato:900italic\";s:14:\"Lato 900italic\";s:21:\"League+Script:regular\";s:21:\"League Script regular\";s:20:\"Leckerli+One:regular\";s:20:\"Leckerli One regular\";s:14:\"Ledger:regular\";s:14:\"Ledger regular\";s:14:\"Lekton:regular\";s:14:\"Lekton regular\";s:13:\"Lekton:italic\";s:13:\"Lekton italic\";s:10:\"Lekton:700\";s:10:\"Lekton 700\";s:13:\"Lemon:regular\";s:13:\"Lemon regular\";s:12:\"Lemonada:300\";s:12:\"Lemonada 300\";s:16:\"Lemonada:regular\";s:16:\"Lemonada regular\";s:12:\"Lemonada:600\";s:12:\"Lemonada 600\";s:12:\"Lemonada:700\";s:12:\"Lemonada 700\";s:25:\"Libre+Barcode+128:regular\";s:25:\"Libre Barcode 128 regular\";s:30:\"Libre+Barcode+128+Text:regular\";s:30:\"Libre Barcode 128 Text regular\";s:24:\"Libre+Barcode+39:regular\";s:24:\"Libre Barcode 39 regular\";s:33:\"Libre+Barcode+39+Extended:regular\";s:33:\"Libre Barcode 39 Extended regular\";s:38:\"Libre+Barcode+39+Extended+Text:regular\";s:38:\"Libre Barcode 39 Extended Text regular\";s:29:\"Libre+Barcode+39+Text:regular\";s:29:\"Libre Barcode 39 Text regular\";s:25:\"Libre+Baskerville:regular\";s:25:\"Libre Baskerville regular\";s:24:\"Libre+Baskerville:italic\";s:24:\"Libre Baskerville italic\";s:21:\"Libre+Baskerville:700\";s:21:\"Libre Baskerville 700\";s:18:\"Libre+Franklin:100\";s:18:\"Libre Franklin 100\";s:24:\"Libre+Franklin:100italic\";s:24:\"Libre Franklin 100italic\";s:18:\"Libre+Franklin:200\";s:18:\"Libre Franklin 200\";s:24:\"Libre+Franklin:200italic\";s:24:\"Libre Franklin 200italic\";s:18:\"Libre+Franklin:300\";s:18:\"Libre Franklin 300\";s:24:\"Libre+Franklin:300italic\";s:24:\"Libre Franklin 300italic\";s:22:\"Libre+Franklin:regular\";s:22:\"Libre Franklin regular\";s:21:\"Libre+Franklin:italic\";s:21:\"Libre Franklin italic\";s:18:\"Libre+Franklin:500\";s:18:\"Libre Franklin 500\";s:24:\"Libre+Franklin:500italic\";s:24:\"Libre Franklin 500italic\";s:18:\"Libre+Franklin:600\";s:18:\"Libre Franklin 600\";s:24:\"Libre+Franklin:600italic\";s:24:\"Libre Franklin 600italic\";s:18:\"Libre+Franklin:700\";s:18:\"Libre Franklin 700\";s:24:\"Libre+Franklin:700italic\";s:24:\"Libre Franklin 700italic\";s:18:\"Libre+Franklin:800\";s:18:\"Libre Franklin 800\";s:24:\"Libre+Franklin:800italic\";s:24:\"Libre Franklin 800italic\";s:18:\"Libre+Franklin:900\";s:18:\"Libre Franklin 900\";s:24:\"Libre+Franklin:900italic\";s:24:\"Libre Franklin 900italic\";s:19:\"Life+Savers:regular\";s:19:\"Life Savers regular\";s:15:\"Life+Savers:700\";s:15:\"Life Savers 700\";s:18:\"Lilita+One:regular\";s:18:\"Lilita One regular\";s:23:\"Lily+Script+One:regular\";s:23:\"Lily Script One regular\";s:17:\"Limelight:regular\";s:17:\"Limelight regular\";s:19:\"Linden+Hill:regular\";s:19:\"Linden Hill regular\";s:18:\"Linden+Hill:italic\";s:18:\"Linden Hill italic\";s:15:\"Lobster:regular\";s:15:\"Lobster regular\";s:19:\"Lobster+Two:regular\";s:19:\"Lobster Two regular\";s:18:\"Lobster+Two:italic\";s:18:\"Lobster Two italic\";s:15:\"Lobster+Two:700\";s:15:\"Lobster Two 700\";s:21:\"Lobster+Two:700italic\";s:21:\"Lobster Two 700italic\";s:24:\"Londrina+Outline:regular\";s:24:\"Londrina Outline regular\";s:23:\"Londrina+Shadow:regular\";s:23:\"Londrina Shadow regular\";s:23:\"Londrina+Sketch:regular\";s:23:\"Londrina Sketch regular\";s:18:\"Londrina+Solid:100\";s:18:\"Londrina Solid 100\";s:18:\"Londrina+Solid:300\";s:18:\"Londrina Solid 300\";s:22:\"Londrina+Solid:regular\";s:22:\"Londrina Solid regular\";s:18:\"Londrina+Solid:900\";s:18:\"Londrina Solid 900\";s:12:\"Lora:regular\";s:12:\"Lora regular\";s:11:\"Lora:italic\";s:11:\"Lora italic\";s:8:\"Lora:700\";s:8:\"Lora 700\";s:14:\"Lora:700italic\";s:14:\"Lora 700italic\";s:29:\"Love+Ya+Like+A+Sister:regular\";s:29:\"Love Ya Like A Sister regular\";s:25:\"Loved+by+the+King:regular\";s:25:\"Loved by the King regular\";s:22:\"Lovers+Quarrel:regular\";s:22:\"Lovers Quarrel regular\";s:20:\"Luckiest+Guy:regular\";s:20:\"Luckiest Guy regular\";s:16:\"Lusitana:regular\";s:16:\"Lusitana regular\";s:12:\"Lusitana:700\";s:12:\"Lusitana 700\";s:15:\"Lustria:regular\";s:15:\"Lustria regular\";s:13:\"M+PLUS+1p:100\";s:13:\"M PLUS 1p 100\";s:13:\"M+PLUS+1p:300\";s:13:\"M PLUS 1p 300\";s:17:\"M+PLUS+1p:regular\";s:17:\"M PLUS 1p regular\";s:13:\"M+PLUS+1p:500\";s:13:\"M PLUS 1p 500\";s:13:\"M+PLUS+1p:700\";s:13:\"M PLUS 1p 700\";s:13:\"M+PLUS+1p:800\";s:13:\"M PLUS 1p 800\";s:13:\"M+PLUS+1p:900\";s:13:\"M PLUS 1p 900\";s:21:\"M+PLUS+Rounded+1c:100\";s:21:\"M PLUS Rounded 1c 100\";s:21:\"M+PLUS+Rounded+1c:300\";s:21:\"M PLUS Rounded 1c 300\";s:25:\"M+PLUS+Rounded+1c:regular\";s:25:\"M PLUS Rounded 1c regular\";s:21:\"M+PLUS+Rounded+1c:500\";s:21:\"M PLUS Rounded 1c 500\";s:21:\"M+PLUS+Rounded+1c:700\";s:21:\"M PLUS Rounded 1c 700\";s:21:\"M+PLUS+Rounded+1c:800\";s:21:\"M PLUS Rounded 1c 800\";s:21:\"M+PLUS+Rounded+1c:900\";s:21:\"M PLUS Rounded 1c 900\";s:15:\"Macondo:regular\";s:15:\"Macondo regular\";s:26:\"Macondo+Swash+Caps:regular\";s:26:\"Macondo Swash Caps regular\";s:8:\"Mada:200\";s:8:\"Mada 200\";s:8:\"Mada:300\";s:8:\"Mada 300\";s:12:\"Mada:regular\";s:12:\"Mada regular\";s:8:\"Mada:500\";s:8:\"Mada 500\";s:8:\"Mada:600\";s:8:\"Mada 600\";s:8:\"Mada:700\";s:8:\"Mada 700\";s:8:\"Mada:900\";s:8:\"Mada 900\";s:13:\"Magra:regular\";s:13:\"Magra regular\";s:9:\"Magra:700\";s:9:\"Magra 700\";s:21:\"Maiden+Orange:regular\";s:21:\"Maiden Orange regular\";s:11:\"Maitree:200\";s:11:\"Maitree 200\";s:11:\"Maitree:300\";s:11:\"Maitree 300\";s:15:\"Maitree:regular\";s:15:\"Maitree regular\";s:11:\"Maitree:500\";s:11:\"Maitree 500\";s:11:\"Maitree:600\";s:11:\"Maitree 600\";s:11:\"Maitree:700\";s:11:\"Maitree 700\";s:26:\"Major+Mono+Display:regular\";s:26:\"Major Mono Display regular\";s:12:\"Mako:regular\";s:12:\"Mako regular\";s:8:\"Mali:200\";s:8:\"Mali 200\";s:14:\"Mali:200italic\";s:14:\"Mali 200italic\";s:8:\"Mali:300\";s:8:\"Mali 300\";s:14:\"Mali:300italic\";s:14:\"Mali 300italic\";s:12:\"Mali:regular\";s:12:\"Mali regular\";s:11:\"Mali:italic\";s:11:\"Mali italic\";s:8:\"Mali:500\";s:8:\"Mali 500\";s:14:\"Mali:500italic\";s:14:\"Mali 500italic\";s:8:\"Mali:600\";s:8:\"Mali 600\";s:14:\"Mali:600italic\";s:14:\"Mali 600italic\";s:8:\"Mali:700\";s:8:\"Mali 700\";s:14:\"Mali:700italic\";s:14:\"Mali 700italic\";s:16:\"Mallanna:regular\";s:16:\"Mallanna regular\";s:15:\"Mandali:regular\";s:15:\"Mandali regular\";s:15:\"Manuale:regular\";s:15:\"Manuale regular\";s:14:\"Manuale:italic\";s:14:\"Manuale italic\";s:11:\"Manuale:500\";s:11:\"Manuale 500\";s:17:\"Manuale:500italic\";s:17:\"Manuale 500italic\";s:11:\"Manuale:600\";s:11:\"Manuale 600\";s:17:\"Manuale:600italic\";s:17:\"Manuale 600italic\";s:11:\"Manuale:700\";s:11:\"Manuale 700\";s:17:\"Manuale:700italic\";s:17:\"Manuale 700italic\";s:17:\"Marcellus:regular\";s:17:\"Marcellus regular\";s:20:\"Marcellus+SC:regular\";s:20:\"Marcellus SC regular\";s:20:\"Marck+Script:regular\";s:20:\"Marck Script regular\";s:17:\"Margarine:regular\";s:17:\"Margarine regular\";s:20:\"Markazi+Text:regular\";s:20:\"Markazi Text regular\";s:16:\"Markazi+Text:500\";s:16:\"Markazi Text 500\";s:16:\"Markazi+Text:600\";s:16:\"Markazi Text 600\";s:16:\"Markazi+Text:700\";s:16:\"Markazi Text 700\";s:17:\"Marko+One:regular\";s:17:\"Marko One regular\";s:16:\"Marmelad:regular\";s:16:\"Marmelad regular\";s:10:\"Martel:200\";s:10:\"Martel 200\";s:10:\"Martel:300\";s:10:\"Martel 300\";s:14:\"Martel:regular\";s:14:\"Martel regular\";s:10:\"Martel:600\";s:10:\"Martel 600\";s:10:\"Martel:700\";s:10:\"Martel 700\";s:10:\"Martel:800\";s:10:\"Martel 800\";s:10:\"Martel:900\";s:10:\"Martel 900\";s:15:\"Martel+Sans:200\";s:15:\"Martel Sans 200\";s:15:\"Martel+Sans:300\";s:15:\"Martel Sans 300\";s:19:\"Martel+Sans:regular\";s:19:\"Martel Sans regular\";s:15:\"Martel+Sans:600\";s:15:\"Martel Sans 600\";s:15:\"Martel+Sans:700\";s:15:\"Martel Sans 700\";s:15:\"Martel+Sans:800\";s:15:\"Martel Sans 800\";s:15:\"Martel+Sans:900\";s:15:\"Martel Sans 900\";s:14:\"Marvel:regular\";s:14:\"Marvel regular\";s:13:\"Marvel:italic\";s:13:\"Marvel italic\";s:10:\"Marvel:700\";s:10:\"Marvel 700\";s:16:\"Marvel:700italic\";s:16:\"Marvel 700italic\";s:12:\"Mate:regular\";s:12:\"Mate regular\";s:11:\"Mate:italic\";s:11:\"Mate italic\";s:15:\"Mate+SC:regular\";s:15:\"Mate SC regular\";s:17:\"Maven+Pro:regular\";s:17:\"Maven Pro regular\";s:13:\"Maven+Pro:500\";s:13:\"Maven Pro 500\";s:13:\"Maven+Pro:700\";s:13:\"Maven Pro 700\";s:13:\"Maven+Pro:900\";s:13:\"Maven Pro 900\";s:15:\"McLaren:regular\";s:15:\"McLaren regular\";s:14:\"Meddon:regular\";s:14:\"Meddon regular\";s:21:\"MedievalSharp:regular\";s:21:\"MedievalSharp regular\";s:18:\"Medula+One:regular\";s:18:\"Medula One regular\";s:20:\"Meera+Inimai:regular\";s:20:\"Meera Inimai regular\";s:14:\"Megrim:regular\";s:14:\"Megrim regular\";s:19:\"Meie+Script:regular\";s:19:\"Meie Script regular\";s:16:\"Merienda:regular\";s:16:\"Merienda regular\";s:12:\"Merienda:700\";s:12:\"Merienda 700\";s:20:\"Merienda+One:regular\";s:20:\"Merienda One regular\";s:16:\"Merriweather:300\";s:16:\"Merriweather 300\";s:22:\"Merriweather:300italic\";s:22:\"Merriweather 300italic\";s:20:\"Merriweather:regular\";s:20:\"Merriweather regular\";s:19:\"Merriweather:italic\";s:19:\"Merriweather italic\";s:16:\"Merriweather:700\";s:16:\"Merriweather 700\";s:22:\"Merriweather:700italic\";s:22:\"Merriweather 700italic\";s:16:\"Merriweather:900\";s:16:\"Merriweather 900\";s:22:\"Merriweather:900italic\";s:22:\"Merriweather 900italic\";s:21:\"Merriweather+Sans:300\";s:21:\"Merriweather Sans 300\";s:27:\"Merriweather+Sans:300italic\";s:27:\"Merriweather Sans 300italic\";s:25:\"Merriweather+Sans:regular\";s:25:\"Merriweather Sans regular\";s:24:\"Merriweather+Sans:italic\";s:24:\"Merriweather Sans italic\";s:21:\"Merriweather+Sans:700\";s:21:\"Merriweather Sans 700\";s:27:\"Merriweather+Sans:700italic\";s:27:\"Merriweather Sans 700italic\";s:21:\"Merriweather+Sans:800\";s:21:\"Merriweather Sans 800\";s:27:\"Merriweather+Sans:800italic\";s:27:\"Merriweather Sans 800italic\";s:13:\"Metal:regular\";s:13:\"Metal regular\";s:19:\"Metal+Mania:regular\";s:19:\"Metal Mania regular\";s:20:\"Metamorphous:regular\";s:20:\"Metamorphous regular\";s:19:\"Metrophobic:regular\";s:19:\"Metrophobic regular\";s:16:\"Michroma:regular\";s:16:\"Michroma regular\";s:15:\"Milonga:regular\";s:15:\"Milonga regular\";s:17:\"Miltonian:regular\";s:17:\"Miltonian regular\";s:24:\"Miltonian+Tattoo:regular\";s:24:\"Miltonian Tattoo regular\";s:12:\"Mina:regular\";s:12:\"Mina regular\";s:8:\"Mina:700\";s:8:\"Mina 700\";s:15:\"Miniver:regular\";s:15:\"Miniver regular\";s:20:\"Miriam+Libre:regular\";s:20:\"Miriam Libre regular\";s:16:\"Miriam+Libre:700\";s:16:\"Miriam Libre 700\";s:13:\"Mirza:regular\";s:13:\"Mirza regular\";s:9:\"Mirza:500\";s:9:\"Mirza 500\";s:9:\"Mirza:600\";s:9:\"Mirza 600\";s:9:\"Mirza:700\";s:9:\"Mirza 700\";s:22:\"Miss+Fajardose:regular\";s:22:\"Miss Fajardose regular\";s:8:\"Mitr:200\";s:8:\"Mitr 200\";s:8:\"Mitr:300\";s:8:\"Mitr 300\";s:12:\"Mitr:regular\";s:12:\"Mitr regular\";s:8:\"Mitr:500\";s:8:\"Mitr 500\";s:8:\"Mitr:600\";s:8:\"Mitr 600\";s:8:\"Mitr:700\";s:8:\"Mitr 700\";s:13:\"Modak:regular\";s:13:\"Modak regular\";s:22:\"Modern+Antiqua:regular\";s:22:\"Modern Antiqua regular\";s:13:\"Mogra:regular\";s:13:\"Mogra regular\";s:15:\"Molengo:regular\";s:15:\"Molengo regular\";s:12:\"Molle:italic\";s:12:\"Molle italic\";s:13:\"Monda:regular\";s:13:\"Monda regular\";s:9:\"Monda:700\";s:9:\"Monda 700\";s:16:\"Monofett:regular\";s:16:\"Monofett regular\";s:15:\"Monoton:regular\";s:15:\"Monoton regular\";s:28:\"Monsieur+La+Doulaise:regular\";s:28:\"Monsieur La Doulaise regular\";s:15:\"Montaga:regular\";s:15:\"Montaga regular\";s:14:\"Montez:regular\";s:14:\"Montez regular\";s:14:\"Montserrat:100\";s:14:\"Montserrat 100\";s:20:\"Montserrat:100italic\";s:20:\"Montserrat 100italic\";s:14:\"Montserrat:200\";s:14:\"Montserrat 200\";s:20:\"Montserrat:200italic\";s:20:\"Montserrat 200italic\";s:14:\"Montserrat:300\";s:14:\"Montserrat 300\";s:20:\"Montserrat:300italic\";s:20:\"Montserrat 300italic\";s:18:\"Montserrat:regular\";s:18:\"Montserrat regular\";s:17:\"Montserrat:italic\";s:17:\"Montserrat italic\";s:14:\"Montserrat:500\";s:14:\"Montserrat 500\";s:20:\"Montserrat:500italic\";s:20:\"Montserrat 500italic\";s:14:\"Montserrat:600\";s:14:\"Montserrat 600\";s:20:\"Montserrat:600italic\";s:20:\"Montserrat 600italic\";s:14:\"Montserrat:700\";s:14:\"Montserrat 700\";s:20:\"Montserrat:700italic\";s:20:\"Montserrat 700italic\";s:14:\"Montserrat:800\";s:14:\"Montserrat 800\";s:20:\"Montserrat:800italic\";s:20:\"Montserrat 800italic\";s:14:\"Montserrat:900\";s:14:\"Montserrat 900\";s:20:\"Montserrat:900italic\";s:20:\"Montserrat 900italic\";s:25:\"Montserrat+Alternates:100\";s:25:\"Montserrat Alternates 100\";s:31:\"Montserrat+Alternates:100italic\";s:31:\"Montserrat Alternates 100italic\";s:25:\"Montserrat+Alternates:200\";s:25:\"Montserrat Alternates 200\";s:31:\"Montserrat+Alternates:200italic\";s:31:\"Montserrat Alternates 200italic\";s:25:\"Montserrat+Alternates:300\";s:25:\"Montserrat Alternates 300\";s:31:\"Montserrat+Alternates:300italic\";s:31:\"Montserrat Alternates 300italic\";s:29:\"Montserrat+Alternates:regular\";s:29:\"Montserrat Alternates regular\";s:28:\"Montserrat+Alternates:italic\";s:28:\"Montserrat Alternates italic\";s:25:\"Montserrat+Alternates:500\";s:25:\"Montserrat Alternates 500\";s:31:\"Montserrat+Alternates:500italic\";s:31:\"Montserrat Alternates 500italic\";s:25:\"Montserrat+Alternates:600\";s:25:\"Montserrat Alternates 600\";s:31:\"Montserrat+Alternates:600italic\";s:31:\"Montserrat Alternates 600italic\";s:25:\"Montserrat+Alternates:700\";s:25:\"Montserrat Alternates 700\";s:31:\"Montserrat+Alternates:700italic\";s:31:\"Montserrat Alternates 700italic\";s:25:\"Montserrat+Alternates:800\";s:25:\"Montserrat Alternates 800\";s:31:\"Montserrat+Alternates:800italic\";s:31:\"Montserrat Alternates 800italic\";s:25:\"Montserrat+Alternates:900\";s:25:\"Montserrat Alternates 900\";s:31:\"Montserrat+Alternates:900italic\";s:31:\"Montserrat Alternates 900italic\";s:28:\"Montserrat+Subrayada:regular\";s:28:\"Montserrat Subrayada regular\";s:24:\"Montserrat+Subrayada:700\";s:24:\"Montserrat Subrayada 700\";s:12:\"Moul:regular\";s:12:\"Moul regular\";s:16:\"Moulpali:regular\";s:16:\"Moulpali regular\";s:30:\"Mountains+of+Christmas:regular\";s:30:\"Mountains of Christmas regular\";s:26:\"Mountains+of+Christmas:700\";s:26:\"Mountains of Christmas 700\";s:21:\"Mouse+Memoirs:regular\";s:21:\"Mouse Memoirs regular\";s:18:\"Mr+Bedfort:regular\";s:18:\"Mr Bedfort regular\";s:16:\"Mr+Dafoe:regular\";s:16:\"Mr Dafoe regular\";s:22:\"Mr+De+Haviland:regular\";s:22:\"Mr De Haviland regular\";s:27:\"Mrs+Saint+Delafield:regular\";s:27:\"Mrs Saint Delafield regular\";s:21:\"Mrs+Sheppards:regular\";s:21:\"Mrs Sheppards regular\";s:9:\"Mukta:200\";s:9:\"Mukta 200\";s:9:\"Mukta:300\";s:9:\"Mukta 300\";s:13:\"Mukta:regular\";s:13:\"Mukta regular\";s:9:\"Mukta:500\";s:9:\"Mukta 500\";s:9:\"Mukta:600\";s:9:\"Mukta 600\";s:9:\"Mukta:700\";s:9:\"Mukta 700\";s:9:\"Mukta:800\";s:9:\"Mukta 800\";s:15:\"Mukta+Mahee:200\";s:15:\"Mukta Mahee 200\";s:15:\"Mukta+Mahee:300\";s:15:\"Mukta Mahee 300\";s:19:\"Mukta+Mahee:regular\";s:19:\"Mukta Mahee regular\";s:15:\"Mukta+Mahee:500\";s:15:\"Mukta Mahee 500\";s:15:\"Mukta+Mahee:600\";s:15:\"Mukta Mahee 600\";s:15:\"Mukta+Mahee:700\";s:15:\"Mukta Mahee 700\";s:15:\"Mukta+Mahee:800\";s:15:\"Mukta Mahee 800\";s:15:\"Mukta+Malar:200\";s:15:\"Mukta Malar 200\";s:15:\"Mukta+Malar:300\";s:15:\"Mukta Malar 300\";s:19:\"Mukta+Malar:regular\";s:19:\"Mukta Malar regular\";s:15:\"Mukta+Malar:500\";s:15:\"Mukta Malar 500\";s:15:\"Mukta+Malar:600\";s:15:\"Mukta Malar 600\";s:15:\"Mukta+Malar:700\";s:15:\"Mukta Malar 700\";s:15:\"Mukta+Malar:800\";s:15:\"Mukta Malar 800\";s:15:\"Mukta+Vaani:200\";s:15:\"Mukta Vaani 200\";s:15:\"Mukta+Vaani:300\";s:15:\"Mukta Vaani 300\";s:19:\"Mukta+Vaani:regular\";s:19:\"Mukta Vaani regular\";s:15:\"Mukta+Vaani:500\";s:15:\"Mukta Vaani 500\";s:15:\"Mukta+Vaani:600\";s:15:\"Mukta Vaani 600\";s:15:\"Mukta+Vaani:700\";s:15:\"Mukta Vaani 700\";s:15:\"Mukta+Vaani:800\";s:15:\"Mukta Vaani 800\";s:8:\"Muli:200\";s:8:\"Muli 200\";s:14:\"Muli:200italic\";s:14:\"Muli 200italic\";s:8:\"Muli:300\";s:8:\"Muli 300\";s:14:\"Muli:300italic\";s:14:\"Muli 300italic\";s:12:\"Muli:regular\";s:12:\"Muli regular\";s:11:\"Muli:italic\";s:11:\"Muli italic\";s:8:\"Muli:600\";s:8:\"Muli 600\";s:14:\"Muli:600italic\";s:14:\"Muli 600italic\";s:8:\"Muli:700\";s:8:\"Muli 700\";s:14:\"Muli:700italic\";s:14:\"Muli 700italic\";s:8:\"Muli:800\";s:8:\"Muli 800\";s:14:\"Muli:800italic\";s:14:\"Muli 800italic\";s:8:\"Muli:900\";s:8:\"Muli 900\";s:14:\"Muli:900italic\";s:14:\"Muli 900italic\";s:21:\"Mystery+Quest:regular\";s:21:\"Mystery Quest regular\";s:11:\"NTR:regular\";s:11:\"NTR regular\";s:26:\"Nanum+Brush+Script:regular\";s:26:\"Nanum Brush Script regular\";s:20:\"Nanum+Gothic:regular\";s:20:\"Nanum Gothic regular\";s:16:\"Nanum+Gothic:700\";s:16:\"Nanum Gothic 700\";s:16:\"Nanum+Gothic:800\";s:16:\"Nanum Gothic 800\";s:27:\"Nanum+Gothic+Coding:regular\";s:27:\"Nanum Gothic Coding regular\";s:23:\"Nanum+Gothic+Coding:700\";s:23:\"Nanum Gothic Coding 700\";s:22:\"Nanum+Myeongjo:regular\";s:22:\"Nanum Myeongjo regular\";s:18:\"Nanum+Myeongjo:700\";s:18:\"Nanum Myeongjo 700\";s:18:\"Nanum+Myeongjo:800\";s:18:\"Nanum Myeongjo 800\";s:24:\"Nanum+Pen+Script:regular\";s:24:\"Nanum Pen Script regular\";s:14:\"Neucha:regular\";s:14:\"Neucha regular\";s:10:\"Neuton:200\";s:10:\"Neuton 200\";s:10:\"Neuton:300\";s:10:\"Neuton 300\";s:14:\"Neuton:regular\";s:14:\"Neuton regular\";s:13:\"Neuton:italic\";s:13:\"Neuton italic\";s:10:\"Neuton:700\";s:10:\"Neuton 700\";s:10:\"Neuton:800\";s:10:\"Neuton 800\";s:18:\"New+Rocker:regular\";s:18:\"New Rocker regular\";s:18:\"News+Cycle:regular\";s:18:\"News Cycle regular\";s:14:\"News+Cycle:700\";s:14:\"News Cycle 700\";s:15:\"Niconne:regular\";s:15:\"Niconne regular\";s:11:\"Niramit:200\";s:11:\"Niramit 200\";s:17:\"Niramit:200italic\";s:17:\"Niramit 200italic\";s:11:\"Niramit:300\";s:11:\"Niramit 300\";s:17:\"Niramit:300italic\";s:17:\"Niramit 300italic\";s:15:\"Niramit:regular\";s:15:\"Niramit regular\";s:14:\"Niramit:italic\";s:14:\"Niramit italic\";s:11:\"Niramit:500\";s:11:\"Niramit 500\";s:17:\"Niramit:500italic\";s:17:\"Niramit 500italic\";s:11:\"Niramit:600\";s:11:\"Niramit 600\";s:17:\"Niramit:600italic\";s:17:\"Niramit 600italic\";s:11:\"Niramit:700\";s:11:\"Niramit 700\";s:17:\"Niramit:700italic\";s:17:\"Niramit 700italic\";s:17:\"Nixie+One:regular\";s:17:\"Nixie One regular\";s:14:\"Nobile:regular\";s:14:\"Nobile regular\";s:13:\"Nobile:italic\";s:13:\"Nobile italic\";s:10:\"Nobile:500\";s:10:\"Nobile 500\";s:16:\"Nobile:500italic\";s:16:\"Nobile 500italic\";s:10:\"Nobile:700\";s:10:\"Nobile 700\";s:16:\"Nobile:700italic\";s:16:\"Nobile 700italic\";s:14:\"Nokora:regular\";s:14:\"Nokora regular\";s:10:\"Nokora:700\";s:10:\"Nokora 700\";s:15:\"Norican:regular\";s:15:\"Norican regular\";s:15:\"Nosifer:regular\";s:15:\"Nosifer regular\";s:15:\"Notable:regular\";s:15:\"Notable regular\";s:28:\"Nothing+You+Could+Do:regular\";s:28:\"Nothing You Could Do regular\";s:20:\"Noticia+Text:regular\";s:20:\"Noticia Text regular\";s:19:\"Noticia+Text:italic\";s:19:\"Noticia Text italic\";s:16:\"Noticia+Text:700\";s:16:\"Noticia Text 700\";s:22:\"Noticia+Text:700italic\";s:22:\"Noticia Text 700italic\";s:17:\"Noto+Sans:regular\";s:17:\"Noto Sans regular\";s:16:\"Noto+Sans:italic\";s:16:\"Noto Sans italic\";s:13:\"Noto+Sans:700\";s:13:\"Noto Sans 700\";s:19:\"Noto+Sans:700italic\";s:19:\"Noto Sans 700italic\";s:16:\"Noto+Sans+JP:100\";s:16:\"Noto Sans JP 100\";s:16:\"Noto+Sans+JP:300\";s:16:\"Noto Sans JP 300\";s:20:\"Noto+Sans+JP:regular\";s:20:\"Noto Sans JP regular\";s:16:\"Noto+Sans+JP:500\";s:16:\"Noto Sans JP 500\";s:16:\"Noto+Sans+JP:700\";s:16:\"Noto Sans JP 700\";s:16:\"Noto+Sans+JP:900\";s:16:\"Noto Sans JP 900\";s:16:\"Noto+Sans+KR:100\";s:16:\"Noto Sans KR 100\";s:16:\"Noto+Sans+KR:300\";s:16:\"Noto Sans KR 300\";s:20:\"Noto+Sans+KR:regular\";s:20:\"Noto Sans KR regular\";s:16:\"Noto+Sans+KR:500\";s:16:\"Noto Sans KR 500\";s:16:\"Noto+Sans+KR:700\";s:16:\"Noto Sans KR 700\";s:16:\"Noto+Sans+KR:900\";s:16:\"Noto Sans KR 900\";s:16:\"Noto+Sans+SC:100\";s:16:\"Noto Sans SC 100\";s:16:\"Noto+Sans+SC:300\";s:16:\"Noto Sans SC 300\";s:20:\"Noto+Sans+SC:regular\";s:20:\"Noto Sans SC regular\";s:16:\"Noto+Sans+SC:500\";s:16:\"Noto Sans SC 500\";s:16:\"Noto+Sans+SC:700\";s:16:\"Noto Sans SC 700\";s:16:\"Noto+Sans+SC:900\";s:16:\"Noto Sans SC 900\";s:16:\"Noto+Sans+TC:100\";s:16:\"Noto Sans TC 100\";s:16:\"Noto+Sans+TC:300\";s:16:\"Noto Sans TC 300\";s:20:\"Noto+Sans+TC:regular\";s:20:\"Noto Sans TC regular\";s:16:\"Noto+Sans+TC:500\";s:16:\"Noto Sans TC 500\";s:16:\"Noto+Sans+TC:700\";s:16:\"Noto Sans TC 700\";s:16:\"Noto+Sans+TC:900\";s:16:\"Noto Sans TC 900\";s:18:\"Noto+Serif:regular\";s:18:\"Noto Serif regular\";s:17:\"Noto+Serif:italic\";s:17:\"Noto Serif italic\";s:14:\"Noto+Serif:700\";s:14:\"Noto Serif 700\";s:20:\"Noto+Serif:700italic\";s:20:\"Noto Serif 700italic\";s:17:\"Noto+Serif+JP:200\";s:17:\"Noto Serif JP 200\";s:17:\"Noto+Serif+JP:300\";s:17:\"Noto Serif JP 300\";s:21:\"Noto+Serif+JP:regular\";s:21:\"Noto Serif JP regular\";s:17:\"Noto+Serif+JP:500\";s:17:\"Noto Serif JP 500\";s:17:\"Noto+Serif+JP:600\";s:17:\"Noto Serif JP 600\";s:17:\"Noto+Serif+JP:700\";s:17:\"Noto Serif JP 700\";s:17:\"Noto+Serif+JP:900\";s:17:\"Noto Serif JP 900\";s:17:\"Noto+Serif+KR:200\";s:17:\"Noto Serif KR 200\";s:17:\"Noto+Serif+KR:300\";s:17:\"Noto Serif KR 300\";s:21:\"Noto+Serif+KR:regular\";s:21:\"Noto Serif KR regular\";s:17:\"Noto+Serif+KR:500\";s:17:\"Noto Serif KR 500\";s:17:\"Noto+Serif+KR:600\";s:17:\"Noto Serif KR 600\";s:17:\"Noto+Serif+KR:700\";s:17:\"Noto Serif KR 700\";s:17:\"Noto+Serif+KR:900\";s:17:\"Noto Serif KR 900\";s:17:\"Noto+Serif+SC:200\";s:17:\"Noto Serif SC 200\";s:17:\"Noto+Serif+SC:300\";s:17:\"Noto Serif SC 300\";s:21:\"Noto+Serif+SC:regular\";s:21:\"Noto Serif SC regular\";s:17:\"Noto+Serif+SC:500\";s:17:\"Noto Serif SC 500\";s:17:\"Noto+Serif+SC:600\";s:17:\"Noto Serif SC 600\";s:17:\"Noto+Serif+SC:700\";s:17:\"Noto Serif SC 700\";s:17:\"Noto+Serif+SC:900\";s:17:\"Noto Serif SC 900\";s:17:\"Noto+Serif+TC:200\";s:17:\"Noto Serif TC 200\";s:17:\"Noto+Serif+TC:300\";s:17:\"Noto Serif TC 300\";s:21:\"Noto+Serif+TC:regular\";s:21:\"Noto Serif TC regular\";s:17:\"Noto+Serif+TC:500\";s:17:\"Noto Serif TC 500\";s:17:\"Noto+Serif+TC:600\";s:17:\"Noto Serif TC 600\";s:17:\"Noto+Serif+TC:700\";s:17:\"Noto Serif TC 700\";s:17:\"Noto+Serif+TC:900\";s:17:\"Noto Serif TC 900\";s:16:\"Nova+Cut:regular\";s:16:\"Nova Cut regular\";s:17:\"Nova+Flat:regular\";s:17:\"Nova Flat regular\";s:17:\"Nova+Mono:regular\";s:17:\"Nova Mono regular\";s:17:\"Nova+Oval:regular\";s:17:\"Nova Oval regular\";s:18:\"Nova+Round:regular\";s:18:\"Nova Round regular\";s:19:\"Nova+Script:regular\";s:19:\"Nova Script regular\";s:17:\"Nova+Slim:regular\";s:17:\"Nova Slim regular\";s:19:\"Nova+Square:regular\";s:19:\"Nova Square regular\";s:14:\"Numans:regular\";s:14:\"Numans regular\";s:10:\"Nunito:200\";s:10:\"Nunito 200\";s:16:\"Nunito:200italic\";s:16:\"Nunito 200italic\";s:10:\"Nunito:300\";s:10:\"Nunito 300\";s:16:\"Nunito:300italic\";s:16:\"Nunito 300italic\";s:14:\"Nunito:regular\";s:14:\"Nunito regular\";s:13:\"Nunito:italic\";s:13:\"Nunito italic\";s:10:\"Nunito:600\";s:10:\"Nunito 600\";s:16:\"Nunito:600italic\";s:16:\"Nunito 600italic\";s:10:\"Nunito:700\";s:10:\"Nunito 700\";s:16:\"Nunito:700italic\";s:16:\"Nunito 700italic\";s:10:\"Nunito:800\";s:10:\"Nunito 800\";s:16:\"Nunito:800italic\";s:16:\"Nunito 800italic\";s:10:\"Nunito:900\";s:10:\"Nunito 900\";s:16:\"Nunito:900italic\";s:16:\"Nunito 900italic\";s:15:\"Nunito+Sans:200\";s:15:\"Nunito Sans 200\";s:21:\"Nunito+Sans:200italic\";s:21:\"Nunito Sans 200italic\";s:15:\"Nunito+Sans:300\";s:15:\"Nunito Sans 300\";s:21:\"Nunito+Sans:300italic\";s:21:\"Nunito Sans 300italic\";s:19:\"Nunito+Sans:regular\";s:19:\"Nunito Sans regular\";s:18:\"Nunito+Sans:italic\";s:18:\"Nunito Sans italic\";s:15:\"Nunito+Sans:600\";s:15:\"Nunito Sans 600\";s:21:\"Nunito+Sans:600italic\";s:21:\"Nunito Sans 600italic\";s:15:\"Nunito+Sans:700\";s:15:\"Nunito Sans 700\";s:21:\"Nunito+Sans:700italic\";s:21:\"Nunito Sans 700italic\";s:15:\"Nunito+Sans:800\";s:15:\"Nunito Sans 800\";s:21:\"Nunito+Sans:800italic\";s:21:\"Nunito Sans 800italic\";s:15:\"Nunito+Sans:900\";s:15:\"Nunito Sans 900\";s:21:\"Nunito+Sans:900italic\";s:21:\"Nunito Sans 900italic\";s:22:\"Odor+Mean+Chey:regular\";s:22:\"Odor Mean Chey regular\";s:15:\"Offside:regular\";s:15:\"Offside regular\";s:23:\"Old+Standard+TT:regular\";s:23:\"Old Standard TT regular\";s:22:\"Old+Standard+TT:italic\";s:22:\"Old Standard TT italic\";s:19:\"Old+Standard+TT:700\";s:19:\"Old Standard TT 700\";s:17:\"Oldenburg:regular\";s:17:\"Oldenburg regular\";s:19:\"Oleo+Script:regular\";s:19:\"Oleo Script regular\";s:15:\"Oleo+Script:700\";s:15:\"Oleo Script 700\";s:30:\"Oleo+Script+Swash+Caps:regular\";s:30:\"Oleo Script Swash Caps regular\";s:26:\"Oleo+Script+Swash+Caps:700\";s:26:\"Oleo Script Swash Caps 700\";s:13:\"Open+Sans:300\";s:13:\"Open Sans 300\";s:19:\"Open+Sans:300italic\";s:19:\"Open Sans 300italic\";s:17:\"Open+Sans:regular\";s:17:\"Open Sans regular\";s:16:\"Open+Sans:italic\";s:16:\"Open Sans italic\";s:13:\"Open+Sans:600\";s:13:\"Open Sans 600\";s:19:\"Open+Sans:600italic\";s:19:\"Open Sans 600italic\";s:13:\"Open+Sans:700\";s:13:\"Open Sans 700\";s:19:\"Open+Sans:700italic\";s:19:\"Open Sans 700italic\";s:13:\"Open+Sans:800\";s:13:\"Open Sans 800\";s:19:\"Open+Sans:800italic\";s:19:\"Open Sans 800italic\";s:23:\"Open+Sans+Condensed:300\";s:23:\"Open Sans Condensed 300\";s:29:\"Open+Sans+Condensed:300italic\";s:29:\"Open Sans Condensed 300italic\";s:23:\"Open+Sans+Condensed:700\";s:23:\"Open Sans Condensed 700\";s:19:\"Oranienbaum:regular\";s:19:\"Oranienbaum regular\";s:16:\"Orbitron:regular\";s:16:\"Orbitron regular\";s:12:\"Orbitron:500\";s:12:\"Orbitron 500\";s:12:\"Orbitron:700\";s:12:\"Orbitron 700\";s:12:\"Orbitron:900\";s:12:\"Orbitron 900\";s:15:\"Oregano:regular\";s:15:\"Oregano regular\";s:14:\"Oregano:italic\";s:14:\"Oregano italic\";s:15:\"Orienta:regular\";s:15:\"Orienta regular\";s:23:\"Original+Surfer:regular\";s:23:\"Original Surfer regular\";s:10:\"Oswald:200\";s:10:\"Oswald 200\";s:10:\"Oswald:300\";s:10:\"Oswald 300\";s:14:\"Oswald:regular\";s:14:\"Oswald regular\";s:10:\"Oswald:500\";s:10:\"Oswald 500\";s:10:\"Oswald:600\";s:10:\"Oswald 600\";s:10:\"Oswald:700\";s:10:\"Oswald 700\";s:24:\"Over+the+Rainbow:regular\";s:24:\"Over the Rainbow regular\";s:16:\"Overlock:regular\";s:16:\"Overlock regular\";s:15:\"Overlock:italic\";s:15:\"Overlock italic\";s:12:\"Overlock:700\";s:12:\"Overlock 700\";s:18:\"Overlock:700italic\";s:18:\"Overlock 700italic\";s:12:\"Overlock:900\";s:12:\"Overlock 900\";s:18:\"Overlock:900italic\";s:18:\"Overlock 900italic\";s:19:\"Overlock+SC:regular\";s:19:\"Overlock SC regular\";s:12:\"Overpass:100\";s:12:\"Overpass 100\";s:18:\"Overpass:100italic\";s:18:\"Overpass 100italic\";s:12:\"Overpass:200\";s:12:\"Overpass 200\";s:18:\"Overpass:200italic\";s:18:\"Overpass 200italic\";s:12:\"Overpass:300\";s:12:\"Overpass 300\";s:18:\"Overpass:300italic\";s:18:\"Overpass 300italic\";s:16:\"Overpass:regular\";s:16:\"Overpass regular\";s:15:\"Overpass:italic\";s:15:\"Overpass italic\";s:12:\"Overpass:600\";s:12:\"Overpass 600\";s:18:\"Overpass:600italic\";s:18:\"Overpass 600italic\";s:12:\"Overpass:700\";s:12:\"Overpass 700\";s:18:\"Overpass:700italic\";s:18:\"Overpass 700italic\";s:12:\"Overpass:800\";s:12:\"Overpass 800\";s:18:\"Overpass:800italic\";s:18:\"Overpass 800italic\";s:12:\"Overpass:900\";s:12:\"Overpass 900\";s:18:\"Overpass:900italic\";s:18:\"Overpass 900italic\";s:17:\"Overpass+Mono:300\";s:17:\"Overpass Mono 300\";s:21:\"Overpass+Mono:regular\";s:21:\"Overpass Mono regular\";s:17:\"Overpass+Mono:600\";s:17:\"Overpass Mono 600\";s:17:\"Overpass+Mono:700\";s:17:\"Overpass Mono 700\";s:11:\"Ovo:regular\";s:11:\"Ovo regular\";s:10:\"Oxygen:300\";s:10:\"Oxygen 300\";s:14:\"Oxygen:regular\";s:14:\"Oxygen regular\";s:10:\"Oxygen:700\";s:10:\"Oxygen 700\";s:19:\"Oxygen+Mono:regular\";s:19:\"Oxygen Mono regular\";s:15:\"PT+Mono:regular\";s:15:\"PT Mono regular\";s:15:\"PT+Sans:regular\";s:15:\"PT Sans regular\";s:14:\"PT+Sans:italic\";s:14:\"PT Sans italic\";s:11:\"PT+Sans:700\";s:11:\"PT Sans 700\";s:17:\"PT+Sans:700italic\";s:17:\"PT Sans 700italic\";s:23:\"PT+Sans+Caption:regular\";s:23:\"PT Sans Caption regular\";s:19:\"PT+Sans+Caption:700\";s:19:\"PT Sans Caption 700\";s:22:\"PT+Sans+Narrow:regular\";s:22:\"PT Sans Narrow regular\";s:18:\"PT+Sans+Narrow:700\";s:18:\"PT Sans Narrow 700\";s:16:\"PT+Serif:regular\";s:16:\"PT Serif regular\";s:15:\"PT+Serif:italic\";s:15:\"PT Serif italic\";s:12:\"PT+Serif:700\";s:12:\"PT Serif 700\";s:18:\"PT+Serif:700italic\";s:18:\"PT Serif 700italic\";s:24:\"PT+Serif+Caption:regular\";s:24:\"PT Serif Caption regular\";s:23:\"PT+Serif+Caption:italic\";s:23:\"PT Serif Caption italic\";s:16:\"Pacifico:regular\";s:16:\"Pacifico regular\";s:14:\"Padauk:regular\";s:14:\"Padauk regular\";s:10:\"Padauk:700\";s:10:\"Padauk 700\";s:13:\"Palanquin:100\";s:13:\"Palanquin 100\";s:13:\"Palanquin:200\";s:13:\"Palanquin 200\";s:13:\"Palanquin:300\";s:13:\"Palanquin 300\";s:17:\"Palanquin:regular\";s:17:\"Palanquin regular\";s:13:\"Palanquin:500\";s:13:\"Palanquin 500\";s:13:\"Palanquin:600\";s:13:\"Palanquin 600\";s:13:\"Palanquin:700\";s:13:\"Palanquin 700\";s:22:\"Palanquin+Dark:regular\";s:22:\"Palanquin Dark regular\";s:18:\"Palanquin+Dark:500\";s:18:\"Palanquin Dark 500\";s:18:\"Palanquin+Dark:600\";s:18:\"Palanquin Dark 600\";s:18:\"Palanquin+Dark:700\";s:18:\"Palanquin Dark 700\";s:16:\"Pangolin:regular\";s:16:\"Pangolin regular\";s:15:\"Paprika:regular\";s:15:\"Paprika regular\";s:18:\"Parisienne:regular\";s:18:\"Parisienne regular\";s:19:\"Passero+One:regular\";s:19:\"Passero One regular\";s:19:\"Passion+One:regular\";s:19:\"Passion One regular\";s:15:\"Passion+One:700\";s:15:\"Passion One 700\";s:15:\"Passion+One:900\";s:15:\"Passion One 900\";s:26:\"Pathway+Gothic+One:regular\";s:26:\"Pathway Gothic One regular\";s:20:\"Patrick+Hand:regular\";s:20:\"Patrick Hand regular\";s:23:\"Patrick+Hand+SC:regular\";s:23:\"Patrick Hand SC regular\";s:15:\"Pattaya:regular\";s:15:\"Pattaya regular\";s:17:\"Patua+One:regular\";s:17:\"Patua One regular\";s:15:\"Pavanam:regular\";s:15:\"Pavanam regular\";s:19:\"Paytone+One:regular\";s:19:\"Paytone One regular\";s:15:\"Peddana:regular\";s:15:\"Peddana regular\";s:15:\"Peralta:regular\";s:15:\"Peralta regular\";s:24:\"Permanent+Marker:regular\";s:24:\"Permanent Marker regular\";s:27:\"Petit+Formal+Script:regular\";s:27:\"Petit Formal Script regular\";s:15:\"Petrona:regular\";s:15:\"Petrona regular\";s:19:\"Philosopher:regular\";s:19:\"Philosopher regular\";s:18:\"Philosopher:italic\";s:18:\"Philosopher italic\";s:15:\"Philosopher:700\";s:15:\"Philosopher 700\";s:21:\"Philosopher:700italic\";s:21:\"Philosopher 700italic\";s:14:\"Piedra:regular\";s:14:\"Piedra regular\";s:21:\"Pinyon+Script:regular\";s:21:\"Pinyon Script regular\";s:18:\"Pirata+One:regular\";s:18:\"Pirata One regular\";s:15:\"Plaster:regular\";s:15:\"Plaster regular\";s:12:\"Play:regular\";s:12:\"Play regular\";s:8:\"Play:700\";s:8:\"Play 700\";s:16:\"Playball:regular\";s:16:\"Playball regular\";s:24:\"Playfair+Display:regular\";s:24:\"Playfair Display regular\";s:23:\"Playfair+Display:italic\";s:23:\"Playfair Display italic\";s:20:\"Playfair+Display:700\";s:20:\"Playfair Display 700\";s:26:\"Playfair+Display:700italic\";s:26:\"Playfair Display 700italic\";s:20:\"Playfair+Display:900\";s:20:\"Playfair Display 900\";s:26:\"Playfair+Display:900italic\";s:26:\"Playfair Display 900italic\";s:27:\"Playfair+Display+SC:regular\";s:27:\"Playfair Display SC regular\";s:26:\"Playfair+Display+SC:italic\";s:26:\"Playfair Display SC italic\";s:23:\"Playfair+Display+SC:700\";s:23:\"Playfair Display SC 700\";s:29:\"Playfair+Display+SC:700italic\";s:29:\"Playfair Display SC 700italic\";s:23:\"Playfair+Display+SC:900\";s:23:\"Playfair Display SC 900\";s:29:\"Playfair+Display+SC:900italic\";s:29:\"Playfair Display SC 900italic\";s:15:\"Podkova:regular\";s:15:\"Podkova regular\";s:11:\"Podkova:500\";s:11:\"Podkova 500\";s:11:\"Podkova:600\";s:11:\"Podkova 600\";s:11:\"Podkova:700\";s:11:\"Podkova 700\";s:11:\"Podkova:800\";s:11:\"Podkova 800\";s:18:\"Poiret+One:regular\";s:18:\"Poiret One regular\";s:18:\"Poller+One:regular\";s:18:\"Poller One regular\";s:12:\"Poly:regular\";s:12:\"Poly regular\";s:11:\"Poly:italic\";s:11:\"Poly italic\";s:16:\"Pompiere:regular\";s:16:\"Pompiere regular\";s:20:\"Pontano+Sans:regular\";s:20:\"Pontano Sans regular\";s:18:\"Poor+Story:regular\";s:18:\"Poor Story regular\";s:11:\"Poppins:100\";s:11:\"Poppins 100\";s:17:\"Poppins:100italic\";s:17:\"Poppins 100italic\";s:11:\"Poppins:200\";s:11:\"Poppins 200\";s:17:\"Poppins:200italic\";s:17:\"Poppins 200italic\";s:11:\"Poppins:300\";s:11:\"Poppins 300\";s:17:\"Poppins:300italic\";s:17:\"Poppins 300italic\";s:15:\"Poppins:regular\";s:15:\"Poppins regular\";s:14:\"Poppins:italic\";s:14:\"Poppins italic\";s:11:\"Poppins:500\";s:11:\"Poppins 500\";s:17:\"Poppins:500italic\";s:17:\"Poppins 500italic\";s:11:\"Poppins:600\";s:11:\"Poppins 600\";s:17:\"Poppins:600italic\";s:17:\"Poppins 600italic\";s:11:\"Poppins:700\";s:11:\"Poppins 700\";s:17:\"Poppins:700italic\";s:17:\"Poppins 700italic\";s:11:\"Poppins:800\";s:11:\"Poppins 800\";s:17:\"Poppins:800italic\";s:17:\"Poppins 800italic\";s:11:\"Poppins:900\";s:11:\"Poppins 900\";s:17:\"Poppins:900italic\";s:17:\"Poppins 900italic\";s:24:\"Port+Lligat+Sans:regular\";s:24:\"Port Lligat Sans regular\";s:24:\"Port+Lligat+Slab:regular\";s:24:\"Port Lligat Slab regular\";s:22:\"Pragati+Narrow:regular\";s:22:\"Pragati Narrow regular\";s:18:\"Pragati+Narrow:700\";s:18:\"Pragati Narrow 700\";s:13:\"Prata:regular\";s:13:\"Prata regular\";s:19:\"Preahvihear:regular\";s:19:\"Preahvihear regular\";s:22:\"Press+Start+2P:regular\";s:22:\"Press Start 2P regular\";s:9:\"Pridi:200\";s:9:\"Pridi 200\";s:9:\"Pridi:300\";s:9:\"Pridi 300\";s:13:\"Pridi:regular\";s:13:\"Pridi regular\";s:9:\"Pridi:500\";s:9:\"Pridi 500\";s:9:\"Pridi:600\";s:9:\"Pridi 600\";s:9:\"Pridi:700\";s:9:\"Pridi 700\";s:22:\"Princess+Sofia:regular\";s:22:\"Princess Sofia regular\";s:16:\"Prociono:regular\";s:16:\"Prociono regular\";s:10:\"Prompt:100\";s:10:\"Prompt 100\";s:16:\"Prompt:100italic\";s:16:\"Prompt 100italic\";s:10:\"Prompt:200\";s:10:\"Prompt 200\";s:16:\"Prompt:200italic\";s:16:\"Prompt 200italic\";s:10:\"Prompt:300\";s:10:\"Prompt 300\";s:16:\"Prompt:300italic\";s:16:\"Prompt 300italic\";s:14:\"Prompt:regular\";s:14:\"Prompt regular\";s:13:\"Prompt:italic\";s:13:\"Prompt italic\";s:10:\"Prompt:500\";s:10:\"Prompt 500\";s:16:\"Prompt:500italic\";s:16:\"Prompt 500italic\";s:10:\"Prompt:600\";s:10:\"Prompt 600\";s:16:\"Prompt:600italic\";s:16:\"Prompt 600italic\";s:10:\"Prompt:700\";s:10:\"Prompt 700\";s:16:\"Prompt:700italic\";s:16:\"Prompt 700italic\";s:10:\"Prompt:800\";s:10:\"Prompt 800\";s:16:\"Prompt:800italic\";s:16:\"Prompt 800italic\";s:10:\"Prompt:900\";s:10:\"Prompt 900\";s:16:\"Prompt:900italic\";s:16:\"Prompt 900italic\";s:18:\"Prosto+One:regular\";s:18:\"Prosto One regular\";s:19:\"Proza+Libre:regular\";s:19:\"Proza Libre regular\";s:18:\"Proza+Libre:italic\";s:18:\"Proza Libre italic\";s:15:\"Proza+Libre:500\";s:15:\"Proza Libre 500\";s:21:\"Proza+Libre:500italic\";s:21:\"Proza Libre 500italic\";s:15:\"Proza+Libre:600\";s:15:\"Proza Libre 600\";s:21:\"Proza+Libre:600italic\";s:21:\"Proza Libre 600italic\";s:15:\"Proza+Libre:700\";s:15:\"Proza Libre 700\";s:21:\"Proza+Libre:700italic\";s:21:\"Proza Libre 700italic\";s:15:\"Proza+Libre:800\";s:15:\"Proza Libre 800\";s:21:\"Proza+Libre:800italic\";s:21:\"Proza Libre 800italic\";s:15:\"Puritan:regular\";s:15:\"Puritan regular\";s:14:\"Puritan:italic\";s:14:\"Puritan italic\";s:11:\"Puritan:700\";s:11:\"Puritan 700\";s:17:\"Puritan:700italic\";s:17:\"Puritan 700italic\";s:20:\"Purple+Purse:regular\";s:20:\"Purple Purse regular\";s:14:\"Quando:regular\";s:14:\"Quando regular\";s:16:\"Quantico:regular\";s:16:\"Quantico regular\";s:15:\"Quantico:italic\";s:15:\"Quantico italic\";s:12:\"Quantico:700\";s:12:\"Quantico 700\";s:18:\"Quantico:700italic\";s:18:\"Quantico 700italic\";s:20:\"Quattrocento:regular\";s:20:\"Quattrocento regular\";s:16:\"Quattrocento:700\";s:16:\"Quattrocento 700\";s:25:\"Quattrocento+Sans:regular\";s:25:\"Quattrocento Sans regular\";s:24:\"Quattrocento+Sans:italic\";s:24:\"Quattrocento Sans italic\";s:21:\"Quattrocento+Sans:700\";s:21:\"Quattrocento Sans 700\";s:27:\"Quattrocento+Sans:700italic\";s:27:\"Quattrocento Sans 700italic\";s:17:\"Questrial:regular\";s:17:\"Questrial regular\";s:13:\"Quicksand:300\";s:13:\"Quicksand 300\";s:17:\"Quicksand:regular\";s:17:\"Quicksand regular\";s:13:\"Quicksand:500\";s:13:\"Quicksand 500\";s:13:\"Quicksand:700\";s:13:\"Quicksand 700\";s:22:\"Quintessential:regular\";s:22:\"Quintessential regular\";s:15:\"Qwigley:regular\";s:15:\"Qwigley regular\";s:23:\"Racing+Sans+One:regular\";s:23:\"Racing Sans One regular\";s:14:\"Radley:regular\";s:14:\"Radley regular\";s:13:\"Radley:italic\";s:13:\"Radley italic\";s:12:\"Rajdhani:300\";s:12:\"Rajdhani 300\";s:16:\"Rajdhani:regular\";s:16:\"Rajdhani regular\";s:12:\"Rajdhani:500\";s:12:\"Rajdhani 500\";s:12:\"Rajdhani:600\";s:12:\"Rajdhani 600\";s:12:\"Rajdhani:700\";s:12:\"Rajdhani 700\";s:14:\"Rakkas:regular\";s:14:\"Rakkas regular\";s:11:\"Raleway:100\";s:11:\"Raleway 100\";s:17:\"Raleway:100italic\";s:17:\"Raleway 100italic\";s:11:\"Raleway:200\";s:11:\"Raleway 200\";s:17:\"Raleway:200italic\";s:17:\"Raleway 200italic\";s:11:\"Raleway:300\";s:11:\"Raleway 300\";s:17:\"Raleway:300italic\";s:17:\"Raleway 300italic\";s:15:\"Raleway:regular\";s:15:\"Raleway regular\";s:14:\"Raleway:italic\";s:14:\"Raleway italic\";s:11:\"Raleway:500\";s:11:\"Raleway 500\";s:17:\"Raleway:500italic\";s:17:\"Raleway 500italic\";s:11:\"Raleway:600\";s:11:\"Raleway 600\";s:17:\"Raleway:600italic\";s:17:\"Raleway 600italic\";s:11:\"Raleway:700\";s:11:\"Raleway 700\";s:17:\"Raleway:700italic\";s:17:\"Raleway 700italic\";s:11:\"Raleway:800\";s:11:\"Raleway 800\";s:17:\"Raleway:800italic\";s:17:\"Raleway 800italic\";s:11:\"Raleway:900\";s:11:\"Raleway 900\";s:17:\"Raleway:900italic\";s:17:\"Raleway 900italic\";s:20:\"Raleway+Dots:regular\";s:20:\"Raleway Dots regular\";s:18:\"Ramabhadra:regular\";s:18:\"Ramabhadra regular\";s:16:\"Ramaraja:regular\";s:16:\"Ramaraja regular\";s:14:\"Rambla:regular\";s:14:\"Rambla regular\";s:13:\"Rambla:italic\";s:13:\"Rambla italic\";s:10:\"Rambla:700\";s:10:\"Rambla 700\";s:16:\"Rambla:700italic\";s:16:\"Rambla 700italic\";s:20:\"Rammetto+One:regular\";s:20:\"Rammetto One regular\";s:16:\"Ranchers:regular\";s:16:\"Ranchers regular\";s:14:\"Rancho:regular\";s:14:\"Rancho regular\";s:13:\"Ranga:regular\";s:13:\"Ranga regular\";s:9:\"Ranga:700\";s:9:\"Ranga 700\";s:8:\"Rasa:300\";s:8:\"Rasa 300\";s:12:\"Rasa:regular\";s:12:\"Rasa regular\";s:8:\"Rasa:500\";s:8:\"Rasa 500\";s:8:\"Rasa:600\";s:8:\"Rasa 600\";s:8:\"Rasa:700\";s:8:\"Rasa 700\";s:17:\"Rationale:regular\";s:17:\"Rationale regular\";s:20:\"Ravi+Prakash:regular\";s:20:\"Ravi Prakash regular\";s:17:\"Redressed:regular\";s:17:\"Redressed regular\";s:17:\"Reem+Kufi:regular\";s:17:\"Reem Kufi regular\";s:21:\"Reenie+Beanie:regular\";s:21:\"Reenie Beanie regular\";s:15:\"Revalia:regular\";s:15:\"Revalia regular\";s:21:\"Rhodium+Libre:regular\";s:21:\"Rhodium Libre regular\";s:14:\"Ribeye:regular\";s:14:\"Ribeye regular\";s:21:\"Ribeye+Marrow:regular\";s:21:\"Ribeye Marrow regular\";s:17:\"Righteous:regular\";s:17:\"Righteous regular\";s:14:\"Risque:regular\";s:14:\"Risque regular\";s:10:\"Roboto:100\";s:10:\"Roboto 100\";s:16:\"Roboto:100italic\";s:16:\"Roboto 100italic\";s:10:\"Roboto:300\";s:10:\"Roboto 300\";s:16:\"Roboto:300italic\";s:16:\"Roboto 300italic\";s:14:\"Roboto:regular\";s:14:\"Roboto regular\";s:13:\"Roboto:italic\";s:13:\"Roboto italic\";s:10:\"Roboto:500\";s:10:\"Roboto 500\";s:16:\"Roboto:500italic\";s:16:\"Roboto 500italic\";s:10:\"Roboto:700\";s:10:\"Roboto 700\";s:16:\"Roboto:700italic\";s:16:\"Roboto 700italic\";s:10:\"Roboto:900\";s:10:\"Roboto 900\";s:16:\"Roboto:900italic\";s:16:\"Roboto 900italic\";s:20:\"Roboto+Condensed:300\";s:20:\"Roboto Condensed 300\";s:26:\"Roboto+Condensed:300italic\";s:26:\"Roboto Condensed 300italic\";s:24:\"Roboto+Condensed:regular\";s:24:\"Roboto Condensed regular\";s:23:\"Roboto+Condensed:italic\";s:23:\"Roboto Condensed italic\";s:20:\"Roboto+Condensed:700\";s:20:\"Roboto Condensed 700\";s:26:\"Roboto+Condensed:700italic\";s:26:\"Roboto Condensed 700italic\";s:15:\"Roboto+Mono:100\";s:15:\"Roboto Mono 100\";s:21:\"Roboto+Mono:100italic\";s:21:\"Roboto Mono 100italic\";s:15:\"Roboto+Mono:300\";s:15:\"Roboto Mono 300\";s:21:\"Roboto+Mono:300italic\";s:21:\"Roboto Mono 300italic\";s:19:\"Roboto+Mono:regular\";s:19:\"Roboto Mono regular\";s:18:\"Roboto+Mono:italic\";s:18:\"Roboto Mono italic\";s:15:\"Roboto+Mono:500\";s:15:\"Roboto Mono 500\";s:21:\"Roboto+Mono:500italic\";s:21:\"Roboto Mono 500italic\";s:15:\"Roboto+Mono:700\";s:15:\"Roboto Mono 700\";s:21:\"Roboto+Mono:700italic\";s:21:\"Roboto Mono 700italic\";s:15:\"Roboto+Slab:100\";s:15:\"Roboto Slab 100\";s:15:\"Roboto+Slab:300\";s:15:\"Roboto Slab 300\";s:19:\"Roboto+Slab:regular\";s:19:\"Roboto Slab regular\";s:15:\"Roboto+Slab:700\";s:15:\"Roboto Slab 700\";s:17:\"Rochester:regular\";s:17:\"Rochester regular\";s:17:\"Rock+Salt:regular\";s:17:\"Rock Salt regular\";s:11:\"Rokkitt:100\";s:11:\"Rokkitt 100\";s:11:\"Rokkitt:200\";s:11:\"Rokkitt 200\";s:11:\"Rokkitt:300\";s:11:\"Rokkitt 300\";s:15:\"Rokkitt:regular\";s:15:\"Rokkitt regular\";s:11:\"Rokkitt:500\";s:11:\"Rokkitt 500\";s:11:\"Rokkitt:600\";s:11:\"Rokkitt 600\";s:11:\"Rokkitt:700\";s:11:\"Rokkitt 700\";s:11:\"Rokkitt:800\";s:11:\"Rokkitt 800\";s:11:\"Rokkitt:900\";s:11:\"Rokkitt 900\";s:17:\"Romanesco:regular\";s:17:\"Romanesco regular\";s:17:\"Ropa+Sans:regular\";s:17:\"Ropa Sans regular\";s:16:\"Ropa+Sans:italic\";s:16:\"Ropa Sans italic\";s:15:\"Rosario:regular\";s:15:\"Rosario regular\";s:14:\"Rosario:italic\";s:14:\"Rosario italic\";s:11:\"Rosario:700\";s:11:\"Rosario 700\";s:17:\"Rosario:700italic\";s:17:\"Rosario 700italic\";s:16:\"Rosarivo:regular\";s:16:\"Rosarivo regular\";s:15:\"Rosarivo:italic\";s:15:\"Rosarivo italic\";s:20:\"Rouge+Script:regular\";s:20:\"Rouge Script regular\";s:17:\"Rozha+One:regular\";s:17:\"Rozha One regular\";s:9:\"Rubik:300\";s:9:\"Rubik 300\";s:15:\"Rubik:300italic\";s:15:\"Rubik 300italic\";s:13:\"Rubik:regular\";s:13:\"Rubik regular\";s:12:\"Rubik:italic\";s:12:\"Rubik italic\";s:9:\"Rubik:500\";s:9:\"Rubik 500\";s:15:\"Rubik:500italic\";s:15:\"Rubik 500italic\";s:9:\"Rubik:700\";s:9:\"Rubik 700\";s:15:\"Rubik:700italic\";s:15:\"Rubik 700italic\";s:9:\"Rubik:900\";s:9:\"Rubik 900\";s:15:\"Rubik:900italic\";s:15:\"Rubik 900italic\";s:22:\"Rubik+Mono+One:regular\";s:22:\"Rubik Mono One regular\";s:12:\"Ruda:regular\";s:12:\"Ruda regular\";s:8:\"Ruda:700\";s:8:\"Ruda 700\";s:8:\"Ruda:900\";s:8:\"Ruda 900\";s:14:\"Rufina:regular\";s:14:\"Rufina regular\";s:10:\"Rufina:700\";s:10:\"Rufina 700\";s:19:\"Ruge+Boogie:regular\";s:19:\"Ruge Boogie regular\";s:14:\"Ruluko:regular\";s:14:\"Ruluko regular\";s:18:\"Rum+Raisin:regular\";s:18:\"Rum Raisin regular\";s:22:\"Ruslan+Display:regular\";s:22:\"Ruslan Display regular\";s:17:\"Russo+One:regular\";s:17:\"Russo One regular\";s:14:\"Ruthie:regular\";s:14:\"Ruthie regular\";s:11:\"Rye:regular\";s:11:\"Rye regular\";s:18:\"Sacramento:regular\";s:18:\"Sacramento regular\";s:15:\"Sahitya:regular\";s:15:\"Sahitya regular\";s:11:\"Sahitya:700\";s:11:\"Sahitya 700\";s:12:\"Sail:regular\";s:12:\"Sail regular\";s:9:\"Saira:100\";s:9:\"Saira 100\";s:9:\"Saira:200\";s:9:\"Saira 200\";s:9:\"Saira:300\";s:9:\"Saira 300\";s:13:\"Saira:regular\";s:13:\"Saira regular\";s:9:\"Saira:500\";s:9:\"Saira 500\";s:9:\"Saira:600\";s:9:\"Saira 600\";s:9:\"Saira:700\";s:9:\"Saira 700\";s:9:\"Saira:800\";s:9:\"Saira 800\";s:9:\"Saira:900\";s:9:\"Saira 900\";s:19:\"Saira+Condensed:100\";s:19:\"Saira Condensed 100\";s:19:\"Saira+Condensed:200\";s:19:\"Saira Condensed 200\";s:19:\"Saira+Condensed:300\";s:19:\"Saira Condensed 300\";s:23:\"Saira+Condensed:regular\";s:23:\"Saira Condensed regular\";s:19:\"Saira+Condensed:500\";s:19:\"Saira Condensed 500\";s:19:\"Saira+Condensed:600\";s:19:\"Saira Condensed 600\";s:19:\"Saira+Condensed:700\";s:19:\"Saira Condensed 700\";s:19:\"Saira+Condensed:800\";s:19:\"Saira Condensed 800\";s:19:\"Saira+Condensed:900\";s:19:\"Saira Condensed 900\";s:25:\"Saira+Extra+Condensed:100\";s:25:\"Saira Extra Condensed 100\";s:25:\"Saira+Extra+Condensed:200\";s:25:\"Saira Extra Condensed 200\";s:25:\"Saira+Extra+Condensed:300\";s:25:\"Saira Extra Condensed 300\";s:29:\"Saira+Extra+Condensed:regular\";s:29:\"Saira Extra Condensed regular\";s:25:\"Saira+Extra+Condensed:500\";s:25:\"Saira Extra Condensed 500\";s:25:\"Saira+Extra+Condensed:600\";s:25:\"Saira Extra Condensed 600\";s:25:\"Saira+Extra+Condensed:700\";s:25:\"Saira Extra Condensed 700\";s:25:\"Saira+Extra+Condensed:800\";s:25:\"Saira Extra Condensed 800\";s:25:\"Saira+Extra+Condensed:900\";s:25:\"Saira Extra Condensed 900\";s:24:\"Saira+Semi+Condensed:100\";s:24:\"Saira Semi Condensed 100\";s:24:\"Saira+Semi+Condensed:200\";s:24:\"Saira Semi Condensed 200\";s:24:\"Saira+Semi+Condensed:300\";s:24:\"Saira Semi Condensed 300\";s:28:\"Saira+Semi+Condensed:regular\";s:28:\"Saira Semi Condensed regular\";s:24:\"Saira+Semi+Condensed:500\";s:24:\"Saira Semi Condensed 500\";s:24:\"Saira+Semi+Condensed:600\";s:24:\"Saira Semi Condensed 600\";s:24:\"Saira+Semi+Condensed:700\";s:24:\"Saira Semi Condensed 700\";s:24:\"Saira+Semi+Condensed:800\";s:24:\"Saira Semi Condensed 800\";s:24:\"Saira+Semi+Condensed:900\";s:24:\"Saira Semi Condensed 900\";s:13:\"Salsa:regular\";s:13:\"Salsa regular\";s:15:\"Sanchez:regular\";s:15:\"Sanchez regular\";s:14:\"Sanchez:italic\";s:14:\"Sanchez italic\";s:16:\"Sancreek:regular\";s:16:\"Sancreek regular\";s:15:\"Sansita:regular\";s:15:\"Sansita regular\";s:14:\"Sansita:italic\";s:14:\"Sansita italic\";s:11:\"Sansita:700\";s:11:\"Sansita 700\";s:17:\"Sansita:700italic\";s:17:\"Sansita 700italic\";s:11:\"Sansita:800\";s:11:\"Sansita 800\";s:17:\"Sansita:800italic\";s:17:\"Sansita 800italic\";s:11:\"Sansita:900\";s:11:\"Sansita 900\";s:17:\"Sansita:900italic\";s:17:\"Sansita 900italic\";s:11:\"Sarabun:100\";s:11:\"Sarabun 100\";s:17:\"Sarabun:100italic\";s:17:\"Sarabun 100italic\";s:11:\"Sarabun:200\";s:11:\"Sarabun 200\";s:17:\"Sarabun:200italic\";s:17:\"Sarabun 200italic\";s:11:\"Sarabun:300\";s:11:\"Sarabun 300\";s:17:\"Sarabun:300italic\";s:17:\"Sarabun 300italic\";s:15:\"Sarabun:regular\";s:15:\"Sarabun regular\";s:14:\"Sarabun:italic\";s:14:\"Sarabun italic\";s:11:\"Sarabun:500\";s:11:\"Sarabun 500\";s:17:\"Sarabun:500italic\";s:17:\"Sarabun 500italic\";s:11:\"Sarabun:600\";s:11:\"Sarabun 600\";s:17:\"Sarabun:600italic\";s:17:\"Sarabun 600italic\";s:11:\"Sarabun:700\";s:11:\"Sarabun 700\";s:17:\"Sarabun:700italic\";s:17:\"Sarabun 700italic\";s:11:\"Sarabun:800\";s:11:\"Sarabun 800\";s:17:\"Sarabun:800italic\";s:17:\"Sarabun 800italic\";s:14:\"Sarala:regular\";s:14:\"Sarala regular\";s:10:\"Sarala:700\";s:10:\"Sarala 700\";s:14:\"Sarina:regular\";s:14:\"Sarina regular\";s:16:\"Sarpanch:regular\";s:16:\"Sarpanch regular\";s:12:\"Sarpanch:500\";s:12:\"Sarpanch 500\";s:12:\"Sarpanch:600\";s:12:\"Sarpanch 600\";s:12:\"Sarpanch:700\";s:12:\"Sarpanch 700\";s:12:\"Sarpanch:800\";s:12:\"Sarpanch 800\";s:12:\"Sarpanch:900\";s:12:\"Sarpanch 900\";s:15:\"Satisfy:regular\";s:15:\"Satisfy regular\";s:23:\"Sawarabi+Gothic:regular\";s:23:\"Sawarabi Gothic regular\";s:23:\"Sawarabi+Mincho:regular\";s:23:\"Sawarabi Mincho regular\";s:13:\"Scada:regular\";s:13:\"Scada regular\";s:12:\"Scada:italic\";s:12:\"Scada italic\";s:9:\"Scada:700\";s:9:\"Scada 700\";s:15:\"Scada:700italic\";s:15:\"Scada 700italic\";s:20:\"Scheherazade:regular\";s:20:\"Scheherazade regular\";s:16:\"Scheherazade:700\";s:16:\"Scheherazade 700\";s:18:\"Schoolbell:regular\";s:18:\"Schoolbell regular\";s:17:\"Scope+One:regular\";s:17:\"Scope One regular\";s:22:\"Seaweed+Script:regular\";s:22:\"Seaweed Script regular\";s:19:\"Secular+One:regular\";s:19:\"Secular One regular\";s:20:\"Sedgwick+Ave:regular\";s:20:\"Sedgwick Ave regular\";s:28:\"Sedgwick+Ave+Display:regular\";s:28:\"Sedgwick Ave Display regular\";s:17:\"Sevillana:regular\";s:17:\"Sevillana regular\";s:19:\"Seymour+One:regular\";s:19:\"Seymour One regular\";s:26:\"Shadows+Into+Light:regular\";s:26:\"Shadows Into Light regular\";s:30:\"Shadows+Into+Light+Two:regular\";s:30:\"Shadows Into Light Two regular\";s:14:\"Shanti:regular\";s:14:\"Shanti regular\";s:13:\"Share:regular\";s:13:\"Share regular\";s:12:\"Share:italic\";s:12:\"Share italic\";s:9:\"Share:700\";s:9:\"Share 700\";s:15:\"Share:700italic\";s:15:\"Share 700italic\";s:18:\"Share+Tech:regular\";s:18:\"Share Tech regular\";s:23:\"Share+Tech+Mono:regular\";s:23:\"Share Tech Mono regular\";s:17:\"Shojumaru:regular\";s:17:\"Shojumaru regular\";s:19:\"Short+Stack:regular\";s:19:\"Short Stack regular\";s:17:\"Shrikhand:regular\";s:17:\"Shrikhand regular\";s:16:\"Siemreap:regular\";s:16:\"Siemreap regular\";s:18:\"Sigmar+One:regular\";s:18:\"Sigmar One regular\";s:11:\"Signika:300\";s:11:\"Signika 300\";s:15:\"Signika:regular\";s:15:\"Signika regular\";s:11:\"Signika:600\";s:11:\"Signika 600\";s:11:\"Signika:700\";s:11:\"Signika 700\";s:20:\"Signika+Negative:300\";s:20:\"Signika Negative 300\";s:24:\"Signika+Negative:regular\";s:24:\"Signika Negative regular\";s:20:\"Signika+Negative:600\";s:20:\"Signika Negative 600\";s:20:\"Signika+Negative:700\";s:20:\"Signika Negative 700\";s:17:\"Simonetta:regular\";s:17:\"Simonetta regular\";s:16:\"Simonetta:italic\";s:16:\"Simonetta italic\";s:13:\"Simonetta:900\";s:13:\"Simonetta 900\";s:19:\"Simonetta:900italic\";s:19:\"Simonetta 900italic\";s:15:\"Sintony:regular\";s:15:\"Sintony regular\";s:11:\"Sintony:700\";s:11:\"Sintony 700\";s:21:\"Sirin+Stencil:regular\";s:21:\"Sirin Stencil regular\";s:16:\"Six+Caps:regular\";s:16:\"Six Caps regular\";s:15:\"Skranji:regular\";s:15:\"Skranji regular\";s:11:\"Skranji:700\";s:11:\"Skranji 700\";s:18:\"Slabo+13px:regular\";s:18:\"Slabo 13px regular\";s:18:\"Slabo+27px:regular\";s:18:\"Slabo 27px regular\";s:15:\"Slackey:regular\";s:15:\"Slackey regular\";s:14:\"Smokum:regular\";s:14:\"Smokum regular\";s:14:\"Smythe:regular\";s:14:\"Smythe regular\";s:15:\"Sniglet:regular\";s:15:\"Sniglet regular\";s:11:\"Sniglet:800\";s:11:\"Sniglet 800\";s:15:\"Snippet:regular\";s:15:\"Snippet regular\";s:21:\"Snowburst+One:regular\";s:21:\"Snowburst One regular\";s:18:\"Sofadi+One:regular\";s:18:\"Sofadi One regular\";s:13:\"Sofia:regular\";s:13:\"Sofia regular\";s:18:\"Song+Myung:regular\";s:18:\"Song Myung regular\";s:18:\"Sonsie+One:regular\";s:18:\"Sonsie One regular\";s:24:\"Sorts+Mill+Goudy:regular\";s:24:\"Sorts Mill Goudy regular\";s:23:\"Sorts+Mill+Goudy:italic\";s:23:\"Sorts Mill Goudy italic\";s:19:\"Source+Code+Pro:200\";s:19:\"Source Code Pro 200\";s:19:\"Source+Code+Pro:300\";s:19:\"Source Code Pro 300\";s:23:\"Source+Code+Pro:regular\";s:23:\"Source Code Pro regular\";s:19:\"Source+Code+Pro:500\";s:19:\"Source Code Pro 500\";s:19:\"Source+Code+Pro:600\";s:19:\"Source Code Pro 600\";s:19:\"Source+Code+Pro:700\";s:19:\"Source Code Pro 700\";s:19:\"Source+Code+Pro:900\";s:19:\"Source Code Pro 900\";s:19:\"Source+Sans+Pro:200\";s:19:\"Source Sans Pro 200\";s:25:\"Source+Sans+Pro:200italic\";s:25:\"Source Sans Pro 200italic\";s:19:\"Source+Sans+Pro:300\";s:19:\"Source Sans Pro 300\";s:25:\"Source+Sans+Pro:300italic\";s:25:\"Source Sans Pro 300italic\";s:23:\"Source+Sans+Pro:regular\";s:23:\"Source Sans Pro regular\";s:22:\"Source+Sans+Pro:italic\";s:22:\"Source Sans Pro italic\";s:19:\"Source+Sans+Pro:600\";s:19:\"Source Sans Pro 600\";s:25:\"Source+Sans+Pro:600italic\";s:25:\"Source Sans Pro 600italic\";s:19:\"Source+Sans+Pro:700\";s:19:\"Source Sans Pro 700\";s:25:\"Source+Sans+Pro:700italic\";s:25:\"Source Sans Pro 700italic\";s:19:\"Source+Sans+Pro:900\";s:19:\"Source Sans Pro 900\";s:25:\"Source+Sans+Pro:900italic\";s:25:\"Source Sans Pro 900italic\";s:24:\"Source+Serif+Pro:regular\";s:24:\"Source Serif Pro regular\";s:20:\"Source+Serif+Pro:600\";s:20:\"Source Serif Pro 600\";s:20:\"Source+Serif+Pro:700\";s:20:\"Source Serif Pro 700\";s:18:\"Space+Mono:regular\";s:18:\"Space Mono regular\";s:17:\"Space+Mono:italic\";s:17:\"Space Mono italic\";s:14:\"Space+Mono:700\";s:14:\"Space Mono 700\";s:20:\"Space+Mono:700italic\";s:20:\"Space Mono 700italic\";s:21:\"Special+Elite:regular\";s:21:\"Special Elite regular\";s:12:\"Spectral:200\";s:12:\"Spectral 200\";s:18:\"Spectral:200italic\";s:18:\"Spectral 200italic\";s:12:\"Spectral:300\";s:12:\"Spectral 300\";s:18:\"Spectral:300italic\";s:18:\"Spectral 300italic\";s:16:\"Spectral:regular\";s:16:\"Spectral regular\";s:15:\"Spectral:italic\";s:15:\"Spectral italic\";s:12:\"Spectral:500\";s:12:\"Spectral 500\";s:18:\"Spectral:500italic\";s:18:\"Spectral 500italic\";s:12:\"Spectral:600\";s:12:\"Spectral 600\";s:18:\"Spectral:600italic\";s:18:\"Spectral 600italic\";s:12:\"Spectral:700\";s:12:\"Spectral 700\";s:18:\"Spectral:700italic\";s:18:\"Spectral 700italic\";s:12:\"Spectral:800\";s:12:\"Spectral 800\";s:18:\"Spectral:800italic\";s:18:\"Spectral 800italic\";s:15:\"Spectral+SC:200\";s:15:\"Spectral SC 200\";s:21:\"Spectral+SC:200italic\";s:21:\"Spectral SC 200italic\";s:15:\"Spectral+SC:300\";s:15:\"Spectral SC 300\";s:21:\"Spectral+SC:300italic\";s:21:\"Spectral SC 300italic\";s:19:\"Spectral+SC:regular\";s:19:\"Spectral SC regular\";s:18:\"Spectral+SC:italic\";s:18:\"Spectral SC italic\";s:15:\"Spectral+SC:500\";s:15:\"Spectral SC 500\";s:21:\"Spectral+SC:500italic\";s:21:\"Spectral SC 500italic\";s:15:\"Spectral+SC:600\";s:15:\"Spectral SC 600\";s:21:\"Spectral+SC:600italic\";s:21:\"Spectral SC 600italic\";s:15:\"Spectral+SC:700\";s:15:\"Spectral SC 700\";s:21:\"Spectral+SC:700italic\";s:21:\"Spectral SC 700italic\";s:15:\"Spectral+SC:800\";s:15:\"Spectral SC 800\";s:21:\"Spectral+SC:800italic\";s:21:\"Spectral SC 800italic\";s:18:\"Spicy+Rice:regular\";s:18:\"Spicy Rice regular\";s:17:\"Spinnaker:regular\";s:17:\"Spinnaker regular\";s:14:\"Spirax:regular\";s:14:\"Spirax regular\";s:18:\"Squada+One:regular\";s:18:\"Squada One regular\";s:28:\"Sree+Krushnadevaraya:regular\";s:28:\"Sree Krushnadevaraya regular\";s:16:\"Sriracha:regular\";s:16:\"Sriracha regular\";s:16:\"Srisakdi:regular\";s:16:\"Srisakdi regular\";s:12:\"Srisakdi:700\";s:12:\"Srisakdi 700\";s:19:\"Staatliches:regular\";s:19:\"Staatliches regular\";s:17:\"Stalemate:regular\";s:17:\"Stalemate regular\";s:21:\"Stalinist+One:regular\";s:21:\"Stalinist One regular\";s:23:\"Stardos+Stencil:regular\";s:23:\"Stardos Stencil regular\";s:19:\"Stardos+Stencil:700\";s:19:\"Stardos Stencil 700\";s:29:\"Stint+Ultra+Condensed:regular\";s:29:\"Stint Ultra Condensed regular\";s:28:\"Stint+Ultra+Expanded:regular\";s:28:\"Stint Ultra Expanded regular\";s:9:\"Stoke:300\";s:9:\"Stoke 300\";s:13:\"Stoke:regular\";s:13:\"Stoke regular\";s:14:\"Strait:regular\";s:14:\"Strait regular\";s:15:\"Stylish:regular\";s:15:\"Stylish regular\";s:27:\"Sue+Ellen+Francisco:regular\";s:27:\"Sue Ellen Francisco regular\";s:16:\"Suez+One:regular\";s:16:\"Suez One regular\";s:14:\"Sumana:regular\";s:14:\"Sumana regular\";s:10:\"Sumana:700\";s:10:\"Sumana 700\";s:13:\"Sunflower:300\";s:13:\"Sunflower 300\";s:13:\"Sunflower:500\";s:13:\"Sunflower 500\";s:13:\"Sunflower:700\";s:13:\"Sunflower 700\";s:17:\"Sunshiney:regular\";s:17:\"Sunshiney regular\";s:24:\"Supermercado+One:regular\";s:24:\"Supermercado One regular\";s:12:\"Sura:regular\";s:12:\"Sura regular\";s:8:\"Sura:700\";s:8:\"Sura 700\";s:15:\"Suranna:regular\";s:15:\"Suranna regular\";s:17:\"Suravaram:regular\";s:17:\"Suravaram regular\";s:19:\"Suwannaphum:regular\";s:19:\"Suwannaphum regular\";s:26:\"Swanky+and+Moo+Moo:regular\";s:26:\"Swanky and Moo Moo regular\";s:17:\"Syncopate:regular\";s:17:\"Syncopate regular\";s:13:\"Syncopate:700\";s:13:\"Syncopate 700\";s:11:\"Tajawal:200\";s:11:\"Tajawal 200\";s:11:\"Tajawal:300\";s:11:\"Tajawal 300\";s:15:\"Tajawal:regular\";s:15:\"Tajawal regular\";s:11:\"Tajawal:500\";s:11:\"Tajawal 500\";s:11:\"Tajawal:700\";s:11:\"Tajawal 700\";s:11:\"Tajawal:800\";s:11:\"Tajawal 800\";s:11:\"Tajawal:900\";s:11:\"Tajawal 900\";s:17:\"Tangerine:regular\";s:17:\"Tangerine regular\";s:13:\"Tangerine:700\";s:13:\"Tangerine 700\";s:14:\"Taprom:regular\";s:14:\"Taprom regular\";s:13:\"Tauri:regular\";s:13:\"Tauri regular\";s:11:\"Taviraj:100\";s:11:\"Taviraj 100\";s:17:\"Taviraj:100italic\";s:17:\"Taviraj 100italic\";s:11:\"Taviraj:200\";s:11:\"Taviraj 200\";s:17:\"Taviraj:200italic\";s:17:\"Taviraj 200italic\";s:11:\"Taviraj:300\";s:11:\"Taviraj 300\";s:17:\"Taviraj:300italic\";s:17:\"Taviraj 300italic\";s:15:\"Taviraj:regular\";s:15:\"Taviraj regular\";s:14:\"Taviraj:italic\";s:14:\"Taviraj italic\";s:11:\"Taviraj:500\";s:11:\"Taviraj 500\";s:17:\"Taviraj:500italic\";s:17:\"Taviraj 500italic\";s:11:\"Taviraj:600\";s:11:\"Taviraj 600\";s:17:\"Taviraj:600italic\";s:17:\"Taviraj 600italic\";s:11:\"Taviraj:700\";s:11:\"Taviraj 700\";s:17:\"Taviraj:700italic\";s:17:\"Taviraj 700italic\";s:11:\"Taviraj:800\";s:11:\"Taviraj 800\";s:17:\"Taviraj:800italic\";s:17:\"Taviraj 800italic\";s:11:\"Taviraj:900\";s:11:\"Taviraj 900\";s:17:\"Taviraj:900italic\";s:17:\"Taviraj 900italic\";s:8:\"Teko:300\";s:8:\"Teko 300\";s:12:\"Teko:regular\";s:12:\"Teko regular\";s:8:\"Teko:500\";s:8:\"Teko 500\";s:8:\"Teko:600\";s:8:\"Teko 600\";s:8:\"Teko:700\";s:8:\"Teko 700\";s:13:\"Telex:regular\";s:13:\"Telex regular\";s:26:\"Tenali+Ramakrishna:regular\";s:26:\"Tenali Ramakrishna regular\";s:18:\"Tenor+Sans:regular\";s:18:\"Tenor Sans regular\";s:19:\"Text+Me+One:regular\";s:19:\"Text Me One regular\";s:17:\"Thasadith:regular\";s:17:\"Thasadith regular\";s:16:\"Thasadith:italic\";s:16:\"Thasadith italic\";s:13:\"Thasadith:700\";s:13:\"Thasadith 700\";s:19:\"Thasadith:700italic\";s:19:\"Thasadith 700italic\";s:26:\"The+Girl+Next+Door:regular\";s:26:\"The Girl Next Door regular\";s:14:\"Tienne:regular\";s:14:\"Tienne regular\";s:10:\"Tienne:700\";s:10:\"Tienne 700\";s:10:\"Tienne:900\";s:10:\"Tienne 900\";s:15:\"Tillana:regular\";s:15:\"Tillana regular\";s:11:\"Tillana:500\";s:11:\"Tillana 500\";s:11:\"Tillana:600\";s:11:\"Tillana 600\";s:11:\"Tillana:700\";s:11:\"Tillana 700\";s:11:\"Tillana:800\";s:11:\"Tillana 800\";s:15:\"Timmana:regular\";s:15:\"Timmana regular\";s:13:\"Tinos:regular\";s:13:\"Tinos regular\";s:12:\"Tinos:italic\";s:12:\"Tinos italic\";s:9:\"Tinos:700\";s:9:\"Tinos 700\";s:15:\"Tinos:700italic\";s:15:\"Tinos 700italic\";s:17:\"Titan+One:regular\";s:17:\"Titan One regular\";s:17:\"Titillium+Web:200\";s:17:\"Titillium Web 200\";s:23:\"Titillium+Web:200italic\";s:23:\"Titillium Web 200italic\";s:17:\"Titillium+Web:300\";s:17:\"Titillium Web 300\";s:23:\"Titillium+Web:300italic\";s:23:\"Titillium Web 300italic\";s:21:\"Titillium+Web:regular\";s:21:\"Titillium Web regular\";s:20:\"Titillium+Web:italic\";s:20:\"Titillium Web italic\";s:17:\"Titillium+Web:600\";s:17:\"Titillium Web 600\";s:23:\"Titillium+Web:600italic\";s:23:\"Titillium Web 600italic\";s:17:\"Titillium+Web:700\";s:17:\"Titillium Web 700\";s:23:\"Titillium+Web:700italic\";s:23:\"Titillium Web 700italic\";s:17:\"Titillium+Web:900\";s:17:\"Titillium Web 900\";s:19:\"Trade+Winds:regular\";s:19:\"Trade Winds regular\";s:11:\"Trirong:100\";s:11:\"Trirong 100\";s:17:\"Trirong:100italic\";s:17:\"Trirong 100italic\";s:11:\"Trirong:200\";s:11:\"Trirong 200\";s:17:\"Trirong:200italic\";s:17:\"Trirong 200italic\";s:11:\"Trirong:300\";s:11:\"Trirong 300\";s:17:\"Trirong:300italic\";s:17:\"Trirong 300italic\";s:15:\"Trirong:regular\";s:15:\"Trirong regular\";s:14:\"Trirong:italic\";s:14:\"Trirong italic\";s:11:\"Trirong:500\";s:11:\"Trirong 500\";s:17:\"Trirong:500italic\";s:17:\"Trirong 500italic\";s:11:\"Trirong:600\";s:11:\"Trirong 600\";s:17:\"Trirong:600italic\";s:17:\"Trirong 600italic\";s:11:\"Trirong:700\";s:11:\"Trirong 700\";s:17:\"Trirong:700italic\";s:17:\"Trirong 700italic\";s:11:\"Trirong:800\";s:11:\"Trirong 800\";s:17:\"Trirong:800italic\";s:17:\"Trirong 800italic\";s:11:\"Trirong:900\";s:11:\"Trirong 900\";s:17:\"Trirong:900italic\";s:17:\"Trirong 900italic\";s:15:\"Trocchi:regular\";s:15:\"Trocchi regular\";s:15:\"Trochut:regular\";s:15:\"Trochut regular\";s:14:\"Trochut:italic\";s:14:\"Trochut italic\";s:11:\"Trochut:700\";s:11:\"Trochut 700\";s:15:\"Trykker:regular\";s:15:\"Trykker regular\";s:18:\"Tulpen+One:regular\";s:18:\"Tulpen One regular\";s:10:\"Ubuntu:300\";s:10:\"Ubuntu 300\";s:16:\"Ubuntu:300italic\";s:16:\"Ubuntu 300italic\";s:14:\"Ubuntu:regular\";s:14:\"Ubuntu regular\";s:13:\"Ubuntu:italic\";s:13:\"Ubuntu italic\";s:10:\"Ubuntu:500\";s:10:\"Ubuntu 500\";s:16:\"Ubuntu:500italic\";s:16:\"Ubuntu 500italic\";s:10:\"Ubuntu:700\";s:10:\"Ubuntu 700\";s:16:\"Ubuntu:700italic\";s:16:\"Ubuntu 700italic\";s:24:\"Ubuntu+Condensed:regular\";s:24:\"Ubuntu Condensed regular\";s:19:\"Ubuntu+Mono:regular\";s:19:\"Ubuntu Mono regular\";s:18:\"Ubuntu+Mono:italic\";s:18:\"Ubuntu Mono italic\";s:15:\"Ubuntu+Mono:700\";s:15:\"Ubuntu Mono 700\";s:21:\"Ubuntu+Mono:700italic\";s:21:\"Ubuntu Mono 700italic\";s:13:\"Ultra:regular\";s:13:\"Ultra regular\";s:22:\"Uncial+Antiqua:regular\";s:22:\"Uncial Antiqua regular\";s:16:\"Underdog:regular\";s:16:\"Underdog regular\";s:17:\"Unica+One:regular\";s:17:\"Unica One regular\";s:18:\"UnifrakturCook:700\";s:18:\"UnifrakturCook 700\";s:26:\"UnifrakturMaguntia:regular\";s:26:\"UnifrakturMaguntia regular\";s:15:\"Unkempt:regular\";s:15:\"Unkempt regular\";s:11:\"Unkempt:700\";s:11:\"Unkempt 700\";s:14:\"Unlock:regular\";s:14:\"Unlock regular\";s:12:\"Unna:regular\";s:12:\"Unna regular\";s:11:\"Unna:italic\";s:11:\"Unna italic\";s:8:\"Unna:700\";s:8:\"Unna 700\";s:14:\"Unna:700italic\";s:14:\"Unna 700italic\";s:13:\"VT323:regular\";s:13:\"VT323 regular\";s:19:\"Vampiro+One:regular\";s:19:\"Vampiro One regular\";s:14:\"Varela:regular\";s:14:\"Varela regular\";s:20:\"Varela+Round:regular\";s:20:\"Varela Round regular\";s:19:\"Vast+Shadow:regular\";s:19:\"Vast Shadow regular\";s:20:\"Vesper+Libre:regular\";s:20:\"Vesper Libre regular\";s:16:\"Vesper+Libre:500\";s:16:\"Vesper Libre 500\";s:16:\"Vesper+Libre:700\";s:16:\"Vesper Libre 700\";s:16:\"Vesper+Libre:900\";s:16:\"Vesper Libre 900\";s:13:\"Vibur:regular\";s:13:\"Vibur regular\";s:16:\"Vidaloka:regular\";s:16:\"Vidaloka regular\";s:12:\"Viga:regular\";s:12:\"Viga regular\";s:13:\"Voces:regular\";s:13:\"Voces regular\";s:15:\"Volkhov:regular\";s:15:\"Volkhov regular\";s:14:\"Volkhov:italic\";s:14:\"Volkhov italic\";s:11:\"Volkhov:700\";s:11:\"Volkhov 700\";s:17:\"Volkhov:700italic\";s:17:\"Volkhov 700italic\";s:16:\"Vollkorn:regular\";s:16:\"Vollkorn regular\";s:15:\"Vollkorn:italic\";s:15:\"Vollkorn italic\";s:12:\"Vollkorn:600\";s:12:\"Vollkorn 600\";s:18:\"Vollkorn:600italic\";s:18:\"Vollkorn 600italic\";s:12:\"Vollkorn:700\";s:12:\"Vollkorn 700\";s:18:\"Vollkorn:700italic\";s:18:\"Vollkorn 700italic\";s:12:\"Vollkorn:900\";s:12:\"Vollkorn 900\";s:18:\"Vollkorn:900italic\";s:18:\"Vollkorn 900italic\";s:19:\"Vollkorn+SC:regular\";s:19:\"Vollkorn SC regular\";s:15:\"Vollkorn+SC:600\";s:15:\"Vollkorn SC 600\";s:15:\"Vollkorn+SC:700\";s:15:\"Vollkorn SC 700\";s:15:\"Vollkorn+SC:900\";s:15:\"Vollkorn SC 900\";s:16:\"Voltaire:regular\";s:16:\"Voltaire regular\";s:31:\"Waiting+for+the+Sunrise:regular\";s:31:\"Waiting for the Sunrise regular\";s:16:\"Wallpoet:regular\";s:16:\"Wallpoet regular\";s:23:\"Walter+Turncoat:regular\";s:23:\"Walter Turncoat regular\";s:14:\"Warnes:regular\";s:14:\"Warnes regular\";s:17:\"Wellfleet:regular\";s:17:\"Wellfleet regular\";s:17:\"Wendy+One:regular\";s:17:\"Wendy One regular\";s:16:\"Wire+One:regular\";s:16:\"Wire One regular\";s:13:\"Work+Sans:100\";s:13:\"Work Sans 100\";s:13:\"Work+Sans:200\";s:13:\"Work Sans 200\";s:13:\"Work+Sans:300\";s:13:\"Work Sans 300\";s:17:\"Work+Sans:regular\";s:17:\"Work Sans regular\";s:13:\"Work+Sans:500\";s:13:\"Work Sans 500\";s:13:\"Work+Sans:600\";s:13:\"Work Sans 600\";s:13:\"Work+Sans:700\";s:13:\"Work Sans 700\";s:13:\"Work+Sans:800\";s:13:\"Work Sans 800\";s:13:\"Work+Sans:900\";s:13:\"Work Sans 900\";s:21:\"Yanone+Kaffeesatz:200\";s:21:\"Yanone Kaffeesatz 200\";s:21:\"Yanone+Kaffeesatz:300\";s:21:\"Yanone Kaffeesatz 300\";s:25:\"Yanone+Kaffeesatz:regular\";s:25:\"Yanone Kaffeesatz regular\";s:21:\"Yanone+Kaffeesatz:700\";s:21:\"Yanone Kaffeesatz 700\";s:15:\"Yantramanav:100\";s:15:\"Yantramanav 100\";s:15:\"Yantramanav:300\";s:15:\"Yantramanav 300\";s:19:\"Yantramanav:regular\";s:19:\"Yantramanav regular\";s:15:\"Yantramanav:500\";s:15:\"Yantramanav 500\";s:15:\"Yantramanav:700\";s:15:\"Yantramanav 700\";s:15:\"Yantramanav:900\";s:15:\"Yantramanav 900\";s:17:\"Yatra+One:regular\";s:17:\"Yatra One regular\";s:18:\"Yellowtail:regular\";s:18:\"Yellowtail regular\";s:17:\"Yeon+Sung:regular\";s:17:\"Yeon Sung regular\";s:18:\"Yeseva+One:regular\";s:18:\"Yeseva One regular\";s:18:\"Yesteryear:regular\";s:18:\"Yesteryear regular\";s:8:\"Yrsa:300\";s:8:\"Yrsa 300\";s:12:\"Yrsa:regular\";s:12:\"Yrsa regular\";s:8:\"Yrsa:500\";s:8:\"Yrsa 500\";s:8:\"Yrsa:600\";s:8:\"Yrsa 600\";s:8:\"Yrsa:700\";s:8:\"Yrsa 700\";s:20:\"ZCOOL+KuaiLe:regular\";s:20:\"ZCOOL KuaiLe regular\";s:29:\"ZCOOL+QingKe+HuangYou:regular\";s:29:\"ZCOOL QingKe HuangYou regular\";s:21:\"ZCOOL+XiaoWei:regular\";s:21:\"ZCOOL XiaoWei regular\";s:14:\"Zeyada:regular\";s:14:\"Zeyada regular\";s:14:\"Zilla+Slab:300\";s:14:\"Zilla Slab 300\";s:20:\"Zilla+Slab:300italic\";s:20:\"Zilla Slab 300italic\";s:18:\"Zilla+Slab:regular\";s:18:\"Zilla Slab regular\";s:17:\"Zilla+Slab:italic\";s:17:\"Zilla Slab italic\";s:14:\"Zilla+Slab:500\";s:14:\"Zilla Slab 500\";s:20:\"Zilla+Slab:500italic\";s:20:\"Zilla Slab 500italic\";s:14:\"Zilla+Slab:600\";s:14:\"Zilla Slab 600\";s:20:\"Zilla+Slab:600italic\";s:20:\"Zilla Slab 600italic\";s:14:\"Zilla+Slab:700\";s:14:\"Zilla Slab 700\";s:20:\"Zilla+Slab:700italic\";s:20:\"Zilla Slab 700italic\";s:28:\"Zilla+Slab+Highlight:regular\";s:28:\"Zilla Slab Highlight regular\";s:24:\"Zilla+Slab+Highlight:700\";s:24:\"Zilla Slab Highlight 700\";}', 'no');
INSERT INTO `pae_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(419, '_transient_product_query-transient-version', '1546553423', 'yes'),
(677, 'wc_gateway_ppce_bootstrap_warning_message', 'WooCommerce Gateway PayPal Checkout requires WooCommerce to be activated', 'yes'),
(749, 'nm_wcpd_settings', 'a:8:{s:6:\"action\";s:21:\"nm_wcpd_save_settings\";s:17:\"nm_wcpd_btn_title\";s:6:\"Design\";s:18:\"nm_wcpd_font_color\";s:7:\"#ffffff\";s:16:\"nm_wcpd_bg_color\";s:7:\"#81d742\";s:19:\"nm_wcpd_canvas_size\";s:0:\"\";s:20:\"nm_wcpd_custom_fonts\";s:0:\"\";s:23:\"woocommerce-login-nonce\";N;s:8:\"_wpnonce\";N;}', 'yes'),
(734, 'ftp_credentials', 'a:3:{s:8:\"hostname\";s:15:\"webpagezone.com\";s:8:\"username\";s:19:\"wpz@webpagezone.com\";s:15:\"connection_type\";s:4:\"ftps\";}', 'yes'),
(1359, 'fpd_plus_bulk_add_variations_written', '', 'yes'),
(1365, 'fpd_ui_layout_namenumber', '{\\\"name\\\":\\\"Name & Number\\\",\\\"plugin_options\\\":{\\\"stageWidth\\\":1000,\\\"stageHeight\\\":600,\\\"gridColumns\\\":\\\"2\\\",\\\"initialActiveModule\\\":\\\"\\\",\\\"selectedColor\\\":\\\"#f5f5f5\\\",\\\"boundingBoxColor\\\":\\\"#005ede\\\",\\\"outOfBoundaryColor\\\":\\\"#990000\\\",\\\"cornerIconColor\\\":\\\"#000000\\\",\\\"mainBarModules\\\":[\\\"products\\\",\\\"images\\\",\\\"text\\\",\\\"designs\\\",\\\"names-numbers\\\"],\\\"actions\\\":{\\\"top\\\":[\\\"download\\\",\\\"print\\\",\\\"snap\\\",\\\"preview-lightbox\\\"],\\\"right\\\":[\\\"magnify-glass\\\",\\\"zoom\\\",\\\"reset-product\\\",\\\"qr-code\\\"],\\\"bottom\\\":[\\\"undo\\\",\\\"redo\\\"],\\\"left\\\":[\\\"manage-layers\\\",\\\"info\\\",\\\"save\\\",\\\"load\\\"]},\\\"toolbarPlacement\\\":\\\"smart\\\",\\\"toolbarTheme\\\":\\\"white\\\"},\\\"container_classes\\\":\\\"fpd-container fpd-views-inside-left fpd-shadow-1 fpd-top-actions-centered fpd-bottom-actions-centered fpd-disable-touch-scrolling fpd-device-desktop fpd-clearfix fpd-grid-columns-2 fpd-sidebar fpd-tabs fpd-tabs-side\\\",\\\"css_colors\\\":{\\\"primary_color\\\":\\\"#000000\\\",\\\"secondary_color\\\":\\\"#27ae60\\\"},\\\"toolbar_exclude_tools\\\":null,\\\"custom_css\\\":\\\"\\\",\\\"guided_tour\\\":[],\\\"css\\\":\\\".fpd-container .fpd-primary-bg-color,.fpd-actions-wrapper > .fpd-action-btn:hover,.fpd-actions-wrapper > .fpd-action-btn.fpd-active,.fpd-thumbnail-preview > .fpd-preview-price{background-color: #000}.fpd-container .fpd-primary-text-color,.fpd-navigation > div.fpd-active,.fpd-bottom-nav > div.fpd-active{color: #000}.fpd-container .fpd-secondary-bg-color,.fpd-container .fpd-btn,.fpd-modal-wrapper .fpd-modal-content .fpd-btn,.fpd-switch-container.fpd-enabled .fpd-switch-toggle,.fpd-switch-container.fpd-enabled .fpd-switch-bar,.fpd-modal-product-designer.fpd-modal-overlay .fpd-done{background-color: #27ae60}.fpd-container .fpd-btn:hover,.fpd-modal-wrapper .fpd-modal-content .fpd-btn:hover{background: #2aba67}.fpd-container .fpd-btn.fpd-secondary,.fpd-modal-wrapper .fpd-modal-content .fpd-btn.fpd-secondary{background: #e0e1e2}.fpd-container .fpd-btn.fpd-secondary:hover,.fpd-modal-wrapper .fpd-modal-content .fpd-btn.fpd-secondary:hover{background: #e8e9e9}.fpd-container .fpd-btn.fpd-dark{background: rgba(0,0,0,0.6)}.fpd-container .fpd-btn.fpd-dark:hover{background: rgba(26,26,26,0.6)}.fpd-toggle.fpd-enabled{color: #27ae60 !important}.fpd-container,.fpd-container textarea,.fpd-sub-tooltip-theme .tooltipster-content,.fpd-modal-wrapper > .fpd-modal-close{color: rgba(0,0,0,0.8)}.fpd-actions-wrapper > .fpd-action-btn,.fpd-list > .fpd-list-row,.fpd-container.fpd-sidebar > .fpd-mainbar,.fpd-container textarea,.fpd-container.fpd-sidebar.fpd-sidebar-right > .fpd-mainbar,.fpd-container.fpd-main-bar-container .fpd-mainbar,.fpd-container .fpd-module input,.fpd-thumbnail-preview,.fpd-container .fpd-stage-off-canvas,.fpd-manage-layers-panel .fpd-sortable-placeholder,.fpd-container .fpd-close-off-canvas,.fpd-topbar[class*=\\\\\\\"fpd-off-canvas-\\\\\\\"] .fpd-mainbar .fpd-content,.fpd-container input[type=\\\\\\\"text\\\\\\\"],.fpd-text-layers-panel .fpd-list > div{border-color: rgba(0,0,0,0.1) !important}.fpd-container textarea:focus,.fpd-element-toolbar textarea:focus{border: 1px solid rgba(0,0,0,0.1)}\\\"}', 'yes'),
(1356, 'fpd_plus_dynamic_views_formats', '', 'yes'),
(1357, 'fpd_plus_color_selection_placement', 'none', 'yes'),
(793, 'wpeft_types', 'a:8:{s:3:\"txt\";s:10:\"text/plain\";s:2:\"7z\";s:27:\"application/x-7z-compressed\";s:3:\"bz2\";s:19:\"application/x-bzip2\";s:2:\"gz\";s:18:\"application/x-gzip\";s:3:\"tgz\";s:18:\"application/x-gzip\";s:3:\"txz\";s:16:\"application/x-xz\";s:2:\"xz\";s:16:\"application/x-xz\";s:3:\"zip\";s:15:\"application/zip\";}', 'yes'),
(794, 'wpeft_custom_types', '', 'yes'),
(7279, '_transient_wc_term_counts', 'a:3:{i:17;s:1:\"2\";i:16;s:1:\"1\";i:15;s:1:\"0\";}', 'no'),
(876, 'theme_mods_understrap', 'a:8:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:18;}s:28:\"understrap_posts_index_style\";s:7:\"default\";s:27:\"understrap_sidebar_position\";s:5:\"right\";s:25:\"understrap_container_type\";s:9:\"container\";s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1546530961;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:13:\"right-sidebar\";a:7:{i:0;s:8:\"search-2\";i:1;s:32:\"woocommerce_product_categories-2\";i:2;s:14:\"recent-posts-2\";i:3;s:17:\"recent-comments-2\";i:4;s:10:\"archives-2\";i:5;s:12:\"categories-2\";i:6;s:6:\"meta-2\";}s:12:\"left-sidebar\";a:0:{}s:4:\"hero\";a:0:{}s:10:\"herocanvas\";a:0:{}s:10:\"statichero\";a:0:{}s:10:\"footerfull\";a:0:{}}}s:16:\"background_color\";s:6:\"ffffff\";}', 'yes'),
(1049, 'fpd_ui_layout_default', '{\\\"name\\\":\\\"Default\\\",\\\"plugin_options\\\":{\\\"stageWidth\\\":1000,\\\"stageHeight\\\":600,\\\"gridColumns\\\":2,\\\"initialActiveModule\\\":\\\"\\\",\\\"selectedColor\\\":\\\"#f5f5f5\\\",\\\"boundingBoxColor\\\":\\\"#005ede\\\",\\\"outOfBoundaryColor\\\":\\\"#990000\\\",\\\"cornerIconColor\\\":\\\"#000000\\\",\\\"mainBarModules\\\":[\\\"products\\\",\\\"images\\\",\\\"text\\\",\\\"designs\\\"],\\\"actions\\\":{\\\"top\\\":[\\\"download\\\",\\\"print\\\",\\\"snap\\\",\\\"preview-lightbox\\\"],\\\"right\\\":[\\\"magnify-glass\\\",\\\"zoom\\\",\\\"reset-product\\\",\\\"qr-code\\\"],\\\"bottom\\\":[\\\"undo\\\",\\\"redo\\\"],\\\"left\\\":[\\\"manage-layers\\\",\\\"info\\\",\\\"save\\\",\\\"load\\\"]},\\\"toolbarPlacement\\\":\\\"smart\\\"},\\\"container_classes\\\":\\\"fpd-container fpd-topbar fpd-views-inside-left fpd-shadow-1 fpd-top-actions-centered fpd-bottom-actions-centered\\\",\\\"css_colors\\\":{\\\"primary_color\\\":\\\"#000000\\\",\\\"secondary_color\\\":\\\"#27ae60\\\"},\\\"custom_css\\\":\\\"\\\",\\\"toolbar_exclude_tools\\\":[],\\\"css\\\":\\\".fpd-container .fpd-primary-bg-color,.fpd-actions-wrapper > .fpd-action-btn:hover,.fpd-actions-wrapper > .fpd-action-btn.fpd-active,.fpd-thumbnail-preview > .fpd-preview-price{background-color: #000}.fpd-container .fpd-primary-text-color,.fpd-navigation > div.fpd-active,.fpd-bottom-nav > div.fpd-active{color: #000}.fpd-container .fpd-secondary-bg-color,.fpd-container .fpd-btn,.fpd-modal-wrapper .fpd-modal-content .fpd-btn,.fpd-switch-container.fpd-enabled .fpd-switch-toggle,.fpd-switch-container.fpd-enabled .fpd-switch-bar,.fpd-modal-product-designer.fpd-modal-overlay .fpd-done{background-color: #27ae60}.fpd-container .fpd-btn:hover,.fpd-modal-wrapper .fpd-modal-content .fpd-btn:hover{background: #2aba67}.fpd-container .fpd-btn.fpd-secondary,.fpd-modal-wrapper .fpd-modal-content .fpd-btn.fpd-secondary{background: #e0e1e2}.fpd-container .fpd-btn.fpd-secondary:hover,.fpd-modal-wrapper .fpd-modal-content .fpd-btn.fpd-secondary:hover{background: #e8e9e9}.fpd-container .fpd-btn.fpd-dark{background: rgba(0,0,0,0.6)}.fpd-container .fpd-btn.fpd-dark:hover{background: rgba(26,26,26,0.6)}.fpd-toggle.fpd-enabled{color: #27ae60 !important}.fpd-container,.fpd-container textarea,.fpd-sub-tooltip-theme .tooltipster-content,.fpd-modal-wrapper > .fpd-modal-close{color: rgba(0,0,0,0.8)}.fpd-actions-wrapper > .fpd-action-btn,.fpd-list > .fpd-list-row,.fpd-container.fpd-sidebar > .fpd-mainbar,.fpd-container textarea,.fpd-container.fpd-sidebar.fpd-sidebar-right > .fpd-mainbar,.fpd-container.fpd-main-bar-container .fpd-mainbar,.fpd-container .fpd-module input,.fpd-thumbnail-preview,.fpd-container .fpd-stage-off-canvas,.fpd-manage-layers-panel .fpd-sortable-placeholder,.fpd-container .fpd-close-off-canvas,.fpd-topbar[class*=\\\\\\\"fpd-off-canvas-\\\\\\\"] .fpd-mainbar .fpd-content,.fpd-container input[type=\\\\\\\"text\\\\\\\"],.fpd-text-layers-panel .fpd-list > div{border-color: rgba(0,0,0,0.1) !important}.fpd-container textarea:focus,.fpd-element-toolbar textarea:focus{border: 1px solid rgba(0,0,0,0.1)}\\\"}', 'yes'),
(990, 'fpd_product_designer_ui_layout', 'default', 'yes'),
(991, 'fpd_product_designer_visibility', 'lightbox', 'yes'),
(992, 'fpd_main_bar_position', 'default', 'yes'),
(993, 'fpd_disable_on_smartphones', 'no', 'yes'),
(994, 'fpd_disable_on_tablets', 'no', 'yes'),
(995, 'fpd_start_customizing_css_class', 'fpd-blue-btn', 'yes'),
(996, 'fpd_type_of_uploader', 'php', 'yes'),
(997, 'fpd_upload_designs_php_logged_in', 'yes', 'yes'),
(998, 'fpd_uploadAgreementModal', 'no', 'yes'),
(999, 'fpd_allowedImageTypes', 'a:3:{i:0;s:4:\"jpeg\";i:1;s:3:\"png\";i:2;s:3:\"svg\";}', 'yes'),
(1000, 'fpd_facebook_app_id', '', 'yes'),
(1001, 'fpd_instagram_client_id', '', 'yes'),
(1002, 'fpd_instagram_redirect_uri', 'https://printandembroid.com/wp-content/plugins/fancy-product-designer/assets/templates/instagram_auth.php', 'yes'),
(1003, 'fpd_pixabayApiKey', '', 'yes'),
(1004, 'fpd_pixabayHighResImages', 'no', 'yes'),
(1005, 'fpd_pixabayLang', 'en', 'yes'),
(1006, 'fpd_depositphotosApiKey', '', 'yes'),
(1007, 'fpd_depositphotosPrice', '0', 'yes'),
(1008, 'fpd_depositphotosLang', 'en', 'yes'),
(1009, 'fpd_depositphotosUsername', '', 'yes'),
(1010, 'fpd_depositphotosPassword', '', 'yes'),
(1011, 'fpd_depositphotosImageSize', 's', 'yes'),
(1012, 'fpd_disableTextEmojis', 'yes', 'yes'),
(1013, 'fpd_replace_initial_elements', 'no', 'yes'),
(1014, 'fpd_watermark_image', '', 'yes'),
(1015, 'fpd_accountProductStorage', 'no', 'yes'),
(1016, 'fpd_autoOpenInfo', 'no', 'yes'),
(1017, 'fpd_zoom_step', '0.2', 'yes'),
(1018, 'fpd_max_zoom', '3', 'yes'),
(1019, 'fpd_action_snap_grid_width', '50', 'yes'),
(1020, 'fpd_action_snap_grid_height', '50', 'yes'),
(1021, 'fpd_qr_code_prop_resizeToW', '0', 'yes'),
(1022, 'fpd_qr_code_prop_resizeToH', '0', 'yes'),
(1023, 'fpd_qr_code_prop_price', '0', 'yes'),
(1024, 'fpd_qr_code_prop_resizable', 'yes', 'yes'),
(1025, 'fpd_qr_code_prop_draggable', 'yes', 'yes'),
(1026, 'fpd_sharing', 'no', 'yes'),
(1027, 'fpd_sharing_og_image', 'no', 'yes'),
(1028, 'fpd_sharing_cache_days', '5', 'yes'),
(1029, 'fpd_sharing_social_networks', 'a:4:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:10:\"googleplus\";i:3;s:5:\"email\";}', 'yes'),
(1034, 'fpd_hex_names', 'cccccc:grey,000000:black,FF0000:red,FFFF00:yellow', 'yes'),
(1035, 'fpd_enable_text_color_prices', 'no', 'yes'),
(1036, 'fpd_enable_image_color_prices', 'no', 'yes'),
(1037, 'fpd_color_prices', '', 'yes'),
(1038, 'fpd_color_colorPickerPalette', '', 'yes'),
(1039, 'fpd_common_fonts', '', 'yes'),
(1040, 'fpd_google_webfonts', 'a:2:{i:0;s:14:\"Aladin:regular\";i:1;s:18:\"Eagle+Lake:regular\";}', 'yes'),
(1041, 'fpd_fonts_directory', '', 'yes'),
(1042, 'fpd_lang_default', '{\"toolbar\":{\"fill\":\"Fill\",\"font_family_search\":\"Search Fonts\",\"transform\":\"Transform\",\"position\":\"Position\",\"move_up\":\"Move Up\",\"move_down\":\"Move Down\",\"reset\":\"Reset\",\"font_size\":\"Font Size\",\"line_height\":\"Line Height\",\"bold\":\"Bold\",\"italic\":\"Italic\",\"underline\":\"Underline\",\"text_align\":\"Text Alignment\",\"stroke\":\"Stroke\",\"stroke_width\":\"Stroke Width\",\"curved_text\":\"Curved Text\",\"edit_text\":\"Edit Text\",\"color\":\"Color\",\"patterns\":\"Patterns\",\"transparency\":\"Transparency\",\"align_left\":\"Align Left\",\"align_top\":\"Align Top\",\"align_right\":\"Align Right\",\"align_bottom\":\"Align Bottom\",\"center_h\":\"Center Horizontal\",\"center_v\":\"Center Vertical\",\"flip_h\":\"Flip Horizontal\",\"flip_v\":\"Flip Vertical\",\"curved_text_switch\":\"Switch\",\"curved_text_reverse\":\"Reverse\",\"radius\":\"Radius\",\"spacing\":\"Spacing\",\"letter_spacing\":\"Letter Spacing\",\"advanced_editing\":\"Advanced Editing\",\"text_transform\":\"Text Transform\",\"back\":\"Back\",\"shadow\":\"Shadow\",\"shadow_blur\":\"Blur\",\"shadow_offset_x\":\"Offset X\",\"shadow_offset_y\":\"Offset Y\"},\"actions\":{\"reset_product\":\"Reset\",\"zoom\":\"Zoom\",\"magnify_glass\":\"Magnify Glass\",\"download\":\"Download\",\"download_current_view\":\"Only export current showing view\",\"info\":\"Info\",\"info_content\":\"You can set the info text in the Fancy Product Designer Labels settings.\",\"print\":\"Print\",\"save\":\"Save\",\"load\":\"Load\",\"manage_layers\":\"Manage Layers\",\"qr_code\":\"Add QR-Code\",\"qr_code_input\":\"Enter a URL, some text...\",\"qr_code_add_btn\":\"Add QR-Code\",\"undo\":\"Undo\",\"redo\":\"Redo\",\"snap\":\"Center Snap\",\"preview_lightbox\":\"Preview\",\"save_placeholder\":\"Optional: Enter a title\",\"ruler\":\"Toggle Ruler\",\"previous_view\":\"Previous View\",\"next_view\":\"Next View\",\"start_guided_tour\":\"Start Guided Tour\"},\"modules\":{\"products\":\"Swap Product\",\"images\":\"Add Image\",\"upload_zone\":\"Click or drop images here\",\"facebook_select_album\":\"Select An Album\",\"text\":\"Add Text\",\"text_input_placeholder\":\"Enter some text\",\"text_add_btn\":\"Add Text\",\"designs\":\"Choose From Designs\",\"designs_search_in\":\"Search in\",\"manage_layers\":\"Manage Layers\",\"images_agreement\":\"I have the rights to use the images.\",\"images_confirm_button\":\"Confirm\",\"pixabay_search\":\"Search in Pixabay library\",\"depositphotos_search\":\"Search in depositphotos.com\",\"depositphotos_search_category\":\"Search In \",\"text_Layers\":\"Text Layers\",\"text_layers_clear\":\"Clear\",\"layouts\":\"Layouts\",\"layouts_confirm_replacement\":\"Are you sure to replace all elements in the current view?\",\"layouts_confirm_button\":\"Yes, got it!\"},\"image_editor\":{\"mask\":\"Mask\",\"filters\":\"Filters\",\"color_manipulation\":\"Color Manipulation\",\"custom_cropping\":\"Custom Cropping\",\"filter_none\":\"None\",\"brightness\":\"Brightness\",\"contrast\":\"Contrast\",\"remove_white\":\"Remove White\",\"remove_white_distance\":\"Distance\",\"restore\":\"Restore Original\",\"save\":\"Save\"},\"misc\":{\"initializing\":\"Initializing Product Designer\",\"out_of_bounding_box\":\"Move element in its containment!\",\"product_saved\":\"Product Saved!\",\"loading_image\":\"Loading Image...\",\"uploaded_image_size_alert\":\"Sorry! But the uploaded image size does not conform our indication of size.<br \\/>Minimum Width: %minW pixels<br \\/>Minimum Height: %minH pixels<br \\/>Maximum Width: %maxW pixels<br \\/>Maximum Height: %maxH pixels\",\"modal_done\":\"Done\",\"minimum_dpi_info\":\"The JPEG image does not have the required DPI of %dpi.\",\"maximum_size_info\":\"The image %filename exceeds the maximum file size of %mbMB.\",\"customization_button\":\"Customize\",\"shortcode_order:_success_sent\":\"The order has been successfully sent to the site owner!\",\"shortcode_order:_fail_sent\":\"The order could not be sent. Please try again or contact the site owner!\",\"not_supported_device_info\":\"Sorry! But the product designer can not be displayed on your device. Please use a device with a larger screen!\",\"share:_button\":\"Share Design\",\"share:_process\":\"An unique URL to share will be created for you...\",\"share:_default_text\":\"Check out my design!\",\"customization_required_info\":\"You need to customize the default design!\",\"image_added\":\"Image Added!\",\"reset_confirm\":\"Are you sure to reset everything?\",\"popup_blocker_alert\":\"Please disable your pop-up blocker and try again.\",\"shortcode_form:send\":\"Send\",\"shortcode_form:name_placeholder\":\"Enter your name here\",\"shortcode_form:email_placeholder\":\"Enter your email here\",\"login_required_info\":\"You need to be logged in to upload images!\",\"view_optional_unlock\":\"Unlock view\",\"account_storage:login_required\":\"Please log into your account!\",\"account_storage:products_loaded\":\"Saved Products Loaded.\",\"account_storage:saved_products\":\"Saved Products\",\"guided_tour_back\":\"Back\",\"guided_tour_next\":\"Next\",\"automated_export:download\":\"Download Print-Ready File\"},\"plus\":{\"names_numbers\":\"Names & Numbers\",\"names_numbers_add_new\":\"Add New\",\"drawing\":\"Free Drawing\",\"drawing_brush_type\":\"Brush Type\",\"drawing_pencil\":\"Pencil\",\"drawing_circle\":\"Circle\",\"drawing_spray\":\"Spray\",\"drawing_color\":\"Color\",\"drawing_line_width\":\"Line Width\",\"drawing_draw_here\":\"Draw Here\",\"drawing_clear\":\"Clear\",\"drawing_add\":\"Add\",\"bulk_add_variations_title\":\"Bulk Order\",\"bulk_add_variations_add\":\"Add\",\"bulk_add_variations_term\":\"Please set all variations in the Bulk Order panel correctly!\",\"dynamic_views\":\"Manage Views\",\"dynamic_views_add_view_info\":\"Add new view\",\"dynamic_views_add_blank\":\"Blank\",\"dynamic_views_add_from_layouts\":\"From Layouts\"},\"woocommerce\":{\"catalog:_add_to_cart\":\"Customize\",\"cart:_re-edit product\":\"Click here to re-edit\",\"get_a_quote\":\"Get a quote\",\"order:_view_customized_product\":\"View Customized Product\",\"save_order\":\"Save Order\",\"saving_order\":\"Saving Order\",\"order_saved\":\"Order Saved\",\"order_saving_failed\":\"Saving Order Failed. Please try again!\",\"loading_product\":\"Loading product...\",\"product_loading_fail\":\"Product could not be loaded. Please try again!\"}}', 'yes'),
(1043, 'fpd_lang_en_US', '{\"toolbar\":{\"fill\":\"Fill\",\"font_family_search\":\"Search Fonts\",\"transform\":\"Transform\",\"position\":\"Position\",\"move_up\":\"Move Up\",\"move_down\":\"Move Down\",\"reset\":\"Reset\",\"font_size\":\"Font Size\",\"line_height\":\"Line Height\",\"bold\":\"Bold\",\"italic\":\"Italic\",\"underline\":\"Underline\",\"text_align\":\"Text Alignment\",\"stroke\":\"Stroke\",\"stroke_width\":\"Stroke Width\",\"curved_text\":\"Curved Text\",\"edit_text\":\"Edit Text\",\"color\":\"Color\",\"patterns\":\"Patterns\",\"transparency\":\"Transparency\",\"align_left\":\"Align Left\",\"align_top\":\"Align Top\",\"align_right\":\"Align Right\",\"align_bottom\":\"Align Bottom\",\"center_h\":\"Center Horizontal\",\"center_v\":\"Center Vertical\",\"flip_h\":\"Flip Horizontal\",\"flip_v\":\"Flip Vertical\",\"curved_text_switch\":\"Switch\",\"curved_text_reverse\":\"Reverse\",\"radius\":\"Radius\",\"spacing\":\"Spacing\",\"letter_spacing\":\"Letter Spacing\",\"advanced_editing\":\"Advanced Editing\",\"text_transform\":\"Text Transform\",\"back\":\"Back\",\"shadow\":\"Shadow\",\"shadow_blur\":\"Blur\",\"shadow_offset_x\":\"Offset X\",\"shadow_offset_y\":\"Offset Y\"},\"actions\":{\"reset_product\":\"Reset\",\"zoom\":\"Zoom\",\"magnify_glass\":\"Magnify Glass\",\"download\":\"Download\",\"download_current_view\":\"Only export current showing view\",\"info\":\"Info\",\"info_content\":\"You can set the info text in the Fancy Product Designer Labels settings.\",\"print\":\"Print\",\"save\":\"Save\",\"load\":\"Load\",\"manage_layers\":\"Manage Layers\",\"qr_code\":\"Add QR-Code\",\"qr_code_input\":\"Enter a URL, some text...\",\"qr_code_add_btn\":\"Add QR-Code\",\"undo\":\"Undo\",\"redo\":\"Redo\",\"snap\":\"Center Snap\",\"preview_lightbox\":\"Preview\",\"save_placeholder\":\"Optional: Enter a title\",\"ruler\":\"Toggle Ruler\",\"previous_view\":\"Previous View\",\"next_view\":\"Next View\",\"start_guided_tour\":\"Start Guided Tour\"},\"modules\":{\"products\":\"Swap Product\",\"images\":\"Add Image\",\"upload_zone\":\"Click or drop images here\",\"facebook_select_album\":\"Select An Album\",\"text\":\"Add Text\",\"text_input_placeholder\":\"Enter some text\",\"text_add_btn\":\"Add Text\",\"designs\":\"Choose From Designs\",\"designs_search_in\":\"Search in\",\"manage_layers\":\"Manage Layers\",\"images_agreement\":\"I have the rights to use the images.\",\"images_confirm_button\":\"Confirm\",\"pixabay_search\":\"Search in Pixabay library\",\"depositphotos_search\":\"Search in depositphotos.com\",\"depositphotos_search_category\":\"Search In \",\"text_Layers\":\"Text Layers\",\"text_layers_clear\":\"Clear\",\"layouts\":\"Layouts\",\"layouts_confirm_replacement\":\"Are you sure to replace all elements in the current view?\",\"layouts_confirm_button\":\"Yes, got it!\"},\"image_editor\":{\"mask\":\"Mask\",\"filters\":\"Filters\",\"color_manipulation\":\"Color Manipulation\",\"custom_cropping\":\"Custom Cropping\",\"filter_none\":\"None\",\"brightness\":\"Brightness\",\"contrast\":\"Contrast\",\"remove_white\":\"Remove White\",\"remove_white_distance\":\"Distance\",\"restore\":\"Restore Original\",\"save\":\"Save\"},\"misc\":{\"initializing\":\"Initializing Product Designer\",\"out_of_bounding_box\":\"Move element in its containment!\",\"product_saved\":\"Product Saved!\",\"loading_image\":\"Loading Image...\",\"uploaded_image_size_alert\":\"Sorry! But the uploaded image size does not conform our indication of size.<br \\/>Minimum Width: %minW pixels<br \\/>Minimum Height: %minH pixels<br \\/>Maximum Width: %maxW pixels<br \\/>Maximum Height: %maxH pixels\",\"modal_done\":\"Done\",\"minimum_dpi_info\":\"The JPEG image does not have the required DPI of %dpi.\",\"maximum_size_info\":\"The image %filename exceeds the maximum file size of %mbMB.\",\"customization_button\":\"Customize\",\"shortcode_order:_success_sent\":\"The order has been successfully sent to the site owner!\",\"shortcode_order:_fail_sent\":\"The order could not be sent. Please try again or contact the site owner!\",\"not_supported_device_info\":\"Sorry! But the product designer can not be displayed on your device. Please use a device with a larger screen!\",\"share:_button\":\"Share Design\",\"share:_process\":\"An unique URL to share will be created for you...\",\"share:_default_text\":\"Check out my design!\",\"customization_required_info\":\"You need to customize the default design!\",\"image_added\":\"Image Added!\",\"reset_confirm\":\"Are you sure to reset everything?\",\"popup_blocker_alert\":\"Please disable your pop-up blocker and try again.\",\"shortcode_form:send\":\"Send\",\"shortcode_form:name_placeholder\":\"Enter your name here\",\"shortcode_form:email_placeholder\":\"Enter your email here\",\"login_required_info\":\"You need to be logged in to upload images!\",\"view_optional_unlock\":\"Unlock view\",\"account_storage:login_required\":\"Please log into your account!\",\"account_storage:products_loaded\":\"Saved Products Loaded.\",\"account_storage:saved_products\":\"Saved Products\",\"guided_tour_back\":\"Back\",\"guided_tour_next\":\"Next\",\"automated_export:download\":\"Download Print-Ready File\"},\"plus\":{\"names_numbers\":\"Names & Numbers\",\"names_numbers_add_new\":\"Add New\",\"drawing\":\"Free Drawing\",\"drawing_brush_type\":\"Brush Type\",\"drawing_pencil\":\"Pencil\",\"drawing_circle\":\"Circle\",\"drawing_spray\":\"Spray\",\"drawing_color\":\"Color\",\"drawing_line_width\":\"Line Width\",\"drawing_draw_here\":\"Draw Here\",\"drawing_clear\":\"Clear\",\"drawing_add\":\"Add\",\"bulk_add_variations_title\":\"Bulk Order\",\"bulk_add_variations_add\":\"Add\",\"bulk_add_variations_term\":\"Please set all variations in the Bulk Order panel correctly!\",\"dynamic_views\":\"Manage Views\",\"dynamic_views_add_view_info\":\"Add new view\",\"dynamic_views_add_blank\":\"Blank\",\"dynamic_views_add_from_layouts\":\"From Layouts\"},\"woocommerce\":{\"catalog:_add_to_cart\":\"Customize\",\"cart:_re-edit product\":\"Click here to re-edit\",\"get_a_quote\":\"Get a quote\",\"order:_view_customized_product\":\"View Customized Product\",\"save_order\":\"Save Order\",\"saving_order\":\"Saving Order\",\"order_saved\":\"Order Saved\",\"order_saving_failed\":\"Saving Order Failed. Please try again!\",\"loading_product\":\"Loading product...\",\"product_loading_fail\":\"Product could not be loaded. Please try again!\"}}', 'yes'),
(1056, 'fpd_ui_layout_left', '{\\\"name\\\":\\\"left\\\",\\\"plugin_options\\\":{\\\"stageWidth\\\":1000,\\\"stageHeight\\\":600,\\\"gridColumns\\\":\\\"2\\\",\\\"initialActiveModule\\\":\\\"\\\",\\\"selectedColor\\\":\\\"#f5f5f5\\\",\\\"boundingBoxColor\\\":\\\"#005ede\\\",\\\"outOfBoundaryColor\\\":\\\"#990000\\\",\\\"cornerIconColor\\\":\\\"#000000\\\",\\\"mainBarModules\\\":[\\\"products\\\",\\\"images\\\",\\\"text\\\",\\\"designs\\\"],\\\"actions\\\":{\\\"top\\\":[\\\"download\\\",\\\"print\\\",\\\"snap\\\",\\\"preview-lightbox\\\"],\\\"right\\\":[\\\"magnify-glass\\\",\\\"zoom\\\",\\\"reset-product\\\",\\\"qr-code\\\"],\\\"bottom\\\":[\\\"undo\\\",\\\"redo\\\"],\\\"left\\\":[\\\"manage-layers\\\",\\\"info\\\",\\\"save\\\",\\\"load\\\"]},\\\"toolbarPlacement\\\":\\\"smart\\\",\\\"toolbarTheme\\\":\\\"white\\\"},\\\"container_classes\\\":\\\"fpd-container fpd-views-inside-left fpd-shadow-1 fpd-top-actions-centered fpd-bottom-actions-centered fpd-disable-touch-scrolling fpd-device-desktop fpd-clearfix fpd-grid-columns-2 fpd-sidebar fpd-tabs fpd-tabs-side\\\",\\\"css_colors\\\":{\\\"primary_color\\\":\\\"#000000\\\",\\\"secondary_color\\\":\\\"#27ae60\\\"},\\\"toolbar_exclude_tools\\\":null,\\\"custom_css\\\":\\\"\\\",\\\"guided_tour\\\":[],\\\"css\\\":\\\".fpd-container .fpd-primary-bg-color,.fpd-actions-wrapper > .fpd-action-btn:hover,.fpd-actions-wrapper > .fpd-action-btn.fpd-active,.fpd-thumbnail-preview > .fpd-preview-price{background-color: #000}.fpd-container .fpd-primary-text-color,.fpd-navigation > div.fpd-active,.fpd-bottom-nav > div.fpd-active{color: #000}.fpd-container .fpd-secondary-bg-color,.fpd-container .fpd-btn,.fpd-modal-wrapper .fpd-modal-content .fpd-btn,.fpd-switch-container.fpd-enabled .fpd-switch-toggle,.fpd-switch-container.fpd-enabled .fpd-switch-bar,.fpd-modal-product-designer.fpd-modal-overlay .fpd-done{background-color: #27ae60}.fpd-container .fpd-btn:hover,.fpd-modal-wrapper .fpd-modal-content .fpd-btn:hover{background: #2aba67}.fpd-container .fpd-btn.fpd-secondary,.fpd-modal-wrapper .fpd-modal-content .fpd-btn.fpd-secondary{background: #e0e1e2}.fpd-container .fpd-btn.fpd-secondary:hover,.fpd-modal-wrapper .fpd-modal-content .fpd-btn.fpd-secondary:hover{background: #e8e9e9}.fpd-container .fpd-btn.fpd-dark{background: rgba(0,0,0,0.6)}.fpd-container .fpd-btn.fpd-dark:hover{background: rgba(26,26,26,0.6)}.fpd-toggle.fpd-enabled{color: #27ae60 !important}.fpd-container,.fpd-container textarea,.fpd-sub-tooltip-theme .tooltipster-content,.fpd-modal-wrapper > .fpd-modal-close{color: rgba(0,0,0,0.8)}.fpd-actions-wrapper > .fpd-action-btn,.fpd-list > .fpd-list-row,.fpd-container.fpd-sidebar > .fpd-mainbar,.fpd-container textarea,.fpd-container.fpd-sidebar.fpd-sidebar-right > .fpd-mainbar,.fpd-container.fpd-main-bar-container .fpd-mainbar,.fpd-container .fpd-module input,.fpd-thumbnail-preview,.fpd-container .fpd-stage-off-canvas,.fpd-manage-layers-panel .fpd-sortable-placeholder,.fpd-container .fpd-close-off-canvas,.fpd-topbar[class*=\\\\\\\"fpd-off-canvas-\\\\\\\"] .fpd-mainbar .fpd-content,.fpd-container input[type=\\\\\\\"text\\\\\\\"],.fpd-text-layers-panel .fpd-list > div{border-color: rgba(0,0,0,0.1) !important}.fpd-container textarea:focus,.fpd-element-toolbar textarea:focus{border: 1px solid rgba(0,0,0,0.1)}\\\"}', 'yes'),
(1091, '_transient_shipping-transient-version', '1546553644', 'yes'),
(8006, '_transient_timeout_external_ip_address_35.197.208.26', '1552940729', 'no'),
(8007, '_transient_external_ip_address_35.197.208.26', '185.42.223.205', 'no'),
(8481, '_transient_timeout_external_ip_address_35.220.156.185', '1553013031', 'no'),
(8482, '_transient_external_ip_address_35.220.156.185', '185.42.223.205', 'no'),
(8771, '_transient_timeout_external_ip_address_35.197.169.32', '1553046496', 'no'),
(8772, '_transient_external_ip_address_35.197.169.32', '2a04:92c1:1:2:1::1c', 'no'),
(8820, '_transient_timeout_external_ip_address_35.198.203.184', '1553053417', 'no'),
(8821, '_transient_external_ip_address_35.198.203.184', '185.42.223.205', 'no'),
(8842, '_transient_timeout_external_ip_address_35.198.206.166', '1553056281', 'no'),
(8843, '_transient_external_ip_address_35.198.206.166', '2a04:92c1:1:2:1::1c', 'no'),
(4629, 'jetpack_activated', '1', 'yes'),
(4632, 'jetpack_activation_source', 'a:2:{i:0;s:4:\"list\";i:1;N;}', 'yes'),
(8988, '_transient_timeout_external_ip_address_10.128.1.1', '1553210108', 'no'),
(8989, '_transient_external_ip_address_10.128.1.1', '185.42.223.205', 'no'),
(9001, '_transient_timeout_wc_shipping_method_count_1_1546553644', '1555218470', 'no'),
(9002, '_transient_wc_shipping_method_count_1_1546553644', '0', 'no'),
(9055, '_transient_timeout_wc_low_stock_count', '1555299672', 'no'),
(9056, '_transient_wc_low_stock_count', '0', 'no'),
(9057, '_transient_timeout_wc_outofstock_count', '1555299672', 'no'),
(9058, '_transient_wc_outofstock_count', '0', 'no'),
(9465, '_transient_timeout_fpd_check_shares_dir', '1552969164', 'no'),
(9466, '_transient_fpd_check_shares_dir', 'yes', 'no'),
(9072, 'fpd_design_category_children', 'a:0:{}', 'yes'),
(9074, 'fpd_category_parameters_animals', '', 'yes'),
(9100, 'fpd_designs_parameter_y', '0', 'yes'),
(9101, 'fpd_designs_parameter_z', '-1', 'yes'),
(9102, 'fpd_designs_parameter_minScaleLimit', '0.01', 'yes'),
(9103, 'fpd_designs_parameter_colors', '', 'yes'),
(9104, 'fpd_designs_parameter_colorLinkGroup', '', 'yes'),
(9105, 'fpd_designs_parameter_price', '0', 'yes'),
(9106, 'fpd_designs_parameter_replace', '', 'yes'),
(9107, 'fpd_designs_parameter_replaceInAllViews', 'no', 'yes'),
(9108, 'fpd_designs_parameter_autoCenter', 'yes', 'yes'),
(9109, 'fpd_designs_parameter_draggable', 'yes', 'yes'),
(9110, 'fpd_designs_parameter_rotatable', 'yes', 'yes'),
(9111, 'fpd_designs_parameter_resizable', 'yes', 'yes'),
(9112, 'fpd_designs_parameter_zChangeable', 'yes', 'yes'),
(9113, 'fpd_designs_parameter_autoSelect', 'no', 'yes'),
(9114, 'fpd_designs_parameter_topped', 'no', 'yes'),
(9115, 'fpd_designs_parameter_uniScalingUnlockable', 'no', 'yes'),
(9116, 'fpd_designs_parameter_bounding_box_control', 'no', 'yes'),
(9117, 'fpd_designs_parameter_bounding_box_by_other', '', 'yes'),
(9118, 'fpd_designs_parameter_bounding_box_x', '', 'yes'),
(9119, 'fpd_designs_parameter_bounding_box_y', '', 'yes'),
(9120, 'fpd_designs_parameter_bounding_box_width', '', 'yes'),
(9121, 'fpd_designs_parameter_bounding_box_height', '', 'yes'),
(9122, 'fpd_designs_parameter_boundingBoxMode', 'inside', 'yes'),
(9123, 'fpd_designs_parameter_scaleMode', 'fit', 'yes'),
(9124, 'fpd_designs_parameter_patterns', 'a:4:{i:0;s:80:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_svg/BesemeMucho2.jpg\";i:1;s:79:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_svg/LoversCoral.jpg\";i:2;s:79:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_svg/Psychedelic.jpg\";i:3;s:82:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_svg/PalmBeachCoral.jpg\";}', 'yes'),
(9125, 'fpd_uploaded_designs_parameter_minW', '100', 'yes'),
(9126, 'fpd_uploaded_designs_parameter_minH', '100', 'yes'),
(9127, 'fpd_uploaded_designs_parameter_maxW', '10000', 'yes'),
(9128, 'fpd_uploaded_designs_parameter_maxH', '10000', 'yes'),
(9129, 'fpd_uploaded_designs_parameter_resizeToW', '0', 'yes'),
(9130, 'fpd_uploaded_designs_parameter_resizeToH', '0', 'yes'),
(9131, 'fpd_uploaded_designs_parameter_maxSize', '10', 'yes'),
(9132, 'fpd_uploaded_designs_parameter_minDPI', '72', 'yes'),
(9133, 'fpd_uploaded_designs_parameter_minScaleLimit', '0.01', 'yes'),
(9134, 'fpd_uploaded_designs_parameter_advancedEditing', 'no', 'yes'),
(9135, 'fpd_uploaded_designs_parameter_filter', 'none', 'yes'),
(9136, 'fpd_all_image_colors', '', 'yes'),
(9137, 'fpd_all_image_colorLinkGroup', '', 'yes'),
(9138, 'fpd_custom_texts_parameter_x', '0', 'yes'),
(9139, 'fpd_custom_texts_parameter_y', '0', 'yes'),
(9140, 'fpd_custom_texts_parameter_z', '-1', 'yes'),
(9141, 'fpd_custom_texts_parameter_fill', '', 'yes'),
(9142, 'fpd_custom_texts_parameter_colors', '', 'yes'),
(9143, 'fpd_custom_texts_parameter_colorLinkGroup', '', 'yes'),
(9144, 'fpd_custom_texts_parameter_price', '0', 'yes'),
(9145, 'fpd_custom_texts_parameter_replace', '', 'yes'),
(9146, 'fpd_custom_texts_parameter_replaceInAllViews', 'no', 'yes'),
(9147, 'fpd_custom_texts_parameter_autoCenter', 'yes', 'yes'),
(9148, 'fpd_custom_texts_parameter_draggable', 'yes', 'yes'),
(9149, 'fpd_custom_texts_parameter_rotatable', 'yes', 'yes'),
(9150, 'fpd_custom_texts_parameter_resizable', 'yes', 'yes'),
(9151, 'fpd_custom_texts_parameter_zChangeable', 'yes', 'yes'),
(9152, 'fpd_custom_texts_parameter_autoSelect', 'no', 'yes'),
(9153, 'fpd_custom_texts_parameter_topped', 'no', 'yes'),
(9154, 'fpd_custom_texts_parameter_uniScalingUnlockable', 'no', 'yes'),
(9155, 'fpd_custom_texts_parameter_curvable', 'yes', 'yes'),
(9156, 'fpd_custom_texts_parameter_curveSpacing', '10', 'yes'),
(9157, 'fpd_custom_texts_parameter_curveRadius', '80', 'yes'),
(9158, 'fpd_custom_texts_parameter_curveReverse', 'no', 'yes'),
(9159, 'fpd_custom_texts_parameter_bounding_box_control', 'no', 'yes'),
(9160, 'fpd_custom_texts_parameter_bounding_box_by_other', '', 'yes'),
(9161, 'fpd_custom_texts_parameter_bounding_box_x', '', 'yes'),
(9162, 'fpd_custom_texts_parameter_bounding_box_y', '', 'yes'),
(9163, 'fpd_custom_texts_parameter_bounding_box_width', '', 'yes'),
(9164, 'fpd_custom_texts_parameter_bounding_box_height', '', 'yes'),
(9165, 'fpd_custom_texts_parameter_boundingBoxMode', 'inside', 'yes'),
(9166, 'fpd_custom_texts_parameter_textSize', '18', 'yes'),
(9167, 'fpd_custom_texts_parameter_minFontSize', '1', 'yes'),
(9168, 'fpd_custom_texts_parameter_maxFontSize', '1000', 'yes'),
(9169, 'fpd_custom_texts_parameter_widthFontSize', '0', 'yes'),
(9170, 'fpd_font', '', 'yes'),
(9171, 'fpd_custom_texts_parameter_maxLength', '0', 'yes'),
(9172, 'fpd_custom_texts_parameter_maxLines', '0', 'yes'),
(9173, 'fpd_custom_texts_parameter_textAlign', 'left', 'yes'),
(9174, 'fpd_custom_texts_parameter_patterns', 'a:3:{i:0;s:84:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_text/Black-and-Blush.jpg\";i:1;s:80:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_text/Artist-Rag .jpg\";i:2;s:80:\"https://printandembroid.com/wp-content/uploads/fpd_patterns_text/LoversCoral.jpg\";}', 'yes'),
(9175, 'fpd_custom_texts_parameter_textLinkGroup', '', 'yes'),
(9176, 'fpd_all_text_colors', '', 'yes'),
(9177, 'fpd_all_text_strokeColors', '', 'yes'),
(9178, 'fpd_common_parameter_originX', 'center', 'yes'),
(9179, 'fpd_common_parameter_originY', 'center', 'yes'),
(4635, 'jetpack_available_modules', 'a:1:{s:5:\"7.1.1\";a:45:{s:18:\"after-the-deadline\";s:3:\"1.1\";s:8:\"carousel\";s:3:\"1.5\";s:13:\"comment-likes\";s:3:\"5.1\";s:8:\"comments\";s:3:\"1.4\";s:12:\"contact-form\";s:3:\"1.3\";s:9:\"copy-post\";s:3:\"7.0\";s:20:\"custom-content-types\";s:3:\"3.1\";s:10:\"custom-css\";s:3:\"1.7\";s:21:\"enhanced-distribution\";s:3:\"1.2\";s:16:\"google-analytics\";s:3:\"4.5\";s:19:\"gravatar-hovercards\";s:3:\"1.1\";s:15:\"infinite-scroll\";s:3:\"2.0\";s:8:\"json-api\";s:3:\"1.9\";s:5:\"latex\";s:3:\"1.1\";s:11:\"lazy-images\";s:5:\"5.6.0\";s:5:\"likes\";s:3:\"2.2\";s:6:\"manage\";s:3:\"3.4\";s:8:\"markdown\";s:3:\"2.8\";s:9:\"masterbar\";s:3:\"4.8\";s:9:\"minileven\";s:3:\"1.8\";s:7:\"monitor\";s:3:\"2.6\";s:5:\"notes\";s:3:\"1.9\";s:10:\"photon-cdn\";s:3:\"6.6\";s:6:\"photon\";s:3:\"2.0\";s:13:\"post-by-email\";s:3:\"2.0\";s:7:\"protect\";s:3:\"3.4\";s:9:\"publicize\";s:3:\"2.0\";s:3:\"pwa\";s:5:\"5.6.0\";s:13:\"related-posts\";s:3:\"2.9\";s:6:\"search\";s:3:\"5.0\";s:9:\"seo-tools\";s:3:\"4.4\";s:10:\"sharedaddy\";s:3:\"1.1\";s:10:\"shortcodes\";s:3:\"1.1\";s:10:\"shortlinks\";s:3:\"1.1\";s:8:\"sitemaps\";s:3:\"3.9\";s:3:\"sso\";s:3:\"2.6\";s:5:\"stats\";s:3:\"1.1\";s:13:\"subscriptions\";s:3:\"1.2\";s:13:\"tiled-gallery\";s:3:\"2.1\";s:10:\"vaultpress\";s:5:\"0:1.2\";s:18:\"verification-tools\";s:3:\"3.0\";s:10:\"videopress\";s:3:\"2.5\";s:17:\"widget-visibility\";s:3:\"2.4\";s:7:\"widgets\";s:3:\"1.2\";s:7:\"wordads\";s:5:\"4.5.0\";}}', 'yes'),
(4636, 'jetpack_options', 'a:7:{s:7:\"version\";s:16:\"6.8.1:1549986525\";s:11:\"old_version\";s:16:\"6.8.1:1549986525\";s:28:\"fallback_no_verify_ssl_certs\";i:0;s:9:\"time_diff\";i:0;s:2:\"id\";i:158309057;s:6:\"public\";i:1;s:9:\"jumpstart\";s:14:\"new_connection\";}', 'yes'),
(9099, 'fpd_designs_parameter_x', '0', 'yes'),
(4637, 'jetpack_sync_settings_disable', '0', 'yes'),
(4639, 'do_activate', '0', 'yes'),
(4644, 'wc_connect_options', 'a:0:{}', 'yes'),
(4645, 'jetpack_log', 'a:1:{i:0;a:4:{s:4:\"time\";i:1549986527;s:7:\"user_id\";i:1;s:7:\"blog_id\";b:0;s:4:\"code\";s:8:\"register\";}}', 'no'),
(4646, 'jetpack_tos_agreed', '1', 'yes'),
(4647, 'jetpack_secrets', 'a:1:{s:19:\"jetpack_authorize_1\";a:3:{s:8:\"secret_1\";s:32:\"HGgaPnFYDgspJqLRxC78qsbBv9Yzzr72\";s:8:\"secret_2\";s:32:\"KKTx7NyrEVs4XznpYbznDqnAfKr4GBgV\";s:3:\"exp\";i:1552766682;}}', 'no'),
(4648, 'jetpack_private_options', 'a:1:{s:10:\"blog_token\";s:65:\"G4b3g@QZEB#7gKMC4Ewj6iBh5sdMvOXO.51!8Vw8z(u9)2xd^C9w3^VB#tYTXXhnr\";}', 'yes'),
(4649, 'jetpack_last_connect_url_check', '1552759482', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `pae_postmeta`
--

CREATE TABLE `pae_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_postmeta`
--

INSERT INTO `pae_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(66, 13, '_wc_average_rating', '0'),
(65, 13, '_wc_rating_count', 'a:0:{}'),
(64, 13, '_wc_review_count', '0'),
(6, 6, '_wc_review_count', '0'),
(7, 6, '_wc_rating_count', 'a:0:{}'),
(8, 6, '_wc_average_rating', '0'),
(9, 6, '_edit_last', '1'),
(10, 6, '_edit_lock', '1552708365:1'),
(11, 7, '_wp_attached_file', '2018/12/HTB1rulneCcqBKNjSZFgq6x_kXXat1.jpg'),
(12, 7, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:42:\"2018/12/HTB1rulneCcqBKNjSZFgq6x_kXXat1.jpg\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-450x450.jpg\";s:5:\"width\";i:450;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-450x450.jpg\";s:5:\"width\";i:450;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:42:\"HTB1rulneCcqBKNjSZFgq6x_kXXat1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(13, 7, '_wp_attachment_image_alt', 'Iron on Patches, Flamingos'),
(14, 6, '_thumbnail_id', '7'),
(15, 6, '_wp_old_date', '2018-12-27'),
(16, 6, '_sku', ''),
(17, 6, '_regular_price', '19.58'),
(18, 6, '_sale_price', ''),
(19, 6, '_sale_price_dates_from', ''),
(20, 6, '_sale_price_dates_to', ''),
(21, 6, 'total_sales', '0'),
(22, 6, '_tax_status', 'taxable'),
(23, 6, '_tax_class', ''),
(24, 6, '_manage_stock', 'no'),
(25, 6, '_backorders', 'no'),
(26, 6, '_low_stock_amount', ''),
(27, 6, '_sold_individually', 'no'),
(28, 6, '_weight', '1'),
(29, 6, '_length', '21'),
(30, 6, '_width', '4'),
(31, 6, '_height', '4'),
(32, 6, '_upsell_ids', 'a:0:{}'),
(33, 6, '_crosssell_ids', 'a:0:{}'),
(34, 6, '_purchase_note', ''),
(35, 6, '_default_attributes', 'a:0:{}'),
(36, 6, '_virtual', 'no'),
(37, 6, '_downloadable', 'no'),
(38, 6, '_product_image_gallery', ''),
(39, 6, '_download_limit', '-1'),
(40, 6, '_download_expiry', '-1'),
(41, 6, '_stock', NULL),
(42, 6, '_stock_status', 'instock'),
(43, 6, '_product_version', '3.5.3'),
(44, 6, '_price', '19.58'),
(45, 8, '_edit_lock', '1552708291:1'),
(46, 8, '_edit_last', '1'),
(47, 9, '_wp_attached_file', '2019/01/t-shirt-template-20.jpg'),
(48, 9, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:800;s:4:\"file\";s:31:\"2019/01/t-shirt-template-20.jpg\";s:5:\"sizes\";a:8:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"t-shirt-template-20-300x375.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:375;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-450x563.jpg\";s:5:\"width\";i:450;s:6:\"height\";i:563;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-450x563.jpg\";s:5:\"width\";i:450;s:6:\"height\";i:563;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"t-shirt-template-20-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(49, 10, '_wp_attached_file', '2019/01/test-svg.png'),
(50, 10, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:648;s:6:\"height\";i:432;s:4:\"file\";s:20:\"2019/01/test-svg.png\";s:5:\"sizes\";a:8:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"test-svg-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"test-svg-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"test-svg-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"test-svg-450x300.png\";s:5:\"width\";i:450;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"test-svg-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"test-svg-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:20:\"test-svg-450x300.png\";s:5:\"width\";i:450;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"test-svg-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(51, 8, 'woo_pd', '{\"templates\":{\"pre_images[9]\":\"https://printandembroid.com/wp-content/uploads/2019/01/t-shirt-template-20.jpg\"},\"shapes\":{\"pre_images[10]\":\"https://printandembroid.com/wp-content/uploads/2019/01/test-svg.png\"},\"btn_label\":\"Upload\",\"file_size\":\"1\",\"file_types\":\"jpeg, png, gif, svg\",\"attach_with\":\"6\"}'),
(52, 6, 'wcpd_design_id', '8'),
(53, 11, '_menu_item_type', 'custom'),
(54, 11, '_menu_item_menu_item_parent', '0'),
(55, 11, '_menu_item_object_id', '11'),
(56, 11, '_menu_item_object', 'custom'),
(57, 11, '_menu_item_target', ''),
(58, 11, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(59, 11, '_menu_item_xfn', ''),
(60, 11, '_menu_item_url', 'https://printandembroid.com/'),
(164, 8, '_wp_trash_meta_time', '1552708445'),
(163, 8, '_wp_trash_meta_status', 'publish'),
(67, 13, '_edit_lock', '1546884775:1'),
(68, 13, '_edit_last', '1'),
(69, 13, '_thumbnail_id', '9'),
(70, 13, '_sku', ''),
(71, 13, '_regular_price', '13.99'),
(72, 13, '_sale_price', ''),
(73, 13, '_sale_price_dates_from', ''),
(74, 13, '_sale_price_dates_to', ''),
(75, 13, 'total_sales', '0'),
(76, 13, '_tax_status', 'taxable'),
(77, 13, '_tax_class', ''),
(78, 13, '_manage_stock', 'no'),
(79, 13, '_backorders', 'no'),
(80, 13, '_low_stock_amount', ''),
(81, 13, '_sold_individually', 'no'),
(82, 13, '_weight', '1.61'),
(83, 13, '_length', '20'),
(84, 13, '_width', '3'),
(85, 13, '_height', '3'),
(86, 13, '_upsell_ids', 'a:0:{}'),
(87, 13, '_crosssell_ids', 'a:0:{}'),
(88, 13, '_purchase_note', ''),
(89, 13, '_default_attributes', 'a:0:{}'),
(90, 13, '_virtual', 'no'),
(91, 13, '_downloadable', 'no'),
(92, 13, '_product_image_gallery', ''),
(93, 13, '_download_limit', '-1'),
(94, 13, '_download_expiry', '-1'),
(95, 13, '_stock', NULL),
(96, 13, '_stock_status', 'instock'),
(97, 13, '_product_version', '3.5.3'),
(98, 13, '_price', '13.99'),
(99, 13, 'fpd_product_settings', ''),
(100, 13, 'fpd_source_type', 'product'),
(101, 13, 'fpd_products', '1'),
(102, 13, 'fpd_product_categories', ''),
(103, 13, 'fpd_source_type_mobile', 'category'),
(104, 13, 'fpd_products_mobile', ''),
(105, 13, 'fpd_product_categories_mobile', ''),
(106, 15, '_edit_lock', '1546563054:1'),
(107, 16, '_edit_lock', '1546562661:1'),
(108, 16, '_wp_page_template', 'page-templates/right-sidebarpage.php'),
(109, 16, '_edit_last', '1'),
(110, 16, 'fpd_product_settings', ''),
(111, 16, 'fpd_source_type', 'category'),
(112, 16, 'fpd_products', ''),
(113, 16, 'fpd_product_categories', ''),
(114, 16, 'fpd_source_type_mobile', 'category'),
(115, 16, 'fpd_products_mobile', ''),
(116, 16, 'fpd_product_categories_mobile', ''),
(165, 8, '_wp_desired_post_slug', 'tshirt'),
(118, 15, '_edit_last', '1'),
(119, 15, 'fpd_product_settings', ''),
(120, 15, 'fpd_source_type', 'category'),
(121, 15, 'fpd_products', ''),
(122, 15, 'fpd_product_categories', ''),
(123, 15, 'fpd_source_type_mobile', 'category'),
(124, 15, 'fpd_products_mobile', ''),
(125, 15, 'fpd_product_categories_mobile', ''),
(162, 7, 'fpd_thumbnail', ''),
(129, 22, '_menu_item_type', 'taxonomy'),
(130, 22, '_menu_item_menu_item_parent', '0'),
(131, 22, '_menu_item_object_id', '17'),
(132, 22, '_menu_item_object', 'product_cat'),
(133, 22, '_menu_item_target', ''),
(134, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(135, 22, '_menu_item_xfn', ''),
(136, 22, '_menu_item_url', ''),
(137, 23, '_menu_item_type', 'taxonomy'),
(138, 23, '_menu_item_menu_item_parent', '22'),
(139, 23, '_menu_item_object_id', '16'),
(140, 23, '_menu_item_object', 'product_cat'),
(141, 23, '_menu_item_target', ''),
(142, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(143, 23, '_menu_item_xfn', ''),
(144, 23, '_menu_item_url', ''),
(160, 7, 'animals_order', '0'),
(161, 7, 'fpd_parameters', 'autoCenter=0&draggable=0&rotatable=0&resizable=0&removable=0&zChangeable=0&autoSelect=0&topped=0&uniScalingUnlockable=0&replaceInAllViews=0&advancedEditing=0&excludeFromExport=0&x=0&y=0&z=-1&price=0&_scaleBy=factor&scale=1&resizeToW=&resizeToH=&scaleMode=fit&minScaleLimit=0.01&sku=&replace=&colors=&colorLinkGroup=&bounding_box_x=&bounding_box_y=&bounding_box_width=&bounding_box_height=&bounding_box_by_other=&boundingBoxMode=inside'),
(155, 27, '_wp_attached_file', '2019/01/back.svg'),
(156, 28, '_wp_attached_file', '2019/01/back-color.svg'),
(159, 31, '_wp_attached_file', '2019/01/front.svg'),
(158, 30, '_wp_attached_file', '2019/01/front-color.svg');

-- --------------------------------------------------------

--
-- Table structure for table `pae_posts`
--

CREATE TABLE `pae_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_posts`
--

INSERT INTO `pae_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-12-20 22:45:17', '2018-12-20 22:45:17', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-12-20 22:45:17', '2018-12-20 22:45:17', '', 0, 'https://printandembroid.com/?p=1', 0, 'post', '', 1),
(2, 1, '2018-12-20 22:45:17', '2018-12-20 22:45:17', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://printandembroid.com/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-12-20 22:45:17', '2018-12-20 22:45:17', '', 0, 'https://printandembroid.com/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-12-20 22:45:17', '2018-12-20 22:45:17', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: https://printandembroid.com.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-12-20 22:45:17', '2018-12-20 22:45:17', '', 0, 'https://printandembroid.com/?page_id=3', 0, 'page', '', 0),
(13, 1, '2019-01-03 22:10:23', '2019-01-03 22:10:23', '', 'Numbers', '', 'publish', 'open', 'closed', '', 'numbers', '', '', '2019-01-03 22:10:23', '2019-01-03 22:10:23', '', 0, 'https://printandembroid.com/?post_type=product&#038;p=13', 0, 'product', '', 0),
(6, 1, '2019-01-03 12:12:44', '2019-01-03 12:12:44', '', 'Flamingo', '', 'publish', 'open', 'closed', '', 'flamingo', '', '', '2019-01-03 14:23:46', '2019-01-03 14:23:46', '', 0, 'https://printandembroid.com/?post_type=product&#038;p=6', 0, 'product', '', 0),
(7, 1, '2018-12-27 20:12:39', '2018-12-27 20:12:39', '', 'Iron on Patches, Flamingos', 'Iron on Patches, Flamingos', 'inherit', 'open', 'closed', '', 'htb1rulneccqbknjszfgq6x_kxxat1', '', '', '2019-03-16 03:45:54', '2019-03-16 03:45:54', '', 6, 'https://printandembroid.com/wp-content/uploads/2018/12/HTB1rulneCcqBKNjSZFgq6x_kXXat1.jpg', 0, 'attachment', 'image/jpeg', 0),
(8, 1, '2019-01-03 12:46:38', '2019-01-03 12:46:38', '', 't-shirt design', '', 'trash', 'closed', 'closed', '', 'tshirt__trashed', '', '', '2019-03-16 03:54:05', '2019-03-16 03:54:05', '', 0, 'https://printandembroid.com/?post_type=product-designs&#038;p=8', 0, 'product-designs', '', 0),
(9, 1, '2019-01-03 12:39:47', '2019-01-03 12:39:47', '', 't-shirt-template-20', '', 'inherit', 'open', 'closed', '', 't-shirt-template-20', '', '', '2019-01-03 12:39:47', '2019-01-03 12:39:47', '', 0, 'https://printandembroid.com/wp-content/uploads/2019/01/t-shirt-template-20.jpg', 0, 'attachment', 'image/jpeg', 0),
(10, 1, '2019-01-03 12:45:34', '2019-01-03 12:45:34', '', 'test-svg', '', 'inherit', 'open', 'closed', '', 'test-svg', '', '', '2019-01-03 12:45:34', '2019-01-03 12:45:34', '', 0, 'https://printandembroid.com/wp-content/uploads/2019/01/test-svg.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2019-01-03 14:42:34', '2019-01-03 14:42:34', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2019-01-03 14:42:34', '2019-01-03 14:42:34', '', 0, 'https://printandembroid.com/?p=11', 1, 'nav_menu_item', '', 0),
(15, 1, '2019-01-04 00:45:04', '2019-01-04 00:45:04', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2019-01-04 00:45:05', '2019-01-04 00:45:05', '', 0, 'https://printandembroid.com/?page_id=15', 0, 'page', '', 0),
(16, 1, '2019-01-04 00:44:19', '2019-01-04 00:44:19', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2019-01-04 00:44:20', '2019-01-04 00:44:20', '', 0, 'https://printandembroid.com/?page_id=16', 0, 'page', '', 0),
(17, 1, '2019-01-04 00:44:19', '2019-01-04 00:44:19', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2019-01-04 00:44:19', '2019-01-04 00:44:19', '', 16, 'https://printandembroid.com/blog/uncategorized/16-revision-v1', 0, 'revision', '', 0),
(19, 1, '2019-01-04 00:45:04', '2019-01-04 00:45:04', '', 'Home', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2019-01-04 00:45:04', '2019-01-04 00:45:04', '', 15, 'https://printandembroid.com/blog/uncategorized/15-revision-v1', 0, 'revision', '', 0),
(22, 1, '2019-01-04 00:48:00', '2019-01-04 00:48:00', ' ', '', '', 'publish', 'closed', 'closed', '', '22', '', '', '2019-01-04 00:48:00', '2019-01-04 00:48:00', '', 0, 'https://printandembroid.com/blog/uncategorized/22', 2, 'nav_menu_item', '', 0),
(23, 1, '2019-01-04 00:48:00', '2019-01-04 00:48:00', ' ', '', '', 'publish', 'closed', 'closed', '', '23', '', '', '2019-01-04 00:48:00', '2019-01-04 00:48:00', '', 0, 'https://printandembroid.com/blog/uncategorized/23', 3, 'nav_menu_item', '', 0),
(33, 1, '2019-03-16 03:41:12', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-03-16 03:41:12', '0000-00-00 00:00:00', '', 0, 'https://printandembroid.com/?p=33', 0, 'post', '', 0),
(27, 1, '2019-01-04 02:06:44', '2019-01-04 02:06:44', '', 'back', '', 'inherit', 'open', 'closed', '', 'back', '', '', '2019-01-04 02:06:44', '2019-01-04 02:06:44', '', 0, 'https://printandembroid.com/wp-content/uploads/2019/01/back.svg', 0, 'attachment', 'image/svg+xml', 0),
(28, 1, '2019-01-04 02:06:45', '2019-01-04 02:06:45', '', 'back-color', '', 'inherit', 'open', 'closed', '', 'back-color', '', '', '2019-01-04 02:06:45', '2019-01-04 02:06:45', '', 0, 'https://printandembroid.com/wp-content/uploads/2019/01/back-color.svg', 0, 'attachment', 'image/svg+xml', 0),
(31, 1, '2019-01-04 02:12:38', '2019-01-04 02:12:38', '', 'front', '', 'inherit', 'open', 'closed', '', 'front', '', '', '2019-01-04 02:12:38', '2019-01-04 02:12:38', '', 0, 'https://printandembroid.com/wp-content/uploads/2019/01/front.svg', 0, 'attachment', 'image/svg+xml', 0),
(30, 1, '2019-01-04 02:06:46', '2019-01-04 02:06:46', '', 'front-color', '', 'inherit', 'open', 'closed', '', 'front-color', '', '', '2019-01-04 02:06:46', '2019-01-04 02:06:46', '', 0, 'https://printandembroid.com/wp-content/uploads/2019/01/front-color.svg', 0, 'attachment', 'image/svg+xml', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pae_registration_log`
--

CREATE TABLE `pae_registration_log` (
  `ID` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `IP` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `date_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_signups`
--

CREATE TABLE `pae_signups` (
  `signup_id` bigint(20) NOT NULL,
  `domain` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `meta` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_site`
--

CREATE TABLE `pae_site` (
  `id` bigint(20) NOT NULL,
  `domain` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `pae_site`
--

INSERT INTO `pae_site` (`id`, `domain`, `path`) VALUES
(1, 'printandembroid.com', '/');

-- --------------------------------------------------------

--
-- Table structure for table `pae_sitemeta`
--

CREATE TABLE `pae_sitemeta` (
  `meta_id` bigint(20) NOT NULL,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `pae_sitemeta`
--

INSERT INTO `pae_sitemeta` (`meta_id`, `site_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'site_name', 'Print and Embroid Sites'),
(2, 1, 'admin_email', 'support@printandembroid.com'),
(3, 1, 'admin_user_id', '1'),
(4, 1, 'registration', 'none'),
(5, 1, 'upload_filetypes', 'jpg jpeg png gif mov avi mpg 3gp 3g2 midi mid pdf doc ppt odt pptx docx pps ppsx xls xlsx key mp3 ogg flac m4a wav mp4 m4v webm ogv flv'),
(6, 1, 'blog_upload_space', '100'),
(7, 1, 'fileupload_maxk', '1500'),
(8, 1, 'site_admins', 'a:1:{i:0;s:3:\"pae\";}'),
(9, 1, 'allowedthemes', 'a:3:{s:14:\"twentynineteen\";b:1;s:14:\"wp-bootstrap-4\";b:1;s:10:\"understrap\";b:1;}'),
(10, 1, 'illegal_names', 'a:9:{i:0;s:3:\"www\";i:1;s:3:\"web\";i:2;s:4:\"root\";i:3;s:5:\"admin\";i:4;s:4:\"main\";i:5;s:6:\"invite\";i:6;s:13:\"administrator\";i:7;s:5:\"files\";i:8;s:4:\"blog\";}'),
(11, 1, 'wpmu_upgrade_site', '43764'),
(12, 1, 'welcome_email', 'Howdy USERNAME,\n\nYour new SITE_NAME site has been successfully set up at:\nBLOG_URL\n\nYou can log in to the administrator account with the following information:\n\nUsername: USERNAME\nPassword: PASSWORD\nLog in here: BLOG_URLwp-login.php\n\nWe hope you enjoy your new site. Thanks!\n\n--The Team @ SITE_NAME'),
(13, 1, 'first_post', 'Welcome to %s. This is your first post. Edit or delete it, then start blogging!'),
(14, 1, 'siteurl', 'https://printandembroid.com/'),
(15, 1, 'add_new_users', '0'),
(16, 1, 'upload_space_check_disabled', '1'),
(17, 1, 'subdomain_install', '0'),
(18, 1, 'global_terms_enabled', '0'),
(19, 1, 'ms_files_rewriting', '0'),
(20, 1, 'initial_db_version', '43764'),
(21, 1, 'active_sitewide_plugins', 'a:0:{}'),
(22, 1, 'WPLANG', 'en_US'),
(1147, 1, 'site_meta_supported', '1'),
(1149, 1, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.1.1\";s:7:\"version\";s:5:\"5.1.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1552914617;s:15:\"version_checked\";s:5:\"5.1.1\";s:12:\"translations\";a:0:{}}'),
(1150, 1, '_site_transient_timeout_php_check_a5907c2ea4d6fbd7e531b3aa7734f0e4', '1553314858'),
(1151, 1, '_site_transient_php_check_a5907c2ea4d6fbd7e531b3aa7734f0e4', 'a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:5:\"5.2.4\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:0;s:13:\"is_acceptable\";b:1;}'),
(1133, 1, '_site_transient_timeout_browser_7287feec18def593acadc342d76f271b', '1553312472'),
(1134, 1, '_site_transient_browser_7287feec18def593acadc342d76f271b', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"73.0.3683.75\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}'),
(28, 1, 'user_count', '1'),
(29, 1, 'blog_count', '1'),
(30, 1, 'can_compress_scripts', '1'),
(31, 1, 'registrationnotification', 'yes'),
(32, 1, 'welcome_user_email', 'Howdy USERNAME,\n\nYour new account is set up.\n\nYou can log in with the following information:\nUsername: USERNAME\nPassword: PASSWORD\nLOGINLINK\n\nThanks!\n\n--The Team @ SITE_NAME'),
(67, 1, 'recently_activated', 'a:0:{}'),
(1158, 1, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1552950700;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:10:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"jetpack/jetpack.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/jetpack\";s:4:\"slug\";s:7:\"jetpack\";s:6:\"plugin\";s:19:\"jetpack/jetpack.php\";s:11:\"new_version\";s:5:\"7.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/jetpack/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/jetpack.7.1.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/jetpack/assets/icon-256x256.png?rev=1791404\";s:2:\"1x\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=1791404\";s:3:\"svg\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=1791404\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/jetpack/assets/banner-1544x500.png?rev=1791404\";s:2:\"1x\";s:62:\"https://ps.w.org/jetpack/assets/banner-772x250.png?rev=1791404\";}s:11:\"banners_rtl\";a:0:{}}s:23:\"loginizer/loginizer.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:23:\"w.org/plugins/loginizer\";s:4:\"slug\";s:9:\"loginizer\";s:6:\"plugin\";s:23:\"loginizer/loginizer.php\";s:11:\"new_version\";s:5:\"1.4.1\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/loginizer/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/loginizer.1.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/loginizer/assets/icon-256x256.png?rev=1381093\";s:2:\"1x\";s:62:\"https://ps.w.org/loginizer/assets/icon-128x128.png?rev=1381093\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/loginizer/assets/banner-1544x500.jpg?rev=1517954\";s:2:\"1x\";s:64:\"https://ps.w.org/loginizer/assets/banner-772x250.jpg?rev=1517954\";}s:11:\"banners_rtl\";a:0:{}}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:39:\"w.org/plugins/mailchimp-for-woocommerce\";s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:6:\"plugin\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:11:\"new_version\";s:6:\"2.1.14\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/mailchimp-for-woocommerce/\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/plugin/mailchimp-for-woocommerce.2.1.14.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";s:2:\"1x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-1544x500.png?rev=1950415\";s:2:\"1x\";s:80:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-772x250.jpg?rev=1950415\";}s:11:\"banners_rtl\";a:0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"3.5.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.3.5.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=1440831\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=1440831\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=1629184\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=1629184\";}s:11:\"banners_rtl\";a:0:{}}s:69:\"woo-gutenberg-products-block/woocommerce-gutenberg-products-block.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:42:\"w.org/plugins/woo-gutenberg-products-block\";s:4:\"slug\";s:28:\"woo-gutenberg-products-block\";s:6:\"plugin\";s:69:\"woo-gutenberg-products-block/woocommerce-gutenberg-products-block.php\";s:11:\"new_version\";s:5:\"1.4.0\";s:3:\"url\";s:59:\"https://wordpress.org/plugins/woo-gutenberg-products-block/\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/plugin/woo-gutenberg-products-block.1.4.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/woo-gutenberg-products-block/assets/icon-256x256.png?rev=1863757\";s:2:\"1x\";s:81:\"https://ps.w.org/woo-gutenberg-products-block/assets/icon-128x128.png?rev=1863757\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:83:\"https://ps.w.org/woo-gutenberg-products-block/assets/banner-772x250.png?rev=1863757\";}s:11:\"banners_rtl\";a:0:{}}s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:57:\"w.org/plugins/woocommerce-gateway-paypal-express-checkout\";s:4:\"slug\";s:43:\"woocommerce-gateway-paypal-express-checkout\";s:6:\"plugin\";s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";s:11:\"new_version\";s:6:\"1.6.10\";s:3:\"url\";s:74:\"https://wordpress.org/plugins/woocommerce-gateway-paypal-express-checkout/\";s:7:\"package\";s:93:\"https://downloads.wordpress.org/plugin/woocommerce-gateway-paypal-express-checkout.1.6.10.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:96:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/icon-256x256.png?rev=1900204\";s:2:\"1x\";s:96:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/icon-128x128.png?rev=1900204\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:99:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/banner-1544x500.png?rev=1948167\";s:2:\"1x\";s:98:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/banner-772x250.png?rev=1948167\";}s:11:\"banners_rtl\";a:0:{}}s:45:\"woocommerce-services/woocommerce-services.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:34:\"w.org/plugins/woocommerce-services\";s:4:\"slug\";s:20:\"woocommerce-services\";s:6:\"plugin\";s:45:\"woocommerce-services/woocommerce-services.php\";s:11:\"new_version\";s:6:\"1.19.0\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/woocommerce-services/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/woocommerce-services.1.19.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-256x256.png?rev=1910075\";s:2:\"1x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-128x128.png?rev=1910075\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/woocommerce-services/assets/banner-1544x500.png?rev=1962920\";s:2:\"1x\";s:75:\"https://ps.w.org/woocommerce-services/assets/banner-772x250.png?rev=1962920\";}s:11:\"banners_rtl\";a:0:{}}s:43:\"wp-extra-file-types/wp-extra-file-types.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:33:\"w.org/plugins/wp-extra-file-types\";s:4:\"slug\";s:19:\"wp-extra-file-types\";s:6:\"plugin\";s:43:\"wp-extra-file-types/wp-extra-file-types.php\";s:11:\"new_version\";s:5:\"0.4.3\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/wp-extra-file-types/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/wp-extra-file-types.0.4.3.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://s.w.org/plugins/geopattern-icon/wp-extra-file-types.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}}}'),
(1194, 1, '_site_transient_timeout_theme_roots', '1552952501'),
(1195, 1, '_site_transient_theme_roots', 'a:5:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:10:\"understrap\";s:7:\"/themes\";s:14:\"wp-bootstrap-4\";s:7:\"/themes\";}'),
(1193, 1, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1552950701;s:7:\"checked\";a:5:{s:14:\"twentynineteen\";s:3:\"1.1\";s:15:\"twentyseventeen\";s:3:\"1.9\";s:13:\"twentysixteen\";s:3:\"1.7\";s:10:\"understrap\";s:5:\"0.9.1\";s:14:\"wp-bootstrap-4\";s:5:\"1.0.9\";}s:8:\"response\";a:3:{s:14:\"twentynineteen\";a:4:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.3.zip\";}s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.1.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.9.zip\";}}s:12:\"translations\";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `pae_termmeta`
--

CREATE TABLE `pae_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_termmeta`
--

INSERT INTO `pae_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 16, 'order', '0'),
(2, 17, 'order', '0'),
(3, 15, 'product_count_product_cat', '0'),
(4, 16, 'product_count_product_cat', '1'),
(5, 17, 'product_count_product_cat', '2');

-- --------------------------------------------------------

--
-- Table structure for table `pae_terms`
--

CREATE TABLE `pae_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_terms`
--

INSERT INTO `pae_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'Uncategorized', 'uncategorized', 0),
(16, 'Tropical', 'tropical', 0),
(17, 'Iron on Patches', 'iron-on-patches', 0),
(18, 'Top menu', 'top-menu', 0),
(19, 'Flowers', 'flowers', 0),
(20, 'Animals', 'animals', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pae_term_relationships`
--

CREATE TABLE `pae_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_term_relationships`
--

INSERT INTO `pae_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(6, 17, 0),
(6, 2, 0),
(6, 16, 0),
(11, 18, 0),
(13, 17, 0),
(13, 2, 0),
(22, 18, 0),
(23, 18, 0),
(7, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pae_term_taxonomy`
--

CREATE TABLE `pae_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_term_taxonomy`
--

INSERT INTO `pae_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 2),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_visibility', '', 0, 0),
(7, 7, 'product_visibility', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 0),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', '', 0, 0),
(16, 16, 'product_cat', '', 0, 1),
(17, 17, 'product_cat', '', 0, 2),
(18, 18, 'nav_menu', '', 0, 3),
(19, 19, 'fpd_design_category', '', 0, 0),
(20, 20, 'fpd_design_category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pae_usermeta`
--

CREATE TABLE `pae_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_usermeta`
--

INSERT INTO `pae_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'pae'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'pae_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'pae_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"40cec480b6bd2bfe4438dc754cb29f7a605991e551201bc504af3a93cc7c20c8\";a:4:{s:10:\"expiration\";i:1552880470;s:2:\"ip\";s:12:\"47.199.73.71\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\";s:5:\"login\";i:1552707670;}s:64:\"4b8d5265a2c347e8d31ac02d5012112878c44b2400fc18997aed17cd34a13833\";a:4:{s:10:\"expiration\";i:1552932281;s:2:\"ip\";s:12:\"47.199.73.71\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36\";s:5:\"login\";i:1552759481;}}'),
(17, 1, 'pae_dashboard_quick_press_last_post_id', '33'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:11:\"47.199.73.0\";}'),
(19, 1, 'manageedit-shop_ordercolumnshidden', 'a:1:{i:0;s:15:\"billing_address\";}'),
(20, 1, 'wc_last_active', '1552694400'),
(21, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:1:{s:32:\"6acdb7aea5e9ee6452b99ea6a778275a\";a:12:{s:8:\"fpd_data\";a:5:{s:11:\"fpd_product\";s:7034:\"{\"product\":[{\"title\":\"front\",\"thumbnail\":\"https://printandembroid.com/wp-content/uploads/2019/01/t-shirt-template-20.jpg\",\"elements\":[{\"title\":\"t\",\"source\":\"https://printandembroid.com/wp-content/uploads/2019/01/t-shirt-template-20.jpg\",\"parameters\":{\"advancedEditing\":false,\"angle\":0,\"autoCenter\":false,\"autoSelect\":false,\"boundingBox\":\"\",\"boundingBoxMode\":\"inside\",\"colorLinkGroup\":false,\"colorPrices\":{},\"colors\":false,\"copyable\":false,\"cornerSize\":24,\"draggable\":false,\"evented\":false,\"excludeFromExport\":false,\"fill\":false,\"filter\":null,\"flipX\":false,\"flipY\":false,\"height\":800,\"left\":500,\"lockUniScaling\":true,\"locked\":false,\"minScaleLimit\":0.01,\"objectCaching\":false,\"opacity\":1,\"originParams\":{\"objectCaching\":false,\"z\":0,\"price\":0,\"colors\":\"\",\"removable\":false,\"draggable\":false,\"rotatable\":false,\"resizable\":false,\"copyable\":false,\"zChangeable\":false,\"boundingBox\":\"\",\"boundingBoxMode\":\"inside\",\"autoCenter\":false,\"replace\":\"\",\"replaceInAllViews\":false,\"autoSelect\":false,\"topped\":false,\"colorPrices\":{},\"colorLinkGroup\":false,\"patterns\":[],\"sku\":\"\",\"excludeFromExport\":false,\"showInColorSelection\":false,\"locked\":false,\"uniScalingUnlockable\":false,\"originX\":\"center\",\"originY\":\"center\",\"cornerSize\":24,\"fill\":false,\"lockUniScaling\":true,\"pattern\":false,\"top\":300,\"left\":500,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"scaleX\":0.72,\"scaleY\":0.72,\"uploadZone\":false,\"filter\":null,\"scaleMode\":\"fit\",\"resizeToW\":0,\"resizeToH\":0,\"advancedEditing\":false,\"uploadZoneMovable\":false,\"padding\":0,\"minScaleLimit\":0.01,\"customAdds\":[],\"_isInitial\":true,\"source\":\"https://printandembroid.com/wp-content/uploads/2019/01/t-shirt-template-20.jpg\",\"title\":\"t\",\"id\":\"1546553563686\",\"cornerColor\":\"#f5f5f5\",\"cornerIconColor\":\"#000000\",\"selectable\":false,\"lockRotation\":true,\"hasRotatingPoint\":false,\"lockScalingX\":true,\"lockScalingY\":true,\"lockMovementX\":true,\"lockMovementY\":true,\"hasControls\":false,\"evented\":false,\"lockScalingFlip\":true,\"crossOrigin\":\"\"},\"originX\":\"center\",\"originY\":\"center\",\"padding\":0,\"patterns\":[],\"price\":0,\"removable\":false,\"replace\":\"\",\"replaceInAllViews\":false,\"resizable\":false,\"resizeToH\":0,\"resizeToW\":0,\"rotatable\":false,\"scaleMode\":\"fit\",\"scaleX\":0.72,\"scaleY\":0.72,\"showInColorSelection\":false,\"sku\":\"\",\"top\":300,\"topped\":false,\"uniScalingUnlockable\":false,\"uploadZone\":false,\"uploadZoneMovable\":false,\"width\":640,\"z\":-1,\"zChangeable\":false,\"topLeftX\":269.6,\"topLeftY\":12},\"type\":\"image\"},{\"title\":\"23\",\"source\":\"23\",\"parameters\":{\"angle\":0,\"autoCenter\":false,\"autoSelect\":true,\"boundingBox\":\"\",\"boundingBoxMode\":\"inside\",\"charSpacing\":0,\"chargeAfterEditing\":false,\"colorLinkGroup\":false,\"colorPrices\":{},\"colors\":[\"#000000\",\"#00ff00\"],\"copyable\":false,\"cornerSize\":24,\"currentColorPrice\":0,\"curvable\":false,\"curveRadius\":80,\"curveReverse\":false,\"curveSpacing\":10,\"curved\":false,\"draggable\":false,\"editable\":true,\"evented\":true,\"excludeFromExport\":false,\"fill\":\"#00ff00\",\"flipX\":false,\"flipY\":false,\"fontFamily\":\"Arial\",\"fontSize\":148,\"fontStyle\":\"normal\",\"fontWeight\":\"normal\",\"height\":167.23999999999998,\"isEditable\":true,\"left\":502,\"letterSpacing\":0,\"lineHeight\":1,\"lockUniScaling\":true,\"locked\":false,\"maxFontSize\":1000,\"maxLength\":0,\"maxLines\":0,\"minFontSize\":1,\"numberPlaceholder\":[0,99],\"objectCaching\":false,\"opacity\":1,\"originParams\":{\"type\":\"i-text\",\"version\":\"2.3.2\",\"originX\":\"center\",\"originY\":\"center\",\"left\":502,\"top\":247,\"width\":164.62,\"height\":167.24,\"fill\":\"#000000\",\"stroke\":null,\"strokeWidth\":0,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"text\":\"23\",\"fontSize\":148,\"fontWeight\":\"normal\",\"fontFamily\":\"Arial\",\"fontStyle\":\"normal\",\"lineHeight\":1,\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"left\",\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"objectCaching\":false,\"z\":1,\"price\":0,\"colors\":[\"#000000\",\"#00ff00\"],\"removable\":false,\"draggable\":false,\"rotatable\":false,\"resizable\":false,\"copyable\":false,\"zChangeable\":false,\"boundingBox\":\"\",\"boundingBoxMode\":\"inside\",\"autoCenter\":false,\"replace\":\"\",\"replaceInAllViews\":false,\"autoSelect\":true,\"topped\":true,\"colorPrices\":{},\"colorLinkGroup\":false,\"patterns\":[],\"sku\":\"\",\"excludeFromExport\":false,\"showInColorSelection\":false,\"locked\":false,\"uniScalingUnlockable\":false,\"cornerSize\":24,\"lockUniScaling\":true,\"pattern\":false,\"maxLength\":0,\"curved\":false,\"curvable\":false,\"curveSpacing\":10,\"curveRadius\":80,\"curveReverse\":false,\"maxLines\":0,\"textBox\":false,\"textPlaceholder\":false,\"numberPlaceholder\":[0,99],\"letterSpacing\":0,\"chargeAfterEditing\":false,\"minFontSize\":1,\"textTransform\":\"none\",\"widthFontSize\":0,\"maxFontSize\":1000,\"shadowColor\":\"\",\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0,\"textLinkGroup\":\"\",\"strokeColors\":[],\"editable\":true,\"textDecoration\":\"normal\",\"padding\":10,\"numberPlaceholderMin\":0,\"numberPlaceholderMax\":99,\"_isInitial\":true},\"originX\":\"center\",\"originY\":\"center\",\"padding\":10,\"patterns\":[],\"price\":0,\"removable\":false,\"replace\":\"\",\"replaceInAllViews\":false,\"resizable\":false,\"rotatable\":false,\"scaleX\":1,\"scaleY\":1,\"shadowBlur\":4,\"shadowColor\":\"#574747\",\"shadowOffsetX\":7,\"shadowOffsetY\":7,\"showInColorSelection\":false,\"sku\":\"\",\"stroke\":\"#170d0d\",\"strokeColors\":[],\"strokeWidth\":5,\"text\":\"23\",\"textAlign\":\"left\",\"textBox\":false,\"textDecoration\":\"normal\",\"textLinkGroup\":\"\",\"textPlaceholder\":false,\"textTransform\":\"none\",\"top\":247,\"topped\":true,\"uniScalingUnlockable\":false,\"width\":164.62109375,\"widthFontSize\":0,\"z\":-1,\"zChangeable\":false,\"topLeftX\":417.189453125,\"topLeftY\":160.88},\"type\":\"text\"}],\"options\":{\"stageWidth\":1000,\"stageHeight\":600,\"customAdds\":{\"designs\":true,\"uploads\":true,\"texts\":true,\"drawing\":true},\"customImageParameters\":{\"minW\":100,\"minH\":100,\"maxW\":10000,\"maxH\":10000,\"minDPI\":72,\"maxSize\":10,\"left\":0,\"top\":0,\"z\":-1,\"minScaleLimit\":0.01,\"price\":0,\"replaceInAllViews\":false,\"autoCenter\":true,\"draggable\":true,\"rotatable\":true,\"resizable\":true,\"zChangeable\":true,\"autoSelect\":false,\"topped\":false,\"uniScalingUnlockable\":false,\"boundingBoxMode\":\"inside\",\"scaleMode\":\"fit\",\"removable\":true,\"resizeToW\":0,\"resizeToH\":0,\"advancedEditing\":false},\"customTextParameters\":{\"left\":0,\"top\":0,\"z\":-1,\"price\":0,\"replaceInAllViews\":false,\"autoCenter\":true,\"draggable\":true,\"rotatable\":true,\"resizable\":true,\"zChangeable\":true,\"autoSelect\":false,\"topped\":false,\"uniScalingUnlockable\":false,\"curvable\":true,\"curveSpacing\":10,\"curveRadius\":80,\"curveReverse\":false,\"boundingBoxMode\":\"inside\",\"fontSize\":18,\"minFontSize\":1,\"maxFontSize\":1000,\"widthFontSize\":0,\"maxLength\":0,\"maxLines\":0,\"textAlign\":\"left\",\"removable\":true},\"maxPrice\":-1,\"optionalView\":false,\"designCategories\":[],\"printingBox\":{},\"layouts\":[]},\"names_numbers\":null,\"mask\":null,\"locked\":false,\"productTitle\":\"number\"}],\"usedFonts\":[{\"name\":\"Arial\"}],\"usedColors\":[{\"hex\":\"#00ff00\"}],\"usedDepositPhotos\":[]}\";s:20:\"fpd_remove_cart_item\";s:0:\"\";s:17:\"fpd_product_price\";s:5:\"13.99\";s:21:\"fpd_product_thumbnail\";s:5122:\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAAA8CAYAAACQPx/OAAAOtklEQVR4Xu2cB3BWVRbHT+hFgiSElgXpXYz00BSHDjoiC1kgRBDGcVR0dhgQdujIzo5SNsq6lqHoSMksisoCgoA0XVdC70hVkCZF6X3v75jDPLMJfM/dveOa3Jk37/veu+/d5P+/p9/7RUlu+0UhEOX5r7npebz/1nDecPI2UAYyuYTcYYrkEhKZDHnDydtA/6mEREVFyV133SVnz569I4R58uSR6OhoKVKkiBw/flyuXbt2x2d+KRP3/4aQXr16Sffu3WX16tUyd+5c+frrr/8NQ0hITEyUhx9+WOLi4pSICxcuyLhx47LsH4Ilbzh5G+jnSkjNmjXlhRdekISEBGHmHzlyRPLlyycnT56UM2fOyJUrV/Q6ZMTGxurnq1evKhmQEhMTI5cuXZINGzbIrFmzZOXKlT9HYrzh5G2gsIQAZO/eveW5556T/Pnzy82bN+X69ety7NgxJQJSUGNc416BAgWkUKFC2hdSuFe8eHEdls9cox06dEg+/vhjWbZsmWzcuFEuX74ciaB4w8nbQJESAtBIw2uvvSbx8fEKpJEB+Ddu3JCjR4/qrC9cuLDehwSeox/X8+bNK6VKldIhucZBPw7u8Q7ederUKRk9erQsWrToTsR4w8nbQJEQ0qJFC9X31apV0xlvgKJ+ANBmuwH/7bff6nXIAGyARk0VK1bsFpFGCPcgzghBarjH9SVLlsgTTzxxO0nxhpO3gW5HSPny5WXChAnSsmXLn6gnAxtCbJbzHkA0oLEh1q9gwYKqnqzxmb4GPqRBHjaGs73n+++/1/GnTZuWHSnecPI2UHaEANL06dOlVatW6taaJAAWRDCrOQOqzW6THAObe5mJgDAjwj7zbkgz1WeSBiE//PCDdOjQQZ2ELJo3nLwNlB0hdevWlalTpypQZcqUuTV76W8zPzijTW0ZKUHwgqQE1Zv1NeMOERcvXlR7g9oz9fjII4+ow5BjCWHGz5s3T0qUKKF6nxmPd2XAcd88KQPVPKigBBgR2RFi6o0zjfdC8u7du6Vo0aIaq/DsyJEjZc2aNTmXkHvvvVe9KWYrOp1WuXJlPZsBRkpQWYAYJCOImpETlJ6gBBkRnCHCiNu6dasSguvL+1FduNpZuMLeNIm3gbJSWQMGDJAePXoo4ICADaldu7Z2NSOOTrfYwkgIGmrzlLhnhGWl1qwfz1owCSG4zqRjkMy7775bBg8erDFKpuYNJ28DZUXIRx99pPkmVAZSAiH169eXEydO6GekBrII+IIz3rwnu2YEWaxhKipoR+wa7+OAhAMHDmigie2CpFq1asmqVatk4MCBOY+QGjVqaE4KQFAVkEAM0bhxY/1uQZ/FGIZQMK7IYEmiMqJwk5KbuMUZUqYzLsP95eP58+c1/YI07NixQycC7yxZsqTGPxDVrVs3DT4DzdvE9TZQZgl5+umnhQNPZ/v27QoUR/PmzdXI43Ux89HtliZJv5Yu/banyIVT5x3IIoULFJHUSqnSvHhLJQUJGbt/tMw6/K6z3M4O3cgvv687WPoUTpbr7l3YD6Jz0ie4uUgeZySGCUI8hLTOnDlTpkyZkrMImTFjhjRo0EBd23Xr1mlycN++fdKpUyfZsmWLzlgSiNWrV9fPm/NskpSlyVI9rppUm1pBrjhwN3fdIUeOH5XxTf4o7X/TUcbsGCXvlX9fHpibKHG7YmVv6wOy7cJOeanlBGlapJkSvnPnTqlataqOSWoeUiCfoBSpxAVOT0+Xvn375hxCAGDFihW3PBxmLeBw4PVs2rRJOnfurADRt1y5cjJ69wj5IP5DSfxTfUlp008qVKokc9bMkhlJ70q92bXkpVYTZcDpAZJvV5QkX+gpjZ2kLV+/TN5sN1Xq/KOGjKw5Vgq6961du1ZVIplhUvi8n5xZnTp1dDwcCNTno48+KufOnTNSvGkSbwMFVVabNm3U58dmAAB6nMzr3r17FQykhYCxdOnScvr0aVUnq5Yvl22uD0nDdl26SAkH6KfHPpU/xAyVammVZGTD0fqOE073d3IBXvmKFWXhZ/NlcsdUKT6vqIwtPV7yurHOODJQkZCPQ8H7mjRposQQCyEhXP/888+lf//+al+wQpmt/P/qu7eBgoSQN2rdurV89913akNQJcxWJIVrzN62bduqOjl8+LBUqFBBva4rGalyAAO4ISsGyaKOiyVxSgMZ9sAIib/nHrnuVNmer77SCHxW9EzZVmi7dN3bWdo4lXaeDLF7lnubN29W4uvVq6eeHRE6ksi7kaA5c+bIxIkT1Y79qgnBZV24cKHGG/yzxB/MVmICgPrmm2/UqCM9DRs2VIMOSKbrLah7Y/df5Y2qb0rFOfHS83I3aeukoqSTKJyA5HE9ZF2njRJ1VSR+ZRnpG5siCU2b6j2MO4b89ddf1+oi+SuMPRLCdWol77zzTlBd/boJ4b9jtlNmTU5OFiqCqKyDBw/qrN2/f7/GBc2aNdPreD4QB2ActClbUmVarelSak1J+d22rtLI9a19331KGn337tkj+5zxXr5hmXwycJVEf1ZUXqnwF7nsgOf+F198IW+99ZY89NBDqrJwg4k/GM+Sm5lUkjdN4m2gzG7vj+HBjwsXUB0GJnEA6gPAGjVqpBKEKsPYo6am/PPPktb6bxL3Xqwkn/itVHXBXAM3+4u56uBp1493IlGAe869a1T6cFkbky7PFHhGEvI0UClZ6ApSZJhDNG84eRsoK0JuB0hKSop0ccYbD4hZC3GTVr4kc5PmSeVXykvXS12kqjP29Zxaw8Cv2LxcRh4bLvFR8TI1ccatBOLQVYNlTfRq6X22lzQt2kLOuTiDBOLs2bND8PErN+qRINGvXz91Q/v06aOq6oNN70lq01ckOrmQtIhPlHJOlZVxZGGkYxwhdZxx7v9Zimytt0N67Oom3Up0l7+nfyhpPd+XMh/ESs9zSVLJqceCTq0RAy1evDiSPyNnuL2RIEHWtX379hocYniT05JkU/etWT6asKCuzOjwrmx3AeWoE6NkT8P9crOgq6Ofi5IqSypKl7MdJQaD71Rewv33y6BBgzT4DNG8aRJvA4VVWbi9Dz74oLrDuKOVnEQccsnA/a6GQZqE+IUzNiPa2Y9WLrYp6/ocdLHMJ86LO+2IxO6UckTEu5gk1p3jnAEnGzB06FDNoYVo3nDyNlBYQgjWnnrqKfW48MCwIRVdnFE4I/N7q3zrXpzXucaFnHqDnKsuL3XRxTXYHRwC8lT5HHn0P+mMPhne4cOHa/wTonnDydtAYQnp2LGjxgnU2gkUcU2RCqQlWGe36qIt7TGiIALQIYU4gxiDCiGxzqRJk0JwoV294eRtoLCEJCUl6fosJIRYBG+LiN5cZdxXmhWljBArRCEhVmfhOVIwfF+6dKmkpaXlEhKWENZJ3e8MMDEFOS0IQG1hF4hZgoQYusFaiVUhLTXDGXXFGqwFCxbkEhKWEJaQVqlSRYNGW/zGDIcMCyQhxUq9wYUMfIYQqoA8g9oi2ETtrV+/Xt5+++1cQsISgieEqsJ+YDPIxBKP2NJRonZblWL5rYxE4E8W0WE/UFm4z9gQnhkxYkQuIWEJGTt2rGZi97i8FAUqbAjqSy1sxqI5q6HbMlJbB2wSYslL0iik9SnL3uM8NdQhJIVo3mytt4HCEvLiiy9qHYTcFkBDBqvZkRJmuS0TMlJ4vy0NRSps+RDqCg+LtD5EYYNYPwzRIZo3nLwNFJYQahGk4VmeA5Ck4S0FDylWZ89s0OkLGZCCZEAoyUmqf7wLO4JRZ+NPiOYNJ28DhSWEfBOGGXUFyFbOxXYYOaguW9ZjaowzxhwCsBucIYbGe7hGXT03ufgjIxHtwgVUdjrt2rVL4xCARCpshaIRAjnmXdnKdsDHs0IyOMwLI1XCdVQfn19++eUQApLDA0NKtvPnz9eZjOrBZpiaMk/K7Iit3+I70oKxhgi+c7DkB4nBS6M0y7up3Q8bNiyXkEglhMQiXhZA2uZOW2pKcGjbCADctrEFPSpIQRqIX+j/5ZdfanGLkjDtK1dzf/bZZ3MJiZQQ1kQ99thjWt4lsWgbPS0WQS0FN+0gPUgHEgBZrErkTJ0ed5kAkywvz5UtW1btCOuKQzRvttbbQGGM+pgxY3QlCLMa9xZXldQH3hIurJVzkRrsCX3wrOgD6Fy3JCR1DySJRXn05T7EsVw0RPOGk7eBwhCSmpqqLi+BISqLtIftOUcNQZStFMGGmIdl7i42BFLw0CAPIw5ZOAhc451IoNmjCIjxhpO3gSIlBNDGjx+vgLNXhJluNgO7wHXb7mYelHlYEGUpd/O2UF+QgK3BBeZABQ4ZMkQlLsLmDSdvA0VKyOOPPy7t2rW7tT2BXBY2ArWEkbc6h6Xdbf+5bfiBFNsDQl9bxY7EobosJf/qq6/qGt4ImzecvA0UKSGTJ09W15TZD7imjjDogG4FJ9ST7Tu33VXBPe1m9CGRWoht+KQPn8n4smAvwuYNJ28DRUoIaQ2b/UgGqobvuLIYYz5bpjcYFFqdBKkwlWY7aiEVVUV/kzSWApGeyVi7eydevOHkbaBICGGmU68gmKPmYcEdUoGqAUz7mQ1TS8x2gIcw28lreS6uc1gxy7ZXc8YNfv7557PbBp2ZIG84eRsoEkJs1bltS0ASrAZipATtg+WszKuCNFQb8QtVRtsKZ8RYKgUSsS1PPvlk5jW82UmKN5y8DRQJIQDINmkMObPcfm0BMjhsQYOhBrC2ugTX2H4dyDZ1kq5n7S6eG0YdMpEkPDFcX7YbBPaA3E5tecPJ20CREALg7DvEVYUUmsUbJim2xc0MuRlvI4dnrEAF8JBk6XeidA6CSxY7UHPJ/TWgO5hPtrDxu1ZkelFd5KLMsJvLig3AxjD7qXHYTzOZVEEWcQhkIAFIjC2QwHawwp7tCFn9CFo2f563iettoEgkxMBA/yMlVh20CqAlEIO/8GAelf0gAORBEAf2BMIILslpcY+dt3hy5LNCNG84eRsoDCEhgPLV1RtO3gbKJSSyuZNLyC8MJ9+ERPbv5+Be/wI0hee19B5i+wAAAABJRU5ErkJggg==\";s:15:\"fpd_print_order\";s:0:\"\";}s:3:\"key\";s:32:\"6acdb7aea5e9ee6452b99ea6a778275a\";s:10:\"product_id\";i:13;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:13.9900000000000002131628207280300557613372802734375;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:13.9900000000000002131628207280300557613372802734375;s:8:\"line_tax\";i:0;}}}'),
(22, 1, 'pae_user-settings', 'libraryContent=browse'),
(23, 1, 'pae_user-settings-time', '1545945170'),
(26, 1, 'source_domain', 'printandembroid.com'),
(27, 1, 'primary_blog', '1'),
(39, 1, 'dismissed_template_files_notice', '1'),
(36, 1, 'jetpack_tracks_anon_id', 'jetpack:7WTYxDf51fqwyNpExo5cNlhB'),
(28, 1, 'dismissed_wootenberg_notice', '1'),
(30, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(31, 1, 'metaboxhidden_nav-menus', 'a:5:{i:0;s:21:\"add-post-type-product\";i:1;s:29:\"add-post-type-product-designs\";i:2;s:12:\"add-post_tag\";i:3;s:15:\"add-product_cat\";i:4;s:15:\"add-product_tag\";}'),
(32, 1, 'nav_menu_recently_edited', '18');

-- --------------------------------------------------------

--
-- Table structure for table `pae_users`
--

CREATE TABLE `pae_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pae_users`
--

INSERT INTO `pae_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`, `spam`, `deleted`) VALUES
(1, 'pae', '$P$BqEXdKdSDDmpLKWfvkJ.couPV03Jfp1', 'pae', 'support@printandembroid.com', '', '2018-12-20 22:45:17', '', 0, 'pae', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pae_wc_download_log`
--

CREATE TABLE `pae_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_wc_webhooks`
--

CREATE TABLE `pae_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_api_keys`
--

CREATE TABLE `pae_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_attribute_taxonomies`
--

CREATE TABLE `pae_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `pae_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_log`
--

CREATE TABLE `pae_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_order_itemmeta`
--

CREATE TABLE `pae_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_order_items`
--

CREATE TABLE `pae_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_payment_tokenmeta`
--

CREATE TABLE `pae_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_payment_tokens`
--

CREATE TABLE `pae_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_sessions`
--

CREATE TABLE `pae_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_shipping_zones`
--

CREATE TABLE `pae_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_shipping_zone_locations`
--

CREATE TABLE `pae_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_shipping_zone_methods`
--

CREATE TABLE `pae_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_tax_rates`
--

CREATE TABLE `pae_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pae_woocommerce_tax_rate_locations`
--

CREATE TABLE `pae_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pae_blogmeta`
--
ALTER TABLE `pae_blogmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `meta_key` (`meta_key`(191)),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `pae_blogs`
--
ALTER TABLE `pae_blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `domain` (`domain`(50),`path`(5)),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `pae_blog_versions`
--
ALTER TABLE `pae_blog_versions`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `db_version` (`db_version`);

--
-- Indexes for table `pae_commentmeta`
--
ALTER TABLE `pae_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `pae_comments`
--
ALTER TABLE `pae_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indexes for table `pae_fpd_products`
--
ALTER TABLE `pae_fpd_products`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pae_fpd_views`
--
ALTER TABLE `pae_fpd_views`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pae_links`
--
ALTER TABLE `pae_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `pae_loginizer_logs`
--
ALTER TABLE `pae_loginizer_logs`
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `pae_options`
--
ALTER TABLE `pae_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `pae_postmeta`
--
ALTER TABLE `pae_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `pae_posts`
--
ALTER TABLE `pae_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `pae_registration_log`
--
ALTER TABLE `pae_registration_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IP` (`IP`);

--
-- Indexes for table `pae_signups`
--
ALTER TABLE `pae_signups`
  ADD PRIMARY KEY (`signup_id`),
  ADD KEY `activation_key` (`activation_key`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `user_login_email` (`user_login`,`user_email`),
  ADD KEY `domain_path` (`domain`(140),`path`(51));

--
-- Indexes for table `pae_site`
--
ALTER TABLE `pae_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain` (`domain`(140),`path`(51));

--
-- Indexes for table `pae_sitemeta`
--
ALTER TABLE `pae_sitemeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `meta_key` (`meta_key`(191)),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `pae_termmeta`
--
ALTER TABLE `pae_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `pae_terms`
--
ALTER TABLE `pae_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `pae_term_relationships`
--
ALTER TABLE `pae_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `pae_term_taxonomy`
--
ALTER TABLE `pae_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `pae_usermeta`
--
ALTER TABLE `pae_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `pae_users`
--
ALTER TABLE `pae_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `pae_wc_download_log`
--
ALTER TABLE `pae_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `pae_wc_webhooks`
--
ALTER TABLE `pae_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pae_woocommerce_api_keys`
--
ALTER TABLE `pae_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `pae_woocommerce_attribute_taxonomies`
--
ALTER TABLE `pae_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indexes for table `pae_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `pae_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pae_woocommerce_log`
--
ALTER TABLE `pae_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `pae_woocommerce_order_itemmeta`
--
ALTER TABLE `pae_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `pae_woocommerce_order_items`
--
ALTER TABLE `pae_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pae_woocommerce_payment_tokenmeta`
--
ALTER TABLE `pae_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `pae_woocommerce_payment_tokens`
--
ALTER TABLE `pae_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pae_woocommerce_sessions`
--
ALTER TABLE `pae_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Indexes for table `pae_woocommerce_shipping_zones`
--
ALTER TABLE `pae_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `pae_woocommerce_shipping_zone_locations`
--
ALTER TABLE `pae_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indexes for table `pae_woocommerce_shipping_zone_methods`
--
ALTER TABLE `pae_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `pae_woocommerce_tax_rates`
--
ALTER TABLE `pae_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `pae_woocommerce_tax_rate_locations`
--
ALTER TABLE `pae_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pae_blogmeta`
--
ALTER TABLE `pae_blogmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_blogs`
--
ALTER TABLE `pae_blogs`
  MODIFY `blog_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pae_commentmeta`
--
ALTER TABLE `pae_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_comments`
--
ALTER TABLE `pae_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pae_fpd_products`
--
ALTER TABLE `pae_fpd_products`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pae_fpd_views`
--
ALTER TABLE `pae_fpd_views`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pae_links`
--
ALTER TABLE `pae_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_options`
--
ALTER TABLE `pae_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9594;

--
-- AUTO_INCREMENT for table `pae_postmeta`
--
ALTER TABLE `pae_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `pae_posts`
--
ALTER TABLE `pae_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `pae_registration_log`
--
ALTER TABLE `pae_registration_log`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_signups`
--
ALTER TABLE `pae_signups`
  MODIFY `signup_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_site`
--
ALTER TABLE `pae_site`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pae_sitemeta`
--
ALTER TABLE `pae_sitemeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1196;

--
-- AUTO_INCREMENT for table `pae_termmeta`
--
ALTER TABLE `pae_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pae_terms`
--
ALTER TABLE `pae_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pae_term_taxonomy`
--
ALTER TABLE `pae_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pae_usermeta`
--
ALTER TABLE `pae_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pae_users`
--
ALTER TABLE `pae_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pae_wc_download_log`
--
ALTER TABLE `pae_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_wc_webhooks`
--
ALTER TABLE `pae_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_api_keys`
--
ALTER TABLE `pae_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_attribute_taxonomies`
--
ALTER TABLE `pae_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `pae_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_log`
--
ALTER TABLE `pae_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_order_itemmeta`
--
ALTER TABLE `pae_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_order_items`
--
ALTER TABLE `pae_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_payment_tokenmeta`
--
ALTER TABLE `pae_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_payment_tokens`
--
ALTER TABLE `pae_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_sessions`
--
ALTER TABLE `pae_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pae_woocommerce_shipping_zones`
--
ALTER TABLE `pae_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_shipping_zone_locations`
--
ALTER TABLE `pae_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_shipping_zone_methods`
--
ALTER TABLE `pae_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_tax_rates`
--
ALTER TABLE `pae_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pae_woocommerce_tax_rate_locations`
--
ALTER TABLE `pae_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
