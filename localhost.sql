-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 23 fév. 2025 à 20:11
-- Version du serveur : 10.11.6-MariaDB-0+deb12u1
-- Version de PHP : 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `amzz2427862`
--
CREATE DATABASE IF NOT EXISTS `cloudbox` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cloudbox`;

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `upload_date` timestamp NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `file_content`
--

CREATE TABLE `file_content` (
  `file_id` int(11) NOT NULL,
  `content` longblob DEFAULT NULL,
  `uploaded_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `file_summary`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `file_summary` (
`id` int(11)
,`user_id` int(11)
,`filename` varchar(255)
,`file_type` varchar(100)
,`file_size` bigint(20)
,`upload_date` timestamp
,`username` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `attempt_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(40) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `verification_code` varchar(6) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `username`, `password`, `birthdate`, `phone`, `country`, `bio`, `created_at`, `verification_code`, `verified`) VALUES
(67, 'amine bel', 'aminoxu12@gmail.com', 'amine', '23bc6df7647b818d79ce7fc43fa0f460c188205a', '2025-02-01', '0707864438', 'USA', '', '2025-02-20 15:05:03', '', 1),
(68, 'amine bel', 'aminox1307@live.fr', 'amine2', '23bc6df7647b818d79ce7fc43fa0f460c188205a', '2025-02-01', '0707864438', 'USA', '', '2025-02-20 15:09:15', '275764', 0),
(70, 'amine bel', 'aminoxu@gmail.com', 'admin1', '23bc6df7647b818d79ce7fc43fa0f460c188205a', '2025-02-02', '0707864438', 'USA', '', '2025-02-20 23:43:34', '990111', 0),
(71, 'Simohamed hdafa', 'simohamed.hdafa.pro25@gmail.com', 'Simo', 'd6f6f42fd390dca72946dd9fbc43a2ba94bb0488', '1986-06-21', '0621211737', 'USA', 'About yourself', '2025-02-21 12:52:28', '275126', 0),
(73, 'Ajoff', 'djjdjd@fjfi.com', 'amz', '013564dc05c22e397a30d38805fae295ef8cb4cc', '2025-02-12', '707864438', 'CA', '', '2025-02-21 12:54:11', '456072', 0),
(74, 'mrabet mohamed ', 'smrabeth@gmail.com', 'mrabet', 'f3f58c2230c994bf0cdd5db609ffac8b68cb7570', '2025-02-01', '0707864438', 'USA', 'i am dark', '2025-02-21 15:39:04', '', 1);

-- --------------------------------------------------------

--
-- Structure de la vue `file_summary`
--
DROP TABLE IF EXISTS `file_summary`;


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_filename` (`filename`);

--
-- Index pour la table `file_content`
--
ALTER TABLE `file_content`
  ADD PRIMARY KEY (`file_id`);

--
-- Index pour la table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `file_content`
--
ALTER TABLE `file_content`
  ADD CONSTRAINT `file_content_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
