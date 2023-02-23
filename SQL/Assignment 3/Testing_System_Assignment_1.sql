DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

CREATE TABLE department (
	department_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name			VARCHAR(100) UNIQUE KEY NOT NULL
);

CREATE TABLE `position` (
	position_id				SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name			ENUM ('Dev', 'Test', 'Scrum Master', 'PM') UNIQUE KEY NOT NULL
);

CREATE TABLE `account` (
	account_id				SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email					VARCHAR(100) UNIQUE KEY NOT NULL,
    username				VARCHAR(100) UNIQUE KEY NOT NULL,
    fullname				VARCHAR(100) NOT NULL,
    department_id			TINYINT UNSIGNED NOT NULL,
    position_id				SMALLINT UNSIGNED DEFAULT 1,
    created_date			DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES `department`(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
    -- created_date chọn datetime DEFAULT now để khi tạo account sẽ tự động lấy ngày giờ tạo tài khoản luôn
    );

CREATE TABLE `group` (
	group_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name				VARCHAR(100) UNIQUE KEY NOT NULL,
    creator_id				SMALLINT UNSIGNED NOT NULL,
    created_date			DATETIME DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE group_account (
	group_id				TINYINT UNSIGNED,
    account_id				SMALLINT UNSIGNED,
    join_date				DATETIME DEFAULT NOW(),
    PRIMARY KEY(group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
    -- Cách viết primary key và unique key giống nhau UNIQUE KEY(group_id, account_id)
);

CREATE TABLE type_question (
	id							TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_question_name			ENUM ('Essay', 'Muiltiple-Choice') NOT NULL
);
-- type_question_name ở đề bài chỉ có 2 trường là multiple-choice và essay. Do đó, có thể khai báo là "bit" và xóa hẳn bảng type_question đi, để khai báo "bit" trong bảng question. Nhưng khi dùng bit thì sau đó sẽ không thể thêm giá trị khác được nữa.

CREATE TABLE category_question (
	id						TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name			VARCHAR(50) NOT NULL
);

CREATE TABLE question (
	id								TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content							VARCHAR(500) NOT NULL,
    type_question_id				TINYINT UNSIGNED DEFAULT 1,
    category_id						TINYINT UNSIGNED NOT NULL,
    creator_id						SMALLINT UNSIGNED,
    created_date					DATETIME DEFAULT NOW(),
    FOREIGN KEY (type_question_id) REFERENCES `type_question`(id),
    FOREIGN KEY (category_id) REFERENCES `category_question`(id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE answer (
	id								SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content							VARCHAR(500) NOT NULL,
    question_id						TINYINT UNSIGNED NOT NULL,
    is_correct						BIT,
    FOREIGN KEY (question_id) REFERENCES `question`(id)
);

CREATE TABLE exam (
	id								TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`							CHAR(10) NOT NULL UNIQUE KEY,
    title						 	VARCHAR(100) NOT NULL UNIQUE KEY,
    category_id						TINYINT UNSIGNED,
    duration						TINYINT UNSIGNED CHECK(duration <=120),
    creator_id						SMALLINT UNSIGNED NOT NULL,
    created_date					DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES `category_question`(id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);
CREATE TABLE exam_question (
	exam_id							TINYINT UNSIGNED,
    question_id						TINYINT UNSIGNED,
    PRIMARY KEY(exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES `exam`(id),
    FOREIGN KEY (question_id) REFERENCES `question`(id)
);