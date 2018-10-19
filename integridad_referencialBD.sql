/*create database integridad_referencial;*/

use integridad_referencial;

CREATE TABLE IF NOT EXISTS `ciudades` (
`id_ciudad` int(10) unsigned NOT NULL,
  `nombre_ciudad` varchar(50) DEFAULT NULL,
  `id_provincia` smallint(5) unsigned DEFAULT NULL,
  `habitantes` int(10) unsigned DEFAULT NULL,
  `recomendacion` varchar(30) NOT NULL DEFAULT 'No recomendada',
  `fundacion` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre_ciudad`, `id_provincia`, `habitantes`, `recomendacion`, `fundacion`) VALUES
(2, 'Mar del Plata', 9, 700000, 'Recomendada', '1800-01-01'),
(3, 'Junin', 9, 50000, 'No recomendada', '1892-01-02'),
(4, 'La Plata', 9, 500000, 'No recomendada', '1910-03-03'),
(5, 'Rio Cuarto', 14, 150000, 'NS/NC', '1492-01-02'),
(6, 'Carlos Paz', 14, 30000, 'Recomendada', '1999-04-11'),
(7, 'Concordia', 15, 190000, 'No recomendada', '1984-05-05'),
(8, 'Ciudad de la cuarta region', 12, 250, 'Parcial', '1990-01-01'),
(9, 'Otra ciudad de la cuarta region', 12, 680, 'NS/NC', '1990-01-01'),
(10, 'Joinville', 11, 496000, 'No recomendada', '1990-01-01'),
(11, 'Itajai', 11, 170000, 'No recomendada', '1990-01-01'),
(12, 'Rosario', 13, 1200000, 'No recomendada', '1990-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
`id_pais` smallint(5) unsigned NOT NULL,
  `nombre_pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`) VALUES
(7, 'Argentina'),
(10, 'Bolivia'),
(8, 'Brasil'),
(9, 'Chile'),
(11, 'Rand McNally');

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE IF NOT EXISTS `provincias` (
`id_provincia` smallint(5) unsigned NOT NULL,
  `nombre_provincia` varchar(50) DEFAULT NULL,
  `id_pais` smallint(5) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `nombre_provincia`, `id_pais`) VALUES
(9, 'Buenos Aires', 7),
(14, 'Cordoba', 7),
(15, 'Entre Rios', 7),
(12, 'IV Region', 9),
(10, 'Parana', 8),
(11, 'Santa Catarina', 8),
(13, 'Santa Fe', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
 ADD PRIMARY KEY (`id_ciudad`), ADD UNIQUE KEY `unq_nombre_ciudad_provincia` (`nombre_ciudad`,`id_provincia`), ADD KEY `fk_ciudades_provincias` (`id_provincia`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
 ADD PRIMARY KEY (`id_pais`), ADD UNIQUE KEY `unq_nombre_pais` (`nombre_pais`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
 ADD PRIMARY KEY (`id_provincia`), ADD UNIQUE KEY `unq_nombre_provincia_id_pais` (`nombre_provincia`,`id_pais`), ADD KEY `fk_provincias_paises` (`id_pais`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ciudades`
--
ALTER TABLE `ciudades`
MODIFY `id_ciudad` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `paises`
--
ALTER TABLE `paises`
MODIFY `id_pais` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
MODIFY `id_provincia` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ciudades`
--
ALTER TABLE `ciudades`
ADD CONSTRAINT `fk_ciudades_provincias` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`);

--
-- Constraints for table `provincias`
--
ALTER TABLE `provincias`
ADD CONSTRAINT `fk_provincias_paises` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE CASCADE;