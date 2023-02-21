DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

CREATE TABLE department (
	department_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name			VARCHAR(100) UNIQUE KEY
);

CREATE TABLE `position` (
	position_id				SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name			ENUM ('Dev', 'Test', 'Scrum Master', 'PM')
);

CREATE TABLE `account` (
	account_id				SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email					VARCHAR(100) UNIQUE KEY,
    username				VARCHAR(100) UNIQUE KEY,
    fullname				VARCHAR(100),
    department_id			TINYINT UNSIGNED,
    position_id				SMALLINT UNSIGNED,
    create_date				DATE
);

CREATE TABLE `group` (
	group_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name				VARCHAR(100) UNIQUE KEY,
    creator_id				SMALLINT UNSIGNED,
    created_date			DATE
);

CREATE TABLE group_account (
	group_id				TINYINT UNSIGNED,
    account_id				SMALLINT UNSIGNED,
    join_date				DATE,
    PRIMARY KEY(group_id, account_id)
    -- Cách viết primary key và unique key giống nhau UNIQUE KEY(group_id, account_id)
);

CREATE TABLE type_question (
	type_question_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_question_name			Bit
);

CREATE TABLE category_question (
	category_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name			VARCHAR(50)
);

CREATE TABLE question (
	question_id						TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content							VARCHAR(500),
    type_question_id				TINYINT UNSIGNED,
    category_id						TINYINT UNSIGNED,
    creator_id						SMALLINT UNSIGNED,
    created_date					DATE
);

CREATE TABLE answer (
	answer_id						SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content							VARCHAR(500),
    question_id						TINYINT UNSIGNED,
    is_correct						BIT
);

CREATE TABLE exam (
	exam_id							TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`							CHAR(10),
    title						 	VARCHAR(100),
    category_id						TINYINT UNSIGNED,
    duration						TINYINT UNSIGNED,
    creator_id						SMALLINT UNSIGNED,
    created_date					DATE
);
CREATE TABLE exam_question (
	exam_id							TINYINT UNSIGNED,
    question_id						TINYINT UNSIGNED,
    PRIMARY KEY(exam_id, question_id)
);