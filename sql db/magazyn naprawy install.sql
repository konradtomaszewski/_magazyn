-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Kwi 2018, 08:40
-- Wersja serwera: 10.1.25-MariaDB
-- Wersja PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Baza danych: `mennica_magazyn`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `repair_devices`
--

CREATE TABLE `repair_devices` (
  `id` int(11) NOT NULL,
  `start_repair_datetime` datetime NOT NULL,
  `end_repair_datetime` datetime DEFAULT NULL,
  `repair_user_id` int(2) NOT NULL,
  `damaged_devices_id` int(11) NOT NULL,
  `service_request_id` int(11) NOT NULL,
  `real_time_repair` varchar(3) COLLATE latin2_bin NOT NULL,
  `repair_description` text COLLATE latin2_bin NOT NULL,
  `repair_status_id` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `repair_devices_id`
--

CREATE TABLE `repair_devices_id` (
  `id` int(2) NOT NULL,
  `product_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `repair_devices_id`
--

INSERT INTO `repair_devices_id` (`id`, `product_id`) VALUES
(1, 148),
(2, 167),
(3, 249),
(4, 243),
(5, 144),
(6, 145),
(7, 146);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `repair_status`
--

CREATE TABLE `repair_status` (
  `id` int(1) NOT NULL,
  `description` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `repair_status`
--

INSERT INTO `repair_status` (`id`, `description`) VALUES
(1, 'Realizowana'),
(2, 'Zakoñczona');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `repair_devices`
--
ALTER TABLE `repair_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repair_devices_id`
--
ALTER TABLE `repair_devices_id`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repair_status`
--
ALTER TABLE `repair_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `repair_devices`
--
ALTER TABLE `repair_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT dla tabeli `repair_devices_id`
--
ALTER TABLE `repair_devices_id`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT dla tabeli `repair_status`
--
ALTER TABLE `repair_status`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;
