CREATE USER 'pp4ds'@'%' IDENTIFIED BY  'ppds';

GRANT 

SELECT, INSERT, UPDATE, DELETE ON * . * TO  'pp4ds'@'%' IDENTIFIED BY  'ppds' 

WITH 

MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0 ;

--
-- SW Version 1.0
--

ALTER TABLE  `personnela` CHANGE  `remarks`  `remarks` CHAR( 2 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
 
ALTER TABLE  `personnel` CHANGE  `remarks`  `remarks` CHAR( 2 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
 
DROP TABLE `environment`;
DROP TABLE `first_rand_table`;
 
CREATE TABLE `environment` (
  `env_cd` int(2) NOT NULL AUTO_INCREMENT,
  `environment` varchar(50) NOT NULL,
  `dist_cd` char(2) NOT NULL,
  `subdiv_cd` char(4) DEFAULT NULL,
  `current_personnel` char(9) DEFAULT NULL,
  `current_office` char(8) DEFAULT NULL,
  `apt1_orderno` varchar(25) DEFAULT NULL,
  `apt1_date` date DEFAULT NULL,
  `apt2_orderno` varchar(25) DEFAULT NULL,
  `apt2_date` date DEFAULT NULL,
  `signature` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`env_cd`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
 
CREATE TABLE `first_rand_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officer_name` varchar(50) DEFAULT NULL,
  `person_desig` varchar(50) DEFAULT NULL,
  `personcd` char(9) DEFAULT NULL,
  `office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postoffice` varchar(30) DEFAULT NULL,
  `subdivision` varchar(30) DEFAULT NULL,
  `policestation` varchar(30) DEFAULT NULL,
  `pc_code` char(2) DEFAULT NULL,
  `pc_name` char(35) DEFAULT NULL,
  `district` char(20) DEFAULT NULL,
  `pin` char(6) DEFAULT NULL,
  `officecd` char(8) DEFAULT NULL,
  `poststatus` char(20) DEFAULT NULL,
  `mob_no` char(16) DEFAULT NULL,
  `training_desc` char(20) DEFAULT NULL,
  `venuename` varchar(50) DEFAULT NULL,
  `venueaddress` varchar(100) DEFAULT NULL,
  `training_dt` char(20) DEFAULT NULL,
  `training_time` char(20) DEFAULT NULL,
  `epic` varchar(30) DEFAULT NULL,
  `acno` char(3) DEFAULT NULL,
  `partno` char(10) DEFAULT NULL,
  `slno` char(10) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `bank_accno` varchar(20) DEFAULT NULL,
  `ifsc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
 
CREATE TABLE `remarks` (
  `remarks_cd` char(2) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`remarks_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `remarks` (`remarks_cd`, `remarks`) VALUES
('01', 'Head of Office'),
('02', 'Night Guard'),
('03', 'Armed Guard'),
('04', 'Sweeper'),
('05', 'Key holder'),
('06', 'Physically Challenged'),
('07', 'Peoples Representative'),
('08', 'Driver'),
('99', 'Other');

CREATE TABLE `tblsms` (
  `name` varchar(50) NOT NULL,
  `phone_no` char(12) NOT NULL,
  `message` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- SW Version 1.1
--

delete from submenu;
INSERT INTO `submenu` (`submenu_cd`, `menu_cd`, `submenu`, `link`, `usercode`, `posted_date`) VALUES
(1, 2, 'Subdivision', 'subdivision-master.php', 1, '2013-12-23 15:29:12'),
(3, 4, 'Add Personnel', 'add-personnel.php', 1, '2013-12-23 15:29:12'),
(4, 4, 'List Personnel', 'list-personnel.php', 1, '2013-12-23 15:29:12'),
(5, 3, 'Add Details', 'office-details.php', 1, '2013-12-26 10:38:51'),
(6, 3, 'Office Details List', 'list-office-details.php', 1, '2013-12-26 10:40:42'),
(7, 9, 'Personnel Report', 'personnel-report.php', 1, '2014-01-03 04:16:01'),
(8, 9, 'Office Report', 'office-report.php', 1, '2014-01-03 04:16:20'),
(9, 4, 'Termination', 'termination-details.php', 1, '2014-01-03 09:03:34'),
(10, 2, 'Training Type', 'training-type-master.php', 1, '2014-01-13 13:02:44'),
(11, 6, 'Training Requirement', 'training-requirement.php', 1, '2014-01-14 13:32:27'),
(12, 6, 'Training Venue', 'trainingvenue.php', 1, '2014-01-15 05:21:24'),
(13, 4, 'Swapping', 'swapping.php', 1, '2014-01-15 05:25:10'),
(14, 6, 'Training Allocation', 'training-allocation.php', 1, '2014-01-15 05:38:18'),
(15, 2, 'Assembly Party', 'assembly-party.php', 1, '2014-01-18 07:55:55'),
(16, 6, 'Training Attendance', 'training-attendance.php', 1, '2014-01-19 01:57:03'),
(17, 4, 'Personnel LS14 List', 'list-personnel_ls14.php', 1, '2014-01-19 11:21:42'),
(18, 5, 'Pre-Group Replacement', 'single-personnel-replacement.php', 1, '2014-01-19 11:31:08'),
(19, 5, 'Post-Group Replacement', 'emp-replacement.php', 1, '2014-01-19 11:31:35'),
(20, 9, 'First Appointment Letter', 'first-appointment-letter.php', 1, '2014-01-19 11:34:20'),
(21, 9, 'Form 12 & Form 12A', 'form-12-app.php', 1, '2014-01-21 07:40:03'),
(22, 9, 'Venue Wise List', 'venue-wise-list.php', 1, '2014-01-22 11:30:03'),
(23, 9, 'Office Wise List', 'office-wise-list.php', 1, '2014-01-22 11:34:24'),
(24, 9, 'Second Appointment Letter', 'second-appointment-letter.php', 1, '2014-01-28 08:18:19'),
(25, 6, 'Training Venue List', 'training_venue_list.php', 1, '2014-01-29 07:53:58'),
(26, 4, 'Termination List', 'list-termination.php', 1, '2014-01-29 07:55:22'),
(27, 2, 'Block/ Municipality', 'block-muni-master.php', 1, '2014-01-30 04:43:10'),
(28, 2, 'Parliament', 'pcmaster.php', 1, '2014-01-30 04:43:10'),
(29, 2, 'Bank', 'bank-master.php', 1, '2014-01-30 09:51:14'),
(30, 2, 'Branch', 'branch-master.php', 1, '2014-01-30 09:51:14'),
(31, 2, 'Assembly Constituency', 'assembly_master.php', 1, '2014-01-30 12:43:46'),
(32, 9, 'Govt. Category Wise Report', 'personnel-report-in-govt-category.php', 1, '2014-01-30 14:32:03'),
(33, 9, 'Govt. Category against Post Status', 'govt-category-ag-poststat.php', 1, '2014-02-01 11:28:03'),
(34, 2, 'Assembly Party List', 'assembly-party-list.php', 1, '2014-02-02 11:55:05'),
(35, 6, 'Training Allocation List', 'training-allocation-list.php', 1, '2014-02-04 15:45:17'),
(36, 2, 'Polling Station', 'polling-station.php', 1, '2014-02-05 14:32:14'),
(37, 6, 'Training Requirement All', 'training-requirement-all.php', 1, '2014-02-05 16:58:09'),
(38, 9, 'Assembly wise PS No & Party No', 'ps-no-wise-party-no.php', 1, '2014-02-05 18:33:31'),
(39, 8, 'First Randomisation', 'first-randomisation.php', 1, '2014-02-07 12:38:39'),
(41, 8, 'Second Randomisation', 'second-randomisation.php', 1, '2014-02-07 12:40:54'),
(42, 8, 'Third Randomisation', 'third-randomisation.php', 1, '2014-02-07 12:40:54'),
(43, 4, 'Swapping Direct', 'swapping-direct.php', 1, '2014-02-07 12:41:24'),
(44, 9, 'First Appointment Letter 2', 'first-appointment-letter2.php', 1, '2014-02-15 09:29:44'),
(45, 2, 'Reserve List', 'reserve-list.php', 1, '2014-02-15 10:04:12'),
(46, 2, 'DCRC Master', 'dcrc-master.php', 1, '2014-02-15 17:36:00'),
(47, 9, 'Party PS List', 'party-ps-list.php', 1, '2014-02-16 21:19:25'),
(48, 9, 'Bulk Report', 'bulk-record.php', 1, '2014-02-17 01:24:56'),
(49, 9, 'Office Wise PP List', 'subdiv-wise-pp.php', 1, '2014-02-17 22:25:18'),
(50, 9, 'Second Appointment Letter - Reserve', 'second-appointment-letter-reserve.php', 1, '2014-02-18 08:53:37'),
(51, 9, 'Scroll/ Master Roll Report', 'pp-scroll-master-roll-report.php', 1, '2014-02-19 12:05:39'),
(52, 2, 'DCRC Master List', 'dcrc-master-list.php', 1, '2014-02-20 06:25:03'),
(53, 9, 'Master Roll Report - Reserve', 'reserve-master-roll-report.php', 1, '2014-02-20 09:33:34'),
(54, 7, 'Save SMS for PP', 'save-sms.php', 1, '2014-02-20 17:35:52'),
(55, 7, 'Pre-Group Cancellation', 'pre-group-cancellation.php', 1, '2014-02-26 14:15:05');

--
-- SW Version 1.2
--

alter table training_pp add column token int(5) default null;

alter table first_rand_table add column (forsubdivision char(4) default null, token char(5) default null);

delete from submenu;

ALTER TABLE `environment` ADD `distnm_sml` VARCHAR( 30 ) NULL AFTER `dist_cd` ,
ADD `distnm_cap` VARCHAR( 30 ) NULL AFTER `distnm_sml`;

INSERT INTO `submenu` (`submenu_cd`, `menu_cd`, `submenu`, `link`, `usercode`, `posted_date`) VALUES
(1, 2, 'Subdivision', 'subdivision-master.php', 1, '2013-12-23 20:58:48'),
(3, 4, 'Add Personnel', 'add-personnel.php', 1, '2013-12-23 20:58:48'),
(4, 4, 'List Personnel', 'list-personnel.php', 1, '2013-12-23 20:58:48'),
(5, 3, 'Add Details', 'office-details.php', 1, '2013-12-26 16:08:27'),
(6, 3, 'Office Details List', 'list-office-details.php', 1, '2013-12-26 16:10:18'),
(7, 9, 'Personnel Report', 'personnel-report.php', 1, '2014-01-03 09:45:37'),
(8, 9, 'Office Report', 'office-report.php', 1, '2014-01-03 09:45:56'),
(9, 4, 'Termination', 'termination-details.php', 1, '2014-01-03 14:33:10'),
(10, 2, 'Training Type', 'training-type-master.php', 1, '2014-01-13 18:32:20'),
(11, 6, 'Training Requirement', 'training-requirement.php', 1, '2014-01-14 19:02:03'),
(12, 6, 'Training Venue', 'trainingvenue.php', 1, '2014-01-15 10:51:00'),
(13, 4, 'Swapping', 'swapping.php', 1, '2014-01-15 10:54:46'),
(14, 6, 'Training Allocation', 'training-allocation.php', 1, '2014-01-15 11:07:54'),
(15, 2, 'Assembly Party', 'assembly-party.php', 1, '2014-01-18 13:25:31'),
(16, 6, 'Training Attendance', 'training-attendance.php', 1, '2014-01-19 07:26:39'),
(17, 4, 'Personnel LS14 List', 'list-personnel_ls14.php', 1, '2014-01-19 16:51:18'),
(18, 5, 'Pre-Group Replacement', 'single-personnel-replacement.php', 1, '2014-01-19 17:00:44'),
(19, 5, 'Post-Group Replacement', 'emp-replacement.php', 1, '2014-01-19 17:01:11'),
(20, 9, 'First Appointment Letter', 'first-appointment-letter.php', 1, '2014-01-19 17:03:56'),
(21, 9, 'Form 12 & Form 12A', 'form-12-app.php', 1, '2014-01-21 13:09:39'),
(22, 9, 'Venue Wise List', 'venue-wise-list.php', 1, '2014-01-22 16:59:39'),
(23, 9, 'Office Wise List', 'office-wise-list.php', 1, '2014-01-22 17:04:00'),
(24, 9, 'Second Appointment Letter', 'second-appointment-letter.php', 1, '2014-01-28 13:47:55'),
(25, 6, 'Training Venue List', 'training_venue_list.php', 1, '2014-01-29 13:23:34'),
(26, 4, 'Termination List', 'list-termination.php', 1, '2014-01-29 13:24:58'),
(27, 2, 'Block/ Municipality', 'block-muni-master.php', 1, '2014-01-30 10:12:46'),
(28, 2, 'Parliament', 'pcmaster.php', 1, '2014-01-30 10:12:46'),
(29, 2, 'Bank', 'bank-master.php', 1, '2014-01-30 15:20:50'),
(30, 2, 'Branch', 'branch-master.php', 1, '2014-01-30 15:20:50'),
(31, 2, 'Assembly Constituency', 'assembly_master.php', 1, '2014-01-30 18:13:22'),
(32, 9, 'Govt. Category Wise Report', 'personnel-report-in-govt-category.php', 1, '2014-01-30 20:01:39'),
(33, 9, 'Govt. Category against Post Status', 'govt-category-ag-poststat.php', 1, '2014-02-01 16:57:39'),
(34, 2, 'Assembly Party List', 'assembly-party-list.php', 1, '2014-02-02 17:24:41'),
(35, 6, 'Training Allocation List', 'training-allocation-list.php', 1, '2014-02-04 21:14:53'),
(36, 2, 'Polling Station', 'polling-station.php', 1, '2014-02-05 20:01:50'),
(37, 6, 'Training Requirement All', 'training-requirement-all.php', 1, '2014-02-05 22:27:45'),
(38, 9, 'Assembly wise PS No & Party No', 'ps-no-wise-party-no.php', 1, '2014-02-06 00:03:07'),
(39, 8, 'First Randomisation', 'first-randomisation.php', 1, '2014-02-07 18:08:15'),
(41, 8, 'Second Randomisation', 'second-randomisation.php', 1, '2014-02-07 18:10:30'),
(42, 8, 'Third Randomisation', 'third-randomisation.php', 1, '2014-02-07 18:10:30'),
(43, 4, 'Swapping Direct', 'swapping-direct.php', 1, '2014-02-07 18:11:00'),
(44, 9, 'First Appointment Letter 2', 'first-appointment-letter2.php', 1, '2014-02-15 14:59:20'),
(45, 2, 'Reserve List', 'reserve-list.php', 1, '2014-02-15 15:33:48'),
(46, 2, 'DCRC Master', 'dcrc-master.php', 1, '2014-02-15 23:05:36'),
(47, 9, 'Party PS List', 'party-ps-list.php', 1, '2014-02-17 02:49:01'),
(48, 9, 'Bulk Report', 'bulk-record.php', 1, '2014-02-17 06:54:32'),
(49, 9, 'Office Wise PP List', 'subdiv-wise-pp.php', 1, '2014-02-18 03:54:54'),
(50, 9, 'Second Appointment Letter - Reserve', 'second-appointment-letter-reserve.php', 1, '2014-02-18 14:23:13'),
(51, 9, 'Scroll/ Master Roll Report', 'pp-scroll-master-roll-report.php', 1, '2014-02-19 17:35:15'),
(52, 2, 'DCRC Master List', 'dcrc-master-list.php', 1, '2014-02-20 11:54:39'),
(53, 9, 'Master Roll Report - Reserve', 'reserve-master-roll-report.php', 1, '2014-02-20 15:03:10'),
(54, 7, 'Save SMS for PP', 'save-sms.php', 1, '2014-02-20 23:05:28'),
(55, 7, 'Pre-Group Cancellation', 'pre-group-cancellation.php', 1, '2014-02-26 19:44:41'),
(56, 4, 'Inter Swap', 'inter-swap.php', 1, '2014-03-05 20:22:10'),
(57, 9, 'First App Letter Populate', 'first-appointment-letter3.php', 1, '2014-03-07 11:09:11'),
(58, 6, 'Token', 'token-creation.php', 1, '2014-03-07 11:09:11');

--
-- SW Version 1.3
--

ALTER TABLE  `first_rand_table` CHANGE  `token`  `token` CHAR( 8 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL

--
-- SW Version 1.4 SMS Gateway
--

delete from submenu;

INSERT INTO `submenu` (`submenu_cd`, `menu_cd`, `submenu`, `link`, `usercode`, `posted_date`) VALUES
(1, 2, 'Subdivision', 'subdivision-master.php', 1, '2013-12-23 20:58:48'),
(3, 4, 'Add Personnel', 'add-personnel.php', 1, '2013-12-23 20:58:48'),
(4, 4, 'List Personnel', 'list-personnel.php', 1, '2013-12-23 20:58:48'),
(5, 3, 'Add Details', 'office-details.php', 1, '2013-12-26 16:08:27'),
(6, 3, 'Office Details List', 'list-office-details.php', 1, '2013-12-26 16:10:18'),
(7, 9, 'Personnel Report', 'personnel-report.php', 1, '2014-01-03 09:45:37'),
(8, 9, 'Office Report', 'office-report.php', 1, '2014-01-03 09:45:56'),
(9, 4, 'Termination', 'termination-details.php', 1, '2014-01-03 14:33:10'),
(10, 2, 'Training Type', 'training-type-master.php', 1, '2014-01-13 18:32:20'),
(11, 6, 'Training Requirement', 'training-requirement.php', 1, '2014-01-14 19:02:03'),
(12, 6, 'Training Venue', 'trainingvenue.php', 1, '2014-01-15 10:51:00'),
(13, 4, 'Swapping', 'swapping.php', 1, '2014-01-15 10:54:46'),
(14, 6, 'Training Allocation', 'training-allocation.php', 1, '2014-01-15 11:07:54'),
(15, 2, 'Assembly Party', 'assembly-party.php', 1, '2014-01-18 13:25:31'),
(16, 6, 'Training Attendance', 'training-attendance.php', 1, '2014-01-19 07:26:39'),
(17, 4, 'Personnel LS14 List', 'list-personnel_ls14.php', 1, '2014-01-19 16:51:18'),
(18, 5, 'Pre-Group Replacement', 'single-personnel-replacement.php', 1, '2014-01-19 17:00:44'),
(19, 5, 'Post-Group Replacement', 'emp-replacement.php', 1, '2014-01-19 17:01:11'),
(20, 9, 'First Appointment Letter', 'first-appointment-letter.php', 1, '2014-01-19 17:03:56'),
(21, 9, 'Form 12 & Form 12A', 'form-12-app.php', 1, '2014-01-21 13:09:39'),
(22, 9, 'Venue Wise List', 'venue-wise-list.php', 1, '2014-01-22 16:59:39'),
(23, 9, 'Office Wise List', 'office-wise-list.php', 1, '2014-01-22 17:04:00'),
(24, 9, 'Second Appointment Letter', 'second-appointment-letter.php', 1, '2014-01-28 13:47:55'),
(25, 6, 'Training Venue List', 'training_venue_list.php', 1, '2014-01-29 13:23:34'),
(26, 4, 'Termination List', 'list-termination.php', 1, '2014-01-29 13:24:58'),
(27, 2, 'Block/ Municipality', 'block-muni-master.php', 1, '2014-01-30 10:12:46'),
(28, 2, 'Parliament', 'pcmaster.php', 1, '2014-01-30 10:12:46'),
(29, 2, 'Bank', 'bank-master.php', 1, '2014-01-30 15:20:50'),
(30, 2, 'Branch', 'branch-master.php', 1, '2014-01-30 15:20:50'),
(31, 2, 'Assembly Constituency', 'assembly_master.php', 1, '2014-01-30 18:13:22'),
(32, 9, 'Govt. Category Wise Report', 'personnel-report-in-govt-category.php', 1, '2014-01-30 20:01:39'),
(33, 9, 'Govt. Category against Post Status', 'govt-category-ag-poststat.php', 1, '2014-02-01 16:57:39'),
(34, 2, 'Assembly Party List', 'assembly-party-list.php', 1, '2014-02-02 17:24:41'),
(35, 6, 'Training Allocation List', 'training-allocation-list.php', 1, '2014-02-04 21:14:53'),
(36, 2, 'Polling Station', 'polling-station.php', 1, '2014-02-05 20:01:50'),
(37, 6, 'Training Requirement All', 'training-requirement-all.php', 1, '2014-02-05 22:27:45'),
(38, 9, 'Assembly wise PS No & Party No', 'ps-no-wise-party-no.php', 1, '2014-02-06 00:03:07'),
(39, 8, 'First Randomisation', 'first-randomisation.php', 1, '2014-02-07 18:08:15'),
(41, 8, 'Second Randomisation', 'second-randomisation.php', 1, '2014-02-07 18:10:30'),
(42, 8, 'Third Randomisation', 'third-randomisation.php', 1, '2014-02-07 18:10:30'),
(43, 4, 'Swapping Direct', 'swapping-direct.php', 1, '2014-02-07 18:11:00'),
(44, 9, 'First Appointment Letter 2', 'first-appointment-letter2.php', 1, '2014-02-15 14:59:20'),
(45, 2, 'Reserve List', 'reserve-list.php', 1, '2014-02-15 15:33:48'),
(46, 2, 'DCRC Master', 'dcrc-master.php', 1, '2014-02-15 23:05:36'),
(47, 9, 'Party PS List', 'party-ps-list.php', 1, '2014-02-17 02:49:01'),
(48, 9, 'Bulk Report', 'bulk-record.php', 1, '2014-02-17 06:54:32'),
(49, 9, 'Office Wise PP List', 'subdiv-wise-pp.php', 1, '2014-02-18 03:54:54'),
(50, 9, 'Second Appointment Letter - Reserve', 'second-appointment-letter-reserve.php', 1, '2014-02-18 14:23:13'),
(51, 9, 'Scroll/ Master Roll Report', 'pp-scroll-master-roll-report.php', 1, '2014-02-19 17:35:15'),
(52, 2, 'DCRC Master List', 'dcrc-master-list.php', 1, '2014-02-20 11:54:39'),
(53, 9, 'Master Roll Report - Reserve', 'reserve-master-roll-report.php', 1, '2014-02-20 15:03:10'),
(54, 7, 'Save SMS for PP', 'save-sms.php', 1, '2014-02-20 23:05:28'),
(55, 7, 'Pre-Group Cancellation', 'pre-group-cancellation.php', 1, '2014-02-26 19:44:41'),
(56, 4, 'Inter Swap', 'inter-swap.php', 1, '2014-03-05 20:22:10'),
(57, 9, 'First App Letter Populate', 'first-appointment-letter3.php', 1, '2014-03-07 11:09:11'),
(58, 6, 'Token', 'token-creation.php', 1, '2014-03-07 11:09:11'),
(59, 7, 'Send SMS', 'send-sms.php', 1, '2014-03-11 17:41:07');

--
-- SW Version 1.5
--

ALTER TABLE  `first_rand_table` CHANGE  `token`  `token` CHAR( 13 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL

TRUNCATE TABLE `submenu`;

INSERT INTO `submenu` (`submenu_cd`, `menu_cd`, `submenu`, `link`, `usercode`, `posted_date`) VALUES
(1, 2, 'Subdivision', 'subdivision-master.php', 1, '2013-12-23 20:58:48'),
(3, 4, 'Add Personnel', 'add-personnel.php', 1, '2013-12-23 20:58:48'),
(4, 4, 'List Personnel', 'list-personnel.php', 1, '2013-12-23 20:58:48'),
(5, 3, 'Add Details', 'office-details.php', 1, '2013-12-26 16:08:27'),
(6, 3, 'Office Details List', 'list-office-details.php', 1, '2013-12-26 16:10:18'),
(7, 9, 'Personnel Report', 'personnel-report.php', 1, '2014-01-03 09:45:37'),
(8, 9, 'Office Report', 'office-report.php', 1, '2014-01-03 09:45:56'),
(9, 4, 'Termination', 'termination-details.php', 1, '2014-01-03 14:33:10'),
(10, 2, 'Training Type', 'training-type-master.php', 1, '2014-01-13 18:32:20'),
(11, 6, 'Training Requirement', 'training-requirement.php', 1, '2014-01-14 19:02:03'),
(12, 6, 'Training Venue', 'trainingvenue.php', 1, '2014-01-15 10:51:00'),
(13, 4, 'Swapping', 'swapping.php', 1, '2014-01-15 10:54:46'),
(14, 6, 'Training Allocation', 'training-allocation.php', 1, '2014-01-15 11:07:54'),
(15, 2, 'Assembly Party', 'assembly-party.php', 1, '2014-01-18 13:25:31'),
(16, 6, 'Training Attendance', 'training-attendance.php', 1, '2014-01-19 07:26:39'),
(17, 4, 'Personnel LS14 List', 'list-personnel_ls14.php', 1, '2014-01-19 16:51:18'),
(18, 5, 'Pre-Group Replacement', 'single-personnel-replacement.php', 1, '2014-01-19 17:00:44'),
(19, 5, 'Post-Group Replacement', 'emp-replacement.php', 1, '2014-01-19 17:01:11'),
(20, 9, 'First Appointment Letter', 'first-appointment-letter.php', 1, '2014-01-19 17:03:56'),
(21, 9, 'Form 12 & Form 12A', 'form-12-app.php', 1, '2014-01-21 13:09:39'),
(22, 9, 'Venue Wise List', 'venue-wise-list.php', 1, '2014-01-22 16:59:39'),
(23, 9, 'Office Wise List', 'office-wise-list.php', 1, '2014-01-22 17:04:00'),
(24, 9, 'Second Appointment Letter', 'second-appointment-letter.php', 1, '2014-01-28 13:47:55'),
(25, 6, 'Training Venue List', 'training_venue_list.php', 1, '2014-01-29 13:23:34'),
(26, 4, 'Termination List', 'list-termination.php', 1, '2014-01-29 13:24:58'),
(27, 2, 'Block/ Municipality', 'block-muni-master.php', 1, '2014-01-30 10:12:46'),
(28, 2, 'Parliament', 'pcmaster.php', 1, '2014-01-30 10:12:46'),
(29, 2, 'Bank', 'bank-master.php', 1, '2014-01-30 15:20:50'),
(30, 2, 'Branch', 'branch-master.php', 1, '2014-01-30 15:20:50'),
(31, 2, 'Assembly Constituency', 'assembly_master.php', 1, '2014-01-30 18:13:22'),
(32, 9, 'Govt. Category Wise Report', 'personnel-report-in-govt-category.php', 1, '2014-01-30 20:01:39'),
(33, 9, 'Govt. Category against Post Status', 'govt-category-ag-poststat.php', 1, '2014-02-01 16:57:39'),
(34, 2, 'Assembly Party List', 'assembly-party-list.php', 1, '2014-02-02 17:24:41'),
(35, 6, 'Training Allocation List', 'training-allocation-list.php', 1, '2014-02-04 21:14:53'),
(36, 2, 'Polling Station', 'polling-station.php', 1, '2014-02-05 20:01:50'),
(37, 6, 'Training Requirement All', 'training-requirement-all.php', 1, '2014-02-05 22:27:45'),
(38, 9, 'Assembly wise PS No & Party No', 'ps-no-wise-party-no.php', 1, '2014-02-06 00:03:07'),
(39, 8, 'First Randomisation', 'first-randomisation.php', 1, '2014-02-07 18:08:15'),
(41, 8, 'Second Randomisation', 'second-randomisation.php', 1, '2014-02-07 18:10:30'),
(42, 8, 'Third Randomisation', 'third-randomisation.php', 1, '2014-02-07 18:10:30'),
(43, 4, 'Swapping Direct', 'swapping-direct.php', 1, '2014-02-07 18:11:00'),
(44, 9, 'First Appointment Letter 2', 'first-appointment-letter2.php', 1, '2014-02-15 14:59:20'),
(45, 2, 'Reserve List', 'reserve-list.php', 1, '2014-02-15 15:33:48'),
(46, 2, 'DCRC Master', 'dcrc-master.php', 1, '2014-02-15 23:05:36'),
(47, 9, 'Party PS List', 'party-ps-list.php', 1, '2014-02-17 02:49:01'),
(48, 9, 'Bulk Report', 'bulk-record.php', 1, '2014-02-17 06:54:32'),
(49, 9, 'Office Wise PP List', 'subdiv-wise-pp.php', 1, '2014-02-18 03:54:54'),
(50, 9, 'Second Appointment Letter - Reserve', 'second-appointment-letter-reserve.php', 1, '2014-02-18 14:23:13'),
(51, 9, 'Scroll/ Master Roll Report', 'pp-scroll-master-roll-report.php', 1, '2014-02-19 17:35:15'),
(52, 2, 'DCRC Master List', 'dcrc-master-list.php', 1, '2014-02-20 11:54:39'),
(53, 9, 'Master Roll Report - Reserve', 'reserve-master-roll-report.php', 1, '2014-02-20 15:03:10'),
(54, 7, 'Save SMS for PP', 'save-sms.php', 1, '2014-02-20 23:05:28'),
(55, 7, 'Pre-Group Cancellation', 'pre-group-cancellation.php', 1, '2014-02-26 19:44:41'),
(56, 4, 'Inter Swap', 'inter-swap.php', 1, '2014-03-05 20:22:10'),
(57, 9, 'First App Letter Populate', 'first-appointment-letter3.php', 1, '2014-03-07 11:09:11'),
(58, 6, 'Token', 'token-creation.php', 1, '2014-03-07 11:09:11'),
(59, 7, 'Send SMS', 'send-sms.php', 1, '2014-03-11 17:41:07'),
(60, 6, 'Training Allocation District From District', 'training-allocation-dist.php', 1, '2014-03-12 13:54:51'),
(61, 6, 'Token From District', 'token-creation-dist.php', 1, '2014-03-12 13:56:35');

--
-- SW Version 1.6
--

ALTER TABLE `tblsms` CHANGE `message` `message` VARCHAR( 320 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;

--
-- SW Version 1.6 Update 1
--

create index asm_dcrc  on grp_dcrc(forassembly,groupid,member);
create index fasm_personnela  on personnela(forassembly,groupid,poststat);

--
-- SW Version 1.6 Update 3
--

ALTER TABLE  `replacement_log_pregroup` ADD  `reason` VARCHAR( 30 ) NULL AFTER  `forpc`;
