-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 13 2017 г., 13:10
-- Версия сервера: 5.5.52-MariaDB
-- Версия PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dvizh_dss`
--

-- --------------------------------------------------------

--
-- Структура таблицы `aggregate_rating`
--

CREATE TABLE IF NOT EXISTS `aggregate_rating` (
  `id` int(11) NOT NULL,
  `model_id` smallint(6) NOT NULL,
  `target_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `rating` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `updater_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `article_attachment`
--

CREATE TABLE IF NOT EXISTS `article_attachment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `article_category`
--

CREATE TABLE IF NOT EXISTS `article_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('superadmin', '3', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('superadmin', 1, 'Superadmin', NULL, NULL, 1494930153, 1498625992),
('user', 1, 'User', NULL, NULL, 1494930153, 1494930153);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `updated_time` int(11) NOT NULL,
  `tmp_user_id` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `created_time`, `updated_time`, `tmp_user_id`) VALUES
(1, '', 1510481981, 1510482452, '9dda1a2491d8394e71a2e34ab9bedc27'),
(2, '1', 1510485237, 1510487928, NULL),
(3, '', 1510488329, 1510488329, 'fc50fd7a2b93e301efeba17253766657'),
(4, '2', 1510488510, 1510488510, NULL),
(5, '', 1510498259, 1510498259, '768e84f10b6d678a5ccb00131148ee60'),
(6, '', 1510549675, 1510549675, '02ae31ff6bab61d9f671c767217fdefa'),
(7, '', 1510559060, 1510559060, 'a188305508d14cca3177fb5e8e098528'),
(8, '', 1510559062, 1510559062, 'b65193f24b23919b06f1905448763681'),
(9, '', 1510559304, 1510559304, '9487433ca7c52a16565aa0a94beda7b0'),
(10, '', 1510559305, 1510559305, 'c1ee168dc4527c753080fc4070c81699'),
(11, '', 1510559308, 1510559308, 'bea91f4ebcc2ea0fd7552b36e973b490'),
(12, '', 1510559311, 1510559368, 'd6cb1afeda568f4cb5d50c84a9aac9d1'),
(13, '', 1510559329, 1510559329, '9e4dbdddef6d34df6e1406cad6a476ed'),
(14, '', 1510559656, 1510559656, '37332913a4570b761670f4a4e8c8381c'),
(15, '', 1510559939, 1510559939, 'beba53f90a79bc4314eb10c5c4ab7228'),
(16, '', 1510560071, 1510560071, '95545648da0ebb4913acf82d9699c8e8');

-- --------------------------------------------------------

--
-- Структура таблицы `cart_element`
--

CREATE TABLE IF NOT EXISTS `cart_element` (
  `id` int(11) NOT NULL,
  `parent_id` int(55) NOT NULL,
  `model` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `cart_id` int(11) NOT NULL,
  `item_id` int(55) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cart_element`
--

INSERT INTO `cart_element` (`id`, `parent_id`, `model`, `cart_id`, `item_id`, `count`, `price`, `hash`, `options`) VALUES
(1, 0, 'dvizh\\shop\\models\\Product', 1, 1, 1, 555.00, '9cf6720420bff656d4d1a66f96cfee17', '[]'),
(2, 0, 'dvizh\\shop\\models\\Product', 2, 2, 5, 799.00, '0c251c1aeb3e55e7663c461440b0856c', '[]'),
(3, 0, 'dvizh\\shop\\models\\Product', 12, 1, 1, 555.00, '9cf6720420bff656d4d1a66f96cfee17', '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `cashbox_cashbox`
--

CREATE TABLE IF NOT EXISTS `cashbox_cashbox` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `balance` decimal(19,2) NOT NULL DEFAULT '0.00',
  `deleted` datetime DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cashbox_exchange`
--

CREATE TABLE IF NOT EXISTS `cashbox_exchange` (
  `id` int(11) NOT NULL,
  `from_cashbox_id` int(11) NOT NULL,
  `from_sum` decimal(19,2) NOT NULL DEFAULT '0.00',
  `to_cashbox_id` int(11) NOT NULL,
  `to_sum` decimal(19,2) NOT NULL DEFAULT '0.00',
  `date` datetime NOT NULL,
  `rate` decimal(19,2) NOT NULL DEFAULT '1.00',
  `staffer_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cashbox_operation`
--

CREATE TABLE IF NOT EXISTS `cashbox_operation` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `balance` decimal(19,2) NOT NULL,
  `sum` decimal(19,2) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `staffer_id` int(11) NOT NULL,
  `comment` text,
  `cancel` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cashbox_revision`
--

CREATE TABLE IF NOT EXISTS `cashbox_revision` (
  `id` int(11) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `balance_fact` decimal(19,2) NOT NULL DEFAULT '0.00',
  `balance_expect` decimal(19,2) NOT NULL DEFAULT '0.00',
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cashbox_user_to_cashbox`
--

CREATE TABLE IF NOT EXISTS `cashbox_user_to_cashbox` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cashbox_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `certificate_certificate`
--

CREATE TABLE IF NOT EXISTS `certificate_certificate` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `date_elapsed` datetime DEFAULT NULL,
  `employment` varchar(55) NOT NULL,
  `status` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `target_user` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `certificate_certificate_to_item`
--

CREATE TABLE IF NOT EXISTS `certificate_certificate_to_item` (
  `id` int(11) NOT NULL,
  `certificate_id` int(11) NOT NULL,
  `target_model` varchar(500) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `certificate_use`
--

CREATE TABLE IF NOT EXISTS `certificate_use` (
  `id` int(11) NOT NULL,
  `certificate_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `client_call`
--

CREATE TABLE IF NOT EXISTS `client_call` (
  `id` int(11) NOT NULL,
  `type` varchar(22) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `staffer_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `matter` varchar(1155) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `result` varchar(55) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `client_call_category`
--

CREATE TABLE IF NOT EXISTS `client_call_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `client_category`
--

CREATE TABLE IF NOT EXISTS `client_category` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `text` text,
  `sort` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `client_client`
--

CREATE TABLE IF NOT EXISTS `client_client` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(55) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `persent` tinyint(5) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `birthday` varchar(55) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `promocode` varchar(55) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_category`
--

CREATE TABLE IF NOT EXISTS `consumption_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_cost`
--

CREATE TABLE IF NOT EXISTS `consumption_cost` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `income_id` int(11) DEFAULT NULL,
  `consume_amount` decimal(19,3) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_income`
--

CREATE TABLE IF NOT EXISTS `consumption_income` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `resource_id` int(11) NOT NULL,
  `income` decimal(19,3) NOT NULL DEFAULT '0.000',
  `cost` decimal(19,2) NOT NULL DEFAULT '0.00',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_norm`
--

CREATE TABLE IF NOT EXISTS `consumption_norm` (
  `id` int(11) NOT NULL,
  `element_model` varchar(255) NOT NULL,
  `element_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `consumption` decimal(10,3) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_remain`
--

CREATE TABLE IF NOT EXISTS `consumption_remain` (
  `id` int(11) NOT NULL,
  `income_id` int(11) NOT NULL,
  `amount` decimal(19,3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_resource`
--

CREATE TABLE IF NOT EXISTS `consumption_resource` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `dimension` decimal(10,3) DEFAULT '0.000',
  `measures` varchar(100) NOT NULL,
  `base_unit` decimal(10,3) DEFAULT '0.000',
  `base_cost` decimal(10,2) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `consumption_transaction`
--

CREATE TABLE IF NOT EXISTS `consumption_transaction` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `ident` int(11) NOT NULL,
  `element_model` varchar(255) NOT NULL,
  `element_id` int(11) NOT NULL,
  `count` decimal(10,3) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `type` enum('income','outcome') NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `deleted` datetime DEFAULT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `faq_category`
--

CREATE TABLE IF NOT EXISTS `faq_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `faq_category`
--

INSERT INTO `faq_category` (`id`, `parent_id`, `name`, `sort`) VALUES
(1, NULL, 'Работа в системе', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `faq_faq`
--

CREATE TABLE IF NOT EXISTS `faq_faq` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `sort` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `faq_faq`
--

INSERT INTO `faq_faq` (`id`, `category_id`, `title`, `text`, `sort`) VALUES
(1, 1, 'Приходование товара', '<p>текст</p>', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `faq_faq_to_category`
--

CREATE TABLE IF NOT EXISTS `faq_faq_to_category` (
  `id` int(11) NOT NULL,
  `faq_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `faq_faq_to_category`
--

INSERT INTO `faq_faq_to_category` (`id`, `faq_id`, `category_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `field`
--

CREATE TABLE IF NOT EXISTS `field` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type` text,
  `options` text,
  `description` text,
  `relation_model` varchar(55) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `field`
--

INSERT INTO `field` (`id`, `name`, `slug`, `category_id`, `type`, `options`, `description`, `relation_model`) VALUES
(13, 'Артикул', 'Code', NULL, 'text', NULL, '', 'pistol88\\shop\\models\\Product');

-- --------------------------------------------------------

--
-- Структура таблицы `field_category`
--

CREATE TABLE IF NOT EXISTS `field_category` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `field_value`
--

CREATE TABLE IF NOT EXISTS `field_value` (
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `numeric_value` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `field_variant`
--

CREATE TABLE IF NOT EXISTS `field_variant` (
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numeric_value` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `file_storage_item`
--

CREATE TABLE IF NOT EXISTS `file_storage_item` (
  `id` int(11) NOT NULL,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `filter`
--

CREATE TABLE IF NOT EXISTS `filter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `relation_field_name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `relation_field_value` text COLLATE utf8_unicode_ci COMMENT 'PHP serialize',
  `slug` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `is_filter` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `sort` int(11) DEFAULT NULL,
  `is_option` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `filter`
--

INSERT INTO `filter` (`id`, `name`, `description`, `relation_field_name`, `type`, `relation_field_value`, `slug`, `is_filter`, `sort`, `is_option`) VALUES
(15, 'Подбор', '', 'category_id', 'radio', 'a:2:{i:0;s:2:"29";i:1;s:2:"28";}', '222', 'no', NULL, NULL),
(18, 'Бренды', '', 'category_id', 'radio', 'a:2:{i:0;s:2:"29";i:1;s:2:"28";}', '222', 'no', NULL, NULL),
(19, 'Тип', '', 'category_id', 'checkbox', 'a:1:{i:0;s:2:"33";}', 'type', 'yes', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `filter_relation_value`
--

CREATE TABLE IF NOT EXISTS `filter_relation_value` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `filter_relation_value`
--

INSERT INTO `filter_relation_value` (`id`, `filter_id`, `value`) VALUES
(60, 18, 28),
(59, 18, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `filter_value`
--

CREATE TABLE IF NOT EXISTS `filter_value` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `filter_variant`
--

CREATE TABLE IF NOT EXISTS `filter_variant` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numeric_value` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `filter_variant`
--

INSERT INTO `filter_variant` (`id`, `filter_id`, `value`, `numeric_value`, `image`) VALUES
(125, 11, NULL, 0, NULL),
(230, 19, 'Крема', 0, NULL),
(229, 19, 'Масла', 0, NULL),
(228, 19, 'Гель', 0, NULL),
(227, 19, 'Мыло', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `i18n_message`
--

CREATE TABLE IF NOT EXISTS `i18n_message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `translation` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `i18n_source_message`
--

CREATE TABLE IF NOT EXISTS `i18n_source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(20) NOT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `description` text,
  `gallery_id` varchar(150) DEFAULT NULL,
  `sort` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `title`, `alt`, `filePath`, `itemId`, `isMain`, `modelName`, `urlAlias`, `description`, `gallery_id`, `sort`) VALUES
(5, NULL, NULL, 'Products/Product904/599ec4.jpg', 904, NULL, 'Product', 'd48ede7513-2', NULL, NULL, NULL),
(46, NULL, NULL, 'Sliders/Slider12/60713a.png', 12, NULL, 'Slider', 'ddd918cc04-2', NULL, NULL, NULL),
(49, NULL, NULL, 'Sliders/Slider14/ac504a.jpg', 14, NULL, 'Slider', '237f3027a3-2', NULL, NULL, NULL),
(100, NULL, NULL, 'Sliders/Slider13/34bd1e.jpg', 13, NULL, 'Slider', '91d19a8ddd-2', NULL, NULL, NULL),
(139, NULL, NULL, 'Producers/Producer20/536384.jpg', 20, NULL, 'Producer', 'd7519868a1-2', NULL, NULL, NULL),
(152, NULL, NULL, 'Products/Product1/028313.jpg', 1, NULL, 'Product', '0a6b2293b7-2', NULL, NULL, NULL),
(153, NULL, NULL, 'Categorys/Category1/2f0ca1.jpg', 1, NULL, 'Category', '35633aa8ab-2', NULL, NULL, NULL),
(154, NULL, NULL, 'Products/Product2/5bf751.jpg', 2, NULL, 'Product', '83ffbf5312-2', NULL, NULL, NULL),
(155, NULL, NULL, 'Products/Product2/ccfa4c.jpg', 2, NULL, 'Product', 'a7ddd5202d-2', NULL, NULL, NULL),
(156, NULL, NULL, 'Sliders/Slider3/d5fa33.jpg', 3, NULL, 'Slider', '09dca0f73a-2', NULL, NULL, NULL),
(158, NULL, NULL, 'Sliders/Slider4/ecf2d5.png', 4, NULL, 'Slider', '6638fcc544-2', NULL, NULL, NULL),
(159, NULL, NULL, 'ShortDiscounts/ShortDiscount3/0f2072.jpg', 3, NULL, 'ShortDiscount', '605d3944be-2', NULL, 'discount', NULL),
(160, NULL, NULL, 'Producers/Producer1/620b73.jpg', 1, NULL, 'Producer', '56b43c07f2-2', NULL, NULL, NULL),
(161, NULL, NULL, 'Producers/Producer2/6f329f.jpg', 2, NULL, 'Producer', '87557643b9-2', NULL, NULL, NULL),
(162, NULL, NULL, 'Newss/News13/1ad500.jpg', 13, NULL, 'News', '824021d935-2', NULL, NULL, NULL),
(163, NULL, NULL, 'Newss/News14/ae416e.jpeg', 14, NULL, 'News', '72f38a9bbc-2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `key_storage_item`
--

CREATE TABLE IF NOT EXISTS `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `key_storage_item`
--

INSERT INTO `key_storage_item` (`key`, `value`, `comment`, `updated_at`, `created_at`) VALUES
('backend.layout-boxed', '0', NULL, NULL, NULL),
('backend.layout-collapsed-sidebar', '0', NULL, NULL, NULL),
('backend.layout-fixed', '0', NULL, NULL, NULL),
('backend.theme-skin', 'skin-blue', 'skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow', 1466273722, NULL),
('frontend.maintenance', 'disabled', 'Set it to "true" to turn on maintenance mode', 1463730515, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1463735058),
('m314315_215216_create_seo_table', 1463740338),
('m160913_114811_consumption_norm', 1478163150),
('m160919_092911_consumption_transaction', 1478163150),
('m160920_102211_consumption_category', 1478163150),
('m160920_102211_consumption_resource', 1478163150),
('m160923_092611_consumption_income', 1478163150),
('m160928_124611_consumption_remain', 1478163150),
('m160928_124711_consumption_cost', 1478163150),
('m161110_050319_create_assigment_fields', 1479734927),
('m161110_050319_create_organization_fields', 1479734927),
('m160905_143011_cashbox_cashbox', 1479791177),
('m160912_121711_cashbox_exchange', 1479791177),
('m160922_070212_cashbox_operation', 1479791177),
('m160922_114111_cashbox_revision', 1479791177),
('m160926_064511_cashbox_user_to_cashbox', 1479791177),
('m161110_125109_altertable_cashbox_cashbox', 1479791177),
('m161110_050321_create_organization_fields', 1479885751),
('m140622_111540_create_image_table', 1486970395),
('m150102_164631_create_rating_table', 1487676741),
('m150127_165542_update_rating_table', 1487676742),
('m150129_132124_add_indexes_for_rating_table', 1487676742),
('m160126_140022_create_aggregate_rating_table', 1487676742),
('m160209_074651_add_indexes_for_aggregate_rating_table', 1487676742),
('m160617_115412_Mass', 1487757451),
('m161119_112011_faq_faq_to_category', 1488349233),
('m161119_112011_altertable_faq_faq', 1488349233),
('m161119_111912_altertable_faq_category', 1488349233),
('m160728_081826_Mass', 1488283270),
('m170107_893987_client_calls', 1488283270),
('m161129_101511_promocode_to_item', 1488286158),
('m160518_123713_Mass', 1488286158),
('m170116_073411_altertable_promocode', 1488286159),
('m170116_073511_promocode_used', 1488286159),
('m170117_131738_altertable_promocode_type', 1488286159),
('m170118_075411_promocode_condition', 1488286159),
('m170118_075611_promocode_to_condition', 1488286159),
('m230217_134711_altertable_promocode_used', 1488286160),
('m161118_112011_faq_faq', 1488349232),
('m161119_111911_faq_category', 1488349233),
('m160513_051524_Mass', 1492417867),
('m170311_230319_create_is_deleted_field', 1492417868),
('m170311_234119_create_element_name_field', 1492417868),
('m140209_132017_init', 1510404525),
('m140403_174025_create_account_table', 1510404525),
('m140504_113157_update_tables', 1510404526),
('m140504_130429_create_token_table', 1510404526),
('m140830_171933_fix_ip_field', 1510404526),
('m140830_172703_change_account_table_name', 1510404526),
('m141222_110026_update_ip_field', 1510404526),
('m141222_135246_alter_username_length', 1510404526),
('m150614_103145_update_social_account_table', 1510404527),
('m150623_212711_fix_username_notnull', 1510404527),
('m151218_234654_add_timezone_to_profile', 1510404527),
('m160929_103127_add_last_login_at_to_user_table', 1510404527);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `anons` varchar(300) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('draft','published','deleted') NOT NULL DEFAULT 'draft',
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `anons`, `text`, `slug`, `date`, `status`, `name`) VALUES
(13, '', '<p>Читайте нашу новость!</p>', '<p>Новость номер 1. Текст новости. Новость</p>', 'novost-1', '2017-11-10 09:31:28', 'published', 'Новость 1'),
(14, '', '<p>Вторая новость интереснее первой</p>', '<p>В этой новости вы узнаете всю правду. Текст новости. Читайте новости только у нас.</p>', 'novost-2', '2017-11-10 09:32:37', 'published', 'Новость 2');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL,
  `client_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `shipping_type_id` int(11) DEFAULT NULL,
  `status` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_info` text COLLATE utf8_unicode_ci COMMENT 'PHP serialize',
  `time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `seller_user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `payment` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `timestamp` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` decimal(11,2) DEFAULT NULL,
  `base_cost` decimal(11,2) DEFAULT NULL,
  `promocode` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_type` enum('fast','totime') COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_time_date` date NOT NULL,
  `delivery_time_hour` tinyint(4) NOT NULL,
  `delivery_time_min` tinyint(4) NOT NULL,
  `is_assigment` tinyint(1) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `client_name`, `phone`, `email`, `payment_type_id`, `shipping_type_id`, `status`, `order_info`, `time`, `user_id`, `seller_user_id`, `date`, `payment`, `timestamp`, `comment`, `address`, `count`, `cost`, `base_cost`, `promocode`, `delivery_type`, `delivery_time_date`, `delivery_time_hour`, `delivery_time_min`, `is_assigment`, `organization_id`, `is_deleted`) VALUES
(1, 'q q q', '+7 900 999-00-99', 'qwe@qwe.qwe', NULL, NULL, 'new', NULL, '13:00:50', NULL, NULL, '2017-11-12 00:00:00', 'no', 1510480850, 'hui', NULL, NULL, 555.00, 555.00, NULL, NULL, '0000-00-00', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `order_element`
--

CREATE TABLE IF NOT EXISTS `order_element` (
  `id` int(11) NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `base_price` decimal(11,2) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `is_assigment` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_element`
--

INSERT INTO `order_element` (`id`, `model`, `order_id`, `item_id`, `count`, `price`, `base_price`, `description`, `options`, `is_assigment`, `is_deleted`, `name`) VALUES
(1, 'dvizh\\shop\\models\\Product', 1, 1, 1, 555.00, 555.00, '', '[]', NULL, 0, 'Первый товар');

-- --------------------------------------------------------

--
-- Структура таблицы `order_element_statist`
--

CREATE TABLE IF NOT EXISTS `order_element_statist` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `date_timestamp` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `retail_cost` int(11) DEFAULT NULL,
  `wholesale_cost` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_field`
--

CREATE TABLE IF NOT EXISTS `order_field` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `order` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_field_type`
--

CREATE TABLE IF NOT EXISTS `order_field_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `widget` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_variants` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_field_value`
--

CREATE TABLE IF NOT EXISTS `order_field_value` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_field_value_variant`
--

CREATE TABLE IF NOT EXISTS `order_field_value_variant` (
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_margin`
--

CREATE TABLE IF NOT EXISTS `order_margin` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_timestamp` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `wholesale_sum` int(11) NOT NULL,
  `retail_sum` int(11) NOT NULL,
  `elements_count` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_payment_type`
--

CREATE TABLE IF NOT EXISTS `order_payment_type` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `widget` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_shipping_type`
--

CREATE TABLE IF NOT EXISTS `order_shipping_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `cost` decimal(11,2) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `free_cost_from` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `status` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `show_page` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `page`
--

INSERT INTO `page` (`id`, `parent_id`, `name`, `slug`, `template`, `text`, `status`, `show_page`) VALUES
(1, NULL, 'Парфюмный дворик', '123123', '', '\r\n<p class="clearfix gray-bg">\r\n<img src="/dss.loc/frontend/web/image/product/2.jpg" alt="" align="left" style="padding: 10px;">\r\n	<a href="/" class="h3">Название акции / товара</a>\r\n	VIP-мероприятие, не меняя концепции, изложенной выше, однообразно транслирует сегмент рынка. Product placement, согласно Ф.Котлеру, наиболее полно усиливает комплексный анализ зарубежного опыта, опираясь на опыт западных коллег. Рекламная поддержка стабилизирует эмпирический комплексный анализ ситуации, опираясь на опыт западных коллег.\r\n</p>', 'draft', 'no'),
(2, NULL, 'Какая-то акция', 'kakaa-to-akcia', '', '<p>123123</p>', 'draft', 'no'),
(3, NULL, 'Доставка и оплата', 'dostavka-i-oplata', '', '<p>123123123</p>', 'draft', 'no'),
(4, NULL, 'О компании', 'o-kompanii', '', '<p>Текст</p>', 'draft', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `promocode`
--

CREATE TABLE IF NOT EXISTS `promocode` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(2) NOT NULL,
  `status` int(1) NOT NULL,
  `date_elapsed` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` enum('percent','quantum') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `promocode`
--

INSERT INTO `promocode` (`id`, `title`, `description`, `code`, `discount`, `status`, `date_elapsed`, `amount`, `type`) VALUES
(20, 'Промокод 404', 'Дарится пользователю при переходе на 404 ошибку', '404error', 5, 1, NULL, NULL, 'percent');

-- --------------------------------------------------------

--
-- Структура таблицы `promocode_condition`
--

CREATE TABLE IF NOT EXISTS `promocode_condition` (
  `id` int(11) NOT NULL,
  `sum_start` int(10) NOT NULL,
  `sum_stop` int(10) NOT NULL,
  `value` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `promocode_to_condition`
--

CREATE TABLE IF NOT EXISTS `promocode_to_condition` (
  `id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `cindition_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `promocode_to_item`
--

CREATE TABLE IF NOT EXISTS `promocode_to_item` (
  `id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `item_model` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `promocode_use`
--

CREATE TABLE IF NOT EXISTS `promocode_use` (
  `id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `user_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `promocode_used`
--

CREATE TABLE IF NOT EXISTS `promocode_used` (
  `id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `quotations`
--

CREATE TABLE IF NOT EXISTS `quotations` (
  `id` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `quotations`
--

INSERT INTO `quotations` (`id`, `sort`, `text`) VALUES
(2, NULL, '<p><em>«Духи, как и мода, - это искусство плавного бегства,</em></p><p><em>создающее в обычной жизни привилегированное пространство».</em></p><p><strong>Марилен Дельбург Дельфи, историк.</strong></p>'),
(3, NULL, '<p><em></em><em>«Парфюмер – это работа, требующая зрелой личности».</em></p><p><strong>Элина Арсеньева, искусствовед.</strong></p>');

-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL,
  `model_id` smallint(6) NOT NULL,
  `target_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_ip` varbinary(39) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rating`
--

INSERT INTO `rating` (`id`, `model_id`, `target_id`, `user_id`, `user_ip`, `value`, `date`) VALUES
(1, 0, 12, NULL, 0x7f000001, 0, 1487677378),
(2, 0, 11, NULL, 0x7f000001, 1, 1487676772),
(3, 0, 12, NULL, 0x058ca410, 1, 1488355749),
(4, 0, 13, 9, 0x058ca410, 1, 1488359229),
(5, 0, 11, NULL, 0x5f6ce1d0, 0, 1488449568),
(6, 0, 11, NULL, 0xb0d7a360, 0, 1488526009),
(7, 0, 11, NULL, 0xb0d78469, 1, 1488718623),
(8, 0, 11, NULL, 0x6baaa676, 0, 1489256877),
(9, 0, 12, NULL, 0xbc120efd, 1, 1490693560),
(10, 0, 12, NULL, 0x6dc386af, 0, 1492425119),
(11, 0, 11, NULL, 0x6dc386af, 1, 1492425126);

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `item_id` int(11) NOT NULL,
  `pluses` text COLLATE utf8_unicode_ci NOT NULL,
  `minuses` text COLLATE utf8_unicode_ci NOT NULL,
  `vote` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `seo`
--

CREATE TABLE IF NOT EXISTS `seo` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `h1` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(522) DEFAULT NULL,
  `text` text,
  `meta_index` varchar(255) DEFAULT NULL,
  `redirect_301` varchar(522) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `seo`
--

INSERT INTO `seo` (`id`, `item_id`, `modelName`, `h1`, `title`, `keywords`, `description`, `text`, `meta_index`, `redirect_301`) VALUES
(1, 1, 'dvizh\\shop\\models\\Category', '', '', '', '', '', '', ''),
(2, 1, 'dvizh\\shop\\models\\Product', '', '', '', '', '', '', ''),
(3, 2, 'dvizh\\shop\\models\\Product', '', '', '', '', '', '', ''),
(4, 13, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 14, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'dvizh\\shop\\models\\Producer', '', '', '', '', '', '', ''),
(7, 2, 'dvizh\\shop\\models\\Producer', '', '', '', '', '', '', ''),
(8, 13, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 14, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `service_category`
--

CREATE TABLE IF NOT EXISTS `service_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `service_property`
--

CREATE TABLE IF NOT EXISTS `service_property` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `comment` text
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `name`, `key`, `value`) VALUES
(3, 'Телефон', 'phone', '+7(999)999-99-99'),
(4, 'Название сайта', 'sitename', 'Магазин'),
(10, 'СЕО текст в футере', 'SEO-text-footer', 'SEO-текст. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the subas industry''s standard dummy text.\r\n\r\nWhen an unknown printer took a galley of type and If you are going to use a passage of Lorem Ipsum scrambled it to make.'),
(11, 'Адрес магазина', 'address', 'адрес'),
(12, 'Электронная почта', 'email', 'admin@shop.ru'),
(13, 'Код яндекс/гугл карты', 'map', '<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Ae600855141a82e1a0a07e17132c4a3d4771b2a73e026ea81acbbbcac1969656e&amp;width=500&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>'),
(14, 'Рабочие часы магазина', 'schedule', '10:00 - 19:00'),
(15, 'Ссылка на Facebook', 'facebook-link', '#'),
(16, 'Ссылка на ВК', 'vk-link', '#'),
(17, 'Ссылка на Одноклассники', 'odnoklassniki-link', '#'),
(18, 'Ссылка на Twitter', 'twitter-link', '#'),
(19, 'Ссылка на YouTube', 'youtube-link', '#');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category`
--

CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `text` text,
  `image` text,
  `sort` int(11) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_category`
--

INSERT INTO `shop_category` (`id`, `parent_id`, `name`, `slug`, `text`, `image`, `sort`, `code`) VALUES
(1, NULL, 'Смартфоны', 'smartfony', '<p>Смартфоны</p>', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_incoming`
--

CREATE TABLE IF NOT EXISTS `shop_incoming` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `content` text,
  `price_id` int(11) DEFAULT NULL,
  `price_type_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_outcoming`
--

CREATE TABLE IF NOT EXISTS `shop_outcoming` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_price`
--

CREATE TABLE IF NOT EXISTS `shop_price` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(55) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_old` decimal(11,2) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `available` enum('yes','no') DEFAULT 'yes',
  `amount` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_price`
--

INSERT INTO `shop_price` (`id`, `name`, `code`, `price`, `price_old`, `product_id`, `available`, `amount`, `sort`, `type_id`, `type`, `item_id`) VALUES
(1, 'Обычная', NULL, 555, NULL, 0, 'yes', 0, NULL, 5, 'p', 1),
(2, 'Цена закупа', NULL, 777, NULL, 0, 'yes', 0, NULL, 6, 'p', 1),
(3, 'Обычная', NULL, 799, NULL, 0, 'yes', 0, NULL, 5, 'p', 2),
(4, 'Цена закупа', NULL, 123, NULL, 0, 'yes', 0, NULL, 6, 'p', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_price_history`
--

CREATE TABLE IF NOT EXISTS `shop_price_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `price_type_id` int(11) NOT NULL,
  `price` decimal(11,0) NOT NULL,
  `date` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_price_type`
--

CREATE TABLE IF NOT EXISTS `shop_price_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_price_type`
--

INSERT INTO `shop_price_type` (`id`, `name`, `sort`, `condition`) VALUES
(5, 'Обычная', 1, NULL),
(6, 'Цена закупа', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_producer`
--

CREATE TABLE IF NOT EXISTS `shop_producer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text,
  `text` text,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_producer`
--

INSERT INTO `shop_producer` (`id`, `name`, `image`, `text`, `slug`) VALUES
(1, 'Lenovo', NULL, '<p>Леново</p>', 'lenovo'),
(2, 'Alcatel', NULL, '<p>Алкатель</p>', 'alcatel');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product`
--

CREATE TABLE IF NOT EXISTS `shop_product` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(55) DEFAULT NULL,
  `barcode` int(55) DEFAULT NULL,
  `sku` int(55) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `related_products` text COMMENT 'PHP serialize',
  `name` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `short_text` varchar(255) DEFAULT NULL,
  `images` text,
  `available` enum('yes','no') DEFAULT 'yes',
  `sort` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `related_ids` text,
  `is_new` enum('yes','no') DEFAULT NULL,
  `is_promo` enum('yes','no') DEFAULT NULL,
  `is_popular` enum('yes','no') DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product`
--

INSERT INTO `shop_product` (`id`, `code`, `barcode`, `sku`, `amount`, `category_id`, `producer_id`, `related_products`, `name`, `text`, `short_text`, `images`, `available`, `sort`, `slug`, `related_ids`, `is_new`, `is_promo`, `is_popular`) VALUES
(1, '', NULL, NULL, 55, 1, NULL, NULL, 'Lenovo a6000', '<p>По количеству выпускаемых моделей смартфонов китайская компания Lenovo является, пожалуй, рекордсменом. Вряд ли кто-нибудь из конкурентов может сейчас похвастать таким же широким выбором одновременно присутствующих на рынке мобильных аппаратов. И тем не менее, всегда найдется конкретная модель, которую и покупатели, и сам производитель склонны выделять особо. О ней больше говорят, шире обсуждают, такую модель чаще выбирают для приобретения из множества других похожих продуктов. Понятно, что все дело в сбалансированности некоторых основополагающих характеристик, которые для среднестатистического пользователя столь важны, что удачное их сочетание и приводит к повышенному спросу на данную конкретную модель.\n<p>\nЧто-то подобное случилось и с героем сегодняшнего обзора. Смартфон Lenovo A6000 — ничем вроде бы не примечательный смартфон, далекий от флагманского уровня. Он и выглядит скромно, и производительностью не блещет, но вот случилось так, что именно его производитель охарактеризовал, как «лучший в своем классе смартфон с пятидюймовым дисплеем». В этом, кстати, легко убедиться, если зайти на страничку фирменного сайта Lenovo, посвященную данной модели. Что ж, возможно, производитель в чем-то прав. По крайней мере, никто не будет спорить сейчас с тем, что в сложившейся рыночной ситуации мобильная продукция этой китайской компании получила в нашей стране такое широкое признание, которого никак нельзя было ожидать в прошлые, докризисные годы. Соответственно, не могли и мы в своих обзорах обойти данную модель стороной, коли уж производитель выделил ее из своего многочисленного семейства недорогих мобильных аппаратов.', 'смартфон, Android 4.4 поддержка двух SIM-карт экран 5", разрешение 1280x720 камера 8 МП, автофокус память 8 Гб, слот для карты памяти 3G, 4G LTE, LTE-A, Wi-Fi, Bluetooth, GPS, ГЛОНАСС объем оперативной памяти 1 Гб аккумулятор 2300 мА⋅ч вес 128 г, ШxВxТ 70', NULL, 'yes', NULL, 'lenovo-a-6000', 'a:0:{}', 'no', 'yes', 'yes'),
(2, '', NULL, NULL, 78, 1, NULL, NULL, 'Alcatel One Touch Idol 3 Mini', '<p>Смартфон Alcatel One Touch 6039Y Idol 3 mini LTE Grey выполнен в уникальном, полностью симметричном дизайне. Вы можете совершать вызовы и управлять устройством, даже если оно повернуто «головой вниз», интерфейс сам подстраивается под текущее положение в пространстве.\n\n\n<p>Аппарат снабжен процессором Qualcomm Snapdragon 410, 4 ядра которого работают на частоте 1,2 ГГц. Устройство оснащено 1.5 Гб оперативной памяти, а объем встроенной памяти составляет 8Гб, который можно расширить с помощью карт памяти MicroSD с объемом до 128Гб, что позволит хранить на них фото, видео, музыку и другие данные в больших количествах.\n\n\n<p>Дисплей Alcatel One Touch 6039Y Idol 3 mini LTE Grey с диагональ 4.7 дюймов имеет HD разрешение 1280 x 720 пикселей с плотностью 312ppi. Экран выполнен по технологии IPS, которая обеспечивает естественную цветопередачу, широкие углы обзора и позволяет изображению не «выцветать» даже при прямом солнечном свете.\n\n\n<p>В телефоне установлена камера с разрешением 13 Мпикс и системой быстрого автофокуса, широкой диафрагмой и электронной системой стабилизации. Кроме встроенной вспышки и функций распознавания лица и улыбки, она позволяет снимать видео высокой четкости с технологией HDR. А фронтальная камера с разрешение 5 Мпикс оснащена широким углом обзора, для любителей делать сэлфи с друзьями.\n\n\n<p>Так же интересной особенностью Alcatel One Touch 6039Y Idol 3 mini LTE Grey является его качественное звучание, благодаря двум динамикам мощностью по 1.2 Вт, которые создают 3D эффект.\n\n<p>Смартфон так же оснащен модулями 4G LTE, Wi-Fi, Bluetooth, имеет встроенную навигацию GPS с технологией A-GPS и работает под управлением операционной системы Android 5.0.2 Lollipop.', 'Диагональ экрана: 4.7 " Разрешение экрана: 1280 x 720 Операционная система: Android 5.0 Lollipop Количество ядер: 4 Максимальная частота процессора: 1.2 ГГц Разрешение основной камеры: 13 Мп Объем оперативной памяти: 1.5 Гб', NULL, 'yes', NULL, 'alcatel-one-touch-idol-3-mini', 'a:0:{}', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_modification`
--

CREATE TABLE IF NOT EXISTS `shop_product_modification` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(55) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `price_old` decimal(11,2) DEFAULT NULL,
  `images` text,
  `available` enum('yes','no') DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `filter_values` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_to_category`
--

CREATE TABLE IF NOT EXISTS `shop_product_to_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_to_category`
--

INSERT INTO `shop_product_to_category` (`id`, `product_id`, `category_id`) VALUES
(2, 1, 1),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_review`
--

CREATE TABLE IF NOT EXISTS `shop_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` text,
  `rate` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_review`
--

INSERT INTO `shop_review` (`id`, `product_id`, `name`, `comment`, `rate`, `created_at`) VALUES
(1, 1, 'Alexandr', 'Loren ipsum doloren sit amet...', 3, '2017-11-10 14:48:00'),
(2, 1, 'Alexandr', 'Loren ipsum doloren sit amet...', 4, '2017-11-10 16:49:00');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_stock`
--

CREATE TABLE IF NOT EXISTS `shop_stock` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `text` text
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_stock_to_product`
--

CREATE TABLE IF NOT EXISTS `shop_stock_to_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_stock_to_user`
--

CREATE TABLE IF NOT EXISTS `shop_stock_to_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `short_discount`
--

CREATE TABLE IF NOT EXISTS `short_discount` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `date_end` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(15,0) NOT NULL,
  `feature` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `short_discount`
--

INSERT INTO `short_discount` (`id`, `title`, `description`, `date_end`, `product_id`, `price`, `feature`) VALUES
(3, 'Акция "Первый заказ"', '<p>Получите скидку на товар при первой покупке на нашем сайте! Срок акции ограничен.</p>', '2017-12-23 00:00:00', 1, 123, '<ul><li>Цена снижена</li><li>Выгода 77%</li><li>Отличный товар за копейки!</li></ul>');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_text` text COLLATE utf8_unicode_ci,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `name`, `url`, `slug`, `short_text`, `sort`) VALUES
(3, 'Категория "Смартфоны"', '/category/view?slug=smartfony', NULL, '<p>Купите смартфон</p>', NULL),
(4, 'Доставка и оплата', '/page/view?slug=dostavka-i-oplata', NULL, '<p>Условия доставки и оплаты нашего магазина</p>', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `spending_category`
--

CREATE TABLE IF NOT EXISTS `spending_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `spending_spending`
--

CREATE TABLE IF NOT EXISTS `spending_spending` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `cost` decimal(19,2) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text,
  `model` varchar(155) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `staffer_category`
--

CREATE TABLE IF NOT EXISTS `staffer_category` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `text` text,
  `sort` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `staffer_fine`
--

CREATE TABLE IF NOT EXISTS `staffer_fine` (
  `id` int(11) NOT NULL,
  `staffer_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `sum` decimal(11,2) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `staffer_staffer`
--

CREATE TABLE IF NOT EXISTS `staffer_staffer` (
  `id` int(10) unsigned NOT NULL,
  `category_id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `pay_type` varchar(55) DEFAULT NULL,
  `persent` tinyint(5) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fix` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `system_db_migration`
--

CREATE TABLE IF NOT EXISTS `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `system_log`
--

CREATE TABLE IF NOT EXISTS `system_log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=28221 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_rbac_migration`
--

CREATE TABLE IF NOT EXISTS `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `system_rbac_migration`
--

INSERT INTO `system_rbac_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1463654551),
('m150625_214101_roles', 1463654781),
('m150625_215624_init_permissions', 1463654781),
('m151223_074604_edit_own_model', 1463654781);

-- --------------------------------------------------------

--
-- Структура таблицы `timeline_event`
--

CREATE TABLE IF NOT EXISTS `timeline_event` (
  `id` int(11) NOT NULL,
  `application` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(3, 'KpRe3gzDhgENBYQpdD67nePToQ5ux1Nh', 1510560092, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(3, 'administrator', 'nn250495@yandex.ru', '$2y$10$QxpUKO.C0Xk9nDUyC/Y91.adXRs5EhCWLejRZimDwVH7YQOPSkC3i', 'gS8IeDr92ZXYkS3FgyQQ-0T1bthyh-AK', 1510560092, NULL, NULL, '176.215.141.165', 1510560092, 1510560092, 0, 1510560253);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_carousel`
--

CREATE TABLE IF NOT EXISTS `widget_carousel` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `widget_carousel`
--

INSERT INTO `widget_carousel` (`id`, `key`, `status`) VALUES
(1, 'index', 1),
(2, 'test', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_carousel_item`
--

CREATE TABLE IF NOT EXISTS `widget_carousel_item` (
  `id` int(11) NOT NULL,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `widget_carousel_item`
--

INSERT INTO `widget_carousel_item` (`id`, `carousel_id`, `base_url`, `path`, `type`, `url`, `caption`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://terehin.lc', 'img/yii2-starter-kit.gif', 'image/gif', '/', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_menu`
--

CREATE TABLE IF NOT EXISTS `widget_menu` (
  `id` int(11) NOT NULL,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `widget_menu`
--

INSERT INTO `widget_menu` (`id`, `key`, `title`, `items`, `status`) VALUES
(1, 'frontend-index', 'Frontend index menu', '[\n    {\n        "label": "Get started with Yii2",\n        "url": "http://www.yiiframework.com",\n        "options": {\n            "tag": "span"\n        },\n        "template": "<a href=\\"{url}\\" class=\\"btn btn-lg btn-success\\">{label}</a>"\n    },\n    {\n        "label": "Yii2 Starter Kit on GitHub",\n        "url": "https://github.com/trntv/yii2-starter-kit",\n        "options": {\n            "tag": "span"\n        },\n        "template": "<a href=\\"{url}\\" class=\\"btn btn-lg btn-primary\\">{label}</a>"\n    },\n    {\n        "label": "Find a bug?",\n        "url": "https://github.com/trntv/yii2-starter-kit/issues",\n        "options": {\n            "tag": "span"\n        },\n        "template": "<a href=\\"{url}\\" class=\\"btn btn-lg btn-danger\\">{label}</a>"\n    }\n]', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_text`
--

CREATE TABLE IF NOT EXISTS `widget_text` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `widget_text`
--

INSERT INTO `widget_text` (`id`, `key`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'backend_welcome', 'Welcome to backend', '<p>Welcome to Yii2 Starter Kit Dashboard</p>', 1, 1463654550, 1463654550),
(2, 'ads-example', 'Google Ads Example Block', '<div class="lead">\n                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\n                <ins class="adsbygoogle"\n                     style="display:block"\n                     data-ad-client="ca-pub-9505937224921657"\n                     data-ad-slot="2264361777"\n                     data-ad-format="auto"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>', 0, 1463654550, 1463654550);

-- --------------------------------------------------------

--
-- Структура таблицы `work_session`
--

CREATE TABLE IF NOT EXISTS `work_session` (
  `id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `stop` datetime DEFAULT NULL,
  `report` text,
  `start_timestamp` int(11) DEFAULT NULL,
  `stop_timestamp` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shift` varchar(55) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `work_session_schedule`
--

CREATE TABLE IF NOT EXISTS `work_session_schedule` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `shift` varchar(55) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `work_session_user`
--

CREATE TABLE IF NOT EXISTS `work_session_user` (
  `id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `stop` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `report` text,
  `start_timestamp` int(11) DEFAULT NULL,
  `stop_timestamp` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `aggregate_rating`
--
ALTER TABLE `aggregate_rating`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aggregate_model_id_target_id` (`model_id`,`target_id`);

--
-- Индексы таблицы `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_author` (`author_id`),
  ADD KEY `fk_article_updater` (`updater_id`),
  ADD KEY `fk_article_category` (`category_id`);

--
-- Индексы таблицы `article_attachment`
--
ALTER TABLE `article_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_attachment_article` (`article_id`);

--
-- Индексы таблицы `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_category_section` (`parent_id`);

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `cart_element`
--
ALTER TABLE `cart_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Индексы таблицы `cashbox_cashbox`
--
ALTER TABLE `cashbox_cashbox`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashbox_exchange`
--
ALTER TABLE `cashbox_exchange`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashbox_operation`
--
ALTER TABLE `cashbox_operation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashbox_revision`
--
ALTER TABLE `cashbox_revision`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashbox_user_to_cashbox`
--
ALTER TABLE `cashbox_user_to_cashbox`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `certificate_certificate`
--
ALTER TABLE `certificate_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `certificate_certificate_to_item`
--
ALTER TABLE `certificate_certificate_to_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `certificate_use`
--
ALTER TABLE `certificate_use`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_call`
--
ALTER TABLE `client_call`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_call_category`
--
ALTER TABLE `client_call_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_category`
--
ALTER TABLE `client_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`parent_id`);

--
-- Индексы таблицы `client_client`
--
ALTER TABLE `client_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status` (`status`);

--
-- Индексы таблицы `consumption_category`
--
ALTER TABLE `consumption_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `consumption_cost`
--
ALTER TABLE `consumption_cost`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `consumption_income`
--
ALTER TABLE `consumption_income`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `consumption_norm`
--
ALTER TABLE `consumption_norm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `consumption_remain`
--
ALTER TABLE `consumption_remain`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `consumption_resource`
--
ALTER TABLE `consumption_resource`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `consumption_transaction`
--
ALTER TABLE `consumption_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`parent_id`);

--
-- Индексы таблицы `faq_faq`
--
ALTER TABLE `faq_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `faq_faq_to_category`
--
ALTER TABLE `faq_faq_to_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `field_category`
--
ALTER TABLE `field_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `field_value`
--
ALTER TABLE `field_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Индексы таблицы `field_variant`
--
ALTER TABLE `field_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_field` (`field_id`);

--
-- Индексы таблицы `file_storage_item`
--
ALTER TABLE `file_storage_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `filter_relation_value`
--
ALTER TABLE `filter_relation_value`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `filter_value`
--
ALTER TABLE `filter_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_item` (`variant_id`,`item_id`);

--
-- Индексы таблицы `filter_variant`
--
ALTER TABLE `filter_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filter` (`filter_id`);

--
-- Индексы таблицы `i18n_message`
--
ALTER TABLE `i18n_message`
  ADD PRIMARY KEY (`id`,`language`);

--
-- Индексы таблицы `i18n_source_message`
--
ALTER TABLE `i18n_source_message`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `key_storage_item`
--
ALTER TABLE `key_storage_item`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `idx_key_storage_item_key` (`key`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_payment` (`payment_type_id`),
  ADD KEY `fk_order_shipping` (`shipping_type_id`);

--
-- Индексы таблицы `order_element`
--
ALTER TABLE `order_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_element_order` (`order_id`);

--
-- Индексы таблицы `order_field`
--
ALTER TABLE `order_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_field_type` (`type_id`);

--
-- Индексы таблицы `order_field_type`
--
ALTER TABLE `order_field_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_field_value`
--
ALTER TABLE `order_field_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_field_order` (`order_id`),
  ADD KEY `fk_value_field` (`field_id`);

--
-- Индексы таблицы `order_field_value_variant`
--
ALTER TABLE `order_field_value_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_variant_field` (`field_id`);

--
-- Индексы таблицы `order_payment_type`
--
ALTER TABLE `order_payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_shipping_type`
--
ALTER TABLE `order_shipping_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `promocode_condition`
--
ALTER TABLE `promocode_condition`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promocode_to_condition`
--
ALTER TABLE `promocode_to_condition`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promocode_to_item`
--
ALTER TABLE `promocode_to_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promocode_use`
--
ALTER TABLE `promocode_use`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promocode` (`promocode_id`);

--
-- Индексы таблицы `promocode_used`
--
ALTER TABLE `promocode_used`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_model_id_target_id` (`model_id`,`target_id`),
  ADD KEY `rating_user_id` (`user_id`),
  ADD KEY `rating_user_ip` (`user_ip`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `service_property`
--
ALTER TABLE `service_property`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`parent_id`);

--
-- Индексы таблицы `shop_incoming`
--
ALTER TABLE `shop_incoming`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_outcoming`
--
ALTER TABLE `shop_outcoming`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_price`
--
ALTER TABLE `shop_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `shop_price_history`
--
ALTER TABLE `shop_price_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_price_type`
--
ALTER TABLE `shop_price_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_producer`
--
ALTER TABLE `shop_producer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `producer_id` (`producer_id`);

--
-- Индексы таблицы `shop_product_modification`
--
ALTER TABLE `shop_product_modification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_product_to_category`
--
ALTER TABLE `shop_product_to_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_review`
--
ALTER TABLE `shop_review`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_stock`
--
ALTER TABLE `shop_stock`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_stock_to_product`
--
ALTER TABLE `shop_stock_to_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Индексы таблицы `shop_stock_to_user`
--
ALTER TABLE `shop_stock_to_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `short_discount`
--
ALTER TABLE `short_discount`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Индексы таблицы `spending_category`
--
ALTER TABLE `spending_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `spending_spending`
--
ALTER TABLE `spending_spending`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `staffer_category`
--
ALTER TABLE `staffer_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`parent_id`);

--
-- Индексы таблицы `staffer_fine`
--
ALTER TABLE `staffer_fine`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `staffer_staffer`
--
ALTER TABLE `staffer_staffer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status` (`status`);

--
-- Индексы таблицы `system_db_migration`
--
ALTER TABLE `system_db_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_level` (`level`),
  ADD KEY `idx_log_category` (`category`);

--
-- Индексы таблицы `system_rbac_migration`
--
ALTER TABLE `system_rbac_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `timeline_event`
--
ALTER TABLE `timeline_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Индексы таблицы `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- Индексы таблицы `widget_carousel`
--
ALTER TABLE `widget_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_carousel` (`carousel_id`);

--
-- Индексы таблицы `widget_menu`
--
ALTER TABLE `widget_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_text`
--
ALTER TABLE `widget_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_widget_text_key` (`key`);

--
-- Индексы таблицы `work_session`
--
ALTER TABLE `work_session`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `work_session_schedule`
--
ALTER TABLE `work_session_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `work_session_user`
--
ALTER TABLE `work_session_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `aggregate_rating`
--
ALTER TABLE `aggregate_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `article_attachment`
--
ALTER TABLE `article_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `cart_element`
--
ALTER TABLE `cart_element`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `cashbox_cashbox`
--
ALTER TABLE `cashbox_cashbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cashbox_exchange`
--
ALTER TABLE `cashbox_exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cashbox_operation`
--
ALTER TABLE `cashbox_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cashbox_revision`
--
ALTER TABLE `cashbox_revision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cashbox_user_to_cashbox`
--
ALTER TABLE `cashbox_user_to_cashbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `certificate_certificate`
--
ALTER TABLE `certificate_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `certificate_certificate_to_item`
--
ALTER TABLE `certificate_certificate_to_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `certificate_use`
--
ALTER TABLE `certificate_use`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `client_call`
--
ALTER TABLE `client_call`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `client_call_category`
--
ALTER TABLE `client_call_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `client_category`
--
ALTER TABLE `client_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=235;
--
-- AUTO_INCREMENT для таблицы `client_client`
--
ALTER TABLE `client_client`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `consumption_category`
--
ALTER TABLE `consumption_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `consumption_cost`
--
ALTER TABLE `consumption_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `consumption_income`
--
ALTER TABLE `consumption_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `consumption_norm`
--
ALTER TABLE `consumption_norm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `consumption_remain`
--
ALTER TABLE `consumption_remain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `consumption_resource`
--
ALTER TABLE `consumption_resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `consumption_transaction`
--
ALTER TABLE `consumption_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `faq_faq`
--
ALTER TABLE `faq_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `faq_faq_to_category`
--
ALTER TABLE `faq_faq_to_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `field`
--
ALTER TABLE `field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `field_category`
--
ALTER TABLE `field_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `field_value`
--
ALTER TABLE `field_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT для таблицы `field_variant`
--
ALTER TABLE `field_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT для таблицы `file_storage_item`
--
ALTER TABLE `file_storage_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `filter`
--
ALTER TABLE `filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `filter_relation_value`
--
ALTER TABLE `filter_relation_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `filter_value`
--
ALTER TABLE `filter_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT для таблицы `filter_variant`
--
ALTER TABLE `filter_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=231;
--
-- AUTO_INCREMENT для таблицы `i18n_source_message`
--
ALTER TABLE `i18n_source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `order_element`
--
ALTER TABLE `order_element`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `order_field`
--
ALTER TABLE `order_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order_field_type`
--
ALTER TABLE `order_field_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order_field_value`
--
ALTER TABLE `order_field_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order_field_value_variant`
--
ALTER TABLE `order_field_value_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order_payment_type`
--
ALTER TABLE `order_payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `order_shipping_type`
--
ALTER TABLE `order_shipping_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `promocode_condition`
--
ALTER TABLE `promocode_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `promocode_to_condition`
--
ALTER TABLE `promocode_to_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `promocode_to_item`
--
ALTER TABLE `promocode_to_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `promocode_use`
--
ALTER TABLE `promocode_use`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `promocode_used`
--
ALTER TABLE `promocode_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `seo`
--
ALTER TABLE `seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `service_category`
--
ALTER TABLE `service_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `service_property`
--
ALTER TABLE `service_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1000;
--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `shop_incoming`
--
ALTER TABLE `shop_incoming`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `shop_outcoming`
--
ALTER TABLE `shop_outcoming`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `shop_price`
--
ALTER TABLE `shop_price`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `shop_price_history`
--
ALTER TABLE `shop_price_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `shop_price_type`
--
ALTER TABLE `shop_price_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `shop_producer`
--
ALTER TABLE `shop_producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `shop_product_modification`
--
ALTER TABLE `shop_product_modification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `shop_product_to_category`
--
ALTER TABLE `shop_product_to_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `shop_review`
--
ALTER TABLE `shop_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `shop_stock`
--
ALTER TABLE `shop_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `shop_stock_to_product`
--
ALTER TABLE `shop_stock_to_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `shop_stock_to_user`
--
ALTER TABLE `shop_stock_to_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `short_discount`
--
ALTER TABLE `short_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `spending_category`
--
ALTER TABLE `spending_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `spending_spending`
--
ALTER TABLE `spending_spending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=597;
--
-- AUTO_INCREMENT для таблицы `staffer_category`
--
ALTER TABLE `staffer_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT для таблицы `staffer_fine`
--
ALTER TABLE `staffer_fine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `staffer_staffer`
--
ALTER TABLE `staffer_staffer`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=255;
--
-- AUTO_INCREMENT для таблицы `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28221;
--
-- AUTO_INCREMENT для таблицы `timeline_event`
--
ALTER TABLE `timeline_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `widget_carousel`
--
ALTER TABLE `widget_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `widget_menu`
--
ALTER TABLE `widget_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `widget_text`
--
ALTER TABLE `widget_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `work_session`
--
ALTER TABLE `work_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT для таблицы `work_session_schedule`
--
ALTER TABLE `work_session_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT для таблицы `work_session_user`
--
ALTER TABLE `work_session_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `promocode_use`
--
ALTER TABLE `promocode_use`
  ADD CONSTRAINT `fk_promocode` FOREIGN KEY (`promocode_id`) REFERENCES `promocode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
