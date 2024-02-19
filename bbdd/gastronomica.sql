-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-02-2024 a las 03:35:49
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gastronomica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `carritoId` int(11) NOT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  `tipo` enum('producto','receta') NOT NULL,
  `itemId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_productos`
--

CREATE TABLE `compras_productos` (
  `idCompra` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) GENERATED ALWAYS AS (`cantidad` * `precio`) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_recetas`
--

CREATE TABLE `compras_recetas` (
  `idCompra` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) GENERATED ALWAYS AS (`cantidad` * `precio`) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `origen` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `origen`, `imagen`) VALUES
(1, 'Arroz Basmati', 'Arroz aromático de grano largo', '5.99', 'Importado', 'https://www.arrozsos.es/wp-content/uploads/2023/08/propiedades-arroz-basmati.jpeg'),
(2, 'Aceite de Oliva Extra Virgen', 'Aceite de oliva de alta calidad', '12.50', 'Local', 'https://s2.abcstatics.com/abc/sevilla/multimedia/economia/2023/12/08/aceite-oliva-virgen-extra-RE1zqa5RgtxtzwSWwCX5KoK-1200x840@abc.png'),
(3, 'Pimienta Negra Molida', 'Pimienta negra para sazonar', '3.75', 'Importado', 'https://s3.abcstatics.com/media/bienestar/2022/01/22/pimienta-negra-kjQB--1248x698@abc.jpg'),
(4, 'Miel de Abeja Pura', 'Miel natural sin procesar', '8.25', 'Local', 'https://fincarosamaria.com.mx/cdn/shop/products/Miel_de_Abeja_ed4c6f68-7025-4b47-b49b-9586f3409359_1000x1000.jpg?v=1565281964'),
(5, 'Canela en Rama', 'Canela de Ceilán para postres', '4.99', 'Importado', 'https://m.media-amazon.com/images/I/61smjztsDaL._AC_UF894,1000_QL80_.jpg'),
(6, 'Salmón Ahumado', 'Filetes de salmón ahumado', '15.99', 'Importado', 'https://laplazadejaen.com/wp-content/uploads/2020/03/salmon-ahumado.jpg'),
(7, 'Queso Parmesano Reggiano', 'Queso parmesano auténtico', '9.75', 'Importado', 'https://www.rosalat.com.ar/wp-content/uploads/2022/10/Queso-parmesano.jpg'),
(8, 'Vinagre Balsámico de Módena', 'Vinagre balsámico envejecido', '14.99', 'Importado', 'https://embutidoslapradera.com/79-large_default/alino-vinagre-balsamico-castana.jpg'),
(9, 'Albahaca Fresca', 'Hojas de albahaca fresca', '2.49', 'Local', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3xaJ_DE59G1wiGO8JvkXxupSaAzA2mos9gvpfJsAbYAQ75jbOcyuPZpUnDvFSUdBI4rU&usqp=CAU'),
(10, 'Tomates Secos', 'Tomates deshidratados para ensaladas', '6.75', 'Importado', 'https://i.blogs.es/14743d/tomates1/1366_2000.jpg'),
(11, 'Cúrcuma en Polvo', 'Especia dorada para curry', '5.25', 'Local', 'https://www.ocu.org/-/media/altroconsumo/images/home/alimentazione/fare-la-spesa/dossier/curcuma.jpg?rev=81f0a791-0f30-41ea-b44f-5ef4d1376929&mw=660&hash=C7613E5F26E7400DB6F0A9839CCD9C58'),
(12, 'Pasta de Trigo Integral', 'Pasta de trigo integral', '3.29', 'Local', 'https://www.solucionesparaladiabetes.com/magazine-diabetes/wp-content/uploads/Beneficios-y-propiedades-de-la-pasta-integral-696x463.jpg'),
(13, 'Jengibre Fresco', 'Raíz de jengibre fresca', '1.99', 'Local', 'https://s1.eestatic.com/2020/07/27/ciencia/nutricion/nutricion_508459709_156545635_1706x960.jpg'),
(14, 'Nuez Moscada Entera', 'Nuez moscada fresca para rallar', '8.99', 'Importado', 'https://images.ecestaticos.com/1mCb9oZ9w9fVciqdu_FN7Zvg8lI=/104x17:1903x1413/1200x899/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F77b%2Fc3d%2F32e%2F77bc3d32e4758f30918598e5703354e5.jpg'),
(15, 'Quinoa Orgánica', 'Quinoa cultivada de forma orgánica', '9.25', 'Importado', 'https://imag.bonviveur.com/como-cocinar-quinoa-perfecta.jpg'),
(16, 'Hojas de Laurel Secas', 'Hojas de laurel para guisos', '3.15', 'Local', 'https://media.glamour.mx/photos/64efc9bd4fc1ded2f560b225/4:3/w_2664,h_1998,c_limit/laurel-en-el-shampoo.jpg'),
(17, 'Azúcar de Caña Orgánica', 'Azúcar natural sin refinar', '4.49', 'Local', 'https://blog.oxfamintermon.org/wp-content/uploads/2018/06/az%C3%BAcar-de-ca%C3%B1a-sin-refinar-2-1.jpg'),
(18, 'Filete de Ternera', 'Filete de ternera magro y jugoso', '13.99', 'Local', 'https://www.solobuey.com/wp-content/uploads/filetes-de-ternera-1.jpg'),
(19, 'Pechuga de Pollo', 'Pechuga de pollo fresca y sin piel', '8.50', 'Local', 'https://www.clara.es/medio/2022/03/07/recetas-con-pechuga-de-pollo_a62c2947_1280x853.jpg'),
(20, 'Costillas de Cerdo', 'Costillas de cerdo ahumadas', '10.75', 'Local', 'https://www.carniceriapamplona.com/wp-content/uploads/2016/07/DSC_8089.jpg'),
(21, 'Sardinas en Lata', 'Sardinas en aceite de oliva', '4.25', 'Importado', 'https://canthynnus.com/wp-content/uploads/2021/05/tin-of-sardines-in-oil-on-rustic-table-scaled.jpg'),
(22, 'Atún Fresco', 'Filete de atún fresco de la pesca del día', '17.99', 'Local', 'https://i.blogs.es/f19514/tuna-3886014_1280/450_1000.jpg'),
(23, 'Naranjas', 'Naranjas jugosas y llenas de vitamina C', '3.99', 'Local', 'https://imagenes.20minutos.es/files/image_1920_1080/uploads/imagenes/2022/11/17/naranjas.jpeg'),
(24, 'Plátanos', 'Plátanos maduros y nutritivos', '2.75', 'Local', 'https://s3.abcstatics.com/media/bienestar/2019/07/25/platano-beneficios-kIyF--1248x698@abc.jpg'),
(25, 'Frambuesas', 'Frambuesas frescas para postres', '6.49', 'Importado', 'https://www.cuerpomente.com/medio/2023/05/31/frambuesa-propiedades-beneficios-y-usos-en-la-cocina_36edf45a_230531094306_1280x720.jpg'),
(26, 'Brócoli Orgánico', 'Brócoli cultivado de forma orgánica', '2.99', 'Importado', 'https://s1.abcstatics.com/media/bienestar/2020/09/22/brocoli-1-klsH--1248x698@abc.jpg'),
(27, 'Calabacín', 'Calabacín fresco para guisos', '1.89', 'Local', 'https://s3.abcstatics.com/media/bienestar/2020/09/09/calabacin-k9TD--1248x698@abc.jpg'),
(28, 'Zanahorias', 'Zanahorias crujientes y saludables', '1.25', 'Local', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpMAdyHDRpI3gFY9z6WtdYV_ij8fe-7Azen0acEGsDFqzkCijzUYTCX8Lp_CrsyQ57lo&usqp=CAU'),
(29, 'Pimientos Amarillos', 'Pimientos amarillos para ensaladas', '2.50', 'Local', 'https://4.bp.blogspot.com/-jQKHQZk-X50/XIJVRo1GsAI/AAAAAAAAZtk/64k2RLFQszwVPI0IPZGPQWDhnaNFrbv2gCLcBGAs/s640/322919715_cab3a15153_o.jpg'),
(30, 'Piña Fresca', 'Piña fresca y jugosa', '5.99', 'Importado', 'https://www.lacocinadelila.com/wp-content/uploads/2021/07/como-madurar-una-pina-600x450.jpg'),
(31, 'Cerezas', 'Cerezas rojas y dulces', '8.25', 'Local', 'https://www.cuerpomente.com/medio/2021/02/11/propiedades-y-beneficos-de-las-cerezas_795e4ea9.jpg'),
(32, 'Aguacates Hass', 'Aguacates Hass maduros', '2.99', 'Local', 'https://www.eltiempo.com/files/image_640_428/uploads/2022/08/11/62f5313e6b498.jpeg'),
(33, 'Espinacas Orgánicas', 'Espinacas cultivadas de forma orgánica', '3.75', 'Importado', 'https://i.blogs.es/5ee30a/istock-522189977/650_1200.jpg'),
(34, 'Tomates Cherry', 'Tomates cherry para ensaladas', '4.50', 'Local', 'https://www.cucinare.tv/wp-content/uploads/2019/10/Cherry.jpg'),
(35, 'Uvas Rojas', 'Uvas rojas para aperitivos', '6.75', 'Importado', 'https://www.innovaspain.com/wp-content/uploads/2023/11/uvas.jpg'),
(36, 'Papas Nuevas', 'Papas nuevas para asar', '2.99', 'Local', 'https://i.blogs.es/a696c0/istock-170187164/840_560.jpg'),
(37, 'Melón', 'Melón dulce y refrescante', '4.99', 'Local', 'https://corp.ametllerorigen.com/wp-content/uploads/2023/07/Proyecto-nuevo-45.jpg'),
(38, 'Kiwi', 'Kiwi rico en vitamina C', '2.25', 'Importado', 'https://blog.disfrutaverdura.com/wp-content/uploads/2020/12/kiwi.jpg'),
(39, 'Papas Rojas', 'Papas rojas ideales para hervir', '3.49', 'Local', 'https://statics-cuidateplus.marca.com/cms/styles/natural/azblob/2023-02/patata-roja.jpg.webp?itok=0MMdbiYS'),
(40, 'Pimientos Verdes', 'Pimientos verdes para guisos', '2.75', 'Local', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIjkdzjKgVtqz3-SbW-TmJoLNeo_W18XxjCw&usqp=CAU'),
(41, 'Ajo Fresco', 'Ajo fresco para sazonar', '1.15', 'Local', 'https://statics-cuidateplus.marca.com/cms/styles/ratio_1_1/azblob/ajos.jpg.webp?itok=1AItGwmc'),
(42, 'Carne Molida de Res', 'Carne molida de res magra', '9.99', 'Local', 'https://static.wixstatic.com/media/dd6ae4_a262672a1f544ba4a20e601977f42d16~mv2.jpg/v1/fill/w_476,h_500,al_c,lg_1,q_80,enc_auto/dd6ae4_a262672a1f544ba4a20e601977f42d16~mv2.jpg'),
(43, 'Peras', 'Peras jugosas y sabrosas', '3.25', 'Importado', 'https://s2.ppllstatics.com/eldiariomontanes/www/multimedia/202005/16/media/cortadas/55366113--1248x830.jpg'),
(44, 'Chuletas de Cordero', 'Chuletas de cordero tiernas y jugosas', '14.75', 'Local', 'https://carnescesareogomez.es/wp-content/uploads/2019/07/Chuletas-de-cordero-merino.jpg'),
(45, 'Solomillo de Cerdo', 'Solomillo de cerdo magro y sabroso', '11.99', 'Local', 'https://www.carnesdelbierzo.es/1606-thickbox_default/SOLOMILLO-CERDO-FRESCO.jpg'),
(46, 'Pollo Asado', 'Pollo asado al horno con hierbas', '12.50', 'Local', 'https://lh3.googleusercontent.com/proxy/1-bJp4pRR0RsBrPsqIr_Mc1jcCdUDvmUIOtZUsz3w35QMwsDQrlktFrSdsDNc3B2AGbuwEnEWRAwdwGG-xvijDFHhcxb1CI8icBJcKUlh6gnvnYRxnsqV_vn2BvFSAU'),
(47, 'Salchichas de Pollo', 'Salchichas de pollo sin piel', '8.25', 'Local', 'https://laplazadejaen.com/wp-content/uploads/2019/05/15-CHICA.jpg'),
(64, 'Ahora si', 'Descripcion nueva', '10.56', 'modificado', 'Imagenes/Productos/arroz_basmati.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_chef` varchar(255) DEFAULT NULL,
  `ingredientes` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `nombre`, `nombre_chef`, `ingredientes`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'Paella Valenciana', 'Jaime Andrés', 'Arroz, Pollo, Conejo, Judía verde, Tomate, Azafrán, Caldo de pollo, Aceite de oliva, Sal y pimienta al gusto', 'Una deliciosa paella valenciana con arroz, pollo y conejo.', '25.99', 'https://www.lafallera.es/wp-content/uploads/2020/08/paella-de-carne.jpg'),
(2, 'Gazpacho Andaluz', 'Isabel Martínez', 'Tomates maduros, Pepino, Pimiento verde, Ajo, Pan blanco, Aceite de oliva virgen extra, Vinagre de vino, Sal y pimienta al gusto', 'Refrescante gazpacho andaluz con tomate, pepino, pimiento y ajo.', '12.50', 'https://www.lecturas.com/recetas/medio/2021/03/11/paso-a-paso-para-hacer-gazpacho-andaluz-con-trocitos-de-verduras-resultado-final_afebd712_1200x630.jpg'),
(3, 'Tortilla Española', 'Carlos Rodríguez', 'Patatas, Cebolla, Huevos, Aceite de oliva virgen extra, Sal al gusto', 'Tortilla española clásica con patatas, cebolla y huevo.', '8.75', 'https://mojo.generalmills.com/api/public/content/9xIHKwJDH0-1wbHPsVCCVQ_gmi_hi_res_jpeg.jpeg?v=2bfc22c6&t=16e3ce250f244648bef28c5949fb99ff'),
(4, 'Gambas al Ajillo', 'Ana Sánchez', 'Gambas, Ajo, Guindilla, Aceite de oliva virgen extra, Perejil fresco, Sal al gusto', 'Gambas salteadas con ajo, guindilla y aceite de oliva, ¡un clásico español!', '16.25', 'https://images.hola.com/imagenes/cocina/recetas/20211124200226/gambas-al-ajillo-receta-de-navidad/1-23-865/gambas-ajillo-t.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userRole` enum('admin','usuario') NOT NULL DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `email`, `password`, `userRole`) VALUES
(1, 'admin@admin.com', 'admin', 'admin'),
(2, 'user@user.com', 'user', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`carritoId`),
  ADD KEY `usuarioId` (`usuarioId`);

--
-- Indices de la tabla `compras_productos`
--
ALTER TABLE `compras_productos`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `compras_productos_ibfk_2` (`idProducto`);

--
-- Indices de la tabla `compras_recetas`
--
ALTER TABLE `compras_recetas`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idReceta` (`idReceta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `carritoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `compras_productos`
--
ALTER TABLE `compras_productos`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras_recetas`
--
ALTER TABLE `compras_recetas`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `compras_productos`
--
ALTER TABLE `compras_productos`
  ADD CONSTRAINT `compras_productos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `compras_productos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras_recetas`
--
ALTER TABLE `compras_recetas`
  ADD CONSTRAINT `compras_recetas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `compras_recetas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
