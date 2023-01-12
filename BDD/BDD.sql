-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour seed
CREATE DATABASE IF NOT EXISTS `seed` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `seed`;

-- Listage de la structure de table seed. comptes
CREATE TABLE IF NOT EXISTS `comptes` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table seed.comptes : ~0 rows (environ)

-- Listage de la structure de table seed. emprunts
CREATE TABLE IF NOT EXISTS `emprunts` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_type` enum('film','livre','jeu_video') NOT NULL,
  `utilisateur` int NOT NULL DEFAULT '0',
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `FK_emprunts_comptes` (`utilisateur`),
  CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `films` (`id`),
  CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `livres` (`id`),
  CONSTRAINT `emprunts_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `jeux_videos` (`id`),
  CONSTRAINT `FK_emprunts_comptes` FOREIGN KEY (`utilisateur`) REFERENCES `comptes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table seed.emprunts : ~0 rows (environ)

-- Listage de la structure de table seed. films
CREATE TABLE IF NOT EXISTS `films` (
  `id` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `annee` int NOT NULL,
  `genre` varchar(255) NOT NULL,
  `realisateur` varchar(255) NOT NULL,
  `acteurs` varchar(255) NOT NULL,
  `synopsis` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table seed.films : ~0 rows (environ)

-- Listage de la structure de table seed. jeux_videos
CREATE TABLE IF NOT EXISTS `jeux_videos` (
  `id` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `annee` int NOT NULL,
  `genre` varchar(255) NOT NULL,
  `editeur` varchar(255) NOT NULL,
  `plateforme` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table seed.jeux_videos : ~0 rows (environ)

-- Listage de la structure de table seed. livres
CREATE TABLE IF NOT EXISTS `livres` (
  `id` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `annee` int NOT NULL,
  `genre` varchar(255) NOT NULL,
  `resume` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table seed.livres : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
