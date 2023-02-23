-- Exercise 2
-- 1/ Lấy ra tất cả các thông tin của phòng ban
SELECT *
FROM		department;

-- 2/ Viết lệnh để lấy id, tên nhân viên và id phòng ban của họ
SELECT 	account_id, fullname, department_id
FROM	`account`;

-- 3/ Viết lệnh để lấy id, tên nhân viên thuộc phòng ban có id = 3
SELECT 	account_id, fullname
FROM	`account`
WHERE	department_id = 3;

-- 4/ Viết lệnh để lấy id, tên nhân viên không thuộc phòng ban có id = 
SELECT 	account_id, fullname
FROM	`account`
WHERE	department_id != 3;

-- 5/ Lấy ra id của phòng ban có tên là "Sale
SELECT 	department_id
FROM	`department`
WHERE	`department_name` = 'Sales';

-- 6/ Viết lệnh để lấy id, tên nhân viên thuộc phòng ban có id = 3 và có position = 4
SELECT 	account_id, fullname
FROM	`account`
WHERE	department_id = 3 AND position_id = 4;

-- 7/ Viết lệnh để lấy id, tên nhân viên thuộc phòng ban có id = 3 hoặc id = 5
SELECT 	account_id, fullname
FROM	`account`
WHERE	department_id = 3 OR department_id = 5;

-- 8/ Lấy ra tên group được tạo trước ngày 20/12/2019
SELECT 	group_name
FROM	`group`
WHERE	created_date < '2019-12-20';

-- 9/ Lấy ra tên group được tạo vào năm 2019, 2020, 2021, 2022 (4 năm liền nhau)
SELECT 	group_name
FROM	`group`
WHERE	YEAR(created_date) BETWEEN 2015 AND 2019;

-- 10/ Lấy ra tên group được tạo vào năm 2017, 2019, 2021, 2022 (4 năm bất kì)
SELECT 	group_name
FROM	`group`
WHERE	YEAR(created_date) IN (2007, 2014, 2017, 2019);

-- 11/ Lấy ra tên nhân viên có username bắt đầu bằng chữ N, kết thúc bằng chữ M chứa chữ A
SELECT 	fullname
FROM	`account`
WHERE	username LIKE 'K%T%R';

-- 12/ Lấy ra tên group không có ngày tạo (created_date = null)
SELECT 	group_name
FROM	`group`
WHERE	created_date IS NULL;

-- 13/ Lấy ra id, tên nhân viên có độ dài tên > 15 ký tự
SELECT account_id, fullname
FROM	`account`
WHERE	LENGTH(fullname) > 15;

-- 14/. Lấy ra id câu hỏi có content > 100 ký tự

SELECT id
FROM	`question`
WHERE	LENGTH(content) > 100;


