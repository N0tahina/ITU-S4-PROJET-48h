-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 11 juil. 2023 à 16:24
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aliment`
--

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

CREATE TABLE `composant` (
  `id_composant` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `composition`
--

CREATE TABLE `composition` (
  `id_composition` int(11) NOT NULL,
  `id_plat` int(11) DEFAULT NULL,
  `id_composant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `taille` float DEFAULT NULL,
  `poids` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `details`
--

INSERT INTO `details` (`id`, `id_user`, `genre`, `age`, `taille`, `poids`) VALUES
(1, 1, 1, 19, 160, 62),
(2, 2, 1, 18, 1636, 68),
(3, 3, 0, 20, 164, 59),
(4, 4, 0, 17, 158, 70);

-- --------------------------------------------------------

--
-- Structure de la table `exercices`
--

CREATE TABLE `exercices` (
  `id_exercice` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `exercices`
--

INSERT INTO `exercices` (`id_exercice`, `nom`, `categorie`) VALUES
(1, 'sport_mampitombo1', 2),
(2, 'sport_mampitombo2', 2),
(3, 'sport_mampitombo3', 2),
(4, 'sport_mampitombo4', 2),
(5, 'sport_mampihena1', 0),
(6, 'sport_mampihena2', 0),
(7, 'sport_mampihena3', 0),
(8, 'sport_mampihena4', 0);

-- --------------------------------------------------------

--
-- Structure de la table `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `pourcentage` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `info`
--

INSERT INTO `info` (`id_info`, `nom`, `pourcentage`) VALUES
(1, 'aliment', 30),
(2, 'sport', 70);

-- --------------------------------------------------------

--
-- Structure de la table `monnaie`
--

CREATE TABLE `monnaie` (
  `id_monnaie` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `etat` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `monnaie`
--

INSERT INTO `monnaie` (`id_monnaie`, `code`, `valeur`, `etat`) VALUES
(1, 'SFSFW', 10000, 1),
(2, 'GDBJS', 20000, 0),
(3, 'OKHGV', 30000, 0),
(4, 'AXSCD', 40000, 0),
(5, 'QWERT', 50000, 0),
(6, 'CVBNG', 60000, 0),
(7, 'LMKNJ', 70000, 0),
(8, 'RFVTG', 80000, 0),
(9, 'POIUY', 90000, 0),
(10, 'GVFCR', 100000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id_plat` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom`, `prix`, `categorie`) VALUES
(1, 'plat_mampitombo1', 12000, 2),
(2, 'plat_mampitombo2', 15000, 2),
(3, 'plat_mampitombo3', 16000, 2),
(4, 'plat_mampitombo4', 17000, 2),
(5, 'plat_mampihena1', 11000, 0),
(6, 'plat_mampihena2', 10000, 0),
(7, 'plat_mampihena3', 9000, 0),
(8, 'plat_mampihena4', 8000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `regime`
--

CREATE TABLE `regime` (
  `id_regime` int(11) NOT NULL,
  `categorie` int(11) DEFAULT NULL,
  `min_poids` float DEFAULT NULL,
  `max_poids` float DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `regime`
--

INSERT INTO `regime` (`id_regime`, `categorie`, `min_poids`, `max_poids`, `nom`) VALUES
(1, 2, 0, 5, 'regime_mampitombo1'),
(2, 2, 5, 20, 'regime_mampitombo2'),
(3, 2, 20, 50, 'regime_mampitombo3'),
(4, 0, 0, 5, 'regime_mampihena1'),
(5, 0, 5, 20, 'regime_mampihena2'),
(6, 0, 20, 50, 'regime_mampihena3');

-- --------------------------------------------------------

--
-- Structure de la table `regime_plats`
--

CREATE TABLE `regime_plats` (
  `id_regime_plats` int(11) NOT NULL,
  `idregime` int(11) DEFAULT NULL,
  `idplat` int(11) DEFAULT NULL,
  `moment` int(11) DEFAULT NULL,
  `jour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `regime_plats`
--

INSERT INTO `regime_plats` (`id_regime_plats`, `idregime`, `idplat`, `moment`, `jour`) VALUES
(1, 1, 4, 0, 1),
(2, 1, 1, 1, 1),
(3, 1, 2, 2, 1),
(4, 1, 3, 0, 2),
(5, 1, 4, 1, 2),
(6, 1, 1, 0, 3),
(7, 1, 2, 1, 3),
(8, 1, 1, 2, 3),
(9, 1, 4, 0, 4),
(10, 1, 3, 1, 4),
(11, 1, 4, 2, 4),
(12, 1, 2, 0, 5),
(13, 1, 1, 1, 5),
(14, 1, 3, 2, 5),
(15, 1, 2, 0, 6),
(16, 1, 3, 1, 6),
(17, 1, 4, 0, 7),
(18, 1, 1, 1, 7),
(19, 1, 2, 0, 1),
(20, 1, 3, 1, 1),
(21, 1, 4, 2, 1),
(22, 2, 1, 0, 1),
(23, 2, 2, 1, 1),
(24, 2, 3, 2, 2),
(25, 2, 4, 0, 2),
(26, 2, 4, 1, 2),
(27, 2, 3, 0, 3),
(28, 2, 2, 1, 3),
(29, 2, 1, 2, 3),
(30, 2, 2, 0, 4),
(31, 2, 1, 1, 4),
(32, 2, 4, 2, 4),
(33, 2, 2, 0, 5),
(34, 2, 1, 1, 5),
(35, 2, 3, 2, 5),
(36, 3, 5, 0, 1),
(37, 3, 6, 1, 1),
(38, 3, 8, 2, 2),
(39, 3, 7, 0, 2),
(40, 3, 8, 1, 2),
(41, 3, 5, 0, 3),
(42, 3, 6, 1, 3),
(43, 3, 7, 2, 3),
(44, 3, 8, 0, 4),
(45, 3, 6, 1, 4),
(46, 3, 5, 2, 4),
(47, 3, 6, 0, 5),
(48, 3, 7, 1, 5),
(49, 3, 8, 2, 5),
(50, 3, 6, 1, 6),
(51, 3, 7, 2, 6),
(52, 4, 5, 0, 1),
(53, 4, 6, 1, 1),
(54, 4, 8, 2, 1),
(55, 4, 6, 0, 2),
(56, 4, 8, 1, 2),
(57, 4, 7, 2, 2),
(58, 4, 6, 0, 3),
(59, 4, 7, 1, 3),
(60, 4, 5, 2, 3),
(61, 4, 6, 0, 4),
(62, 4, 5, 1, 4),
(63, 4, 8, 2, 4),
(64, 4, 7, 0, 5),
(65, 4, 8, 1, 5),
(66, 4, 6, 2, 5),
(67, 4, 7, 0, 6),
(68, 4, 8, 1, 6),
(69, 4, 6, 2, 6),
(70, 4, 7, 0, 7),
(71, 4, 8, 1, 7),
(72, 4, 6, 2, 7),
(73, 4, 7, 0, 1),
(74, 4, 8, 1, 1),
(75, 4, 6, 2, 2),
(76, 4, 7, 0, 2),
(77, 4, 8, 1, 2),
(78, 4, 6, 2, 3),
(79, 4, 7, 0, 3),
(80, 4, 8, 1, 3),
(81, 4, 6, 0, 4),
(82, 4, 7, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id_sport` int(11) NOT NULL,
  `categorie` int(11) DEFAULT NULL,
  `min_poids` float DEFAULT NULL,
  `max_poids` float DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id_sport`, `categorie`, `min_poids`, `max_poids`, `nom`) VALUES
(1, 2, 0, 5, 'sport_mampitombo1'),
(2, 2, 5, 10, 'sport_mampitombo2'),
(3, 2, 10, 15, 'sport_mampitombo3'),
(4, 2, 15, 20, 'sport_mampitombo4'),
(5, 2, 20, 30, 'sport_mampitombo5'),
(6, 0, 0, 5, 'sport_mampihena1'),
(7, 0, 5, 10, 'sport_mampihena2'),
(8, 0, 10, 15, 'sport_mampihena3'),
(9, 0, 15, 20, 'sport_mampihena4'),
(10, 0, 20, 30, 'sport_mampihena5');

-- --------------------------------------------------------

--
-- Structure de la table `sport_exercice`
--

CREATE TABLE `sport_exercice` (
  `id_sport_exercice` int(11) NOT NULL,
  `idsport` int(11) DEFAULT NULL,
  `idexercice` int(11) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sport_exercice`
--

INSERT INTO `sport_exercice` (`id_sport_exercice`, `idsport`, `idexercice`, `duree`) VALUES
(1, 1, 1, 15),
(2, 2, 1, 20),
(3, 2, 2, 30),
(4, 3, 1, 25),
(5, 3, 2, 10),
(6, 3, 3, 33),
(7, 6, 5, 27),
(8, 7, 5, 5),
(9, 7, 6, 23),
(10, 8, 5, 45),
(11, 8, 6, 30),
(12, 8, 7, 20);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass_word` varchar(8) DEFAULT NULL,
  `is_admin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `nickname`, `email`, `pass_word`, `is_admin`) VALUES
(1, 'pseudo1', 'un@gmail.com', 'un', 0),
(2, 'pseudo2', 'deux@gmail.com', 'deux', 1),
(3, 'pseudo3', 'trois@gmail.com', 'trois', 0),
(4, 'pseudo4', 'quatre@gmail.com', 'quatre', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_monnaie`
--

CREATE TABLE `user_monnaie` (
  `id_user_monnaie` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_monnaie` int(11) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_monnaie`
--

INSERT INTO `user_monnaie` (`id_user_monnaie`, `id_user`, `id_monnaie`, `etat`) VALUES
(1, 0, 1, 2),
(2, 1, 1, 1),
(3, 1, 1, 2);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_regime_plats`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_regime_plats` (
`id_regime_plats` int(11)
,`moment` int(11)
,`id_plat` int(11)
,`nom` varchar(20)
,`prix` double
,`categorie` int(11)
,`id_regime` int(11)
,`categorie_regime` int(11)
,`min_poids` float
,`max_poids` float
,`nom_regime` varchar(20)
,`jour` int(11)
,`duree` bigint(21)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_sport_exercice`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_sport_exercice` (
`id_sport_exercice` int(11)
,`duree` int(11)
,`id_exercice` int(11)
,`nom` varchar(20)
,`categorie` int(11)
,`id_sport` int(11)
,`categorie_sport` int(11)
,`min_poids` float
,`max_poids` float
,`nom_sport` varchar(20)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_users_detail`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_users_detail` (
`id_user` int(11)
,`nickname` varchar(20)
,`email` varchar(100)
,`pass_word` varchar(8)
,`is_admin` int(11)
,`id` int(11)
,`genre` int(11)
,`age` int(11)
,`taille` float
,`poids` float
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_user_monnaie`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_user_monnaie` (
`id_user_monnaie` int(11)
,`id_user` int(11)
,`nickname` varchar(20)
,`id_monnaie` int(11)
,`code` varchar(5)
,`valeur` double
,`etat` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_regime_plats`
--
DROP TABLE IF EXISTS `v_regime_plats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_regime_plats`  AS  select `regime_plats`.`id_regime_plats` AS `id_regime_plats`,`regime_plats`.`moment` AS `moment`,`plat`.`id_plat` AS `id_plat`,`plat`.`nom` AS `nom`,`plat`.`prix` AS `prix`,`plat`.`categorie` AS `categorie`,`regime`.`id_regime` AS `id_regime`,`regime`.`categorie` AS `categorie_regime`,`regime`.`min_poids` AS `min_poids`,`regime`.`max_poids` AS `max_poids`,`regime`.`nom` AS `nom_regime`,`regime_plats`.`jour` AS `jour`,(select count(`regime_plats`.`idplat`) from `regime_plats` where `regime_plats`.`moment` = 0 and `regime_plats`.`idregime` = `regime`.`id_regime`) AS `duree` from ((`regime_plats` join `regime` on(`regime_plats`.`idregime` = `regime`.`id_regime`)) join `plat` on(`regime_plats`.`idplat` = `plat`.`id_plat`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_sport_exercice`
--
DROP TABLE IF EXISTS `v_sport_exercice`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sport_exercice`  AS  select `sport_exercice`.`id_sport_exercice` AS `id_sport_exercice`,`sport_exercice`.`duree` AS `duree`,`exercices`.`id_exercice` AS `id_exercice`,`exercices`.`nom` AS `nom`,`exercices`.`categorie` AS `categorie`,`sport`.`id_sport` AS `id_sport`,`sport`.`categorie` AS `categorie_sport`,`sport`.`min_poids` AS `min_poids`,`sport`.`max_poids` AS `max_poids`,`sport`.`nom` AS `nom_sport` from ((`sport_exercice` join `sport` on(`sport_exercice`.`idsport` = `sport`.`id_sport`)) join `exercices` on(`sport_exercice`.`idexercice` = `exercices`.`id_exercice`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_users_detail`
--
DROP TABLE IF EXISTS `v_users_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_users_detail`  AS  select `users`.`id_user` AS `id_user`,`users`.`nickname` AS `nickname`,`users`.`email` AS `email`,`users`.`pass_word` AS `pass_word`,`users`.`is_admin` AS `is_admin`,`details`.`id` AS `id`,`details`.`genre` AS `genre`,`details`.`age` AS `age`,`details`.`taille` AS `taille`,`details`.`poids` AS `poids` from (`details` join `users` on(`details`.`id_user` = `users`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_user_monnaie`
--
DROP TABLE IF EXISTS `v_user_monnaie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_monnaie`  AS  select `user_monnaie`.`id_user_monnaie` AS `id_user_monnaie`,`user_monnaie`.`id_user` AS `id_user`,`users`.`nickname` AS `nickname`,`monnaie`.`id_monnaie` AS `id_monnaie`,`monnaie`.`code` AS `code`,`monnaie`.`valeur` AS `valeur`,`user_monnaie`.`etat` AS `etat` from ((`monnaie` join `user_monnaie` on(`user_monnaie`.`id_monnaie` = `monnaie`.`id_monnaie`)) join `users` on(`users`.`id_user` = `user_monnaie`.`id_user`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `composant`
--
ALTER TABLE `composant`
  ADD PRIMARY KEY (`id_composant`);

--
-- Index pour la table `composition`
--
ALTER TABLE `composition`
  ADD PRIMARY KEY (`id_composition`),
  ADD KEY `id_plat` (`id_plat`),
  ADD KEY `id_composant` (`id_composant`);

--
-- Index pour la table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `exercices`
--
ALTER TABLE `exercices`
  ADD PRIMARY KEY (`id_exercice`);

--
-- Index pour la table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Index pour la table `monnaie`
--
ALTER TABLE `monnaie`
  ADD PRIMARY KEY (`id_monnaie`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id_plat`);

--
-- Index pour la table `regime`
--
ALTER TABLE `regime`
  ADD PRIMARY KEY (`id_regime`);

--
-- Index pour la table `regime_plats`
--
ALTER TABLE `regime_plats`
  ADD PRIMARY KEY (`id_regime_plats`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_sport`);

--
-- Index pour la table `sport_exercice`
--
ALTER TABLE `sport_exercice`
  ADD PRIMARY KEY (`id_sport_exercice`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `user_monnaie`
--
ALTER TABLE `user_monnaie`
  ADD PRIMARY KEY (`id_user_monnaie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `composant`
--
ALTER TABLE `composant`
  MODIFY `id_composant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `composition`
--
ALTER TABLE `composition`
  MODIFY `id_composition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `exercices`
--
ALTER TABLE `exercices`
  MODIFY `id_exercice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `monnaie`
--
ALTER TABLE `monnaie`
  MODIFY `id_monnaie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `id_plat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `regime`
--
ALTER TABLE `regime`
  MODIFY `id_regime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `regime_plats`
--
ALTER TABLE `regime_plats`
  MODIFY `id_regime_plats` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `sport`
--
ALTER TABLE `sport`
  MODIFY `id_sport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `sport_exercice`
--
ALTER TABLE `sport_exercice`
  MODIFY `id_sport_exercice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user_monnaie`
--
ALTER TABLE `user_monnaie`
  MODIFY `id_user_monnaie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `composition_ibfk_1` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`),
  ADD CONSTRAINT `composition_ibfk_2` FOREIGN KEY (`id_composant`) REFERENCES `composant` (`id_composant`);

--
-- Contraintes pour la table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
