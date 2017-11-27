-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2017 at 09:19 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `edu_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_author` (`created_by`),
  KEY `fk_article_updater` (`updated_by`),
  KEY `fk_article_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_attachment`
--

CREATE TABLE IF NOT EXISTS `article_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE IF NOT EXISTS `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category_section` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `slug`, `title`, `body`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'news', 'News', NULL, NULL, 1, 1511603743, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_item`
--

CREATE TABLE IF NOT EXISTS `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i18n_message`
--

CREATE TABLE IF NOT EXISTS `i18n_message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `i18n_source_message`
--

CREATE TABLE IF NOT EXISTS `i18n_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `key_storage_item`
--

CREATE TABLE IF NOT EXISTS `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `key_storage_item`
--

INSERT INTO `key_storage_item` (`key`, `value`, `comment`, `updated_at`, `created_at`) VALUES
('backend.layout-boxed', '0', NULL, NULL, NULL),
('backend.layout-collapsed-sidebar', '0', NULL, NULL, NULL),
('backend.layout-fixed', '0', NULL, NULL, NULL),
('backend.theme-skin', 'skin-blue', 'skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow', NULL, NULL),
('frontend.maintenance', 'disabled', 'Set it to "true" to turn on maintenance mode', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `slug`, `title`, `body`, `view`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about', 'About', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL, 1, 1511603743, 1511603743);

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_assignment`
--

INSERT INTO `rbac_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator', '1', 1511603748),
('manager', '2', 1511603748),
('user', '3', 1511603748);

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_item`
--

CREATE TABLE IF NOT EXISTS `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_item`
--

INSERT INTO `rbac_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrator', 1, NULL, NULL, NULL, 1511603748, 1511603748),
('editOwnModel', 2, NULL, 'ownModelRule', NULL, 1511603748, 1511603748),
('loginToBackend', 2, NULL, NULL, NULL, 1511603748, 1511603748),
('manager', 1, NULL, NULL, NULL, 1511603748, 1511603748),
('user', 1, NULL, NULL, NULL, 1511603748, 1511603748);

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_item_child`
--

INSERT INTO `rbac_auth_item_child` (`parent`, `child`) VALUES
('user', 'editOwnModel'),
('manager', 'loginToBackend'),
('administrator', 'manager'),
('manager', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_rule`
--

CREATE TABLE IF NOT EXISTS `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_rule`
--

INSERT INTO `rbac_auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('ownModelRule', 0x4f3a32393a22636f6d6d6f6e5c726261635c72756c655c4f776e4d6f64656c52756c65223a333a7b733a343a226e616d65223b733a31323a226f776e4d6f64656c52756c65223b733a393a22637265617465644174223b693a313531313630333734383b733a393a22757064617465644174223b693a313531313630333734383b7d, 1511603748, 1511603748);

-- --------------------------------------------------------

--
-- Table structure for table `system_db_migration`
--

CREATE TABLE IF NOT EXISTS `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_db_migration`
--

INSERT INTO `system_db_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1511603736),
('m140703_123000_user', 1511603741),
('m140703_123055_log', 1511603741),
('m140703_123104_page', 1511603741),
('m140703_123803_article', 1511603741),
('m140703_123813_rbac', 1511603741),
('m140709_173306_widget_menu', 1511603741),
('m140709_173333_widget_text', 1511603741),
('m140712_123329_widget_carousel', 1511603741),
('m140805_084745_key_storage_item', 1511603741),
('m141012_101932_i18n_tables', 1511603741),
('m150318_213934_file_storage_item', 1511603741),
('m150414_195800_timeline_event', 1511603741),
('m150725_192740_seed_data', 1511603743),
('m150929_074021_article_attachment_order', 1511603743),
('m160203_095604_user_token', 1511603743);

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE IF NOT EXISTS `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=51 ;

--
-- Dumping data for table `system_log`
--

INSERT INTO `system_log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 1, 'yii\\base\\InvalidParamException', 1511603846.3771, '[frontend][/frontend/web/]', 'exception ''yii\\base\\InvalidParamException'' with message ''The file or directory to be published does not exist: /home/ubuntu/workspace/vendor/bower/bootstrap/dist'' in /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php:456\nStack trace:\n#0 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(185): yii\\web\\AssetManager->publish(''/home/ubuntu/wo...'', Array)\n#1 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(268): yii\\web\\AssetBundle->publish(Object(yii\\web\\AssetManager))\n#2 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(239): yii\\web\\AssetManager->loadBundle(''yii\\bootstrap\\B...'', Array, true)\n#3 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/View.php(286): yii\\web\\AssetManager->getBundle(''yii\\bootstrap\\B...'')\n#4 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(125): yii\\web\\View->registerAssetBundle(''yii\\bootstrap\\B...'')\n#5 /home/ubuntu/workspace/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register(Object(yii\\web\\View))\n#6 /home/ubuntu/workspace/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin(''carousel'')\n#7 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Widget.php(140): common\\widgets\\DbCarousel->run()\n#8 /home/ubuntu/workspace/frontend/views/site/index.php(12): yii\\base\\Widget::widget(Array)\n#9 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(332): require(''/home/ubuntu/wo...'')\n#10 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(250): yii\\base\\View->renderPhpFile(''/home/ubuntu/wo...'', Array)\n#11 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(152): yii\\base\\View->renderFile(''/home/ubuntu/wo...'', Array, Object(frontend\\controllers\\SiteController))\n#12 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(384): yii\\base\\View->render(''index'', Array, Object(frontend\\controllers\\SiteController))\n#13 /home/ubuntu/workspace/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render(''index'')\n#14 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#15 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#16 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#17 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(''index'', Array)\n#18 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction('''', Array)\n#19 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#20 /home/ubuntu/workspace/frontend/web/index.php(22): yii\\base\\Application->run()\n#21 {main}'),
(2, 2, 'yii\\debug\\Module::checkAccess', 1511603846.3979, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(3, 2, 'yii\\debug\\Module::checkAccess', 1511603846.3989, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(4, 1, 'yii\\base\\InvalidParamException', 1511604016.3438, '[frontend][/frontend/web/]', 'exception ''yii\\base\\InvalidParamException'' with message ''The file or directory to be published does not exist: /home/ubuntu/workspace/vendor/bower/bootstrap/dist'' in /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php:456\nStack trace:\n#0 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(185): yii\\web\\AssetManager->publish(''/home/ubuntu/wo...'', Array)\n#1 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(268): yii\\web\\AssetBundle->publish(Object(yii\\web\\AssetManager))\n#2 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(239): yii\\web\\AssetManager->loadBundle(''yii\\bootstrap\\B...'', Array, true)\n#3 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/View.php(286): yii\\web\\AssetManager->getBundle(''yii\\bootstrap\\B...'')\n#4 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(125): yii\\web\\View->registerAssetBundle(''yii\\bootstrap\\B...'')\n#5 /home/ubuntu/workspace/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register(Object(yii\\web\\View))\n#6 /home/ubuntu/workspace/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin(''carousel'')\n#7 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Widget.php(140): common\\widgets\\DbCarousel->run()\n#8 /home/ubuntu/workspace/frontend/views/site/index.php(12): yii\\base\\Widget::widget(Array)\n#9 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(332): require(''/home/ubuntu/wo...'')\n#10 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(250): yii\\base\\View->renderPhpFile(''/home/ubuntu/wo...'', Array)\n#11 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(152): yii\\base\\View->renderFile(''/home/ubuntu/wo...'', Array, Object(frontend\\controllers\\SiteController))\n#12 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(384): yii\\base\\View->render(''index'', Array, Object(frontend\\controllers\\SiteController))\n#13 /home/ubuntu/workspace/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render(''index'')\n#14 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#15 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#16 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#17 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(''index'', Array)\n#18 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction('''', Array)\n#19 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#20 /home/ubuntu/workspace/frontend/web/index.php(22): yii\\base\\Application->run()\n#21 {main}'),
(5, 2, 'yii\\debug\\Module::checkAccess', 1511604016.3728, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.203'),
(6, 2, 'yii\\debug\\Module::checkAccess', 1511604016.3768, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.203'),
(7, 1, 'yii\\base\\InvalidParamException', 1511751081.0212, '[frontend][/frontend/web/]', 'exception ''yii\\base\\InvalidParamException'' with message ''The file or directory to be published does not exist: /home/ubuntu/workspace/vendor/bower/bootstrap/dist'' in /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php:456\nStack trace:\n#0 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(185): yii\\web\\AssetManager->publish(''/home/ubuntu/wo...'', Array)\n#1 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(268): yii\\web\\AssetBundle->publish(Object(yii\\web\\AssetManager))\n#2 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(239): yii\\web\\AssetManager->loadBundle(''yii\\bootstrap\\B...'', Array, true)\n#3 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/View.php(286): yii\\web\\AssetManager->getBundle(''yii\\bootstrap\\B...'')\n#4 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(125): yii\\web\\View->registerAssetBundle(''yii\\bootstrap\\B...'')\n#5 /home/ubuntu/workspace/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register(Object(yii\\web\\View))\n#6 /home/ubuntu/workspace/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin(''carousel'')\n#7 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Widget.php(140): common\\widgets\\DbCarousel->run()\n#8 /home/ubuntu/workspace/frontend/views/site/index.php(12): yii\\base\\Widget::widget(Array)\n#9 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(332): require(''/home/ubuntu/wo...'')\n#10 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(250): yii\\base\\View->renderPhpFile(''/home/ubuntu/wo...'', Array)\n#11 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(152): yii\\base\\View->renderFile(''/home/ubuntu/wo...'', Array, Object(frontend\\controllers\\SiteController))\n#12 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(384): yii\\base\\View->render(''index'', Array, Object(frontend\\controllers\\SiteController))\n#13 /home/ubuntu/workspace/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render(''index'')\n#14 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#15 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#16 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#17 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(''index'', Array)\n#18 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction('''', Array)\n#19 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#20 /home/ubuntu/workspace/frontend/web/index.php(22): yii\\base\\Application->run()\n#21 {main}'),
(8, 2, 'yii\\debug\\Module::checkAccess', 1511751081.0569, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.105'),
(9, 2, 'yii\\debug\\Module::checkAccess', 1511751081.0581, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.105'),
(10, 1, 'yii\\base\\InvalidParamException', 1511753167.5691, '[frontend][/frontend/web/]', 'exception ''yii\\base\\InvalidParamException'' with message ''The file or directory to be published does not exist: /home/ubuntu/workspace/vendor/bower/bootstrap/dist'' in /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php:456\nStack trace:\n#0 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(185): yii\\web\\AssetManager->publish(''/home/ubuntu/wo...'', Array)\n#1 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(268): yii\\web\\AssetBundle->publish(Object(yii\\web\\AssetManager))\n#2 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(239): yii\\web\\AssetManager->loadBundle(''yii\\bootstrap\\B...'', Array, true)\n#3 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/View.php(286): yii\\web\\AssetManager->getBundle(''yii\\bootstrap\\B...'')\n#4 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(125): yii\\web\\View->registerAssetBundle(''yii\\bootstrap\\B...'')\n#5 /home/ubuntu/workspace/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register(Object(yii\\web\\View))\n#6 /home/ubuntu/workspace/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin(''carousel'')\n#7 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Widget.php(140): common\\widgets\\DbCarousel->run()\n#8 /home/ubuntu/workspace/frontend/views/site/index.php(12): yii\\base\\Widget::widget(Array)\n#9 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(332): require(''/home/ubuntu/wo...'')\n#10 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(250): yii\\base\\View->renderPhpFile(''/home/ubuntu/wo...'', Array)\n#11 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(152): yii\\base\\View->renderFile(''/home/ubuntu/wo...'', Array, Object(frontend\\controllers\\SiteController))\n#12 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(384): yii\\base\\View->render(''index'', Array, Object(frontend\\controllers\\SiteController))\n#13 /home/ubuntu/workspace/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render(''index'')\n#14 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#15 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#16 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#17 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(''index'', Array)\n#18 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction('''', Array)\n#19 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#20 /home/ubuntu/workspace/frontend/web/index.php(22): yii\\base\\Application->run()\n#21 {main}'),
(11, 2, 'yii\\debug\\Module::checkAccess', 1511753167.5904, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(12, 2, 'yii\\debug\\Module::checkAccess', 1511753167.5912, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(13, 1, 'yii\\base\\InvalidParamException', 1511756154.941, '[frontend][/frontend/web/]', 'exception ''yii\\base\\InvalidParamException'' with message ''The file or directory to be published does not exist: /home/ubuntu/workspace/vendor/bower/bootstrap/dist'' in /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php:456\nStack trace:\n#0 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(185): yii\\web\\AssetManager->publish(''/home/ubuntu/wo...'', Array)\n#1 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(268): yii\\web\\AssetBundle->publish(Object(yii\\web\\AssetManager))\n#2 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(239): yii\\web\\AssetManager->loadBundle(''yii\\bootstrap\\B...'', Array, true)\n#3 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/View.php(286): yii\\web\\AssetManager->getBundle(''yii\\bootstrap\\B...'')\n#4 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(125): yii\\web\\View->registerAssetBundle(''yii\\bootstrap\\B...'')\n#5 /home/ubuntu/workspace/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register(Object(yii\\web\\View))\n#6 /home/ubuntu/workspace/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin(''carousel'')\n#7 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Widget.php(140): common\\widgets\\DbCarousel->run()\n#8 /home/ubuntu/workspace/frontend/views/site/index.php(12): yii\\base\\Widget::widget(Array)\n#9 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(332): require(''/home/ubuntu/wo...'')\n#10 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(250): yii\\base\\View->renderPhpFile(''/home/ubuntu/wo...'', Array)\n#11 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(152): yii\\base\\View->renderFile(''/home/ubuntu/wo...'', Array, Object(frontend\\controllers\\SiteController))\n#12 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(384): yii\\base\\View->render(''index'', Array, Object(frontend\\controllers\\SiteController))\n#13 /home/ubuntu/workspace/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render(''index'')\n#14 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#15 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#16 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#17 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(''index'', Array)\n#18 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction('''', Array)\n#19 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#20 /home/ubuntu/workspace/frontend/web/index.php(22): yii\\base\\Application->run()\n#21 {main}'),
(14, 2, 'yii\\debug\\Module::checkAccess', 1511756154.9883, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.105'),
(15, 2, 'yii\\debug\\Module::checkAccess', 1511756154.9891, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.105'),
(16, 1, 'yii\\base\\InvalidParamException', 1511757988.3391, '[frontend][/frontend/web/]', 'exception ''yii\\base\\InvalidParamException'' with message ''The file or directory to be published does not exist: /home/ubuntu/workspace/vendor/bower/bootstrap/dist'' in /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php:456\nStack trace:\n#0 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(185): yii\\web\\AssetManager->publish(''/home/ubuntu/wo...'', Array)\n#1 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(268): yii\\web\\AssetBundle->publish(Object(yii\\web\\AssetManager))\n#2 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetManager.php(239): yii\\web\\AssetManager->loadBundle(''yii\\bootstrap\\B...'', Array, true)\n#3 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/View.php(286): yii\\web\\AssetManager->getBundle(''yii\\bootstrap\\B...'')\n#4 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/AssetBundle.php(125): yii\\web\\View->registerAssetBundle(''yii\\bootstrap\\B...'')\n#5 /home/ubuntu/workspace/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register(Object(yii\\web\\View))\n#6 /home/ubuntu/workspace/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin(''carousel'')\n#7 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Widget.php(140): common\\widgets\\DbCarousel->run()\n#8 /home/ubuntu/workspace/frontend/views/site/index.php(12): yii\\base\\Widget::widget(Array)\n#9 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(332): require(''/home/ubuntu/wo...'')\n#10 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(250): yii\\base\\View->renderPhpFile(''/home/ubuntu/wo...'', Array)\n#11 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/View.php(152): yii\\base\\View->renderFile(''/home/ubuntu/wo...'', Array, Object(frontend\\controllers\\SiteController))\n#12 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(384): yii\\base\\View->render(''index'', Array, Object(frontend\\controllers\\SiteController))\n#13 /home/ubuntu/workspace/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render(''index'')\n#14 [internal function]: frontend\\controllers\\SiteController->actionIndex()\n#15 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array(Array, Array)\n#16 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#17 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(''index'', Array)\n#18 /home/ubuntu/workspace/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction('''', Array)\n#19 /home/ubuntu/workspace/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#20 /home/ubuntu/workspace/frontend/web/index.php(22): yii\\base\\Application->run()\n#21 {main}'),
(17, 2, 'yii\\debug\\Module::checkAccess', 1511757988.5541, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(18, 2, 'yii\\debug\\Module::checkAccess', 1511757988.5551, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(19, 2, 'yii\\debug\\Module::checkAccess', 1511760146.0082, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(20, 2, 'yii\\debug\\Module::checkAccess', 1511760146.0099, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(21, 2, 'yii\\debug\\Module::checkAccess', 1511760431.042, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.203'),
(22, 2, 'yii\\debug\\Module::checkAccess', 1511760431.0454, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.203'),
(23, 2, 'yii\\debug\\Module::checkAccess', 1511766746.1289, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.127'),
(24, 2, 'yii\\debug\\Module::checkAccess', 1511766746.1302, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.127'),
(25, 2, 'yii\\debug\\Module::checkAccess', 1511766756.3512, '[frontend][/frontend/web/page/about]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.127'),
(26, 2, 'yii\\debug\\Module::checkAccess', 1511766756.3522, '[frontend][/frontend/web/page/about]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.127'),
(27, 2, 'yii\\debug\\Module::checkAccess', 1511766758.4282, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.127'),
(28, 2, 'yii\\debug\\Module::checkAccess', 1511766758.4292, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.127'),
(29, 2, 'yii\\debug\\Module::checkAccess', 1511767004.3492, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.203'),
(30, 2, 'yii\\debug\\Module::checkAccess', 1511767004.3502, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.203'),
(31, 2, 'yii\\debug\\Module::checkAccess', 1511767041.7296, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.60'),
(32, 2, 'yii\\debug\\Module::checkAccess', 1511767041.731, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.60'),
(33, 2, 'yii\\debug\\Module::checkAccess', 1511767122.7283, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.60'),
(34, 2, 'yii\\debug\\Module::checkAccess', 1511767122.7298, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.60'),
(35, 2, 'yii\\debug\\Module::checkAccess', 1511767591.966, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(36, 2, 'yii\\debug\\Module::checkAccess', 1511767591.9687, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(37, 2, 'yii\\debug\\Module::checkAccess', 1511768907.7375, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.60'),
(38, 2, 'yii\\debug\\Module::checkAccess', 1511768907.7394, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.60'),
(39, 2, 'yii\\debug\\Module::checkAccess', 1511768941.7653, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(40, 2, 'yii\\debug\\Module::checkAccess', 1511768941.767, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(41, 2, 'yii\\debug\\Module::checkAccess', 1511768965.9236, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(42, 2, 'yii\\debug\\Module::checkAccess', 1511768965.9252, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(43, 2, 'yii\\debug\\Module::checkAccess', 1511768977.4378, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(44, 2, 'yii\\debug\\Module::checkAccess', 1511768977.4387, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(45, 2, 'yii\\debug\\Module::checkAccess', 1511769389.5555, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(46, 2, 'yii\\debug\\Module::checkAccess', 1511769389.5574, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.183'),
(47, 2, 'yii\\debug\\Module::checkAccess', 1511773998.3383, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.173'),
(48, 2, 'yii\\debug\\Module::checkAccess', 1511773998.3403, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.1.173'),
(49, 2, 'yii\\debug\\Module::checkAccess', 1511774374.9598, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33'),
(50, 2, 'yii\\debug\\Module::checkAccess', 1511774374.9609, '[frontend][/frontend/web/]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.240.0.33');

-- --------------------------------------------------------

--
-- Table structure for table `system_rbac_migration`
--

CREATE TABLE IF NOT EXISTS `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_rbac_migration`
--

INSERT INTO `system_rbac_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1511603743),
('m150625_214101_roles', 1511603748),
('m150625_215624_init_permissions', 1511603748),
('m151223_074604_edit_own_model', 1511603748);

-- --------------------------------------------------------

--
-- Table structure for table `timeline_event`
--

CREATE TABLE IF NOT EXISTS `timeline_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `timeline_event`
--

INSERT INTO `timeline_event` (`id`, `application`, `category`, `event`, `data`, `created_at`) VALUES
(1, 'frontend', 'user', 'signup', '{"public_identity":"webmaster","user_id":1,"created_at":1511603741}', 1511603741),
(2, 'frontend', 'user', 'signup', '{"public_identity":"manager","user_id":2,"created_at":1511603741}', 1511603741),
(3, 'frontend', 'user', 'signup', '{"public_identity":"user","user_id":3,"created_at":1511603741}', 1511603741);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_client_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `access_token`, `password_hash`, `oauth_client`, `oauth_client_user_id`, `email`, `status`, `created_at`, `updated_at`, `logged_at`) VALUES
(1, 'webmaster', '5FA6vDILBY8CdAxPyBo6DVs7dOcK049k', 's355IqgD286uxMuzb6dWtm-lH_0dAXB_BOPBUQ4K', '$2y$13$g7lOW3qFRLO2Iinf.ZTYdOz3ge0sQnJQeG/mpHbof7e6ozDSrPOk.', NULL, NULL, 'webmaster@example.com', 2, 1511603742, 1511603742, NULL),
(2, 'manager', 'sgjvKp7elL8ELO-0Vl-mgOmU-bMwpUkA', 'uJzZaJ5mDqnAq83qJChM6Az0yaY12zg6J1YS-pTR', '$2y$13$OOF5qChMDg912PHg3O73ae7JPrquRSQ4pdW5acX89LJ78C0nVCP/G', NULL, NULL, 'manager@example.com', 2, 1511603743, 1511603743, NULL),
(3, 'user', 'Xckl2Tm5t3-7i92BXE8YIZ0S9I4h19Sf', 'T36jxcUXdjYynC3mc9wmILKaIxclcTZOlW18g2gR', '$2y$13$KqcXfsHndDEs9XKLkZXtnutunyHZpIzqNX/z6p2FVTXMxqSYnorf6', NULL, NULL, 'user@example.com', 2, 1511603743, 1511603743, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gender` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `firstname`, `middlename`, `lastname`, `avatar_path`, `avatar_base_url`, `locale`, `gender`) VALUES
(1, 'John', NULL, 'Doe', NULL, NULL, 'en-US', NULL),
(2, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL),
(3, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_carousel`
--

CREATE TABLE IF NOT EXISTS `widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `widget_carousel`
--

INSERT INTO `widget_carousel` (`id`, `key`, `status`) VALUES
(1, 'index', 1);

-- --------------------------------------------------------

--
-- Table structure for table `widget_carousel_item`
--

CREATE TABLE IF NOT EXISTS `widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `widget_carousel_item`
--

INSERT INTO `widget_carousel_item` (`id`, `carousel_id`, `base_url`, `path`, `type`, `url`, `caption`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://yii2-video-learning-avengerappvn.c9users.io', 'img/yii2-starter-kit.gif', 'image/gif', '/', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `widget_menu`
--

CREATE TABLE IF NOT EXISTS `widget_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `widget_menu`
--

INSERT INTO `widget_menu` (`id`, `key`, `title`, `items`, `status`) VALUES
(1, 'frontend-index', 'Frontend index menu', '[\n    {\n        "label": "Get started with Yii2",\n        "url": "http://www.yiiframework.com",\n        "options": {\n            "tag": "span"\n        },\n        "template": "<a href=\\"{url}\\" class=\\"btn btn-lg btn-success\\">{label}</a>"\n    },\n    {\n        "label": "Yii2 Starter Kit on GitHub",\n        "url": "https://github.com/trntv/yii2-starter-kit",\n        "options": {\n            "tag": "span"\n        },\n        "template": "<a href=\\"{url}\\" class=\\"btn btn-lg btn-primary\\">{label}</a>"\n    },\n    {\n        "label": "Find a bug?",\n        "url": "https://github.com/trntv/yii2-starter-kit/issues",\n        "options": {\n            "tag": "span"\n        },\n        "template": "<a href=\\"{url}\\" class=\\"btn btn-lg btn-danger\\">{label}</a>"\n    }\n]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `widget_text`
--

CREATE TABLE IF NOT EXISTS `widget_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `widget_text`
--

INSERT INTO `widget_text` (`id`, `key`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'backend_welcome', 'Welcome to backend', '<p>Welcome to Yii2 Starter Kit Dashboard</p>', 1, 1511603743, 1511603743),
(2, 'ads-example', 'Google Ads Example Block', '<div class="lead">\n                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\n                <ins class="adsbygoogle"\n                     style="display:block"\n                     data-ad-client="ca-pub-9505937224921657"\n                     data-ad-slot="2264361777"\n                     data-ad-format="auto"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>', 0, 1511603743, 1511603743);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_author` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_updater` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `article_attachment`
--
ALTER TABLE `article_attachment`
  ADD CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `i18n_message`
--
ALTER TABLE `i18n_message`
  ADD CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rbac_auth_assignment`
--
ALTER TABLE `rbac_auth_assignment`
  ADD CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rbac_auth_item`
--
ALTER TABLE `rbac_auth_item`
  ADD CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `rbac_auth_item_child`
--
ALTER TABLE `rbac_auth_item_child`
  ADD CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  ADD CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
