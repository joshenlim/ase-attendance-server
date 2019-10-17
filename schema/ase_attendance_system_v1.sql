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
	`name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ase_attendance_system_db`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ase_attendance_system_db`.`courses` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`code` VARCHAR(255) NOT NULL UNIQUE,
	`name` VARCHAR(255) NOT NULL,
  `num_labs` INT NOT NULL
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
  `seat` INT NOT NULL,
  `attendance` JSON NOT NULL,
  PRIMARY KEY (`matric`, `group_name`),
  FOREIGN KEY (`matric`) REFERENCES `ase_attendance_system_db`.`students`(`matric`),
  FOREIGN KEY (`group_name`) REFERENCES `ase_attendance_system_db`.`groups`(`group_name`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Populate mock datahere
-- -----------------------------------------------------

INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1003', 'Introduction to Computational Thinking', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1004', 'Introduction to Computing Systems', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1005', 'Digital Logic', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1006', 'Computer Organization and Architecture', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1007', 'Data Structures', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1011', 'Engineering Mathematics I', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ1012', 'Engineering Mathematics II', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2001', 'Algorithms', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2002', 'Object Oriented Design and Programming', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2003', 'Compcoursesuter Graphics and Visualization', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2004', 'Human Computer Interaction', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2005', 'Operating Systems', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2006', 'Software Engineering', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ2007', 'Introduction to Databases', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3001', 'Advanced Computer Architecture', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3002', 'Advanced Software Engineering', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3003', 'Software Systems Analysis and Design', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3004', 'Multidisciplinary Design Project', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3005', 'Artificial Intelligence', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3006', 'Net Centric Computing', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ3007', 'Compiler Techniques', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4001', 'Virtual and Augmented Reality', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4002', 'Visual Media Compression and Processing', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4003', 'Computer Vision', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4004', '3D Modelling and Animation', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4005', 'Audio and Speech Processing', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4011', 'Parallel Computing', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4013', 'Distributed Systems', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4015', 'Simulation and Modelling', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4016', 'Advanced Topics in Algorithms', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4021', 'Pervasive Networks', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4022', 'Personal Mobile Networks', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4023', 'Advanced Computer Networks', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4024', 'Cryptography and Network Security', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4031', 'Database Systems Principles', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4032', 'Data Analytics and Mining', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4033', 'Advanced Data Management', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4034', 'Information Retrieval', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4041', 'Machine Learning', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4042', 'Neural Networks', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4045', 'Natural Language Processing', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4046', 'Intelligent Agents', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4055', 'Cyber Physical System Security', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4062', 'Computer Security', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4064', 'Security Management', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4065', 'Digital Forensics', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4068', 'Application Security', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4071', 'Network Science', 5);
INSERT INTO `ase_attendance_system_db`.`courses` (code, name, num_labs) VALUES ('CZ4072', 'Big Data Management', 5);

INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1722911C', 'Joshen Lim', 'JLIM256@e.ntu.edu.sg');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1720999H', 'Muhammed Salleh', 'C170090@e.ntu.edu.sg');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1722094J', 'Ng Jing Rui', 'JNG154@e.ntu.edu.sg');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1721312J', 'John Vega', 'JOHN010@e.ntu.edu.sg');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1721959H', 'Aloysius Tsang', 'ALOY0027@e.ntu.edu.sg');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723456A', 'Andrew Tan', 'ANDREW@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723457A', 'Peter Chong', 'PETER@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723458A', 'Jennifer Ng', 'JENNIFER@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723459A', 'Gabrielle Yeo', 'GABRIELLE@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723460A', 'Valerie Chen', 'VALARIE@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723461A', 'Jimmy Teo', 'JIMMIE@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723462A', 'Charlie Cheong', 'CHARLIE@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723463A', 'Loganathan Thiru', 'LOGANATHAN@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723464A', 'Maximillian Lau', 'MAXIMILLIAN@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723465A', 'Adam Grant', 'ADAM@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723466A', 'Lin Chong Wei', 'CHONGWEI@mailinator.com');
INSERT INTO `ase_attendance_system_db`.`students` (matric, name, email) VALUES ('U1723467A', 'Liu Jia Ying', 'JIAYING@mailinator.com');

INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS1', 'CZ3002', 'SWLAB3', 'Tuesday', '13:30:00', '15:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS2', 'CZ3002', 'HWLAB3', 'Monday', '11:30:00', '13:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS3', 'CZ3002', 'SWLAB1', 'Wednesday', '10:30:00', '12:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TS4', 'CZ3002', 'SWLAB2', 'Wednesday', '10:30:00', '12:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSP1', 'CZ3005', 'SWLAB2', 'Friday', '15:30:00', '17:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSP2', 'CZ3005', 'SWLAB1', 'Tuesday', '13:30:00', '15:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSP4', 'CZ3001', 'SPL', 'Monday', '08:30:00', '10:30:00');
INSERT INTO `ase_attendance_system_db`.`groups` (group_name, course_code, venue, day, start_time, end_time) VALUES ('TSR1', 'CZ3001', 'SWLAB3', 'Thursday', '12:30:00', '14:30:00');

INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1722911C', 'TS1', 62, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1720999H', 'TS1', 63, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1722094J', 'TS1', 64, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1721312J', 'TS1', 65, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1721959H', 'TS1', 66, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723456A', 'TS1', 67, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723457A', 'TS1', 68, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723458A', 'TS1', 69, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723459A', 'TS1', 70, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723460A', 'TS1', 71, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723461A', 'TS1', 72, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723462A', 'TS1', 73, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723463A', 'TS1', 74, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723464A', 'TS1', 75, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723465A', 'TS1', 76, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723466A', 'TS1', 77, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');
INSERT INTO `ase_attendance_system_db`.`student_group` (matric, group_name, seat, attendance) VALUES ('U1723467A', 'TS1', 78, '{"session_1": 0, "session_2": 0, "session_3": 0, "session_4": 0, "session_5": 0}');