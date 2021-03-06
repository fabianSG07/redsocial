-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2019 at 07:20 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redsocial`
--
CREATE DATABASE IF NOT EXISTS `redsocial` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `redsocial`;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `idcomentario` int(11) NOT NULL,
  `idPublicacion` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `contenidoComentario` longtext NOT NULL,
  `fechaComentario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`idcomentario`, `idPublicacion`, `idUser`, `contenidoComentario`, `fechaComentario`) VALUES
(1, 1, 1, 'Ami tambien', '2019-06-25 01:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `idlike` int(11) NOT NULL,
  `idPublicacion` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`idlike`, `idPublicacion`, `idUser`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE `mensajes` (
  `idmensaje` int(11) NOT NULL,
  `usuarios_idusuario` int(11) NOT NULL,
  `usuarioMando` int(11) NOT NULL,
  `contenido` longtext NOT NULL,
  `fechaMensaje` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mensajes`
--

INSERT INTO `mensajes` (`idmensaje`, `usuarios_idusuario`, `usuarioMando`, `contenido`, `fechaMensaje`) VALUES
(2, 3, 1, 'Bien y tu', '2019-06-25 01:06:45'),
(3, 1, 4, 'Hellow', '2019-11-04 16:47:50');

-- --------------------------------------------------------

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
CREATE TABLE `notificaciones` (
  `idnotificacion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `usuarioAccion` int(11) NOT NULL,
  `tipoNotificaion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificaciones`
--

INSERT INTO `notificaciones` (`idnotificacion`, `idUsuario`, `usuarioAccion`, `tipoNotificaion`) VALUES
(1, 3, 1, 1),
(2, 3, 1, 2),
(3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fotoPerfil` varchar(200) NOT NULL,
  `nombreCompleto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`idperfil`, `idUsuario`, `fotoPerfil`, `nombreCompleto`) VALUES
(1, 1, 'img/imagenesPerfil/images.jpg', 'Juan fernando araque agudelo'),
(2, 2, 'img/imagenesPerfil/Ariana_Grande_Elle_2018.png', 'Andres caicedo'),
(3, 3, 'img/imagenesPerfil/patrock.jpg', 'Patricio estrella'),
(4, 4, 'img/imagenesPerfil/stella_vermillion_by_mysticswordsman21_d9haivv-pre.jpg', 'Kismusito el mejor');

-- --------------------------------------------------------

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE `privilegios` (
  `idPerfil` int(11) NOT NULL,
  `nombrePrivilegio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilegios`
--

INSERT INTO `privilegios` (`idPerfil`, `nombrePrivilegio`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE `publicaciones` (
  `idpublicacion` int(11) NOT NULL,
  `idUserPublico` int(11) NOT NULL,
  `contenidoPublicacion` longtext NOT NULL,
  `fotoPublicacion` varchar(255) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `fechaPublicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publicaciones`
--

INSERT INTO `publicaciones` (`idpublicacion`, `idUserPublico`, `contenidoPublicacion`, `fotoPublicacion`, `num_likes`, `fechaPublicacion`) VALUES
(1, 3, 'Me gustan los caramelos', 'img/imagenesPublicaciones/MV5BNDUwNjBkMmUtZjM2My00NmM4LTlmOWQtNWE5YTdmN2Y2MTgxXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_UX477_CR0,0,477,268_AL_.jpg', 1, '2019-07-04 13:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `tiposnotificaciones`
--

DROP TABLE IF EXISTS `tiposnotificaciones`;
CREATE TABLE `tiposnotificaciones` (
  `idtiposNotificaciones` int(11) NOT NULL,
  `nombreTipo` varchar(60) NOT NULL,
  `mensajeNotificacion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tiposnotificaciones`
--

INSERT INTO `tiposnotificaciones` (`idtiposNotificaciones`, `nombreTipo`, `mensajeNotificacion`) VALUES
(1, 'Like', 'le ha dado me gusta a tu publicaci??n'),
(2, 'Comentario', 'ha comentado tu publicaci??n');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `idPrivilegio`, `correo`, `usuario`, `contrasena`, `fecha_registro`) VALUES
(1, 1, 'kismu35891@gmail.com', 'kismu', '$2y$10$4kpLoFauTnJv6YuJEY1h3ebBUQKIwvu2Dj0M/EBeT9yn9fhZ2uEiy', '2019-06-20 16:25:29'),
(2, 2, 'jhojan17000@hotmail.com', 'mateo', '$2y$10$fxpvH71JBTUXGwdTO29Ew.k02JXIFV3c4JoDbGXtF3oH51sXAdldy', '2019-06-21 23:08:36'),
(3, 2, 'kismu35891@gmail.com', 'patricio', '$2y$10$AJDhrw7NqjPFumTP9uUqeOgZQ.RiIg9sXM9W7WwoC7haLb2UWTXam', '2019-06-25 01:04:37'),
(4, 2, 'kismupro@gmail.com', 'kismusitopro', '$2y$10$.PrPEUkr.hIfwm6U11BG0OyFZk8WBvtJT5WsYCSKnMIqnyMddkDrO', '2019-11-04 16:44:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `comentarioPublicacion_idx` (`idPublicacion`),
  ADD KEY `comentarioUser_idx` (`idUser`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`idlike`),
  ADD KEY `publiLikes_idx` (`idPublicacion`),
  ADD KEY `usuarioLike_idx` (`idUser`);

--
-- Indexes for table `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idmensaje`),
  ADD KEY `fk_mensajes_usuarios1_idx` (`usuarios_idusuario`),
  ADD KEY `usuarioMando` (`usuarioMando`);

--
-- Indexes for table `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`idnotificacion`),
  ADD KEY `usuarioNotificacion_idx` (`idUsuario`),
  ADD KEY `fk_notificaciones_tiposNotificaciones1_idx` (`tipoNotificaion`),
  ADD KEY `usuarioAccion` (`usuarioAccion`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`),
  ADD KEY `perfilUser_idx` (`idUsuario`);

--
-- Indexes for table `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indexes for table `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`idpublicacion`),
  ADD KEY `publicacioesUser_idx` (`idUserPublico`);

--
-- Indexes for table `tiposnotificaciones`
--
ALTER TABLE `tiposnotificaciones`
  ADD PRIMARY KEY (`idtiposNotificaciones`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `priviUser_idx` (`idPrivilegio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `idlike` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idmensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `idnotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `idpublicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tiposnotificaciones`
--
ALTER TABLE `tiposnotificaciones`
  MODIFY `idtiposNotificaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarioPublicacion` FOREIGN KEY (`idPublicacion`) REFERENCES `publicaciones` (`idpublicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comentarioUser` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `publiLikes` FOREIGN KEY (`idPublicacion`) REFERENCES `publicaciones` (`idpublicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarioLike` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `fk_mensajes_usuarios1` FOREIGN KEY (`usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`usuarioMando`) REFERENCES `usuarios` (`idusuario`);

--
-- Constraints for table `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `fk_notificaciones_tiposNotificaciones1` FOREIGN KEY (`tipoNotificaion`) REFERENCES `tiposnotificaciones` (`idtiposNotificaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuarioAccion`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `usuarioNotificacion` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfilUser` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicacioesUser` FOREIGN KEY (`idUserPublico`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `priviUser` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
