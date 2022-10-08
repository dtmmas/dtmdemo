-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2021 a las 22:48:22
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `DTM`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `node_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `user_id`, `node_id`, `reference`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Dr. Gerard Goyette', '2021-04-21 20:20:01', '2021-04-21 20:20:01', NULL),
(2, 3, 1, 'Zoe Adams DDS', '2021-04-21 20:20:01', '2021-04-21 20:20:01', NULL),
(3, 4, 1, 'Mr. Jake Feest', '2021-04-21 20:20:01', '2021-04-21 20:20:01', NULL),
(4, 5, 2, 'Prof. Alberto McLaughlin III', '2021-04-21 20:20:01', '2021-04-21 20:20:01', NULL),
(5, 6, 1, 'Mr. Jayme Schulist MD', '2021-04-21 20:20:02', '2021-04-21 20:20:02', NULL),
(6, 12, NULL, 'cliente a', '2021-04-21 20:36:09', '2021-04-21 20:36:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_product`
--

CREATE TABLE `client_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `node_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_instalation` date NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_installation` double(12,2) NOT NULL DEFAULT 0.00,
  `advance` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1-> pago anticipado',
  `status` enum('-1','0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1-> activo, 0-> suspendido, -1 -> cancelado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `client_product`
--

INSERT INTO `client_product` (`id`, `client_id`, `product_id`, `node_id`, `date_instalation`, `address`, `reference`, `amount_installation`, `advance`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2021-04-21', 'Virgie ', 'Virgie ', 0.00, '0', '1', '2021-04-21 20:31:33', '2021-04-21 20:31:33'),
(2, 2, 2, 3, '2021-04-21', 'Amir ', 'Amir ', 0.00, '0', '1', '2021-04-21 20:31:57', '2021-04-21 20:31:57'),
(3, 6, 1, 2, '2021-04-21', 'wefwqe', 'fqwefwer', 0.00, '0', '1', '2021-04-21 23:17:28', '2021-04-21 23:17:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `collector_zone`
--

CREATE TABLE `collector_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collector_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `collector_zone`
--

INSERT INTO `collector_zone` (`id`, `collector_id`, `zone_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2021-04-21 20:28:03', '2021-04-21 20:28:03'),
(2, 7, 3, '2021-04-21 20:28:40', '2021-04-21 20:28:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('0','1','-1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0->pendiente, 1->pagada, -1 ->vencida',
  `price` double(12,2) NOT NULL,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_03_16_150207_create_sessions_table', 1),
(7, '2021_03_16_153941_create_permission_tables', 1),
(8, '2021_04_02_210909_create_categories_table', 1),
(9, '2021_04_02_213808_create_subcategories_table', 1),
(10, '2021_04_02_213809_create_products_table', 1),
(11, '2021_04_08_131735_create_zones_table', 1),
(12, '2021_04_08_131742_create_nodes_table', 1),
(13, '2021_04_08_152958_create_clients_table', 1),
(14, '2021_04_09_200442_create_collector_zone_table', 1),
(15, '2021_04_09_225429_create_client_product_table', 1),
(16, '2021_04_13_173058_create_invoices_table', 1),
(17, '2021_04_14_142030_create_payments_table', 1),
(18, '2021_04_23_071556_create_log_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nodes`
--

CREATE TABLE `nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nodes`
--

INSERT INTO `nodes` (`id`, `zone_id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '17', 'NODO 17', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL),
(2, 2, '59', 'NODO 59', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL),
(3, 3, '21', 'NODO 21', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL),
(4, 4, '43', 'NODO 43', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL),
(5, 5, '48', 'NODO 48', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `no_voucher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_voucher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(12,2) NOT NULL,
  `observation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_payment` enum('2','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1->manual, 2 ->paypal',
  `status` enum('0','1','-1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0->pendiente, 1->aprobado, -1 ->rechazado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'users.index', 'Ver listado de usuarios', 'web', '2021-04-21 20:20:04', '2021-04-21 20:20:04'),
(2, 'users.create', 'Crear nuevos usuarios', 'web', '2021-04-21 20:20:05', '2021-04-21 20:20:05'),
(3, 'users.edit', 'Editar usuarios', 'web', '2021-04-21 20:20:05', '2021-04-21 20:20:05'),
(4, 'users.destroy', 'Eliminar usuarios', 'web', '2021-04-21 20:20:05', '2021-04-21 20:20:05'),
(5, 'users.editrole', 'Modificar y asignar roles a un usuario', 'web', '2021-04-21 20:20:05', '2021-04-21 20:20:05'),
(6, 'roles.index', 'Ver listado de roles', 'web', '2021-04-21 20:20:05', '2021-04-21 20:20:05'),
(7, 'roles.create', 'Crear nuevos roles', 'web', '2021-04-21 20:20:06', '2021-04-21 20:20:06'),
(8, 'roles.edit', 'Editar Rol', 'web', '2021-04-21 20:20:06', '2021-04-21 20:20:06'),
(9, 'roles.destroy', 'Eliminar Rol', 'web', '2021-04-21 20:20:06', '2021-04-21 20:20:06'),
(10, 'products.index', 'Ver listado de productos', 'web', '2021-04-21 20:20:06', '2021-04-21 20:20:06'),
(11, 'products.create', 'Crear nuevos productos', 'web', '2021-04-21 20:20:07', '2021-04-21 20:20:07'),
(12, 'products.edit', 'Editar Producto', 'web', '2021-04-21 20:20:07', '2021-04-21 20:20:07'),
(13, 'products.destroy', 'Eliminar Producto', 'web', '2021-04-21 20:20:07', '2021-04-21 20:20:07'),
(14, 'products.mine', 'Ver listado de planes contratados', 'web', '2021-04-21 20:20:07', '2021-04-21 20:20:07'),
(15, 'zones.index', 'Ver listado de zonas', 'web', '2021-04-21 20:20:08', '2021-04-21 20:20:08'),
(16, 'zones.create', 'Crear nuevas zonas', 'web', '2021-04-21 20:20:08', '2021-04-21 20:20:08'),
(17, 'zones.edit', 'Editar Zona', 'web', '2021-04-21 20:20:08', '2021-04-21 20:20:08'),
(18, 'zones.destroy', 'Eliminar Zona', 'web', '2021-04-21 20:20:08', '2021-04-21 20:20:08'),
(19, 'clients.index', 'Ver listado de clientes', 'web', '2021-04-21 20:20:08', '2021-04-21 20:20:08'),
(20, 'clients.create', 'Crear nuevos clientes', 'web', '2021-04-21 20:20:08', '2021-04-21 20:20:08'),
(21, 'clients.edit', 'Editar clientes', 'web', '2021-04-21 20:20:09', '2021-04-21 20:20:09'),
(22, 'clients.destroy', 'Eliminar clientes', 'web', '2021-04-21 20:20:09', '2021-04-21 20:20:09'),
(23, 'collectors.index', 'Ver listado de cobradores', 'web', '2021-04-21 20:20:09', '2021-04-21 20:20:09'),
(24, 'collectors.create', 'Crear nuevos cobradores', 'web', '2021-04-21 20:20:09', '2021-04-21 20:20:09'),
(25, 'collectors.edit', 'Editar cobradores', 'web', '2021-04-21 20:20:09', '2021-04-21 20:20:09'),
(26, 'collectors.destroy', 'Eliminar cobradores', 'web', '2021-04-21 20:20:09', '2021-04-21 20:20:09'),
(27, 'invoices.index', 'Ver listado de facturas', 'web', '2021-04-21 20:20:10', '2021-04-21 20:20:10'),
(28, 'payments.index', 'Ver listado de pagos', 'web', '2021-04-21 20:20:10', '2021-04-21 20:20:10'),
(29, 'payments.create', 'Reportar pagos', 'web', '2021-04-21 20:20:10', '2021-04-21 20:20:10'),
(30, 'payments.process', 'Aprobar o rechazar pagos', 'web', '2021-04-21 20:20:12', '2021-04-21 20:20:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `velocidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `velocidad`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PLAN 83', '15156969', '83GB', 1910.00, '2021-04-21 20:19:56', '2021-04-21 20:19:56', NULL),
(2, 'PLAN 95', '55482202', '95GB', 2741.00, '2021-04-21 20:19:56', '2021-04-21 20:19:56', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Tiene acceso a todo el sistema', 'web', '2021-04-21 20:19:57', '2021-04-21 20:19:57'),
(2, 'Cobrador', 'Solo tiene acceso a su perfil, listado de clientes y el historial de pagos del cliente', 'web', '2021-04-21 20:19:58', '2021-04-21 20:19:58'),
(3, 'Cliente', 'Solo tiene acceso a su perfil y a sus facturas y pagos', 'web', '2021-04-21 20:19:58', '2021-04-21 20:19:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 3),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(19, 2),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 2),
(27, 3),
(28, 1),
(28, 2),
(28, 3),
(29, 1),
(29, 2),
(29, 3),
(30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JcACOaYRRPucfJU6vS2rV29R7gjPRZeSz9VMFqSe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.438', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1I1Rm92bldXSGhxdnhXS1lRUG9DZ1d5cVdtQ2U4ajl6S2ZVdUl3cyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1619190352),
('W3GCP1O7LYIbNLhDAmTZYKA5v1JOcHeeRq4VFYKp', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 OPR/73.0.3856.438', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRnd3c1Joc0UyeDhhSFZqa2xzQ05XN3NUZzhKQW10YWpNV3JFVFNhViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3QvY29icmFuemEvcGF5bWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkbExTVzhYbkdrL3pvNjNlTUE0eW9ndTUyQ1AwUUJESnRHbzliMTU1OUxiWXBEU3EuU1duNmkiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGxMU1c4WG5Hay96bzYzZU1BNHlvZ3U1MkNQMFFCREp0R285YjE1NTlMYllwRFNxLlNXbjZpIjt9', 1619210632);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1-> es cobrador, 0-> NO es cobrado',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `dni`, `address`, `phone`, `email`, `type`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'Admin', '21', '58904 Akeem Walks\nNew Alport, MD 54594', '6567674', 'admin@gmail.com', '0', '2021-04-21 20:19:56', '$2y$10$lLSW8XnGk/zo63eMA4yogu52CP0QBDJtGo9b1559LbYpDSq.SWn6i', NULL, NULL, 'bFfzrQo3lutgzrJrfnnAsLo9MLDtyIMzFGR3mQBQ1qgCFwYNAvNCyI79FxcZ', NULL, NULL, '2021-04-21 20:19:56', '2021-04-21 20:19:56', NULL),
(2, 'Virgie Romaguera', 'Kutch', '9574', '183 Reese View\nNew Idella, CO 28415-3994', '30672553', 'tward@example.org', '0', '2021-04-21 20:20:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'I82j4vgLOK', NULL, NULL, '2021-04-21 20:20:00', '2021-04-21 20:20:00', NULL),
(3, 'Prof. Amir Conroy', 'Jacobs', '457', '904 Maggio Grove Suite 866\nLockmanberg, OH 74656-7761', '80286', 'aric.dietrich@example.com', '0', '2021-04-21 20:20:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'upT4qOcqs2', NULL, NULL, '2021-04-21 20:20:00', '2021-04-21 20:20:00', NULL),
(4, 'Bulah Casper', 'Cartwright', '6708210', '66105 Isai Rapids\nSwiftland, MT 15316', '754', 'price.israel@example.org', '0', '2021-04-21 20:20:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'ugW358ujoo', NULL, NULL, '2021-04-21 20:20:00', '2021-04-21 20:20:00', NULL),
(5, 'Savannah Bauch', 'Tromp', '832107', '313 Raoul Flat\nLake Chadville, CA 46847-9841', '827420', 'carolyn.hermiston@example.net', '0', '2021-04-21 20:20:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'J7S0z93IAa', NULL, NULL, '2021-04-21 20:20:00', '2021-04-21 20:20:00', NULL),
(6, 'Estel Will', 'Wisoky', '534', '1349 Russel Manor Apt. 575\nWest Jennyfer, NM 29463-2572', '131299203', 'novella52@example.org', '0', '2021-04-21 20:20:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'zWozlExCvr', NULL, NULL, '2021-04-21 20:20:00', '2021-04-21 20:20:00', NULL),
(7, 'Cobrador 62', 'Prohaska', '297448', '4999 Korey Junctions Apt. 665\nPort Natasha, AZ 83234-2437', '29542', 'msporer@example.net', '1', '2021-04-21 20:20:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'jIjB7C84ecvEsoI2W41rnqxFMgxWG8tyizXyIfGhVXZqzikvHr4G7NTGkhfX', NULL, NULL, '2021-04-21 20:20:02', '2021-04-21 20:20:02', NULL),
(8, 'Cobrador 62', 'Raynor', '44569534', '34335 Clarabelle Fork\nNorth Sigmundberg, MS 41197-5048', '9', 'ally96@example.net', '1', '2021-04-21 20:20:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'sZadizCtSR', NULL, NULL, '2021-04-21 20:20:03', '2021-04-21 20:20:03', NULL),
(9, 'Cobrador 62', 'Roberts', '10', '947 Zulauf Hollow\nNew Devenport, GA 66787-5029', '53246258', 'eleanore30@example.net', '1', '2021-04-21 20:20:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'akTSMy4QZn', NULL, NULL, '2021-04-21 20:20:03', '2021-04-21 20:20:03', NULL),
(10, 'Cobrador 62', 'Hirthe', '844', '89955 Wilderman Divide Apt. 705\nLowehaven, SD 16034-7206', '84', 'pstoltenberg@example.net', '1', '2021-04-21 20:20:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '39AWicl1TS', NULL, NULL, '2021-04-21 20:20:03', '2021-04-21 20:20:03', NULL),
(11, 'Cobrador 62', 'Goldner', '3', '197 Harvey Island\nPort Aylaport, SD 85721-1885', '766311724', 'gutmann.elyssa@example.net', '1', '2021-04-21 20:20:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'ga7BI1UbCR', NULL, NULL, '2021-04-21 20:20:04', '2021-04-21 20:20:04', NULL),
(12, 'cliente', 'cliente', 'cliente', 'cliente', 'cliente', 'cliente@gmail.com', '0', NULL, '$2y$10$8qn1sCrya6sc947pNxfVGeMUuNm6JzAeRzVSWsrdgtA4TyyiAUjLW', NULL, NULL, NULL, NULL, NULL, '2021-04-21 20:36:09', '2021-04-21 20:36:09', NULL),
(13, 'cobraor2', 'cobraor2', 'cobraor2', 'cobraor2', 'cobraor2', 'cobraor2@gmail.com', '1', NULL, '$2y$10$0BK88Kq.gniA5KQpay29/.P7mnqvfCK71RQxGVUSUQ4/tC014xMqO', NULL, NULL, NULL, NULL, NULL, '2021-04-21 20:36:33', '2021-04-21 20:36:33', NULL),
(14, 'Cobrador', 'Cobrador', 'Cobrador', 'a', 'Cobrador', 'Cobrador@sc.sf', '1', NULL, '$2y$10$SqxXf5PwTlKtxOZjdSZN9.8lBFNBbGuXVu4XSDkpfR13cOenFpgIe', NULL, NULL, NULL, NULL, NULL, '2021-04-21 20:39:26', '2021-04-21 20:39:26', NULL),
(15, 'CobradorCobrador', 'Cobrador', 'Cobradorscs', 'Cobrador', 'Cobrador', 'Cobrador@sdf.sdf', '1', NULL, '$2y$10$5kJ6EQE.mr8qxckj4VtGG.F.TZ1nV4omE0TbO7aEoSf63Jt3.3lCS', NULL, NULL, NULL, NULL, NULL, '2021-04-21 20:42:02', '2021-04-21 20:42:02', NULL),
(16, 'Cobrador3', 'Cobrador3', 'Cobrador3', 'Cobrador3', 'Cobrador3', 'Cobrador3@sdf.sdf', '1', NULL, '$2y$10$wnJSk0dKCtGhZyez/dyMf.WhLoO7G764/DOBcIA9ZfA6O1RZEMw6m', NULL, NULL, NULL, NULL, NULL, '2021-04-21 20:43:10', '2021-04-21 20:43:10', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `zones`
--

INSERT INTO `zones` (`id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '64', 'ZONA 64', '2021-04-21 20:19:56', '2021-04-21 20:19:56', NULL),
(2, '25', 'ZONA 25', '2021-04-21 20:19:56', '2021-04-21 20:19:56', NULL),
(3, '65', 'ZONA 65', '2021-04-21 20:19:56', '2021-04-21 20:19:56', NULL),
(4, '36', 'ZONA 36', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL),
(5, '59', 'ZONA 59', '2021-04-21 20:19:57', '2021-04-21 20:19:57', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_foreign` (`user_id`),
  ADD KEY `clients_node_id_foreign` (`node_id`);

--
-- Indices de la tabla `client_product`
--
ALTER TABLE `client_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_product_client_id_foreign` (`client_id`),
  ADD KEY `client_product_product_id_foreign` (`product_id`),
  ADD KEY `client_product_node_id_foreign` (`node_id`);

--
-- Indices de la tabla `collector_zone`
--
ALTER TABLE `collector_zone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collector_zone_collector_id_foreign` (`collector_id`),
  ADD KEY `collector_zone_zone_id_foreign` (`zone_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_product_id_foreign` (`client_product_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `nodes`
--
ALTER TABLE `nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nodes_zone_id_foreign` (`zone_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_processed_by_foreign` (`processed_by`),
  ADD KEY `payments_invoice_id_foreign` (`invoice_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `client_product`
--
ALTER TABLE `client_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `collector_zone`
--
ALTER TABLE `collector_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `nodes`
--
ALTER TABLE `nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `client_product`
--
ALTER TABLE `client_product`
  ADD CONSTRAINT `client_product_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_product_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `client_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `collector_zone`
--
ALTER TABLE `collector_zone`
  ADD CONSTRAINT `collector_zone_collector_id_foreign` FOREIGN KEY (`collector_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collector_zone_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_product_id_foreign` FOREIGN KEY (`client_product_id`) REFERENCES `client_product` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `nodes`
--
ALTER TABLE `nodes`
  ADD CONSTRAINT `nodes_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `payments_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
