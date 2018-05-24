-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 02 mai 2018 à 18:06
-- Version du serveur :  5.7.21
-- Version de PHP :  7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `nbFreeSeats` smallint(6) NOT NULL,
  `seatPrice` double NOT NULL,
  `takeOffTime` datetime NOT NULL,
  `publicationDate` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wasDone` tinyint(1) NOT NULL,
  `departure_id` int(11) NOT NULL,
  `arrival_id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plane_model`
--

CREATE TABLE `plane_model` (
  `id` int(11) NOT NULL,
  `model` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cruiseSpeed` smallint(6) NOT NULL,
  `planeNbSeats` smallint(6) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `plane_model`
--

INSERT INTO `plane_model` (`id`, `model`, `manufacturer`, `cruiseSpeed`, `planeNbSeats`, `isAvailable`) VALUES
(1, 'Alpha', 'Boeing', 1700, 78, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `nbReservedSeats` smallint(6) NOT NULL,
  `publicationDate` datetime NOT NULL,
  `wasDone` tinyint(1) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publicationDate` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `user_rated_id` int(11) NOT NULL,
  `review_author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `icao` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `creationDate` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `isACertifiedPilot` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `phoneNumber`, `birthDate`, `creationDate`, `note`, `isACertifiedPilot`) VALUES
(1, 'Xaviezr', 'Ling', '98179872', '2013-01-01', '2013-01-01 00:00:00', 5, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C257E60E7704ED06` (`departure_id`),
  ADD KEY `IDX_C257E60E62789708` (`arrival_id`),
  ADD KEY `IDX_C257E60EF53666A8` (`plane_id`),
  ADD KEY `IDX_C257E60ECE55439B` (`pilot_id`);

--
-- Index pour la table `plane_model`
--
ALTER TABLE `plane_model`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42C8495591F478C5` (`flight_id`),
  ADD KEY `IDX_42C849554502E565` (`passenger_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6AA3E2149` (`user_rated_id`),
  ADD KEY `IDX_794381C66184681A` (`review_author_id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `plane_model`
--
ALTER TABLE `plane_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK_C257E60E62789708` FOREIGN KEY (`arrival_id`) REFERENCES `site` (`id`),
  ADD CONSTRAINT `FK_C257E60E7704ED06` FOREIGN KEY (`departure_id`) REFERENCES `site` (`id`),
  ADD CONSTRAINT `FK_C257E60ECE55439B` FOREIGN KEY (`pilot_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C257E60EF53666A8` FOREIGN KEY (`plane_id`) REFERENCES `plane_model` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C849554502E565` FOREIGN KEY (`passenger_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_42C8495591F478C5` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C66184681A` FOREIGN KEY (`review_author_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_794381C6AA3E2149` FOREIGN KEY (`user_rated_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
