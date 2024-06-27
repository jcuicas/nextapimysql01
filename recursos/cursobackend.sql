-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-06-2024 a las 23:43:27
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursobackend`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `idestatus`, `category`) VALUES
(1, 1, 'beauty'),
(2, 1, 'fragrances'),
(3, 1, 'furniture'),
(4, 1, 'groceries'),
(5, 1, 'home-decoration'),
(6, 1, 'kitchen-accessories'),
(7, 1, 'laptops'),
(8, 1, 'mens-shirts'),
(9, 1, 'mens-shoes'),
(10, 1, 'mens-watches'),
(11, 1, 'mobile-accessories'),
(12, 1, 'motorcycle'),
(13, 1, 'skin-care'),
(14, 1, 'smartphones'),
(15, 1, 'sports-accessories'),
(16, 1, 'sunglasses'),
(17, 1, 'tablets'),
(18, 1, 'tops'),
(19, 1, 'vehicle'),
(20, 1, 'womens-bags'),
(21, 1, 'womens-dresses'),
(22, 1, 'womens-jewellery'),
(23, 1, 'womens-shoes'),
(24, 1, 'womens-watches');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `idestatus`, `nombre`, `correo`, `clave`) VALUES
(1, 1, 'Cliente 1', 'cliente1@gmail.com', '0102030405'),
(2, 1, 'Cliente 2', 'cliente2@gmail.com', '4521');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `id` int NOT NULL,
  `idpedido` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`id`, `idpedido`, `idproducto`, `cantidad`, `precio`) VALUES
(1, 1, 1, 2, 9.99),
(2, 1, 2, 4, 19.99),
(3, 1, 3, 4, 14.99),
(4, 1, 4, 2, 12.99),
(5, 1, 6, 10, 8.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` int NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `estatus`) VALUES
(1, 'Avtivo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `idcliente` int NOT NULL,
  `total` double(12,2) NOT NULL,
  `comentario` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `idestatus`, `idcliente`, `total`, `comentario`, `fecha`) VALUES
(1, 1, 1, 25000.00, 'pedido numero 1', '2024-06-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `idcategoria` int NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `thumbnail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idestatus`, `idcategoria`, `title`, `price`, `stock`, `brand`, `thumbnail`) VALUES
(1, 1, 1, 'Essence Mascara Lash Princess', 12, 35, 'Essence', 'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png'),
(2, 1, 1, 'Eyeshadow Palette with Mirror', 19.99, 44, 'Glamour Beauty', 'https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png'),
(3, 1, 1, 'Powder Canister', 14.99, 59, 'Velvet Touch', 'https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png'),
(4, 1, 1, 'Red Lipstick', 12.99, 68, 'Chic Cosmetics', 'https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/thumbnail.png'),
(5, 1, 1, 'Red Nail Polish', 8.99, 71, 'Nail Couture', 'https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png'),
(6, 1, 2, 'Calvin Klein CK One', 49.99, 17, 'Calvin Klein', 'https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png'),
(7, 1, 2, 'Chanel Coco Noir Eau De', 129.99, 41, 'Chanel', 'https://cdn.dummyjson.com/products/images/fragrances/Chanel%20Coco%20Noir%20Eau%20De/thumbnail.png'),
(8, 1, 2, 'Dior J\'adore', 89.99, 91, 'Dior', 'https://cdn.dummyjson.com/products/images/fragrances/Dior%20J\'adore/thumbnail.png'),
(9, 1, 2, 'Dolce Shine Eau de', 69.99, 3, 'Dolce & Gabbana', 'https://cdn.dummyjson.com/products/images/fragrances/Dolce%20Shine%20Eau%20de/thumbnail.png'),
(10, 1, 2, 'Gucci Bloom Eau de', 79.99, 93, 'Gucci', 'https://cdn.dummyjson.com/products/images/fragrances/Gucci%20Bloom%20Eau%20de/thumbnail.png'),
(11, 1, 3, 'Annibale Colombo Bed', 1899.99, 47, 'Annibale Colombo', 'https://cdn.dummyjson.com/products/images/furniture/Annibale%20Colombo%20Bed/thumbnail.png'),
(12, 1, 3, 'Annibale Colombo Sofa', 2499.99, 16, 'Annibale Colombo', 'https://cdn.dummyjson.com/products/images/furniture/Annibale%20Colombo%20Sofa/thumbnail.png'),
(13, 1, 3, 'Bedside Table African Cherry', 299.99, 16, 'Furniture Co.', 'https://cdn.dummyjson.com/products/images/furniture/Bedside%20Table%20African%20Cherry/thumbnail.png'),
(14, 1, 3, 'Knoll Saarinen Executive Conference Chair', 499.99, 47, 'Knoll', 'https://cdn.dummyjson.com/products/images/furniture/Knoll%20Saarinen%20Executive%20Conference%20Chair/thumbnail.png'),
(15, 1, 3, 'Wooden Bathroom Sink With Mirror', 799.99, 95, 'Bath Trends', 'https://cdn.dummyjson.com/products/images/furniture/Wooden%20Bathroom%20Sink%20With%20Mirror/thumbnail.png'),
(16, 1, 4, 'Apple', 1.99, 9, '', 'https://cdn.dummyjson.com/products/images/groceries/Apple/thumbnail.png'),
(17, 1, 4, 'Beef Steak', 12.99, 96, '', 'https://cdn.dummyjson.com/products/images/groceries/Beef%20Steak/thumbnail.png'),
(18, 1, 4, 'Cat Food', 8.99, 13, '', 'https://cdn.dummyjson.com/products/images/groceries/Cat%20Food/thumbnail.png'),
(19, 1, 4, 'Chicken Meat', 9.99, 69, '', 'https://cdn.dummyjson.com/products/images/groceries/Chicken%20Meat/thumbnail.png'),
(20, 1, 4, 'Cooking Oil', 4.99, 22, '', 'https://cdn.dummyjson.com/products/images/groceries/Cooking%20Oil/thumbnail.png'),
(21, 1, 4, 'Cucumber', 1.49, 22, '', 'https://cdn.dummyjson.com/products/images/groceries/Cucumber/thumbnail.png'),
(22, 1, 4, 'Dog Food', 10.99, 40, '', 'https://cdn.dummyjson.com/products/images/groceries/Dog%20Food/thumbnail.png'),
(23, 1, 4, 'Eggs', 2.99, 10, '', 'https://cdn.dummyjson.com/products/images/groceries/Eggs/thumbnail.png'),
(24, 1, 4, 'Fish Steak', 14.99, 99, '', 'https://cdn.dummyjson.com/products/images/groceries/Fish%20Steak/thumbnail.png'),
(25, 1, 4, 'Green Bell Pepper', 1.29, 89, '', 'https://cdn.dummyjson.com/products/images/groceries/Green%20Bell%20Pepper/thumbnail.png'),
(26, 1, 4, 'Green Chili Pepper', 0.99, 8, '', 'https://cdn.dummyjson.com/products/images/groceries/Green%20Chili%20Pepper/thumbnail.png'),
(27, 1, 4, 'Honey Jar', 6.99, 25, '', 'https://cdn.dummyjson.com/products/images/groceries/Honey%20Jar/thumbnail.png'),
(28, 1, 4, 'Ice Cream', 5.49, 76, '', 'https://cdn.dummyjson.com/products/images/groceries/Ice%20Cream/thumbnail.png'),
(29, 1, 4, 'Juice', 3.99, 99, '', 'https://cdn.dummyjson.com/products/images/groceries/Juice/thumbnail.png'),
(30, 1, 4, 'Kiwi', 2.49, 1, '', 'https://cdn.dummyjson.com/products/images/groceries/Kiwi/thumbnail.png'),
(31, 1, 4, 'Lemon', 0.79, 0, '', 'https://cdn.dummyjson.com/products/images/groceries/Lemon/thumbnail.png'),
(32, 1, 4, 'Milk', 3.49, 57, '', 'https://cdn.dummyjson.com/products/images/groceries/Milk/thumbnail.png'),
(33, 1, 4, 'Mulberry', 4.99, 79, '', 'https://cdn.dummyjson.com/products/images/groceries/Mulberry/thumbnail.png'),
(34, 1, 4, 'Nescafe Coffee', 7.99, 22, '', 'https://cdn.dummyjson.com/products/images/groceries/Nescafe%20Coffee/thumbnail.png'),
(35, 1, 4, 'Potatoes', 2.29, 8, '', 'https://cdn.dummyjson.com/products/images/groceries/Potatoes/thumbnail.png'),
(36, 1, 4, 'Protein Powder', 19.99, 65, '', 'https://cdn.dummyjson.com/products/images/groceries/Protein%20Powder/thumbnail.png'),
(37, 1, 4, 'Red Onions', 1.99, 86, '', 'https://cdn.dummyjson.com/products/images/groceries/Red%20Onions/thumbnail.png'),
(38, 1, 4, 'Rice', 5.99, 49, '', 'https://cdn.dummyjson.com/products/images/groceries/Rice/thumbnail.png'),
(39, 1, 4, 'Soft Drinks', 1.99, 78, '', 'https://cdn.dummyjson.com/products/images/groceries/Soft%20Drinks/thumbnail.png'),
(40, 1, 4, 'Strawberry', 3.99, 9, '', 'https://cdn.dummyjson.com/products/images/groceries/Strawberry/thumbnail.png'),
(41, 1, 4, 'Tissue Paper Box', 2.49, 97, '', 'https://cdn.dummyjson.com/products/images/groceries/Tissue%20Paper%20Box/thumbnail.png'),
(42, 1, 4, 'Water', 0.99, 95, '', 'https://cdn.dummyjson.com/products/images/groceries/Water/thumbnail.png'),
(43, 1, 5, 'Decoration Swing', 59.99, 62, '', 'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png'),
(44, 1, 5, 'Family Tree Photo Frame', 29.99, 34, '', 'https://cdn.dummyjson.com/products/images/home-decoration/Family%20Tree%20Photo%20Frame/thumbnail.png'),
(45, 1, 5, 'House Showpiece Plant', 39.99, 89, '', 'https://cdn.dummyjson.com/products/images/home-decoration/House%20Showpiece%20Plant/thumbnail.png'),
(46, 1, 5, 'Plant Pot', 14.99, 70, '', 'https://cdn.dummyjson.com/products/images/home-decoration/Plant%20Pot/thumbnail.png'),
(47, 1, 5, 'Table Lamp', 49.99, 84, '', 'https://cdn.dummyjson.com/products/images/home-decoration/Table%20Lamp/thumbnail.png'),
(48, 1, 6, 'Bamboo Spatula', 7.99, 0, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Bamboo%20Spatula/thumbnail.png'),
(49, 1, 6, 'Black Aluminium Cup', 5.99, 42, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Aluminium%20Cup/thumbnail.png'),
(50, 1, 6, 'Black Whisk', 9.99, 17, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(51, 1, 6, 'Boxed Blender', 39.99, 81, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Boxed%20Blender/thumbnail.png'),
(52, 1, 6, 'Carbon Steel Wok', 29.99, 2, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Carbon%20Steel%20Wok/thumbnail.png'),
(53, 1, 6, 'Chopping Board', 12.99, 53, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Chopping%20Board/thumbnail.png'),
(54, 1, 6, 'Citrus Squeezer Yellow', 8.99, 59, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Citrus%20Squeezer%20Yellow/thumbnail.png'),
(55, 1, 6, 'Egg Slicer', 6.99, 30, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Egg%20Slicer/thumbnail.png'),
(56, 1, 6, 'Electric Stove', 49.99, 41, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Electric%20Stove/thumbnail.png'),
(57, 1, 6, 'Fine Mesh Strainer', 9.99, 13, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Fine%20Mesh%20Strainer/thumbnail.png'),
(58, 1, 6, 'Fork', 3.99, 10, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Fork/thumbnail.png'),
(59, 1, 6, 'Glass', 4.99, 68, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Glass/thumbnail.png'),
(60, 1, 6, 'Grater Black', 10.99, 80, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Grater%20Black/thumbnail.png'),
(61, 1, 6, 'Hand Blender', 34.99, 8, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Hand%20Blender/thumbnail.png'),
(62, 1, 6, 'Ice Cube Tray', 5.99, 81, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Ice%20Cube%20Tray/thumbnail.png'),
(63, 1, 6, 'Kitchen Sieve', 7.99, 33, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Kitchen%20Sieve/thumbnail.png'),
(64, 1, 6, 'Knife', 14.99, 59, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Knife/thumbnail.png'),
(65, 1, 6, 'Lunch Box', 12.99, 26, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Lunch%20Box/thumbnail.png'),
(66, 1, 6, 'Microwave Oven', 89.99, 27, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Microwave%20Oven/thumbnail.png'),
(67, 1, 6, 'Mug Tree Stand', 15.99, 93, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Mug%20Tree%20Stand/thumbnail.png'),
(68, 1, 6, 'Pan', 24.99, 40, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Pan/thumbnail.png'),
(69, 1, 6, 'Plate', 3.99, 30, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Plate/thumbnail.png'),
(70, 1, 6, 'Red Tongs', 6.99, 15, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Red%20Tongs/thumbnail.png'),
(71, 1, 6, 'Silver Pot With Glass Cap', 39.99, 37, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Silver%20Pot%20With%20Glass%20Cap/thumbnail.png'),
(72, 1, 6, 'Slotted Turner', 8.99, 36, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Slotted%20Turner/thumbnail.png'),
(73, 1, 6, 'Spice Rack', 19.99, 24, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Spice%20Rack/thumbnail.png'),
(74, 1, 6, 'Spoon', 4.99, 51, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Spoon/thumbnail.png'),
(75, 1, 6, 'Tray', 16.99, 48, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Tray/thumbnail.png'),
(76, 1, 6, 'Wooden Rolling Pin', 11.99, 80, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Wooden%20Rolling%20Pin/thumbnail.png'),
(77, 1, 6, 'Yellow Peeler', 5.99, 86, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Yellow%20Peeler/thumbnail.png'),
(78, 1, 7, 'Apple MacBook Pro 14 Inch Space Grey', 1999.99, 39, 'Apple', 'https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/thumbnail.png'),
(79, 1, 7, 'Asus Zenbook Pro Dual Screen Laptop', 1799.99, 38, 'Asus', 'https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/thumbnail.png'),
(80, 1, 7, 'Huawei Matebook X Pro', 1399.99, 34, 'Huawei', 'https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/thumbnail.png'),
(81, 1, 7, 'Lenovo Yoga 920', 1099.99, 71, 'Lenovo', 'https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/thumbnail.png'),
(82, 1, 7, 'New DELL XPS 13 9300 Laptop', 1499.99, 18, 'Dell', 'https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/thumbnail.png'),
(83, 1, 8, 'Blue & Black Check Shirt', 29.99, 44, 'Fashion Trends', 'https://cdn.dummyjson.com/products/images/mens-shirts/Blue%20&%20Black%20Check%20Shirt/thumbnail.png'),
(84, 1, 8, 'Gigabyte Aorus Men Tshirt', 24.99, 64, 'Gigabyte', 'https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/thumbnail.png'),
(85, 1, 8, 'Man Plaid Shirt', 34.99, 65, 'Classic Wear', 'https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/thumbnail.png'),
(86, 1, 8, 'Man Short Sleeve Shirt', 19.99, 20, 'Casual Comfort', 'https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/thumbnail.png'),
(87, 1, 8, 'Men Check Shirt', 27.99, 69, 'Urban Chic', 'https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/thumbnail.png'),
(88, 1, 9, 'Nike Air Jordan 1 Red And Black', 149.99, 15, 'Nike', 'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/thumbnail.png'),
(89, 1, 9, 'Nike Baseball Cleats', 79.99, 14, 'Nike', 'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/thumbnail.png'),
(90, 1, 9, 'Puma Future Rider Trainers', 89.99, 10, 'Puma', 'https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/thumbnail.png'),
(91, 1, 9, 'Sports Sneakers Off White & Red', 119.99, 73, 'Off White', 'https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/thumbnail.png'),
(92, 1, 9, 'Sports Sneakers Off White Red', 109.99, 75, 'Off White', 'https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/thumbnail.png'),
(93, 1, 10, 'Brown Leather Belt Watch', 89.99, 69, 'Fashion Timepieces', 'https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/thumbnail.png'),
(94, 1, 10, 'Longines Master Collection', 1499.99, 65, 'Longines', 'https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/thumbnail.png'),
(95, 1, 10, 'Rolex Cellini Date Black Dial', 8999.99, 84, 'Rolex', 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/thumbnail.png'),
(96, 1, 10, 'Rolex Cellini Moonphase', 12999.99, 33, 'Rolex', 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/thumbnail.png'),
(97, 1, 10, 'Rolex Datejust', 10999.99, 11, 'Rolex', 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/thumbnail.png'),
(98, 1, 10, 'Rolex Submariner Watch', 13999.99, 35, 'Rolex', 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/thumbnail.png'),
(99, 1, 11, 'Amazon Echo Plus', 99.99, 50, 'Amazon', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Amazon%20Echo%20Plus/thumbnail.png'),
(100, 1, 11, 'Apple Airpods', 129.99, 93, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/thumbnail.png'),
(101, 1, 11, 'Apple AirPods Max Silver', 549.99, 7, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/thumbnail.png'),
(102, 1, 11, 'Apple Airpower Wireless Charger', 79.99, 78, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpower%20Wireless%20Charger/thumbnail.png'),
(103, 1, 11, 'Apple HomePod Mini Cosmic Grey', 99.99, 65, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20HomePod%20Mini%20Cosmic%20Grey/thumbnail.png'),
(104, 1, 11, 'Apple iPhone Charger', 19.99, 4, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20iPhone%20Charger/thumbnail.png'),
(105, 1, 11, 'Apple MagSafe Battery Pack', 99.99, 80, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20MagSafe%20Battery%20Pack/thumbnail.png'),
(106, 1, 11, 'Apple Watch Series 4 Gold', 349.99, 68, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/thumbnail.png'),
(107, 1, 11, 'Beats Flex Wireless Earphones', 49.99, 49, 'Beats', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Beats%20Flex%20Wireless%20Earphones/thumbnail.png'),
(108, 1, 11, 'iPhone 12 Silicone Case with MagSafe Plum', 29.99, 51, 'Apple', 'https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/thumbnail.png'),
(109, 1, 11, 'Monopod', 19.99, 96, 'TechGear', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Monopod/thumbnail.png'),
(110, 1, 11, 'Selfie Lamp with iPhone', 14.99, 89, 'GadgetMaster', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Selfie%20Lamp%20with%20iPhone/thumbnail.png'),
(111, 1, 11, 'Selfie Stick Monopod', 12.99, 33, 'SnapTech', 'https://cdn.dummyjson.com/products/images/mobile-accessories/Selfie%20Stick%20Monopod/thumbnail.png'),
(112, 1, 11, 'TV Studio Camera Pedestal', 499.99, 45, 'ProVision', 'https://cdn.dummyjson.com/products/images/mobile-accessories/TV%20Studio%20Camera%20Pedestal/thumbnail.png'),
(113, 1, 12, 'Generic Motorcycle', 3999.99, 63, 'Generic Motors', 'https://cdn.dummyjson.com/products/images/motorcycle/Generic%20Motorcycle/thumbnail.png'),
(114, 1, 12, 'Kawasaki Z800', 8999.99, 88, 'Kawasaki', 'https://cdn.dummyjson.com/products/images/motorcycle/Kawasaki%20Z800/thumbnail.png'),
(115, 1, 12, 'MotoGP CI.H1', 14999.99, 85, 'MotoGP', 'https://cdn.dummyjson.com/products/images/motorcycle/MotoGP%20CI.H1/thumbnail.png'),
(116, 1, 12, 'Scooter Motorcycle', 2999.99, 11, 'ScootMaster', 'https://cdn.dummyjson.com/products/images/motorcycle/Scooter%20Motorcycle/thumbnail.png'),
(117, 1, 12, 'Sportbike Motorcycle', 7499.99, 12, 'SpeedMaster', 'https://cdn.dummyjson.com/products/images/motorcycle/Sportbike%20Motorcycle/thumbnail.png'),
(118, 1, 13, 'Attitude Super Leaves Hand Soap', 8.99, 98, 'Attitude', 'https://cdn.dummyjson.com/products/images/skin-care/Attitude%20Super%20Leaves%20Hand%20Soap/thumbnail.png'),
(119, 1, 13, 'Olay Ultra Moisture Shea Butter Body Wash', 12.99, 43, 'Olay', 'https://cdn.dummyjson.com/products/images/skin-care/Olay%20Ultra%20Moisture%20Shea%20Butter%20Body%20Wash/thumbnail.png'),
(120, 1, 13, 'Vaseline Men Body and Face Lotion', 9.99, 54, 'Vaseline', 'https://cdn.dummyjson.com/products/images/skin-care/Vaseline%20Men%20Body%20and%20Face%20Lotion/thumbnail.png'),
(121, 1, 14, 'iPhone 5s', 199.99, 65, 'Apple', 'https://cdn.dummyjson.com/products/images/smartphones/iPhone%205s/thumbnail.png'),
(122, 1, 14, 'iPhone 6', 299.99, 99, 'Apple', 'https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/thumbnail.png'),
(123, 1, 14, 'iPhone 13 Pro', 1099.99, 26, 'Apple', 'https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/thumbnail.png'),
(124, 1, 14, 'iPhone X', 899.99, 99, 'Apple', 'https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/thumbnail.png'),
(125, 1, 14, 'Oppo A57', 249.99, 76, 'Oppo', 'https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/thumbnail.png'),
(126, 1, 14, 'Oppo F19 Pro+', 399.99, 92, 'Oppo', 'https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro+/thumbnail.png'),
(127, 1, 14, 'Oppo K1', 299.99, 61, 'Oppo', 'https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/thumbnail.png'),
(128, 1, 14, 'Realme C35', 149.99, 81, 'Realme', 'https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/thumbnail.png'),
(129, 1, 14, 'Realme X', 299.99, 87, 'Realme', 'https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/thumbnail.png'),
(130, 1, 14, 'Realme XT', 349.99, 53, 'Realme', 'https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/thumbnail.png'),
(131, 1, 14, 'Samsung Galaxy S7', 299.99, 55, 'Samsung', 'https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/thumbnail.png'),
(132, 1, 14, 'Samsung Galaxy S8', 499.99, 75, 'Samsung', 'https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/thumbnail.png'),
(133, 1, 14, 'Samsung Galaxy S10', 699.99, 40, 'Samsung', 'https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/thumbnail.png'),
(134, 1, 14, 'Vivo S1', 249.99, 13, 'Vivo', 'https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/thumbnail.png'),
(135, 1, 14, 'Vivo V9', 299.99, 19, 'Vivo', 'https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/thumbnail.png'),
(136, 1, 14, 'Vivo X21', 499.99, 0, 'Vivo', 'https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/thumbnail.png'),
(137, 1, 15, 'American Football', 19.99, 48, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/American%20Football/thumbnail.png'),
(138, 1, 15, 'Baseball Ball', 8.99, 71, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Ball/thumbnail.png'),
(139, 1, 15, 'Baseball Glove', 24.99, 43, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/thumbnail.png'),
(140, 1, 15, 'Basketball', 14.99, 100, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Basketball/thumbnail.png'),
(141, 1, 15, 'Basketball Rim', 39.99, 57, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Basketball%20Rim/thumbnail.png'),
(142, 1, 15, 'Cricket Ball', 12.99, 42, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Ball/thumbnail.png'),
(143, 1, 15, 'Cricket Bat', 29.99, 3, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Bat/thumbnail.png'),
(144, 1, 15, 'Cricket Helmet', 44.99, 31, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/thumbnail.png'),
(145, 1, 15, 'Cricket Wicket', 29.99, 31, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Wicket/thumbnail.png'),
(146, 1, 15, 'Feather Shuttlecock', 5.99, 17, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Feather%20Shuttlecock/thumbnail.png'),
(147, 1, 15, 'Football', 17.99, 66, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Football/thumbnail.png'),
(148, 1, 15, 'Golf Ball', 9.99, 45, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Golf%20Ball/thumbnail.png'),
(149, 1, 15, 'Iron Golf', 49.99, 7, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Iron%20Golf/thumbnail.png'),
(150, 1, 15, 'Metal Baseball Bat', 29.99, 37, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Metal%20Baseball%20Bat/thumbnail.png'),
(151, 1, 15, 'Tennis Ball', 6.99, 99, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Tennis%20Ball/thumbnail.png'),
(152, 1, 15, 'Tennis Racket', 49.99, 86, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Tennis%20Racket/thumbnail.png'),
(153, 1, 15, 'Volleyball', 11.99, 0, '', 'https://cdn.dummyjson.com/products/images/sports-accessories/Volleyball/thumbnail.png'),
(154, 1, 16, 'Black Sun Glasses', 29.99, 100, 'Fashion Shades', 'https://cdn.dummyjson.com/products/images/sunglasses/Black%20Sun%20Glasses/thumbnail.png'),
(155, 1, 16, 'Classic Sun Glasses', 24.99, 100, 'Fashion Shades', 'https://cdn.dummyjson.com/products/images/sunglasses/Classic%20Sun%20Glasses/thumbnail.png'),
(156, 1, 16, 'Green and Black Glasses', 34.99, 74, 'Fashion Shades', 'https://cdn.dummyjson.com/products/images/sunglasses/Green%20and%20Black%20Glasses/thumbnail.png'),
(157, 1, 16, 'Party Glasses', 19.99, 35, 'Fashion Fun', 'https://cdn.dummyjson.com/products/images/sunglasses/Party%20Glasses/thumbnail.png'),
(158, 1, 16, 'Sunglasses', 22.99, 59, 'Fashion Shades', 'https://cdn.dummyjson.com/products/images/sunglasses/Sunglasses/thumbnail.png'),
(159, 1, 17, 'iPad Mini 2021 Starlight', 499.99, 32, 'Apple', 'https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/thumbnail.png'),
(160, 1, 17, 'Samsung Galaxy Tab S8 Plus Grey', 599.99, 76, 'Samsung', 'https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/thumbnail.png'),
(161, 1, 17, 'Samsung Galaxy Tab White', 349.99, 0, 'Samsung', 'https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/thumbnail.png'),
(162, 1, 18, 'Blue Frock', 29.99, 37, '', 'https://cdn.dummyjson.com/products/images/tops/Blue%20Frock/thumbnail.png'),
(163, 1, 18, 'Girl Summer Dress', 19.99, 20, '', 'https://cdn.dummyjson.com/products/images/tops/Girl%20Summer%20Dress/thumbnail.png'),
(164, 1, 18, 'Gray Dress', 34.99, 81, '', 'https://cdn.dummyjson.com/products/images/tops/Gray%20Dress/thumbnail.png'),
(165, 1, 18, 'Short Frock', 24.99, 19, '', 'https://cdn.dummyjson.com/products/images/tops/Short%20Frock/thumbnail.png'),
(166, 1, 18, 'Tartan Dress', 39.99, 100, '', 'https://cdn.dummyjson.com/products/images/tops/Tartan%20Dress/thumbnail.png'),
(167, 1, 19, '300 Touring', 28999.99, 53, 'Chrysler', 'https://cdn.dummyjson.com/products/images/vehicle/300%20Touring/thumbnail.png'),
(168, 1, 19, 'Charger SXT RWD', 32999.99, 85, 'Dodge', 'https://cdn.dummyjson.com/products/images/vehicle/Charger%20SXT%20RWD/thumbnail.png'),
(169, 1, 19, 'Dodge Hornet GT Plus', 24999.99, 81, 'Dodge', 'https://cdn.dummyjson.com/products/images/vehicle/Dodge%20Hornet%20GT%20Plus/thumbnail.png'),
(170, 1, 19, 'Durango SXT RWD', 36999.99, 0, 'Dodge', 'https://cdn.dummyjson.com/products/images/vehicle/Durango%20SXT%20RWD/thumbnail.png'),
(171, 1, 19, 'Pacifica Touring', 31999.99, 22, 'Chrysler', 'https://cdn.dummyjson.com/products/images/vehicle/Pacifica%20Touring/thumbnail.png'),
(172, 1, 20, 'Blue Women\'s Handbag', 49.99, 76, 'Fashionista', 'https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women\'s%20Handbag/thumbnail.png'),
(173, 1, 20, 'Heshe Women\'s Leather Bag', 129.99, 9, 'Heshe', 'https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women\'s%20Leather%20Bag/thumbnail.png'),
(174, 1, 20, 'Prada Women Bag', 599.99, 43, 'Prada', 'https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/thumbnail.png'),
(175, 1, 20, 'White Faux Leather Backpack', 39.99, 89, 'Urban Chic', 'https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/thumbnail.png'),
(176, 1, 20, 'Women Handbag Black', 59.99, 24, 'Elegance Collection', 'https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/thumbnail.png'),
(177, 1, 21, 'Black Women\'s Gown', 129.99, 59, '', 'https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women\'s%20Gown/thumbnail.png'),
(178, 1, 21, 'Corset Leather With Skirt', 89.99, 59, '', 'https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/thumbnail.png'),
(179, 1, 21, 'Corset With Black Skirt', 79.99, 67, '', 'https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/thumbnail.png'),
(180, 1, 21, 'Dress Pea', 49.99, 29, '', 'https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/thumbnail.png'),
(181, 1, 21, 'Marni Red & Black Suit', 179.99, 15, '', 'https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/thumbnail.png'),
(182, 1, 22, 'Green Crystal Earring', 29.99, 1, '', 'https://cdn.dummyjson.com/products/images/womens-jewellery/Green%20Crystal%20Earring/thumbnail.png'),
(183, 1, 22, 'Green Oval Earring', 24.99, 89, '', 'https://cdn.dummyjson.com/products/images/womens-jewellery/Green%20Oval%20Earring/thumbnail.png'),
(184, 1, 22, 'Tropical Earring', 19.99, 76, '', 'https://cdn.dummyjson.com/products/images/womens-jewellery/Tropical%20Earring/thumbnail.png'),
(185, 1, 23, 'Black & Brown Slipper', 19.99, 80, 'Comfort Trends', 'https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/thumbnail.png'),
(186, 1, 23, 'Calvin Klein Heel Shoes', 79.99, 99, 'Calvin Klein', 'https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/thumbnail.png'),
(187, 1, 23, 'Golden Shoes Woman', 49.99, 99, 'Fashion Diva', 'https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/thumbnail.png'),
(188, 1, 23, 'Pampi Shoes', 29.99, 36, 'Pampi', 'https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/thumbnail.png'),
(189, 1, 23, 'Red Shoes', 34.99, 53, 'Fashion Express', 'https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/thumbnail.png'),
(190, 1, 24, 'IWC Ingenieur Automatic Steel', 4999.99, 85, 'IWC', 'https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/thumbnail.png'),
(191, 1, 24, 'Rolex Cellini Moonphase', 15999.99, 66, 'Rolex', 'https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/thumbnail.png'),
(192, 1, 24, 'Rolex Datejust Women', 10999.99, 31, 'Rolex', 'https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/thumbnail.png'),
(193, 1, 24, 'Watch Gold for Women', 799.99, 94, 'Fashion Gold', 'https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/thumbnail.png'),
(194, 1, 24, 'Women\'s Wrist Watch', 129.99, 55, 'Fashion Co.', 'https://cdn.dummyjson.com/products/images/womens-watches/Women\'s%20Wrist%20Watch/thumbnail.png'),
(196, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(197, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(198, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(199, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(201, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(202, 1, 6, 'Black Whisk', 9.99, 50, '', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(203, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(204, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(205, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),
(206, 1, 6, 'Black Whisk', 9.99, 17, 'Whisk', 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'moderator'),
(3, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `idrole` int NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `maidenName` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `bloodGroup` varchar(25) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `eyeColor` varchar(25) DEFAULT NULL,
  `ip` varchar(512) DEFAULT NULL,
  `university` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `idestatus`, `idrole`, `firstName`, `lastName`, `maidenName`, `age`, `gender`, `email`, `phone`, `username`, `password`, `birthDate`, `image`, `bloodGroup`, `height`, `weight`, `eyeColor`, `ip`, `university`) VALUES
(1, 1, 1, 'Emily', 'Johnson', 'Smith', 28, 'female', 'emily.johnson@x.dummyjson.com', '+81 965-431-3024', 'emilys', 'emilyspass', '1996-05-30', 'https://dummyjson.com/icon/emilys/128', 'O-', 193.24, 63.16, 'Green', '42.48.100.32', 'University of Wisconsin--Madison'),
(2, 1, 1, 'Michael', 'Williams', '', 35, 'male', 'michael.williams@x.dummyjson.com', '+49 258-627-6644', 'michaelw', 'michaelwpass', '1989-08-10', 'https://dummyjson.com/icon/michaelw/128', 'B+', 186.22, 76.32, 'Red', '12.13.116.142', 'Ohio State University'),
(3, 1, 1, 'Sophia', 'Brown', '', 42, 'female', 'sophia.brown@x.dummyjson.com', '+81 210-652-2785', 'sophiab', 'sophiabpass', '1982-11-06', 'https://dummyjson.com/icon/sophiab/128', 'O-', 177.72, 52.6, 'Hazel', '214.225.51.195', 'Pepperdine University'),
(4, 1, 1, 'James', 'Davis', '', 45, 'male', 'james.davis@x.dummyjson.com', '+49 614-958-9364', 'jamesd', 'jamesdpass', '1979-05-04', 'https://dummyjson.com/icon/jamesd/128', 'AB+', 193.31, 62.1, 'Amber', '101.118.131.66', 'University of Southern California'),
(5, 1, 1, 'Emma', 'Miller', 'Johnson', 30, 'female', 'emma.miller@x.dummyjson.com', '+91 759-776-1614', 'emmaj', 'emmajpass', '1994-06-13', 'https://dummyjson.com/icon/emmaj/128', 'AB-', 192.8, 63.62, 'Green', '224.126.22.183', 'Northeastern University'),
(6, 1, 2, 'Olivia', 'Wilson', '', 22, 'female', 'olivia.wilson@x.dummyjson.com', '+91 607-295-6448', 'oliviaw', 'oliviawpass', '2002-04-20', 'https://dummyjson.com/icon/oliviaw/128', 'B+', 182.61, 58, 'Hazel', '249.178.112.207', 'University of North Carolina--Chapel Hill'),
(7, 1, 2, 'Alexander', 'Jones', '', 38, 'male', 'alexander.jones@x.dummyjson.com', '+61 260-824-4986', 'alexanderj', 'alexanderjpass', '1986-10-20', 'https://dummyjson.com/icon/alexanderj/128', 'AB-', 153.89, 77.42, 'Blue', '166.204.84.32', 'University of Illinois--Urbana-Champaign'),
(8, 1, 2, 'Ava', 'Taylor', '', 27, 'female', 'ava.taylor@x.dummyjson.com', '+1 458-853-7877', 'avat', 'avatpass', '1997-08-25', 'https://dummyjson.com/icon/avat/128', 'AB-', 168.47, 57.08, 'Hazel', '150.73.197.233', 'University of Wisconsin--Madison'),
(9, 1, 2, 'Ethan', 'Martinez', '', 33, 'male', 'ethan.martinez@x.dummyjson.com', '+92 933-608-5081', 'ethanm', 'ethanmpass', '1991-02-12', 'https://dummyjson.com/icon/ethanm/128', 'AB+', 159.19, 68.81, 'Hazel', '63.191.127.71', 'Syracuse University'),
(10, 1, 2, 'Isabella', 'Anderson', 'Davis', 31, 'female', 'isabella.anderson@x.dummyjson.com', '+49 770-658-4885', 'isabellad', 'isabelladpass', '1993-06-10', 'https://dummyjson.com/icon/isabellad/128', 'A-', 150.56, 50.1, 'Brown', '114.9.114.205', 'California Institute of Technology (Caltech)'),
(11, 1, 2, 'Liam', 'Garcia', '', 29, 'male', 'liam.garcia@x.dummyjson.com', '+92 870-217-6201', 'liamg', 'liamgpass', '1995-06-06', 'https://dummyjson.com/icon/liamg/128', 'AB-', 162.32, 93.16, 'Violet', '56.201.85.9', 'Ohio State University'),
(12, 1, 2, 'Mia', 'Rodriguez', '', 24, 'female', 'mia.rodriguez@x.dummyjson.com', '+49 989-461-8403', 'miar', 'miarpass', '2000-08-04', 'https://dummyjson.com/icon/miar/128', 'O-', 188.08, 56.03, 'Blue', '11.72.253.90', 'William & Mary'),
(13, 1, 2, 'Noah', 'Hernandez', '', 40, 'male', 'noah.hernandez@x.dummyjson.com', '+49 393-605-6968', 'noahh', 'noahhpass', '1984-06-05', 'https://dummyjson.com/icon/noahh/128', 'AB+', 188.62, 69.49, 'Brown', '169.154.126.57', 'New York University (NYU)'),
(14, 1, 2, 'Charlotte', 'Lopez', 'Martinez', 36, 'female', 'charlotte.lopez@x.dummyjson.com', '+44 373-953-5028', 'charlottem', 'charlottempass', '1988-06-08', 'https://dummyjson.com/icon/charlottem/128', 'AB-', 178.92, 82.46, 'Brown', '119.103.95.60', 'Northeastern University'),
(15, 1, 2, 'William', 'Gonzalez', '', 32, 'male', 'william.gonzalez@x.dummyjson.com', '+81 905-252-7319', 'williamg', 'williamgpass', '1992-03-27', 'https://dummyjson.com/icon/williamg/128', 'B-', 173.21, 82.41, 'Hazel', '250.2.241.204', 'Tufts University'),
(16, 1, 3, 'Avery', 'Perez', '', 25, 'female', 'avery.perez@x.dummyjson.com', '+61 731-431-3457', 'averyp', 'averyppass', '1999-03-10', 'https://dummyjson.com/icon/averyp/128', 'O-', 172.68, 93.9, 'Brown', '131.217.4.214', 'Harvard University'),
(17, 1, 3, 'Evelyn', 'Sanchez', '', 37, 'female', 'evelyn.sanchez@x.dummyjson.com', '+1 623-880-6871', 'evelyns', 'evelynspass', '1987-10-13', 'https://dummyjson.com/icon/evelyns/128', 'B+', 184.08, 83.15, 'Violet', '87.114.135.146', 'Washington University in St. Louis'),
(18, 1, 3, 'Logan', 'Torres', '', 31, 'male', 'logan.torres@x.dummyjson.com', '+81 507-434-8733', 'logant', 'logantpass', '1993-10-26', 'https://dummyjson.com/icon/logant/128', 'A+', 190.04, 72.43, 'Green', '155.98.15.162', 'University of Illinois--Urbana-Champaign'),
(19, 1, 3, 'Abigail', 'Rivera', '', 28, 'female', 'abigail.rivera@x.dummyjson.com', '+91 228-363-7806', 'abigailr', 'abigailrpass', '1996-10-11', 'https://dummyjson.com/icon/abigailr/128', 'B+', 186.39, 74.61, 'Violet', '19.183.240.94', 'California Institute of Technology (Caltech)'),
(20, 1, 3, 'Jackson', 'Evans', '', 34, 'male', 'jackson.evans@x.dummyjson.com', '+44 468-628-6686', 'jacksone', 'jacksonepass', '1990-11-30', 'https://dummyjson.com/icon/jacksone/128', 'O-', 162.57, 74.37, 'Green', '221.127.144.198', 'Ohio State University'),
(21, 1, 3, 'Madison', 'Collins', '', 26, 'female', 'madison.collins@x.dummyjson.com', '+81 259-957-5711', 'madisonc', 'madisoncpass', '1998-03-07', 'https://dummyjson.com/icon/madisonc/128', 'B-', 189.28, 56.96, 'Red', '85.34.1.204', 'University of Pennsylvania'),
(22, 1, 3, 'Elijah', 'Stewart', '', 33, 'male', 'elijah.stewart@x.dummyjson.com', '+44 468-357-7872', 'elijahs', 'elijahspass', '1991-10-22', 'https://dummyjson.com/icon/elijahs/128', 'A-', 195.33, 81.64, 'Blue', '23.87.135.62', 'Georgetown University'),
(23, 1, 3, 'Chloe', 'Morales', '', 39, 'female', 'chloe.morales@x.dummyjson.com', '+92 468-541-7133', 'chloem', 'chloempass', '1985-04-21', 'https://dummyjson.com/icon/chloem/128', 'O+', 185.07, 63.97, 'Brown', '66.78.20.21', 'Syracuse University'),
(24, 1, 3, 'Mateo', 'Nguyen', '', 30, 'male', 'mateo.nguyen@x.dummyjson.com', '+1 341-597-6694', 'mateon', 'mateonpass', '1994-06-02', 'https://dummyjson.com/icon/mateon/128', 'O+', 174.29, 59.98, 'Red', '192.57.144.7', 'Columbia University'),
(25, 1, 3, 'Harper', 'Kelly', 'Evans', 27, 'female', 'harper.kelly@x.dummyjson.com', '+92 518-863-2863', 'harpere', 'harperepass', '1997-03-03', 'https://dummyjson.com/icon/harpere/128', 'AB-', 184.32, 81.69, 'Amber', '174.111.61.162', 'Boston College'),
(26, 1, 3, 'Evelyn', 'Gonzalez', '', 35, 'female', 'evelyn.gonzalez@x.dummyjson.com', '+61 708-508-4638', 'evelyng', 'evelyngpass', '1989-02-05', 'https://dummyjson.com/icon/evelyng/128', 'O+', 168.94, 58.47, 'Red', '42.52.74.232', 'Washington University in St. Louis'),
(27, 1, 3, 'Daniel', 'Cook', '', 41, 'male', 'daniel.cook@x.dummyjson.com', '+44 254-761-6843', 'danielc', 'danielcpass', '1983-12-25', 'https://dummyjson.com/icon/danielc/128', 'AB+', 186.21, 83.72, 'Brown', '1.61.73.142', 'Columbia University'),
(28, 1, 3, 'Lily', 'Lee', 'Brown', 29, 'female', 'lily.lee@x.dummyjson.com', '+1 808-757-9867', 'lilyb', 'lilybpass', '1995-12-03', 'https://dummyjson.com/icon/lilyb/128', 'AB-', 181.42, 51.49, 'Gray', '67.184.255.96', 'Johns Hopkins University'),
(29, 1, 3, 'Henry', 'Hill', '', 38, 'male', 'henry.hill@x.dummyjson.com', '+1 240-833-4680', 'henryh', 'henryhpass', '1986-08-19', 'https://dummyjson.com/icon/henryh/128', 'O-', 180.25, 95.84, 'Gray', '194.43.55.202', 'University of Illinois--Urbana-Champaign'),
(30, 1, 3, 'Addison', 'Wright', '', 32, 'female', 'addison.wright@x.dummyjson.com', '+1 514-384-3300', 'addisonw', 'addisonwpass', '1992-01-03', 'https://dummyjson.com/icon/addisonw/128', 'B+', 179.32, 76.93, 'Brown', '11.35.69.81', 'Syracuse University'),
(31, 1, 3, 'Gabriel', 'Adams', '', 36, 'male', 'gabriel.adams@x.dummyjson.com', '+91 936-400-4116', 'gabriela', 'gabrielapass', '1988-09-05', 'https://dummyjson.com/icon/gabriela/128', 'B+', 181.72, 79.14, 'Green', '22.129.163.106', 'Massachusetts Institute of Technology (MIT)'),
(32, 1, 3, 'Natalie', 'Harris', '', 28, 'female', 'natalie.harris@x.dummyjson.com', '+49 584-501-9302', 'natalieh', 'nataliehpass', '1996-07-23', 'https://dummyjson.com/icon/natalieh/128', 'AB+', 196.7, 57, 'Green', '15.75.88.81', 'Washington University in St. Louis'),
(33, 1, 3, 'Carter', 'Baker', '', 31, 'male', 'carter.baker@x.dummyjson.com', '+49 787-512-9117', 'carterb', 'carterbpass', '1993-04-19', 'https://dummyjson.com/icon/carterb/128', 'A+', 190.96, 70.78, 'Green', '167.111.147.45', 'Washington University in St. Louis'),
(34, 1, 3, 'Sofia', 'Mitchell', '', 25, 'female', 'sofia.mitchell@x.dummyjson.com', '+92 957-686-6804', 'sofiam', 'sofiampass', '1999-11-18', 'https://dummyjson.com/icon/sofiam/128', 'O-', 186.93, 69.14, 'Red', '214.76.55.140', 'University of North Carolina--Chapel Hill'),
(35, 1, 3, 'Jack', 'Ward', '', 29, 'male', 'jack.ward@x.dummyjson.com', '+91 857-765-4373', 'jackw', 'jackwpass', '1995-09-23', 'https://dummyjson.com/icon/jackw/128', 'B-', 198.13, 56.73, 'Hazel', '131.243.182.227', 'Pepperdine University'),
(36, 1, 3, 'Harper', 'Turner', '', 33, 'female', 'harper.turner@x.dummyjson.com', '+49 980-340-5333', 'harpert', 'harpertpass', '1991-01-14', 'https://dummyjson.com/icon/harpert/128', 'A+', 191.03, 70.18, 'Gray', '102.200.5.180', 'Boston University'),
(37, 1, 3, 'Mason', 'Parker', '', 34, 'male', 'mason.parker@x.dummyjson.com', '+61 837-389-4095', 'masonp', 'masonppass', '1990-04-20', 'https://dummyjson.com/icon/masonp/128', 'AB+', 171.56, 76.25, 'Hazel', '97.184.116.71', 'Yale University'),
(38, 1, 3, 'Aria', 'Roberts', '', 26, 'female', 'aria.roberts@x.dummyjson.com', '+61 411-514-5320', 'ariar', 'ariarpass', '1998-03-25', 'https://dummyjson.com/icon/ariar/128', 'A-', 199.62, 88.96, 'Gray', '208.86.10.37', 'Princeton University'),
(39, 1, 3, 'Lucas', 'Gray', '', 30, 'male', 'lucas.gray@x.dummyjson.com', '+44 687-435-7119', 'lucasg', 'lucasgpass', '1994-04-06', 'https://dummyjson.com/icon/lucasg/128', 'O-', 195.26, 88.5, 'Amber', '56.97.195.115', 'Syracuse University'),
(40, 1, 3, 'Ella', 'Adams', '', 27, 'female', 'ella.adams@x.dummyjson.com', '+1 450-865-6061', 'ellaa', 'ellaapass', '1997-06-20', 'https://dummyjson.com/icon/ellaa/128', 'B-', 167.53, 64.19, 'Hazel', '175.172.136.236', 'Northeastern University'),
(41, 1, 3, 'Evan', 'Reed', '', 32, 'male', 'evan.reed@x.dummyjson.com', '+61 932-569-4853', 'evanr', 'evanrpass', '1992-06-16', 'https://dummyjson.com/icon/evanr/128', 'O+', 152.55, 90.4, 'Blue', '6.25.22.101', 'University of California--Irvine'),
(42, 1, 3, 'Avery', 'Carter', '', 28, 'female', 'avery.carter@x.dummyjson.com', '+44 254-655-6112', 'averyc', 'averycpass', '1996-08-21', 'https://dummyjson.com/icon/averyc/128', 'B-', 179.92, 59.37, 'Blue', '187.69.252.251', 'Yale University'),
(43, 1, 3, 'Benjamin', 'Foster', '', 34, 'male', 'benjamin.foster@x.dummyjson.com', '+61 333-911-3476', 'benjaminf', 'benjaminfpass', '1990-11-01', 'https://dummyjson.com/icon/benjaminf/128', 'O+', 164.2, 58.9, 'Gray', '132.29.94.179', 'University of Michigan--Ann Arbor'),
(44, 1, 3, 'Scarlett', 'Wright', '', 26, 'female', 'scarlett.wright@x.dummyjson.com', '+1 599-432-3048', 'scarlettw', 'scarlettwpass', '1998-05-09', 'https://dummyjson.com/icon/scarlettw/128', 'A+', 180.04, 70.75, 'Brown', '243.186.233.187', 'University of Pennsylvania'),
(45, 1, 3, 'Lincoln', 'Kelly', '', 30, 'male', 'lincoln.kelly@x.dummyjson.com', '+49 680-666-9673', 'lincolnk', 'lincolnkpass', '1994-01-12', 'https://dummyjson.com/icon/lincolnk/128', 'A+', 191.01, 73.38, 'Amber', '82.138.239.3', 'Yale University'),
(46, 1, 3, 'Hannah', 'Robinson', '', 29, 'female', 'hannah.robinson@x.dummyjson.com', '+92 556-625-4398', 'hannahr', 'hannahrpass', '1995-02-02', 'https://dummyjson.com/icon/hannahr/128', 'AB+', 150.25, 67.93, 'Brown', '82.201.57.248', 'Harvard University'),
(47, 1, 3, 'Nicholas', 'Bailey', '', 35, 'male', 'nicholas.bailey@x.dummyjson.com', '+49 212-856-4272', 'nicholasb', 'nicholasbpass', '1989-06-14', 'https://dummyjson.com/icon/nicholasb/128', 'A+', 162.29, 50.86, 'Gray', '171.101.211.225', 'Yale University'),
(48, 1, 3, 'Luna', 'Russell', '', 27, 'female', 'luna.russell@x.dummyjson.com', '+91 730-486-3735', 'lunar', 'lunarpass', '1997-06-18', 'https://dummyjson.com/icon/lunar/128', 'O-', 188, 76.37, 'Hazel', '218.176.123.51', 'University of Florida'),
(49, 1, 3, 'Jacob', 'Cooper', '', 31, 'male', 'jacob.cooper@x.dummyjson.com', '+91 322-775-7582', 'jacobc', 'jacobcpass', '1993-12-21', 'https://dummyjson.com/icon/jacobc/128', 'A+', 157.39, 96.32, 'Brown', '145.68.5.38', 'University of California--Los Angeles (UCLA)'),
(50, 1, 3, 'Stella', 'Hughes', '', 33, 'female', 'stella.hughes@x.dummyjson.com', '+92 378-326-3439', 'stellah', 'stellahpass', '1991-11-06', 'https://dummyjson.com/icon/stellah/128', 'A-', 171.2, 81.45, 'Brown', '201.29.33.153', 'University of California--San Diego'),
(51, 1, 3, 'Eli', 'Bennett', '', 29, 'male', 'eli.bennett@x.dummyjson.com', '+1 465-379-7226', 'elib', 'elibpass', '1995-09-17', 'https://dummyjson.com/icon/elib/128', 'B+', 170.61, 91.22, 'Gray', '144.73.131.148', 'Boston University'),
(52, 1, 3, 'Grace', 'Perry', '', 26, 'female', 'grace.perry@x.dummyjson.com', '+49 550-430-8269', 'gracep', 'graceppass', '1998-12-23', 'https://dummyjson.com/icon/gracep/128', 'B-', 193.34, 81.7, 'Gray', '39.127.170.122', 'Boston College'),
(53, 1, 3, 'Lucas', 'Gordon', '', 35, 'male', 'lucas.gordon@x.dummyjson.com', '+81 367-320-4960', 'lucasgx', 'lucasgxpass', '1989-09-11', 'https://dummyjson.com/icon/lucasgx/128', 'B-', 179.73, 72.92, 'Brown', '79.214.245.49', 'Massachusetts Institute of Technology (MIT)'),
(54, 1, 3, 'Ava', 'Harrison', '', 28, 'female', 'ava.harrison@x.dummyjson.com', '+44 926-778-4653', 'avah', 'avahpass', '1996-04-22', 'https://dummyjson.com/icon/avah/128', 'O-', 155.72, 93.47, 'Hazel', '225.40.138.177', 'Harvard University'),
(55, 1, 3, 'Owen', 'Fisher', '', 31, 'male', 'owen.fisher@x.dummyjson.com', '+49 328-635-8057', 'owenf', 'owenfpass', '1993-06-26', 'https://dummyjson.com/icon/owenf/128', 'O-', 167.31, 72.03, 'Gray', '196.196.227.202', 'University of Wisconsin--Madison'),
(56, 1, 3, 'Samantha', 'Howard', '', 30, 'female', 'samantha.howard@x.dummyjson.com', '+91 458-289-9756', 'samanthah', 'samanthahpass', '1994-06-17', 'https://dummyjson.com/icon/samanthah/128', 'O-', 183.61, 81.47, 'Green', '60.137.253.102', 'University of Rochester'),
(57, 1, 3, 'Nathan', 'Dixon', '', 34, 'male', 'nathan.dixon@x.dummyjson.com', '+44 540-488-4436', 'nathand', 'nathandpass', '1990-11-10', 'https://dummyjson.com/icon/nathand/128', 'A+', 166.43, 59.96, 'Brown', '21.193.172.72', 'University of Wisconsin--Madison'),
(58, 1, 3, 'Bella', 'Grant', '', 27, 'female', 'bella.grant@x.dummyjson.com', '+92 896-206-1901', 'bellag', 'bellagpass', '1997-03-15', 'https://dummyjson.com/icon/bellag/128', 'O-', 192.65, 96.46, 'Amber', '123.144.124.157', 'Vanderbilt University'),
(59, 1, 3, 'Ethan', 'Fletcher', '', 33, 'male', 'ethan.fletcher@x.dummyjson.com', '+1 251-564-2643', 'ethanf', 'ethanfpass', '1991-05-01', 'https://dummyjson.com/icon/ethanf/128', 'AB-', 183.99, 83.98, 'Violet', '21.94.6.7', 'Cornell University'),
(60, 1, 3, 'Lillian', 'Simmons', '', 32, 'female', 'lillian.simmons@x.dummyjson.com', '+61 857-625-2029', 'lillians', 'lillianspass', '1992-03-09', 'https://dummyjson.com/icon/lillians/128', 'A+', 173.72, 87.33, 'Gray', '161.193.124.63', 'Boston University'),
(61, 1, 3, 'Mason', 'Pearson', '', 28, 'male', 'mason.pearson@x.dummyjson.com', '+1 394-401-1757', 'masonpx', 'masonpxpass', '1996-05-09', 'https://dummyjson.com/icon/masonpx/128', 'A+', 198.74, 60.14, 'Gray', '167.22.242.229', 'University of Chicago'),
(62, 1, 3, 'Leah', 'Henderson', '', 26, 'female', 'leah.henderson@x.dummyjson.com', '+91 453-220-4258', 'leahh', 'leahhpass', '1998-08-19', 'https://dummyjson.com/icon/leahh/128', 'B-', 153.01, 67.56, 'Brown', '64.196.103.68', 'Wake Forest University'),
(63, 1, 3, 'Logan', 'Lawson', '', 33, 'male', 'logan.lawson@x.dummyjson.com', '+1 750-526-9455', 'loganl', 'loganlpass', '1991-08-05', 'https://dummyjson.com/icon/loganl/128', 'B+', 195.97, 51.89, 'Amber', '152.155.90.41', 'University of Virginia'),
(64, 1, 3, 'Avery', 'Barnes', '', 29, 'female', 'avery.barnes@x.dummyjson.com', '+91 207-801-7417', 'averyb', 'averybpass', '1995-02-05', 'https://dummyjson.com/icon/averyb/128', 'O-', 158.1, 77.81, 'Green', '104.8.31.159', 'Harvard University'),
(65, 1, 3, 'Caleb', 'Perkins', '', 30, 'male', 'caleb.perkins@x.dummyjson.com', '+81 351-413-9369', 'calebp', 'calebppass', '1994-07-28', 'https://dummyjson.com/icon/calebp/128', 'AB-', 151.24, 62.54, 'Blue', '243.236.99.67', 'Columbia University'),
(66, 1, 3, 'Aria', 'Ferguson', '', 27, 'female', 'aria.ferguson@x.dummyjson.com', '+44 434-406-8551', 'ariaf', 'ariafpass', '1997-06-01', 'https://dummyjson.com/icon/ariaf/128', 'B+', 161.81, 97.12, 'Blue', '180.24.111.167', 'Cornell University'),
(67, 1, 3, 'Gabriel', 'Hayes', '', 34, 'male', 'gabriel.hayes@x.dummyjson.com', '+61 386-511-8949', 'gabrielh', 'gabrielhpass', '1990-04-08', 'https://dummyjson.com/icon/gabrielh/128', 'A+', 172, 83.77, 'Red', '217.72.9.121', 'University of Notre Dame'),
(68, 1, 3, 'Layla', 'Sullivan', '', 25, 'female', 'layla.sullivan@x.dummyjson.com', '+92 657-388-7474', 'laylas', 'laylaspass', '1999-10-03', 'https://dummyjson.com/icon/laylas/128', 'O-', 187.49, 56.12, 'Gray', '137.194.35.102', 'Washington University in St. Louis'),
(69, 1, 3, 'Christopher', 'West', '', 31, 'male', 'christopher.west@x.dummyjson.com', '+49 968-571-2475', 'christopherw', 'christopherwpass', '1993-11-16', 'https://dummyjson.com/icon/christopherw/128', 'AB+', 173.02, 83.19, 'Red', '38.64.216.221', 'University of North Carolina--Chapel Hill'),
(70, 1, 3, 'Zoe', 'Nicholson', '', 32, 'female', 'zoe.nicholson@x.dummyjson.com', '+49 638-976-6904', 'zoen', 'zoenpass', '1992-12-24', 'https://dummyjson.com/icon/zoen/128', 'A+', 177.34, 56.28, 'Hazel', '162.232.212.187', 'University of Miami'),
(71, 1, 3, 'Nolan', 'Bryant', '', 29, 'male', 'nolan.bryant@x.dummyjson.com', '+44 618-916-5243', 'nolanb', 'nolanbpass', '1995-12-07', 'https://dummyjson.com/icon/nolanb/128', 'B-', 180.65, 94.04, 'Brown', '104.73.181.230', 'Pepperdine University'),
(72, 1, 3, 'Victoria', 'McDonald', '', 27, 'female', 'victoria.mcdonald@x.dummyjson.com', '+91 624-944-2089', 'victoriam', 'victoriampass', '1997-09-16', 'https://dummyjson.com/icon/victoriam/128', 'AB+', 172.55, 97.24, 'Hazel', '173.205.48.240', 'Carnegie Mellon University'),
(73, 1, 3, 'Max', 'Russell', '', 34, 'male', 'max.russell@x.dummyjson.com', '+44 663-850-4302', 'maxr', 'maxrpass', '1990-04-19', 'https://dummyjson.com/icon/maxr/128', 'AB-', 153.37, 76.58, 'Blue', '212.179.168.242', 'Northeastern University'),
(74, 1, 3, 'Penelope', 'Harper', '', 28, 'female', 'penelope.harper@x.dummyjson.com', '+44 907-679-1302', 'penelopeh', 'penelopehpass', '1996-09-14', 'https://dummyjson.com/icon/penelopeh/128', 'A-', 161.76, 93.74, 'Brown', '124.114.248.236', 'University of Notre Dame'),
(75, 1, 3, 'Ryan', 'Graham', '', 31, 'male', 'ryan.graham@x.dummyjson.com', '+92 260-518-7256', 'ryang', 'ryangpass', '1993-10-02', 'https://dummyjson.com/icon/ryang/128', 'AB-', 170.74, 74.67, 'Green', '168.118.81.248', 'Northeastern University'),
(76, 1, 3, 'Madeline', 'Simpson', '', 26, 'female', 'madeline.simpson@x.dummyjson.com', '+44 371-964-4017', 'madelines', 'madelinespass', '1998-12-01', 'https://dummyjson.com/icon/madelines/128', 'AB+', 181.51, 67.7, 'Brown', '29.230.204.12', 'University of Rochester'),
(77, 1, 3, 'Jonathan', 'Pierce', '', 33, 'male', 'jonathan.pierce@x.dummyjson.com', '+61 456-307-5568', 'jonathanp', 'jonathanppass', '1991-09-25', 'https://dummyjson.com/icon/jonathanp/128', 'B+', 151.41, 57.86, 'Violet', '121.29.4.35', 'Emory University'),
(78, 1, 3, 'Eleanor', 'Tyler', '', 30, 'female', 'eleanor.tyler@x.dummyjson.com', '+1 232-621-9938', 'eleanort', 'eleanortpass', '1994-10-26', 'https://dummyjson.com/icon/eleanort/128', 'O-', 195.85, 70.03, 'Green', '54.87.239.213', 'Wake Forest University'),
(79, 1, 3, 'Isaac', 'Lawrence', '', 32, 'male', 'isaac.lawrence@x.dummyjson.com', '+81 693-260-7234', 'isaacl', 'isaaclpass', '1992-01-06', 'https://dummyjson.com/icon/isaacl/128', 'A+', 177.52, 88.08, 'Hazel', '125.69.20.49', 'University of Southern California'),
(80, 1, 3, 'Hazel', 'Gardner', '', 27, 'female', 'hazel.gardner@x.dummyjson.com', '+91 688-478-9459', 'hazelg', 'hazelgpass', '1997-09-18', 'https://dummyjson.com/icon/hazelg/128', 'O+', 166.79, 82.31, 'Red', '6.254.212.106', 'Duke University'),
(81, 1, 3, 'Austin', 'Hudson', '', 29, 'male', 'austin.hudson@x.dummyjson.com', '+81 405-412-4250', 'austinh', 'austinhpass', '1995-05-01', 'https://dummyjson.com/icon/austinh/128', 'A-', 189.77, 66.83, 'Blue', '147.130.253.116', 'University of Michigan--Ann Arbor'),
(82, 1, 3, 'Lillian', 'Bishop', '', 26, 'female', 'lillian.bishop@x.dummyjson.com', '+92 538-589-5885', 'lillianb', 'lillianbpass', '1998-08-02', 'https://dummyjson.com/icon/lillianb/128', 'O-', 192.14, 64.86, 'Hazel', '24.17.79.226', 'Johns Hopkins University'),
(83, 1, 3, 'Dylan', 'Wells', '', 34, 'male', 'dylan.wells@x.dummyjson.com', '+49 659-638-1106', 'dylanw', 'dylanwpass', '1990-11-07', 'https://dummyjson.com/icon/dylanw/128', 'O+', 156.56, 83.29, 'Amber', '254.112.7.252', 'William & Mary'),
(84, 1, 3, 'Aaliyah', 'Hanson', '', 28, 'female', 'aaliyah.hanson@x.dummyjson.com', '+1 275-501-1119', 'aaliyahh', 'aaliyahhpass', '1996-03-20', 'https://dummyjson.com/icon/aaliyahh/128', 'B+', 164.5, 92.03, 'Blue', '51.180.201.49', 'Cornell University'),
(85, 1, 3, 'Cameron', 'Burke', '', 31, 'male', 'cameron.burke@x.dummyjson.com', '+1 976-686-7996', 'cameronb', 'cameronbpass', '1993-02-28', 'https://dummyjson.com/icon/cameronb/128', 'A+', 167.99, 65.63, 'Hazel', '223.11.49.77', 'Boston College'),
(86, 1, 3, 'Nora', 'Mills', '', 26, 'female', 'nora.mills@x.dummyjson.com', '+44 767-262-6860', 'noram', 'norampass', '1998-09-18', 'https://dummyjson.com/icon/noram/128', 'O+', 180.77, 56.11, 'Hazel', '129.48.92.197', 'William & Mary'),
(87, 1, 3, 'Hunter', 'Gordon', '', 33, 'male', 'hunter.gordon@x.dummyjson.com', '+1 986-988-5297', 'hunterg', 'huntergpass', '1991-02-08', 'https://dummyjson.com/icon/hunterg/128', 'A+', 186.43, 83.88, 'Blue', '59.138.90.32', 'Emory University'),
(88, 1, 3, 'Aubrey', 'Wagner', '', 30, 'female', 'aubrey.wagner@x.dummyjson.com', '+81 285-568-5834', 'aubreyw', 'aubreywpass', '1994-04-01', 'https://dummyjson.com/icon/aubreyw/128', 'B+', 168.73, 79.86, 'Red', '203.204.53.60', 'Vanderbilt University'),
(89, 1, 3, 'Brayden', 'Fleming', '', 32, 'male', 'brayden.fleming@x.dummyjson.com', '+1 404-382-1778', 'braydenf', 'braydenfpass', '1992-07-20', 'https://dummyjson.com/icon/braydenf/128', 'B-', 162.36, 92.54, 'Blue', '190.7.180.9', 'University of Pennsylvania'),
(90, 1, 3, 'Scarlett', 'Bowman', '', 27, 'female', 'scarlett.bowman@x.dummyjson.com', '+44 928-549-7517', 'scarlettb', 'scarlettbpass', '1997-02-26', 'https://dummyjson.com/icon/scarlettb/128', 'AB-', 185.22, 92.68, 'Red', '62.62.42.196', 'University of Pennsylvania'),
(91, 1, 3, 'Levi', 'Hicks', '', 29, 'male', 'levi.hicks@x.dummyjson.com', '+92 931-753-3850', 'levih', 'levihpass', '1995-05-19', 'https://dummyjson.com/icon/levih/128', 'A-', 199.06, 95.68, 'Red', '235.155.45.205', 'Ohio State University'),
(92, 1, 3, 'Autumn', 'Gomez', '', 26, 'female', 'autumn.gomez@x.dummyjson.com', '+1 340-455-2897', 'autumng', 'autumngpass', '1998-02-01', 'https://dummyjson.com/icon/autumng/128', 'A-', 182.61, 92.77, 'Amber', '104.233.56.225', 'University of Chicago'),
(93, 1, 3, 'Julian', 'Newton', '', 34, 'male', 'julian.newton@x.dummyjson.com', '+92 865-328-8737', 'juliann', 'juliannpass', '1990-07-02', 'https://dummyjson.com/icon/juliann/128', 'AB-', 162.55, 50.79, 'Amber', '53.230.49.216', 'Duke University'),
(94, 1, 3, 'Ruby', 'Andrews', '', 28, 'female', 'ruby.andrews@x.dummyjson.com', '+1 343-203-7912', 'rubya', 'rubyapass', '1996-07-07', 'https://dummyjson.com/icon/rubya/128', 'AB+', 176.73, 98.77, 'Brown', '37.23.186.32', 'University of Chicago'),
(95, 1, 3, 'Miles', 'Stevenson', '', 31, 'male', 'miles.stevenson@x.dummyjson.com', '+49 708-659-4394', 'miless', 'milesspass', '1993-03-01', 'https://dummyjson.com/icon/miless/128', 'AB+', 151.88, 97.67, 'Gray', '205.69.48.134', 'Wake Forest University'),
(96, 1, 3, 'Aurora', 'Lawson', '', 26, 'female', 'aurora.lawson@x.dummyjson.com', '+92 802-452-4192', 'auroral', 'auroralpass', '1998-06-16', 'https://dummyjson.com/icon/auroral/128', 'O+', 174.28, 88.18, 'Violet', '161.244.58.227', 'Boston University'),
(97, 1, 3, 'Oscar', 'Powers', '', 33, 'male', 'oscar.powers@x.dummyjson.com', '+61 929-572-1408', 'oscarp', 'oscarppass', '1991-09-07', 'https://dummyjson.com/icon/oscarp/128', 'O+', 169.03, 62.55, 'Violet', '216.204.186.222', 'University of Virginia'),
(98, 1, 3, 'Clara', 'Berry', '', 30, 'female', 'clara.berry@x.dummyjson.com', '+1 390-831-5172', 'clarab', 'clarabpass', '1994-02-13', 'https://dummyjson.com/icon/clarab/128', 'O-', 151.55, 90.27, 'Red', '144.153.81.107', 'Boston College'),
(99, 1, 3, 'Gavin', 'Stanley', '', 32, 'male', 'gavin.stanley@x.dummyjson.com', '+44 466-358-6026', 'gavins', 'gavinspass', '1992-03-17', 'https://dummyjson.com/icon/gavins/128', 'O-', 173.37, 92.17, 'Amber', '189.110.169.3', 'University of California--Irvine'),
(100, 1, 3, 'Lila', 'Hudson', '', 27, 'female', 'lila.hudson@x.dummyjson.com', '+91 697-236-1544', 'lilah', 'lilahpass', '1997-09-01', 'https://dummyjson.com/icon/lilah/128', 'AB+', 190.1, 70.03, 'Gray', '96.35.42.117', 'University of Notre Dame'),
(101, 1, 3, 'Alice', 'Smith', 'Johnson', 28, 'female', 'alice.smith@x.dummyjson.com', '+61 611-556-8989', 'alicej', 'alicejpass', '1996-09-08', 'https://dummyjson.com/icon/alicej/128', 'AB-', 171.67, 56.25, 'Red', '223.157.14.11', 'Wake Forest University'),
(102, 1, 3, 'John', 'Doe', '', 35, 'male', 'john.doe@x.dummyjson.com', '+44 242-757-6754', 'johnd', 'johndpass', '1989-02-20', 'https://dummyjson.com/icon/johnd/128', 'B-', 179.44, 93.42, 'Brown', '1.250.48.36', 'Brown University'),
(103, 1, 3, 'Emily', 'Brown', 'Taylor', 42, 'female', 'emily.brown@x.dummyjson.com', '+61 875-999-8871', 'emilyt', 'emilytpass', '1982-12-05', 'https://dummyjson.com/icon/emilyt/128', 'AB-', 181.96, 89.65, 'Blue', '41.156.197.109', 'Georgetown University'),
(104, 1, 3, 'Michael', 'Johnson', '', 24, 'male', 'michael.johnson@x.dummyjson.com', '+92 290-825-4767', 'michaelj', 'michaeljpass', '2000-01-06', 'https://dummyjson.com/icon/michaelj/128', 'A+', 164.38, 97.18, 'Red', '115.37.119.66', 'University of Miami'),
(105, 1, 3, 'Emma', 'Wilson', 'Clark', 31, 'female', 'emma.wilson@x.dummyjson.com', '+49 933-975-3236', 'emmac', 'emmacpass', '1993-06-02', 'https://dummyjson.com/icon/emmac/128', 'O+', 164.59, 97.44, 'Gray', '23.240.162.228', 'Tufts University'),
(106, 1, 3, 'David', 'Martinez', '', 39, 'male', 'david.martinez@x.dummyjson.com', '+1 846-350-3024', 'davidm', 'davidmpass', '1985-06-11', 'https://dummyjson.com/icon/davidm/128', 'O+', 159.35, 88.58, 'Gray', '50.111.18.40', 'University of Texas--Austin'),
(107, 1, 3, 'Olivia', 'Anderson', 'Harris', 29, 'female', 'olivia.anderson@x.dummyjson.com', '+44 952-688-2836', 'oliviah', 'oliviahpass', '1995-06-23', 'https://dummyjson.com/icon/oliviah/128', 'B+', 155.22, 99.18, 'Brown', '209.171.160.250', 'Boston University'),
(108, 1, 3, 'James', 'Garcia', '', 45, 'male', 'james.garcia@x.dummyjson.com', '+1 958-844-1106', 'jamesg', 'jamesgpass', '1979-11-29', 'https://dummyjson.com/icon/jamesg/128', 'A-', 175.44, 67.27, 'Green', '9.23.123.103', 'University of Notre Dame'),
(109, 1, 3, 'Sophia', 'Jones', 'Moore', 33, 'female', 'sophia.jones@x.dummyjson.com', '+92 230-523-9981', 'sophiam', 'sophiampass', '1991-05-21', 'https://dummyjson.com/icon/sophiam/128', 'AB+', 187.2, 61.59, 'Amber', '199.163.24.60', 'Pepperdine University'),
(110, 1, 3, 'Daniel', 'Taylor', '', 27, 'male', 'daniel.taylor@x.dummyjson.com', '+92 944-656-6731', 'danielt', 'danieltpass', '1997-12-21', 'https://dummyjson.com/icon/danielt/128', 'AB-', 183.88, 72.49, 'Blue', '54.218.41.97', 'Boston University'),
(111, 1, 3, 'Isabella', 'Jackson', 'White', 36, 'female', 'isabella.jackson@x.dummyjson.com', '+44 398-882-4460', 'isabellaw', 'isabellawpass', '1988-12-26', 'https://dummyjson.com/icon/isabellaw/128', 'O-', 192.2, 96.97, 'Brown', '3.244.185.83', 'Rice University'),
(112, 1, 3, 'Alexander', 'Hernandez', '', 41, 'male', 'alexander.hernandez@x.dummyjson.com', '+49 410-245-8608', 'alexanderh', 'alexanderhpass', '1983-07-04', 'https://dummyjson.com/icon/alexanderh/128', 'B-', 172.2, 82.3, 'Blue', '145.104.53.16', 'University of Florida'),
(113, 1, 3, 'Mia', 'Miller', 'Martin', 25, 'female', 'mia.miller@x.dummyjson.com', '+1 484-466-3879', 'miam', 'miampass', '1999-07-10', 'https://dummyjson.com/icon/miam/128', 'O-', 197.72, 54.7, 'Violet', '46.101.94.61', 'California Institute of Technology (Caltech)'),
(114, 1, 3, 'Ethan', 'Thompson', '', 32, 'male', 'ethan.thompson@x.dummyjson.com', '+1 872-403-3499', 'ethant', 'ethantpass', '1992-01-10', 'https://dummyjson.com/icon/ethant/128', 'A-', 153.05, 79.71, 'Amber', '236.39.153.193', 'University of California--Irvine'),
(115, 1, 3, 'Charlotte', 'Davis', 'Brown', 38, 'female', 'charlotte.davis@x.dummyjson.com', '+91 908-214-6224', 'charlotteb', 'charlottebpass', '1986-01-18', 'https://dummyjson.com/icon/charlotteb/128', 'B-', 182.35, 99.38, 'Amber', '147.246.166.48', 'Tufts University'),
(116, 1, 3, 'William', 'Lopez', '', 26, 'male', 'william.lopez@x.dummyjson.com', '+49 254-368-2317', 'williaml', 'williamlpass', '1998-11-01', 'https://dummyjson.com/icon/williaml/128', 'O+', 186.91, 50.32, 'Violet', '160.129.222.72', 'University of California--San Diego'),
(117, 1, 3, 'Amelia', 'Perez', 'Gonzalez', 43, 'female', 'amelia.perez@x.dummyjson.com', '+49 751-988-9521', 'ameliag', 'ameliagpass', '1981-01-29', 'https://dummyjson.com/icon/ameliag/128', 'B+', 186.66, 80.38, 'Brown', '249.222.49.78', 'University of Michigan--Ann Arbor'),
(118, 1, 3, 'Benjamin', 'Wilson', '', 30, 'male', 'benjamin.wilson@x.dummyjson.com', '+91 482-329-9835', 'benjaminw', 'benjaminwpass', '1994-03-11', 'https://dummyjson.com/icon/benjaminw/128', 'A-', 154.98, 88.95, 'Green', '198.187.169.104', 'Harvard University'),
(119, 1, 3, 'Liam', 'Gonzalez', 'Rodriguez', 34, 'male', 'liam.gonzalez@x.dummyjson.com', '+1 803-794-6247', 'liamr', 'liamrpass', '1990-09-14', 'https://dummyjson.com/icon/liamr/128', 'AB-', 182.76, 76.81, 'Green', '234.42.59.250', 'University of Wisconsin--Madison'),
(120, 1, 3, 'Evelyn', 'Walker', 'Flores', 37, 'female', 'evelyn.walker@x.dummyjson.com', '+44 478-401-7533', 'evelynf', 'evelynfpass', '1987-08-24', 'https://dummyjson.com/icon/evelynf/128', 'O-', 178.35, 56.33, 'Blue', '38.99.12.157', 'University of California--Santa Barbara'),
(121, 1, 3, 'Ava', 'Harris', '', 29, 'female', 'ava.harris@x.dummyjson.com', '+44 422-227-6412', 'avahx', 'avahxpass', '1995-08-26', 'https://dummyjson.com/icon/avahx/128', 'A-', 199.36, 63.3, 'Blue', '23.127.175.229', 'University of Florida'),
(122, 1, 3, 'Liam', 'Smith', 'Thomas', 44, 'male', 'liam.smith@x.dummyjson.com', '+44 293-526-4966', 'liamt', 'liamtpass', '1980-11-24', 'https://dummyjson.com/icon/liamt/128', 'A-', 180.32, 97.71, 'Red', '223.143.73.113', 'Georgetown University'),
(123, 1, 3, 'Harper', 'King', 'Baker', 23, 'female', 'harper.king@x.dummyjson.com', '+92 865-719-5676', 'harperb', 'harperbpass', '2001-06-17', 'https://dummyjson.com/icon/harperb/128', 'A+', 156.42, 67.02, 'Amber', '60.163.119.248', 'Georgetown University'),
(124, 1, 3, 'Noah', 'Lewis', '', 39, 'male', 'noah.lewis@x.dummyjson.com', '+61 396-867-4229', 'noahl', 'noahlpass', '1985-06-09', 'https://dummyjson.com/icon/noahl/128', 'AB-', 168.71, 86.15, 'Green', '210.106.253.177', 'Yale University'),
(125, 1, 3, 'Logan', 'Lee', '', 45, 'male', 'logan.lee@x.dummyjson.com', '+92 231-690-1885', 'loganlx', 'loganlxpass', '1979-10-18', 'https://dummyjson.com/icon/loganlx/128', 'O+', 180.04, 92.82, 'Brown', '84.172.241.191', 'University of North Carolina--Chapel Hill'),
(126, 1, 3, 'Avery', 'Scott', 'Adams', 27, 'female', 'avery.scott@x.dummyjson.com', '+91 965-669-9087', 'averya', 'averyapass', '1997-10-13', 'https://dummyjson.com/icon/averya/128', 'B-', 161.67, 56.81, 'Green', '227.163.241.130', 'Duke University'),
(127, 1, 3, 'Mason', 'Wright', '', 40, 'male', 'mason.wright@x.dummyjson.com', '+61 251-806-5947', 'masonw', 'masonwpass', '1984-05-17', 'https://dummyjson.com/icon/masonw/128', 'A-', 162.47, 79.18, 'Brown', '39.155.137.209', 'University of Connecticut'),
(128, 1, 3, 'Grace', 'Green', 'Evans', 35, 'female', 'grace.green@x.dummyjson.com', '+91 339-788-2388', 'gracee', 'graceepass', '1989-02-04', 'https://dummyjson.com/icon/gracee/128', 'B-', 197.09, 92.08, 'Green', '27.251.232.118', 'Rice University'),
(129, 1, 3, 'Lucas', 'Allen', '', 26, 'male', 'lucas.allen@x.dummyjson.com', '+61 831-566-3134', 'lucasa', 'lucasapass', '1998-11-01', 'https://dummyjson.com/icon/lucasa/128', 'B-', 199.33, 67.89, 'Gray', '70.157.133.232', 'Massachusetts Institute of Technology (MIT)'),
(130, 1, 3, 'Chloe', 'Roberts', 'Price', 41, 'female', 'chloe.roberts@x.dummyjson.com', '+44 900-399-5847', 'chloep', 'chloeppass', '1983-04-08', 'https://dummyjson.com/icon/chloep/128', 'AB+', 153.85, 72.46, 'Gray', '70.183.180.248', 'Washington University in St. Louis'),
(131, 1, 3, 'Jackson', 'Morales', '', 33, 'male', 'jackson.morales@x.dummyjson.com', '+1 685-561-9154', 'jacksonm', 'jacksonmpass', '1991-09-18', 'https://dummyjson.com/icon/jacksonm/128', 'AB-', 154.3, 60.62, 'Violet', '10.39.106.47', 'Pepperdine University'),
(132, 1, 3, 'Zoe', 'Bennett', 'Carter', 28, 'female', 'zoe.bennett@x.dummyjson.com', '+44 944-423-6651', 'zoec', 'zoecpass', '1996-05-11', 'https://dummyjson.com/icon/zoec/128', 'B-', 187.9, 99.54, 'Blue', '161.79.176.71', 'Massachusetts Institute of Technology (MIT)'),
(133, 1, 3, 'Carter', 'Rivera', '', 37, 'male', 'carter.rivera@x.dummyjson.com', '+92 500-957-1453', 'carterr', 'carterrpass', '1987-01-19', 'https://dummyjson.com/icon/carterr/128', 'B-', 192.63, 56.51, 'Green', '213.213.80.240', 'Emory University'),
(134, 1, 3, 'Nora', 'Russell', 'Morgan', 24, 'female', 'nora.russell@x.dummyjson.com', '+81 415-979-9594', 'noramx', 'noramxpass', '2000-03-30', 'https://dummyjson.com/icon/noramx/128', 'B+', 162.57, 76.02, 'Violet', '76.41.20.150', 'Tufts University'),
(135, 1, 3, 'Elijah', 'Cruz', '', 29, 'male', 'elijah.cruz@x.dummyjson.com', '+1 613-532-2557', 'elijahc', 'elijahcpass', '1995-01-23', 'https://dummyjson.com/icon/elijahc/128', 'O+', 195.29, 78.61, 'Gray', '178.45.211.139', 'University of California--Berkeley'),
(136, 1, 3, 'Madison', 'Stewart', 'Kelly', 36, 'female', 'madison.stewart@x.dummyjson.com', '+61 455-829-5048', 'madisonk', 'madisonkpass', '1988-05-15', 'https://dummyjson.com/icon/madisonk/128', 'B-', 199.81, 76.36, 'Blue', '110.144.81.89', 'Northwestern University'),
(137, 1, 3, 'Gabriel', 'Bailey', '', 42, 'male', 'gabriel.bailey@x.dummyjson.com', '+91 970-512-5684', 'gabrielb', 'gabrielbpass', '1982-11-22', 'https://dummyjson.com/icon/gabrielb/128', 'O-', 185.22, 66.39, 'Violet', '102.6.102.233', 'University of Michigan--Ann Arbor'),
(138, 1, 3, 'Lily', 'Torres', 'Lopez', 31, 'female', 'lily.torres@x.dummyjson.com', '+91 610-954-3059', 'lilyl', 'lilylpass', '1993-08-22', 'https://dummyjson.com/icon/lilyl/128', 'B-', 191.89, 89.54, 'Hazel', '177.180.239.191', 'University of Michigan--Ann Arbor'),
(139, 1, 3, 'Elijah', 'Hill', '', 26, 'male', 'elijah.hill@x.dummyjson.com', '+91 906-692-9655', 'elijahh', 'elijahhpass', '1998-08-25', 'https://dummyjson.com/icon/elijahh/128', 'B+', 160.31, 76.3, 'Gray', '175.3.175.35', 'Harvard University'),
(140, 1, 3, 'Hannah', 'Howard', 'Graham', 35, 'female', 'hannah.howard@x.dummyjson.com', '+1 884-326-8478', 'hannahg', 'hannahgpass', '1989-10-15', 'https://dummyjson.com/icon/hannahg/128', 'B-', 189.91, 58.16, 'Red', '255.136.28.75', 'Boston College'),
(141, 1, 3, 'Owen', 'Sullivan', '', 43, 'male', 'owen.sullivan@x.dummyjson.com', '+91 438-781-6749', 'owens', 'owenspass', '1981-01-02', 'https://dummyjson.com/icon/owens/128', 'AB+', 156.97, 79.13, 'Hazel', '211.229.95.93', 'New York University (NYU)'),
(142, 1, 3, 'Aria', 'Parker', 'Miller', 27, 'female', 'aria.parker@x.dummyjson.com', '+91 762-847-6884', 'ariam', 'ariampass', '1997-07-06', 'https://dummyjson.com/icon/ariam/128', 'AB-', 164.79, 92.15, 'Blue', '112.164.28.147', 'Stanford University'),
(143, 1, 3, 'Grayson', 'Coleman', '', 30, 'male', 'grayson.coleman@x.dummyjson.com', '+61 238-607-2286', 'graysonc', 'graysoncpass', '1994-12-15', 'https://dummyjson.com/icon/graysonc/128', 'O+', 180.01, 69.94, 'Hazel', '62.75.54.134', 'Purdue University'),
(144, 1, 3, 'Ella', 'Cook', 'Robinson', 38, 'female', 'ella.cook@x.dummyjson.com', '+91 736-763-5452', 'ellar', 'ellarpass', '1986-10-28', 'https://dummyjson.com/icon/ellar/128', 'AB+', 162.8, 75.09, 'Hazel', '109.193.157.140', 'Georgetown University'),
(145, 1, 3, 'Luke', 'Cooper', '', 25, 'male', 'luke.cooper@x.dummyjson.com', '+61 347-869-6758', 'lukec', 'lukecpass', '1999-04-20', 'https://dummyjson.com/icon/lukec/128', 'O-', 165.98, 79.02, 'Hazel', '219.83.201.134', 'University of Connecticut'),
(146, 1, 3, 'Leah', 'Hughes', 'Perez', 32, 'female', 'leah.hughes@x.dummyjson.com', '+1 935-838-3386', 'leahp', 'leahppass', '1992-06-02', 'https://dummyjson.com/icon/leahp/128', 'B-', 180.3, 64.31, 'Amber', '170.69.157.12', 'Massachusetts Institute of Technology (MIT)'),
(147, 1, 3, 'Henry', 'Turner', '', 44, 'male', 'henry.turner@x.dummyjson.com', '+1 374-470-5082', 'henryt', 'henrytpass', '1980-06-12', 'https://dummyjson.com/icon/henryt/128', 'AB-', 151.17, 62.94, 'Amber', '96.193.117.130', 'University of Florida'),
(148, 1, 3, 'Aurora', 'Barnes', 'Gomez', 29, 'female', 'aurora.barnes@x.dummyjson.com', '+91 403-842-9683', 'aurorag', 'auroragpass', '1995-12-15', 'https://dummyjson.com/icon/aurorag/128', 'B+', 185.79, 53.66, 'Green', '204.17.198.20', 'Georgetown University'),
(149, 1, 3, 'Wyatt', 'Perry', '', 34, 'male', 'wyatt.perry@x.dummyjson.com', '+81 370-801-1294', 'wyattp', 'wyattppass', '1990-05-23', 'https://dummyjson.com/icon/wyattp/128', 'B-', 152.5, 83.76, 'Green', '17.245.68.234', 'Tufts University'),
(150, 1, 3, 'Stella', 'Morris', 'Sanchez', 39, 'female', 'stella.morris@x.dummyjson.com', '+1 202-954-5884', 'stellas', 'stellaspass', '1985-03-15', 'https://dummyjson.com/icon/stellas/128', 'A+', 179.02, 88.22, 'Violet', '230.238.153.252', 'Harvard University'),
(151, 1, 3, 'Nathan', 'Reed', '', 28, 'male', 'nathan.reed@x.dummyjson.com', '+1 448-642-4577', 'nathanr', 'nathanrpass', '1996-12-26', 'https://dummyjson.com/icon/nathanr/128', 'A+', 186.76, 52.22, 'Amber', '216.178.112.125', 'University of Pennsylvania'),
(152, 1, 3, 'Paisley', 'Bell', 'Flores', 43, 'female', 'paisley.bell@x.dummyjson.com', '+81 744-537-2238', 'paisleyf', 'paisleyfpass', '1981-05-10', 'https://dummyjson.com/icon/paisleyf/128', 'B-', 180.16, 84.81, 'Hazel', '8.33.214.38', 'University of North Carolina--Chapel Hill'),
(153, 1, 3, 'Christian', 'Perez', '', 31, 'male', 'christian.perez@x.dummyjson.com', '+91 223-371-4471', 'christianp', 'christianppass', '1993-07-24', 'https://dummyjson.com/icon/christianp/128', 'B-', 163.47, 67.09, 'Hazel', '52.154.199.19', 'Georgetown University'),
(154, 1, 3, 'Bella', 'Gonzalez', 'Adams', 26, 'female', 'bella.gonzalez@x.dummyjson.com', '+81 213-723-5694', 'bellaa', 'bellaapass', '1998-06-17', 'https://dummyjson.com/icon/bellaa/128', 'O+', 159.37, 56.06, 'Blue', '129.106.244.122', 'Vanderbilt University'),
(155, 1, 3, 'Nicholas', 'Edwards', '', 41, 'male', 'nicholas.edwards@x.dummyjson.com', '+44 983-891-6014', 'nicholase', 'nicholasepass', '1983-01-13', 'https://dummyjson.com/icon/nicholase/128', 'A-', 156.74, 82.94, 'Green', '185.136.227.153', 'University of Florida'),
(156, 1, 3, 'Mila', 'Hernandez', 'Mitchell', 33, 'female', 'mila.hernandez@x.dummyjson.com', '+49 893-855-2896', 'milam', 'milampass', '1991-08-18', 'https://dummyjson.com/icon/milam/128', 'B-', 174.13, 80.97, 'Hazel', '109.219.231.82', 'University of Virginia'),
(157, 1, 3, 'Aaron', 'Cook', '', 27, 'male', 'aaron.cook@x.dummyjson.com', '+81 362-539-6973', 'aaronc', 'aaroncpass', '1997-01-26', 'https://dummyjson.com/icon/aaronc/128', 'AB+', 165.6, 61.17, 'Green', '71.248.65.203', 'University of Pennsylvania'),
(158, 1, 3, 'Aubrey', 'Gutierrez', 'Baker', 36, 'female', 'aubrey.gutierrez@x.dummyjson.com', '+92 881-268-9845', 'aubreyb', 'aubreybpass', '1988-02-19', 'https://dummyjson.com/icon/aubreyb/128', 'AB-', 186.45, 69.83, 'Brown', '19.183.244.21', 'University of Illinois--Urbana-Champaign'),
(159, 1, 3, 'Eli', 'Ward', '', 30, 'male', 'eli.ward@x.dummyjson.com', '+92 770-978-9439', 'eliw', 'eliwpass', '1994-04-24', 'https://dummyjson.com/icon/eliw/128', 'O-', 199.25, 61.46, 'Violet', '67.192.93.229', 'Emory University'),
(160, 1, 3, 'Claire', 'Foster', 'Stewart', 29, 'female', 'claire.foster@x.dummyjson.com', '+81 570-848-1400', 'claires', 'clairespass', '1995-02-24', 'https://dummyjson.com/icon/claires/128', 'AB+', 167.27, 66.04, 'Brown', '158.10.110.213', 'New York University (NYU)'),
(161, 1, 3, 'James', 'Gonzales', '', 44, 'male', 'james.gonzales@x.dummyjson.com', '+92 970-896-7544', 'jamesgx', 'jamesgxpass', '1980-09-05', 'https://dummyjson.com/icon/jamesgx/128', 'B-', 172.55, 89.39, 'Gray', '124.90.55.90', 'Northwestern University'),
(162, 1, 3, 'Mateo', 'Bennett', '', 28, 'male', 'mateo.bennett@x.dummyjson.com', '+91 232-996-1168', 'mateob', 'mateobpass', '1996-08-08', 'https://dummyjson.com/icon/mateob/128', 'B+', 186.64, 79.25, 'Red', '59.222.148.82', 'University of Notre Dame'),
(163, 1, 3, 'Julian', 'James', '', 24, 'male', 'julian.james@x.dummyjson.com', '+92 871-230-2864', 'julianj', 'julianjpass', '2000-08-15', 'https://dummyjson.com/icon/julianj/128', 'B+', 161.77, 83.55, 'Violet', '171.226.156.64', 'University of Wisconsin--Madison'),
(164, 1, 3, 'Addison', 'Ward', 'Foster', 29, 'female', 'addison.ward@x.dummyjson.com', '+1 248-875-1802', 'addisonf', 'addisonfpass', '1995-08-23', 'https://dummyjson.com/icon/addisonf/128', 'B-', 160.22, 75.72, 'Amber', '74.79.100.79', 'University of Illinois--Urbana-Champaign'),
(165, 1, 3, 'Leo', 'Rivera', '', 36, 'male', 'leo.rivera@x.dummyjson.com', '+44 625-386-6730', 'leor', 'leorpass', '1988-07-29', 'https://dummyjson.com/icon/leor/128', 'AB-', 195.49, 75.77, 'Hazel', '182.249.72.154', 'Johns Hopkins University'),
(166, 1, 3, 'Elena', 'Long', 'Mitchell', 42, 'female', 'elena.long@x.dummyjson.com', '+91 697-839-3216', 'elenam', 'elenampass', '1982-04-04', 'https://dummyjson.com/icon/elenam/128', 'AB+', 179.89, 56.93, 'Hazel', '252.247.244.14', 'Tufts University'),
(167, 1, 3, 'Evan', 'Wright', '', 31, 'male', 'evan.wright@x.dummyjson.com', '+92 329-343-8617', 'evanw', 'evanwpass', '1993-06-24', 'https://dummyjson.com/icon/evanw/128', 'AB+', 187.05, 61.58, 'Red', '246.150.23.157', 'University of Miami'),
(168, 1, 3, 'Luna', 'Perez', 'Hernandez', 26, 'female', 'luna.perez@x.dummyjson.com', '+92 202-261-2116', 'lunah', 'lunahpass', '1998-10-08', 'https://dummyjson.com/icon/lunah/128', 'AB+', 182.59, 68.01, 'Hazel', '100.251.47.74', 'Emory University'),
(169, 1, 3, 'Jaxon', 'Barnes', '', 41, 'male', 'jaxon.barnes@x.dummyjson.com', '+92 263-713-5362', 'jaxonb', 'jaxonbpass', '1983-07-16', 'https://dummyjson.com/icon/jaxonb/128', 'O-', 194.37, 60.15, 'Red', '238.130.227.82', 'University of Virginia'),
(170, 1, 3, 'Penelope', 'King', 'Taylor', 33, 'female', 'penelope.king@x.dummyjson.com', '+44 802-959-3104', 'penelopet', 'penelopetpass', '1991-01-27', 'https://dummyjson.com/icon/penelopet/128', 'B+', 195.84, 50.48, 'Violet', '153.88.226.4', 'Washington University in St. Louis'),
(171, 1, 3, 'Connor', 'Baker', '', 27, 'male', 'connor.baker@x.dummyjson.com', '+49 638-260-8907', 'connorb', 'connorbpass', '1997-02-02', 'https://dummyjson.com/icon/connorb/128', 'AB-', 166.57, 59.49, 'Green', '74.144.84.40', 'Purdue University'),
(172, 1, 3, 'Ariana', 'Ross', 'Ward', 36, 'female', 'ariana.ross@x.dummyjson.com', '+61 393-553-7155', 'arianaw', 'arianawpass', '1988-09-26', 'https://dummyjson.com/icon/arianaw/128', 'O-', 164.81, 50.3, 'Red', '47.190.165.179', 'University of Virginia'),
(173, 1, 3, 'Asher', 'Scott', '', 30, 'male', 'asher.scott@x.dummyjson.com', '+81 469-421-7639', 'ashers', 'asherspass', '1994-08-18', 'https://dummyjson.com/icon/ashers/128', 'O+', 169.56, 54.08, 'Blue', '150.136.12.36', 'Columbia University'),
(174, 1, 3, 'Sadie', 'Morales', 'Perez', 29, 'female', 'sadie.morales@x.dummyjson.com', '+61 203-600-1121', 'sadiep', 'sadieppass', '1995-02-09', 'https://dummyjson.com/icon/sadiep/128', 'AB-', 168.13, 70.75, 'Gray', '96.40.37.194', 'University of Illinois--Urbana-Champaign'),
(175, 1, 3, 'Gabriel', 'Mitchell', '', 44, 'male', 'gabriel.mitchell@x.dummyjson.com', '+81 861-548-2844', 'gabrielm', 'gabrielmpass', '1980-08-18', 'https://dummyjson.com/icon/gabrielm/128', 'O-', 197.94, 67.8, 'Hazel', '184.237.159.84', 'University of Michigan--Ann Arbor'),
(176, 1, 3, 'Aaliyah', 'Martinez', 'Adams', 28, 'female', 'aaliyah.martinez@x.dummyjson.com', '+91 862-924-5336', 'aaliyaha', 'aaliyahapass', '1996-02-02', 'https://dummyjson.com/icon/aaliyaha/128', 'B+', 177.05, 68.62, 'Green', '164.70.78.194', 'Georgetown University'),
(177, 1, 3, 'Xavier', 'Wright', '', 37, 'male', 'xavier.wright@x.dummyjson.com', '+91 561-239-9006', 'xavierw', 'xavierwpass', '1987-01-11', 'https://dummyjson.com/icon/xavierw/128', 'AB+', 192.26, 85.15, 'Violet', '191.157.149.183', 'Carnegie Mellon University'),
(178, 1, 3, 'Savannah', 'Gomez', 'Evans', 25, 'female', 'savannah.gomez@x.dummyjson.com', '+92 242-841-6772', 'savannahe', 'savannahepass', '1999-02-16', 'https://dummyjson.com/icon/savannahe/128', 'A-', 168.59, 73.74, 'Hazel', '204.100.141.2', 'Boston University'),
(179, 1, 3, 'Tyler', 'Davis', '', 42, 'male', 'tyler.davis@x.dummyjson.com', '+92 633-378-5551', 'tylerd', 'tylerdpass', '1982-05-21', 'https://dummyjson.com/icon/tylerd/128', 'O+', 185.65, 77.02, 'Violet', '31.197.214.168', 'Princeton University'),
(180, 1, 3, 'Aurora', 'Rodriguez', 'Nelson', 31, 'female', 'aurora.rodriguez@x.dummyjson.com', '+61 393-225-2755', 'auroran', 'auroranpass', '1993-11-23', 'https://dummyjson.com/icon/auroran/128', 'AB+', 164.92, 65.48, 'Brown', '127.15.107.0', 'University of Virginia'),
(181, 1, 3, 'Brandon', 'Collins', '', 26, 'male', 'brandon.collins@x.dummyjson.com', '+91 994-732-2700', 'brandonc', 'brandoncpass', '1998-01-19', 'https://dummyjson.com/icon/brandonc/128', 'B+', 173.25, 68.45, 'Brown', '2.164.227.107', 'Yale University'),
(182, 1, 3, 'Ellie', 'Stewart', 'Hill', 41, 'female', 'ellie.stewart@x.dummyjson.com', '+1 901-445-7668', 'ellieh', 'elliehpass', '1983-11-02', 'https://dummyjson.com/icon/ellieh/128', 'O-', 189.43, 87.61, 'Green', '248.18.30.194', 'William & Mary'),
(183, 1, 3, 'Cameron', 'Perez', '', 33, 'male', 'cameron.perez@x.dummyjson.com', '+91 275-868-7103', 'cameronp', 'cameronppass', '1991-09-02', 'https://dummyjson.com/icon/cameronp/128', 'B-', 153.92, 86.88, 'Hazel', '124.76.78.240', 'Ohio State University'),
(184, 1, 3, 'Natalie', 'Price', 'Hernandez', 28, 'female', 'natalie.price@x.dummyjson.com', '+91 273-928-7633', 'nataliehx', 'nataliehxpass', '1996-10-09', 'https://dummyjson.com/icon/nataliehx/128', 'B+', 167.08, 65.86, 'Violet', '3.53.149.153', 'Boston University'),
(185, 1, 3, 'Henry', 'Adams', '', 44, 'male', 'henry.adams@x.dummyjson.com', '+61 715-487-1979', 'henrya', 'henryapass', '1980-07-14', 'https://dummyjson.com/icon/henrya/128', 'AB+', 155.01, 56.01, 'Brown', '67.144.157.90', 'Washington University in St. Louis'),
(186, 1, 3, 'Harper', 'Garcia', 'Bell', 29, 'female', 'harper.garcia@x.dummyjson.com', '+92 230-235-4683', 'harperbx', 'harperbxpass', '1995-05-05', 'https://dummyjson.com/icon/harperbx/128', 'B+', 167.38, 79.54, 'Hazel', '147.157.206.159', 'University of Wisconsin--Madison'),
(187, 1, 3, 'Zachary', 'Lee', '', 36, 'male', 'zachary.lee@x.dummyjson.com', '+61 382-295-6973', 'zacharyl', 'zacharylpass', '1988-12-26', 'https://dummyjson.com/icon/zacharyl/128', 'AB-', 193.23, 94.79, 'Brown', '49.188.116.209', 'Brown University'),
(188, 1, 3, 'Aria', 'Flores', 'Martin', 25, 'female', 'aria.flores@x.dummyjson.com', '+61 415-771-8232', 'ariamx', 'ariamxpass', '1999-11-08', 'https://dummyjson.com/icon/ariamx/128', 'O-', 160.06, 92.02, 'Amber', '86.67.36.191', 'Columbia University'),
(189, 1, 3, 'Tristan', 'Scott', '', 30, 'male', 'tristan.scott@x.dummyjson.com', '+44 401-329-9855', 'tristans', 'tristanspass', '1994-12-02', 'https://dummyjson.com/icon/tristans/128', 'O+', 174.12, 59.54, 'Gray', '192.185.20.193', 'Northwestern University'),
(190, 1, 3, 'Leah', 'Gutierrez', 'Wright', 31, 'female', 'leah.gutierrez@x.dummyjson.com', '+1 300-470-3376', 'leahw', 'leahwpass', '1993-06-22', 'https://dummyjson.com/icon/leahw/128', 'AB+', 151.25, 97.88, 'Violet', '145.139.252.76', 'Purdue University'),
(191, 1, 3, 'Layla', 'Young', 'Brown', 41, 'female', 'layla.young@x.dummyjson.com', '+44 224-805-7678', 'laylab', 'laylabpass', '1983-04-30', 'https://dummyjson.com/icon/laylab/128', 'AB-', 164.15, 98.17, 'Violet', '160.161.233.99', 'University of Illinois--Urbana-Champaign'),
(192, 1, 3, 'Nolan', 'Gonzalez', '', 33, 'male', 'nolan.gonzalez@x.dummyjson.com', '+49 666-608-6933', 'nolang', 'nolangpass', '1991-06-11', 'https://dummyjson.com/icon/nolang/128', 'AB-', 157.63, 61.56, 'Red', '212.114.53.82', 'University of Notre Dame'),
(193, 1, 3, 'Hazel', 'Evans', 'Collins', 28, 'female', 'hazel.evans@x.dummyjson.com', '+92 319-405-4110', 'hazelc', 'hazelcpass', '1996-08-11', 'https://dummyjson.com/icon/hazelc/128', 'B-', 188.78, 77.33, 'Amber', '94.206.41.47', 'Georgetown University');
INSERT INTO `usuarios` (`id`, `idestatus`, `idrole`, `firstName`, `lastName`, `maidenName`, `age`, `gender`, `email`, `phone`, `username`, `password`, `birthDate`, `image`, `bloodGroup`, `height`, `weight`, `eyeColor`, `ip`, `university`) VALUES
(194, 1, 3, 'Brayden', 'Hill', '', 45, 'male', 'brayden.hill@x.dummyjson.com', '+61 371-853-2857', 'braydenh', 'braydenhpass', '1979-04-20', 'https://dummyjson.com/icon/braydenh/128', 'A-', 196.84, 84.16, 'Green', '9.79.112.93', 'Harvard University'),
(195, 1, 3, 'Violet', 'Roberts', 'Adams', 29, 'female', 'violet.roberts@x.dummyjson.com', '+49 724-357-9329', 'violeta', 'violetapass', '1995-06-14', 'https://dummyjson.com/icon/violeta/128', 'A-', 187.32, 82.79, 'Hazel', '148.79.103.219', 'Ohio State University'),
(196, 1, 3, 'Lucas', 'Ramirez', '', 34, 'male', 'lucas.ramirez@x.dummyjson.com', '+92 745-454-8374', 'lucasr', 'lucasrpass', '1990-12-04', 'https://dummyjson.com/icon/lucasr/128', 'A-', 181.93, 90.12, 'Brown', '132.79.66.76', 'Princeton University'),
(197, 1, 3, 'Eleanor', 'Collins', 'Ward', 37, 'female', 'eleanor.collins@x.dummyjson.com', '+44 353-303-4041', 'eleanorw', 'eleanorwpass', '1987-01-20', 'https://dummyjson.com/icon/eleanorw/128', 'O-', 190.86, 75.95, 'Brown', '216.88.62.56', 'University of California--Irvine'),
(198, 1, 3, 'Max', 'Parker', '', 32, 'male', 'max.parker@x.dummyjson.com', '+81 250-310-5486', 'maxp', 'maxppass', '1992-01-15', 'https://dummyjson.com/icon/maxp/128', 'A-', 154.14, 69.87, 'Blue', '134.44.115.225', 'Boston College'),
(199, 1, 3, 'Vivian', 'Carter', 'Gomez', 26, 'female', 'vivian.carter@x.dummyjson.com', '+92 237-734-8586', 'viviang', 'viviangpass', '1998-02-25', 'https://dummyjson.com/icon/viviang/128', 'B+', 172.82, 79.28, 'Violet', '129.204.254.126', 'Massachusetts Institute of Technology (MIT)'),
(200, 1, 3, 'Adrian', 'Flores', '', 43, 'male', 'adrian.flores@x.dummyjson.com', '+61 524-858-7351', 'adrianf', 'adrianfpass', '1981-05-01', 'https://dummyjson.com/icon/adrianf/128', 'O+', 183.05, 97.74, 'Green', '86.244.141.158', 'Stanford University');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idestatus` (`idestatus`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idestatus` (`idestatus`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpedido` (`idpedido`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idestatus` (`idestatus`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcategoria` (`idcategoria`),
  ADD KEY `idestatus` (`idestatus`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idestatus` (`idestatus`),
  ADD KEY `idrole` (`idrole`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`idestatus`) REFERENCES `estatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idestatus`) REFERENCES `estatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idestatus`) REFERENCES `estatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idestatus`) REFERENCES `estatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
