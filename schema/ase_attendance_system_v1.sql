-- -----------------------------------------------------
-- Schema ase_attendance_system_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ase_attendance_system_db` DEFAULT CHARACTER SET utf8 ;
USE `ase_attendance_system_db` ;

-- -----------------------------------------------------
-- Table `ase_attendance_system_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ase_attendance_system_db`.`students` (
	`id`INT AUTO_INCREMENT PRIMARY KEY,
	`matric` VARCHAR(255) NOT NULL UNIQUE,
	`name` VARCHAR(255) NOT NULL
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ase_attendance_system_db`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ase_attendance_system_db`.`courses` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`code` VARCHAR(255) NOT NULL UNIQUE,
	`name` VARCHAR(255) NOT NULL
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ase_attendance_system_db`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ase_attendance_system_db`.`groups` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`group_name` VARCHAR(255) NOT NULL UNIQUE,
  `course_code` VARCHAR(255) NOT NULL,
	`venue` VARCHAR(255) NOT NULL,
  `day` VARCHAR(255) NOT NULL,
	`start_time` TIME NULL,
	`end_time` TIME NULL,
  FOREIGN KEY (`course_code`) REFERENCES `ase_attendance_system_db`.`courses`(`code`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ase_attendance_system_db`.`student_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ase_attendance_system_db`.`student_group` (
	`matric` VARCHAR(255) NOT NULL,
  `group_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`matric`, `group_name`),
  FOREIGN KEY (`matric`) REFERENCES `ase_attendance_system_db`.`students`(`matric`),
  FOREIGN KEY (`group_name`) REFERENCES `ase_attendance_system_db`.`groups`(`group_name`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Populate mock datahere
-- -----------------------------------------------------

INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1003', 'Introduction to Computational Thinking');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1004', 'Introduction to Computing Systems');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1005', 'Digital Logic');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1006', 'Computer Organization and Architecture');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1007', 'Data Structures');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1011', 'Engineering Mathematics I');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ1012', 'Engineering Mathematics II');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2001', 'Algorithms');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2002', 'Object Oriented Design and Programming');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2003', 'Compcoursesuter Graphics and Visualization');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2004', 'Human Computer Interaction');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2005', 'Operating Systems');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2006', 'Software Engineering');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ2007', 'Introduction to Databases');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3001', 'Advanced Computer Architecture');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3002', 'Advanced Software Engineering');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3003', 'Software Systems Analysis and Design');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3004', 'Multidisciplinary Design Project');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3005', 'Artificial Intelligence');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3006', 'Net Centric Computing');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ3007', 'Compiler Techniques');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4001', 'Virtual and Augmented Reality');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4002', 'Visual Media Compression and Processing');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4003', 'Computer Vision');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4004', '3D Modelling and Animation');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4005', 'Audio and Speech Processing');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4011', 'Parallel Computing');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4013', 'Distributed Systems');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4015', 'Simulation and Modelling');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4016', 'Advanced Topics in Algorithms');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4021', 'Pervasive Networks');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4022', 'Personal Mobile Networks');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4023', 'Advanced Computer Networks');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4024', 'Cryptography and Network Security');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4031', 'Database Systems Principles');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4032', 'Data Analytics and Mining');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4033', 'Advanced Data Management');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4034', 'Information Retrieval');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4041', 'Machine Learning');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4042', 'Neural Networks');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4045', 'Natural Language Processing');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4046', 'Intelligent Agents');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4055', 'Cyber Physical System Security');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4062', 'Computer Security');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4064', 'Security Management');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4065', 'Digital Forensics');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4068', 'Application Security');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4071', 'Network Science');
INSERT INTO `ase_attendance_system_db`.`courses` (code, name) VALUES ('CZ4072', 'Big Data Management');

INSERT INTO `ase_attendance_system_db`.`students` (matric, name) VALUES ('U1722911C', 'Joshen Lim');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name) VALUES ('U1720999H', 'Muhammed Salleh');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name) VALUES ('U1722094J', 'Ng Jing Rui');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name) VALUES ('U1721312J', 'John Vega');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name) VALUES ('U1721959H', 'Aloysius Tsang');

INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS1', 'CZ3002', 'SWLAB3', 'Tuesday', '13:30:00', '15:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS2', 'CZ3002', 'HWLAB3', 'Monday', '11:30:00', '13:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS3', 'CZ3002', 'SWLAB1', 'Wednesday', '10:30:00', '12:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS4', 'CZ3002', 'SWLAB2', 'Wednesday', '10:30:00', '12:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSP1', 'CZ3005', 'SWLAB2', 'Friday', '15:30:00', '17:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSP2', 'CZ3005', 'SWLAB1', 'Tuesday', '13:30:00', '15:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSP4', 'CZ3001', 'SPL', 'Monday', '08:30:00', '10:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSR1', 'CZ3001', 'SWLAB3', 'Thursday', '12:30:00', '14:30:00');

INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name) VALUES ('U1722911C', 'TS1');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name) VALUES ('U1720999H', 'TS1');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name) VALUES ('U1722094J', 'TS1');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name) VALUES ('U1721312J', 'TS1');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name) VALUES ('U1721959H', 'TS1');