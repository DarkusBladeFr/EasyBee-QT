-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 19 mai 2023 à 20:24
-- Version du serveur : 8.0.32
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `easybeebdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
(1, 'ruches'),
(2, 'ruchettes'),
(3, 'combinaisons'),
(4, 'pots'),
(5, 'cires'),
(6, 'enfumoirs'),
(7, 'accessoires'),
(8, 'extracteurs à miel'),
(9, 'robinets'),
(10, 'mise en pot'),
(11, 'nourrisseurs');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `idUtilisateur` int NOT NULL,
  `etatCommande` int NOT NULL,
  `prixTotal` float DEFAULT '0',
  PRIMARY KEY (`idCommande`),
  KEY `etatCommande` (`etatCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

DROP TABLE IF EXISTS `detailcommande`;
CREATE TABLE IF NOT EXISTS `detailcommande` (
  `id_commande` int NOT NULL,
  `id_produit` int NOT NULL,
  `quantiteNecessaire` int DEFAULT NULL,
  `quantitePlacee` int DEFAULT '0',
  `prixLigne` float DEFAULT '0',
  `id_utilisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_commande`,`id_produit`),
  KEY `id_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etatcommande`
--

DROP TABLE IF EXISTS `etatcommande`;
CREATE TABLE IF NOT EXISTS `etatcommande` (
  `id` int NOT NULL,
  `libelle` varchar(4) COLLATE utf8mb3_bin NOT NULL,
  `signification` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `etatcommande`
--

INSERT INTO `etatcommande` (`id`, `libelle`, `signification`) VALUES
(1, 'AT', 'en attente de réception : les produits n’ont pas été livrés.'),
(2, 'RT', 'réception complète : tous les produits commandés ont été réceptionnés.'),
(3, 'RP', 'réception partielle : certains produits de la commande n’ont toujours pas été livrés.'),
(4, 'EP', 'en attente de paiement : tous les produits ont été livrés. La facture n’est toujours pas réglée.'),
(5, 'CL', 'commande clôturée – la facture est réglée.');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomFournisseur` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `mail` varchar(40) COLLATE utf8mb3_bin NOT NULL,
  `tel` int NOT NULL,
  `adresse` int NOT NULL,
  `CP` int NOT NULL,
  `ville` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nomFournisseur`, `mail`, `tel`, `adresse`, `CP`, `ville`) VALUES
(1, 'Fournisseur 1', 'fournisseur1@mail.com', 123456789, 123, 45678, 'Paris'),
(2, 'Fournisseur 2', 'fournisseur2@mail.com', 234567890, 456, 78901, 'Lyon'),
(3, 'Fournisseur 3', 'fournisseur3@mail.com', 345678901, 789, 12345, 'Marseille'),
(4, 'Fournisseur 4', 'fournisseur4@mail.com', 456789012, 159, 35791, 'Toulouse'),
(5, 'Fournisseur 5', 'fournisseur5@mail.com', 567890123, 753, 15964, 'Bordeaux'),
(6, 'Fournisseur 6', 'fournisseur6@mail.com', 678901234, 246, 80235, 'Rennes'),
(7, 'Fournisseur 7', 'fournisseur7@mail.com', 789012345, 802, 46801, 'Nantes'),
(8, 'Fournisseur 8', 'fournisseur8@mail.com', 890123456, 357, 91357, 'Lille'),
(9, 'Fournisseur 9', 'fournisseur9@mail.com', 901234567, 468, 24680, 'Strasbourg'),
(10, 'Fournisseur 10', 'fournisseur10@mail.com', 12345678, 913, 57913, 'Montpellier');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codeProduit` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `idCategorie` int NOT NULL,
  `designationProduit` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `stockMag` int NOT NULL,
  `stockRes` int NOT NULL,
  `stockMinMag` int NOT NULL,
  `stockMinRes` int NOT NULL,
  `prixUnitaire` float NOT NULL,
  `tauxTVA` float NOT NULL,
  `selection` int NOT NULL,
  `stockMinEntrepot` int NOT NULL,
  `stockEntrepot` int NOT NULL,
  `id_fournisseur` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategorie` (`idCategorie`),
  KEY `id_fournisseur` (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `codeProduit`, `idCategorie`, `designationProduit`, `stockMag`, `stockRes`, `stockMinMag`, `stockMinRes`, `prixUnitaire`, `tauxTVA`, `selection`, `stockMinEntrepot`, `stockEntrepot`, `id_fournisseur`) VALUES
(1, '065-1100', 1, 'Ruche vitrée Dadant 10 cadres', 1, 1, 2, 2, 212, 0.055, 0, 4, 0, 1),
(2, '065-4150', 1, 'Ruche en paille diam. 45cm', 3, 2, 2, 2, 40, 0.055, 0, 4, 3, 1),
(3, '065-0160', 1, 'Ruche chalet Dadant 10 cadres filés', 1, 1, 1, 1, 123, 0.055, 0, 2, 0, 2),
(4, '060-0350', 2, 'Ruchette Dadant 6 cadres polystyrène HD avec Nourr', 2, 6, 4, 2, 46, 0.055, 0, 6, 0, 3),
(5, '110-0650', 2, 'Ruchette  fécondation Quadri Hives polystyrène HD', 6, 1, 2, 2, 106, 0.055, 0, 4, 0, 4),
(6, 'XXX-RANGEC', 7, 'Range cadre', 9, 10, 5, 5, 15, 0.055, 0, 10, 10, 4),
(7, '100-2375_A2', 3, 'Combinaison Air\'3D Cosmonaute', 5, 3, 3, 3, 124, 0.055, 0, 6, 6, 5),
(8, '500-P110_A4_09', 3, 'Kit Rucher', 2, 2, 2, 2, 89, 0.055, 0, 4, 4, 6),
(9, '243-1450_OR', 4, '12 pots verre 250 g (212 ml) avec couvercles TO 63', 17, 4, 10, 4, 5.9, 0.055, 0, 14, 14, 7),
(10, '248-0700_AR', 4, '48 pots verre 40g (41ml) avec couvercles TO 43', 6, 12, 4, 10, 20.9, 0.055, 0, 14, 14, 8),
(11, '010-0100', 5, '10 feuilles de cire d\'abeille gaufrées Dadant corps Sélection', 35, 11, 35, 10, 19.85, 0.055, 0, 45, 40, 9),
(12, '900-0100', 5, 'Pain de cire d\'abeille 400g', 35, 10, 35, 10, 5.9, 0.055, 0, 45, 45, 10);

-- --------------------------------------------------------

--
-- Structure de la table `typeutilisateur`
--

DROP TABLE IF EXISTS `typeutilisateur`;
CREATE TABLE IF NOT EXISTS `typeutilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `typeutilisateur`
--

INSERT INTO `typeutilisateur` (`id`, `libelle`) VALUES
(1, 'gerant'),
(2, 'assistante de direction'),
(3, 'receptionniste entrepot'),
(4, 'admin'),
(5, 'exclu'),
(6, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `nom` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `prenom` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `motdepasse` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `typeUtilisateur` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeUtilisateur` (`typeUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`nom`, `prenom`, `motdepasse`, `typeUtilisateur`, `id`, `identifiant`) VALUES
('Edward', 'Richtofen', 'gerant1234', 1, 1, 'gerant1234'),
('Coward', 'Rodriguez', 'assistance1234', 2, 2, 'assistance1234'),
('Polo', 'Marco', 'reception1234', 3, 3, 'reception1234'),
('Andrieu', 'Thomas', 'root', 4, 4, 'admin'),
('kicked', 'banned', 'exclu1234', 5, 5, 'exclu1234'),
('client1secondname', 'client1firstname', 'client1234', 6, 6, 'client1234');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`etatCommande`) REFERENCES `etatcommande` (`id`);

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `detailcommande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`idCommande`),
  ADD CONSTRAINT `detailcommande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`typeUtilisateur`) REFERENCES `typeutilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
