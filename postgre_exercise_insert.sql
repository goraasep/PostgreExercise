-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               PostgreSQL 17.0 on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


INSERT INTO "role" ("id", "role_type", "created_at", "updated_at", "deleted_at") VALUES
	(1, 'buyer', '2024-10-29 13:12:11.93415', '2024-10-29 13:12:11.93415', NULL),
	(2, 'seller', '2024-10-29 13:12:11.938376', '2024-10-29 13:12:11.938376', NULL);

INSERT INTO "shipping_method" ("id", "name", "price", "created_at", "updated_at", "deleted_at") VALUES
	(1, 'JNE', 10000, '2024-10-29 13:13:29.69643', '2024-10-29 13:13:29.69643', NULL),
	(2, 'J&T', 8000, '2024-10-29 13:13:29.701988', '2024-10-29 13:13:29.701988', NULL);

INSERT INTO "user" ("user_name", "role_id", "created_at", "updated_at", "deleted_at", "id") VALUES
	('gora', 1, '2024-10-29 13:12:32.81688', '2024-10-29 13:12:32.81688', NULL, 1),
	('asep', 2, '2024-10-29 13:12:32.823176', '2024-10-29 13:12:32.823176', NULL, 2);

INSERT INTO "address" ("user_id", "name", "details", "created_at", "updated_at", "deleted_at", "id") VALUES
	(1, 'Kosan Purwadhika', 'Jl. ABCD, Kota Batam, 12144', '2024-10-29 13:20:29.043918', '2024-10-29 13:20:29.043918', NULL, 1),
	(2, 'Kantor Purwadhika', 'Jl. VWXYZ, Kota Batam, 12144', '2024-10-29 13:20:29.049715', '2024-10-29 13:20:29.049715', NULL, 2);

INSERT INTO "store" ("id", "name", "user_id", "created_at", "updated_at", "deleted_at") VALUES
	(1, 'Asep''s Store', 2, '2024-10-29 13:13:58.411679', '2024-10-29 13:13:58.411679', NULL);

INSERT INTO "product" ("id", "store_id", "name", "quantity", "price", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'Kacang', 100, 1000, '2024-10-29 13:15:16.622988', '2024-10-29 13:15:16.622988', NULL),
	(2, 1, 'Tomat', 20, 5000, '2024-10-29 13:15:16.628151', '2024-10-29 13:15:16.628151', NULL),
	(3, 1, 'Apel', 10, 11000, '2024-10-29 13:15:16.631221', '2024-10-29 13:15:16.631221', NULL);

INSERT INTO "cart" ("id", "user_id", "total_price", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 6000, '2024-10-29 13:18:31.789119', '2024-10-29 13:18:31.789119', NULL);

INSERT INTO "cart_item" ("id", "store_id", "cart_id", "product_id", "quantity", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 1, 1, 1, '2024-10-29 13:19:17.396269', '2024-10-29 13:19:17.396269', NULL),
	(2, 1, 1, 2, 1, '2024-10-29 13:19:17.405033', '2024-10-29 13:19:17.405033', NULL);

INSERT INTO "invoice" ("id", "user_id", "shipping_method_id", "cart_id", "invoice_number", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 1, 1, 'ABCDEFG/1234/5678', '2024-10-29 13:21:13.096854', '2024-10-29 13:21:13.096854', NULL);

INSERT INTO "payment_method" ("id", "invoice_id", "name", "amount", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'Gopay', 5000, '2024-10-29 13:21:42.728199', '2024-10-29 13:21:42.728199', NULL),
	(2, 1, 'VISA', 1000, '2024-10-29 13:21:42.736101', '2024-10-29 13:21:42.736101', NULL);
