-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Wrz 2016, 14:30
-- Wersja serwera: 10.1.13-MariaDB
-- Wersja PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mennica_magazyn`
--
CREATE DATABASE IF NOT EXISTS `mennica_magazyn` DEFAULT CHARACTER SET latin2 COLLATE latin2_bin;
USE `mennica_magazyn`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arrival_items`
--

CREATE TABLE `arrival_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `arrival_id` int(11) NOT NULL,
  `arrival_type_id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `arrival_items`
--

INSERT INTO `arrival_items` (`id`, `product_id`, `quantity`, `arrival_id`, `arrival_type_id`, `storage_id`) VALUES
(1, 43, 10, 1, 1, 1),
(2, 43, -2, 2, 2, 1),
(3, 43, 1, 3, 3, 1),
(4, 17, 3, 4, 1, 1),
(5, 27, 10, 4, 1, 1),
(6, 64, 5, 4, 1, 1),
(7, 17, 3, 5, 1, 2),
(8, 27, 12, 5, 1, 2),
(9, 43, 20, 5, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arrival_products_temp`
--

CREATE TABLE `arrival_products_temp` (
  `item_name` varchar(255) COLLATE latin2_bin NOT NULL,
  `item_sn` varchar(20) COLLATE latin2_bin NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_product_id` int(11) NOT NULL,
  `document_name` varchar(20) COLLATE latin2_bin NOT NULL,
  `storage_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arrival_types`
--

CREATE TABLE `arrival_types` (
  `id` int(1) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `arrival_types`
--

INSERT INTO `arrival_types` (`id`, `name`) VALUES
(1, 'Dostawa'),
(2, 'Transfer wydany'),
(3, 'Zwrot na magazyn');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arrivals`
--

CREATE TABLE `arrivals` (
  `id` int(11) NOT NULL,
  `arrival_type_id` int(11) NOT NULL,
  `document_name` varchar(255) COLLATE latin2_bin NOT NULL,
  `storage_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `accept_user_id` int(11) DEFAULT NULL,
  `release_user_id` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `accept_date` datetime NOT NULL,
  `release_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `arrivals`
--

INSERT INTO `arrivals` (`id`, `arrival_type_id`, `document_name`, `storage_id`, `create_user_id`, `accept_user_id`, `release_user_id`, `create_date`, `accept_date`, `release_date`) VALUES
(1, 1, 'WAR/dostawa1', 1, 1, 2, NULL, '2016-09-26 11:48:44', '2016-09-26 11:49:10', '0000-00-00 00:00:00'),
(2, 2, 'WAR/wydanie1', 1, 2, NULL, 3, '2016-09-26 11:50:06', '0000-00-00 00:00:00', '2016-09-26 11:50:06'),
(3, 3, 'WAR/zwrot1', 1, 2, 2, NULL, '2016-09-26 11:51:25', '2016-09-26 11:51:25', '0000-00-00 00:00:00'),
(4, 1, 'WAR/Dostawa2', 1, 1, 2, NULL, '2016-09-27 09:53:43', '2016-09-27 09:54:10', '0000-00-00 00:00:00'),
(5, 1, 'WRO/Dostawa1', 2, 1, 2, NULL, '2016-09-27 09:57:34', '2016-09-27 09:58:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `automat_type`
--

CREATE TABLE `automat_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `automat_type`
--

INSERT INTO `automat_type` (`id`, `name`) VALUES
(1, 'stacjonarny - S&B'),
(2, 'mobilny - BM 101');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sn` varchar(255) COLLATE latin2_bin NOT NULL,
  `arrival_id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `product_status_id` int(11) NOT NULL,
  `product_status_change_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `sn`, `arrival_id`, `storage_id`, `product_status_id`, `product_status_change_datetime`) VALUES
(1, 43, '', 1, 1, 1, '2016-09-26 11:49:10'),
(2, 43, '', 2, 1, 2, '2016-09-26 11:50:06'),
(3, 43, '', 3, 1, 3, '2016-09-26 11:51:25'),
(4, 64, '', 4, 1, 1, '2016-09-27 09:54:10'),
(5, 27, '', 4, 1, 1, '2016-09-27 09:54:10'),
(6, 17, 'qwe123', 4, 1, 1, '2016-09-27 09:54:10'),
(7, 17, 'asd123', 4, 1, 1, '2016-09-27 09:54:10'),
(8, 17, 'zxc123', 4, 1, 1, '2016-09-27 09:54:10'),
(9, 27, '', 5, 2, 1, '2016-09-27 09:58:07'),
(10, 43, '', 5, 2, 1, '2016-09-27 09:58:07'),
(11, 17, 'qaz213', 5, 2, 1, '2016-09-27 09:58:07'),
(12, 17, 'wsx213', 5, 2, 1, '2016-09-27 09:58:07'),
(13, 17, 'edc123', 5, 2, 1, '2016-09-27 09:58:07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_status`
--

CREATE TABLE `product_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `product_status`
--

INSERT INTO `product_status` (`id`, `name`) VALUES
(1, 'Zatwierdzono na magazyn'),
(2, 'Wydano z magazynu'),
(3, 'Zwrócono na magazyn');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL,
  `automat_type` varchar(255) COLLATE latin2_bin NOT NULL,
  `sn_required` varchar(255) COLLATE latin2_bin NOT NULL,
  `is_active` enum('0','1') COLLATE latin2_bin NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `name`, `automat_type`, `sn_required`, `is_active`) VALUES
(1, 'akceptor ( wlot )', 'stacjonarny - S&B', '', '1'),
(2, 'antena coin box', 'stacjonarny - S&B', '', '1'),
(3, 'antena mifare', 'stacjonarny - S&B', '', '1'),
(4, 'Artema (mobilna)', 'stacjonarny - S&B', '', '1'),
(5, 'Artema (stacjonarna)', 'stacjonarny - S&B', '', '1'),
(6, 'Battery Pack', 'stacjonarny - S&B', '', '1'),
(7, 'BNA', 'stacjonarny - S&B', '', '1'),
(8, 'CM 0,1 zł', 'stacjonarny - S&B', '', '1'),
(9, 'CM 0,2 zł', 'stacjonarny - S&B', '', '1'),
(10, 'CM 0,5 zł', 'stacjonarny - S&B', '', '1'),
(11, 'CM 1,0 zł', 'stacjonarny - S&B', '', '1'),
(12, 'CM 2,0 zł', 'stacjonarny - S&B', '', '1'),
(13, 'CM 5,0 zł', 'stacjonarny - S&B', '', '1'),
(14, 'CR (manualny)', 'stacjonarny - S&B', '', '1'),
(15, 'CR automatyczny', 'stacjonarny - S&B', '', '1'),
(16, 'Czujnik zmierzchowy', 'stacjonarny - S&B', '', '1'),
(17, 'drukarka (Thino)', 'stacjonarny - S&B', 'required', '1'),
(18, 'HDD', 'stacjonarny - S&B', '', '1'),
(19, 'Hopper (0,1)', 'stacjonarny - S&B', '', '1'),
(20, 'Hopper (1,0)', 'stacjonarny - S&B', '', '1'),
(21, 'Hopper (5,0)', 'stacjonarny - S&B', '', '1'),
(22, 'karta flash', 'stacjonarny - S&B', '', '1'),
(23, 'Karta SaM MIFARE', 'stacjonarny - S&B', '', '1'),
(24, 'karta sam zestaw płatniczy', 'stacjonarny - S&B', '', '1'),
(25, 'LCD', 'stacjonarny - S&B', '', '1'),
(26, 'mifare', 'stacjonarny - S&B', '', '1'),
(27, 'modem', 'stacjonarny - S&B', '', '1'),
(28, 'Nagrzewnica', 'stacjonarny - S&B', '', '1'),
(29, 'panel wewnętrzny', 'stacjonarny - S&B', '', '1'),
(30, 'PC', 'stacjonarny - S&B', '', '1'),
(31, 'pinpad', 'stacjonarny - S&B', '', '1'),
(32, 'Płyta backplan', 'stacjonarny - S&B', '', '1'),
(33, 'płyta pod CM', 'stacjonarny - S&B', '', '1'),
(34, 'płyta za ACM', 'stacjonarny - S&B', '', '1'),
(35, 'płytka do powerbox', 'stacjonarny - S&B', '', '1'),
(36, 'przejściówka do modemu', 'stacjonarny - S&B', '', '1'),
(37, 'przetwornica PCMDS60 24S12W', 'stacjonarny - S&B', '', '1'),
(38, 'Router RUT500', 'stacjonarny - S&B', '', '1'),
(39, 'sortownik', 'stacjonarny - S&B', '', '1'),
(40, 'sterownik drukarki', 'stacjonarny - S&B', '', '1'),
(41, 'VIVOpay Kiosk II', 'stacjonarny - S&B', '', '1'),
(42, 'walidator (NRI)', 'stacjonarny - S&B', '', '1'),
(43, 'zasilacz', 'stacjonarny - S&B', '', '1'),
(44, 'ZCGVA', 'stacjonarny - S&B', '', '1'),
(45, 'Komputer AEON EMB-CV1-A11 Mini-ITX', 'stacjonarny - BS 201', '', '1'),
(46, 'Artema PinPad', 'stacjonarny - BS 201', '', '1'),
(47, 'antena VIVO', 'stacjonarny - BS 201', '', '1'),
(48, 'Czytnik  artema  P167', 'stacjonarny - BS 201', '', '1'),
(49, 'Grzejnik z dmuchawą', 'stacjonarny - BS 201', '', '1'),
(50, 'Karuzela do automatu stacjonarnego', 'stacjonarny - BS 201', '', '1'),
(51, 'KONTROLER ARTEMA', 'stacjonarny - BS 201', '', '1'),
(52, 'Bezpiecznik 20 A 250 V', 'stacjonarny - BS 201', '', '1'),
(53, 'Pakiet kontrolera karuzel', 'stacjonarny - BS 201', '', '1'),
(54, 'Płyta ZASILACZ-MAINDO BS201', 'stacjonarny - BS 201', '', '1'),
(55, 'Przetwornica impulsowa DRA 240', 'stacjonarny - BS 201', '', '1'),
(56, 'Przetwornica impulsowa DR-120-24', 'stacjonarny - BS 201', '', '1'),
(57, 'pinpad', 'stacjonarny - BS 201', '', '1'),
(58, 'Akumulator żelowy 12V 2,3 Ah', 'mobilny - BM 101', '', '1'),
(59, 'Antena dwupasmowa GSM/GPS', 'mobilny - BM 101', '', '1'),
(60, 'Antena zbliżeniowa', 'mobilny - BM 101', '', '1'),
(61, 'CR manual mobilny', 'mobilny - BM 101', '', '1'),
(62, 'grzałka ', 'mobilny - BM 101', '', '1'),
(63, 'Interfejs IF9000 RS232 do drukarek termicznych SEIKO', 'mobilny - BM 101', '', '1'),
(64, 'kabel zasilacz-main 4 żyły', 'mobilny - BM 101', '', '1'),
(65, 'Komputer PC 104 AMD GEODE 500 (EVOC:EC3-1641 CLDNA)', 'mobilny - BM 101', '', '1'),
(66, 'MAIN (WRDE 0141)', 'mobilny - BM 101', '', '1'),
(67, 'Mechanizm drukujący SEIKO z obcinaczem', 'mobilny - BM 101', '', '1'),
(68, 'Nakładka dotykowa na ekran LCD ', 'mobilny - BM 101', '', '1'),
(69, 'opóźniacz', 'mobilny - BM 101', '', '1'),
(70, 'Sprężyna szyby', 'mobilny - BM 101', '', '1'),
(71, 'VIVOpay Kiosk II Controller', 'mobilny - BM 101', '', '1'),
(72, 'wałek aluminiowy drukarki', 'mobilny - BM 101', '', '1'),
(73, 'Wentylator 12 v 50x50', 'mobilny - BM 101', '', '1'),
(74, 'Wyświetlacz LCD', 'mobilny - BM 101', '', '1'),
(75, 'Zasilacz (WRKP0135)', 'mobilny - BM 101', '', '1'),
(76, 'zespół drukarki do BM101 (stelaż, mechanizm druk., sterownik)', 'mobilny - BM 101', '', '1'),
(77, 'Zespół kieszeni  wydawania biletu   ', 'mobilny - BM 101', '', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `service_request`
--

CREATE TABLE `service_request` (
  `id` int(11) NOT NULL,
  `arrival_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `sn` varchar(255) COLLATE latin2_bin NOT NULL,
  `quantity` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `release_user_id` int(11) NOT NULL,
  `service_status_id` int(11) NOT NULL DEFAULT '1',
  `automat_number` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `change_status_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `service_request`
--

INSERT INTO `service_request` (`id`, `arrival_id`, `product_id`, `sn`, `quantity`, `storage_id`, `release_user_id`, `service_status_id`, `automat_number`, `change_status_datetime`) VALUES
(1, 2, 43, '', 2, 1, 3, 1, NULL, '2016-09-26 11:50:06'),
(2, NULL, 43, '', -1, 1, 3, 2, 'automat1', '2016-09-26 11:50:57'),
(3, NULL, 43, '', -1, 1, 3, 3, '', '2016-09-26 11:51:06'),
(4, 3, 43, '', 1, 1, 3, 4, NULL, '2016-09-26 11:51:25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `service_status`
--

CREATE TABLE `service_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `service_status`
--

INSERT INTO `service_status` (`id`, `name`) VALUES
(1, 'Otrzymano z magazynu'),
(2, 'Montaż w automacie'),
(3, 'Do zwrotu'),
(4, 'Zwrócono na magazyn');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `storage`
--

CREATE TABLE `storage` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `storage`
--

INSERT INTO `storage` (`id`, `name`) VALUES
(1, 'Magazyn Warszawa'),
(2, 'Magazyn Wrocław');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE latin2_bin NOT NULL,
  `password` varchar(255) COLLATE latin2_bin NOT NULL,
  `user_name` varchar(255) COLLATE latin2_bin NOT NULL,
  `email` varchar(255) COLLATE latin2_bin NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `is_active` enum('0','1') COLLATE latin2_bin NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `user_name`, `email`, `user_group_id`, `storage_id`, `is_active`) VALUES
(1, 'mennica_test', 'fa8d52b91c0742b7f2f983bd978c453c', 'mennica test', '', 1, 0, '1'),
(2, 'vector_test', '1edabd3ab3a3b8acf3efd272f613380f', 'vector test', '', 2, 1, '1'),
(3, 'serwisant1', '6cce4ad64dc940b1f7a60ea642dd5fb0', 'serwisant', '', 3, 1, '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_group`
--

CREATE TABLE `users_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `users_group`
--

INSERT INTO `users_group` (`id`, `name`) VALUES
(1, 'mennica'),
(2, 'vectorsoft_magazyn'),
(3, 'serwisant');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `arrival_items`
--
ALTER TABLE `arrival_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrival_types`
--
ALTER TABLE `arrival_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrivals`
--
ALTER TABLE `arrivals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automat_type`
--
ALTER TABLE `automat_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_request`
--
ALTER TABLE `service_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_status`
--
ALTER TABLE `service_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_group`
--
ALTER TABLE `users_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `arrival_items`
--
ALTER TABLE `arrival_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT dla tabeli `arrival_types`
--
ALTER TABLE `arrival_types`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `arrivals`
--
ALTER TABLE `arrivals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `automat_type`
--
ALTER TABLE `automat_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT dla tabeli `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT dla tabeli `product_status`
--
ALTER TABLE `product_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT dla tabeli `service_request`
--
ALTER TABLE `service_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `service_status`
--
ALTER TABLE `service_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `storage`
--
ALTER TABLE `storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `users_group`
--
ALTER TABLE `users_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
