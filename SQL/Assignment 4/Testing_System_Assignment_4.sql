-- Exercise 1: Distinct, Order by, Limit
-- 1. Lấy ra id của các phòng ban đã có nhân viên, sắp xếp theo thứ tự id giảm dần
SELECT DISTINCT(department_id)
FROM `account`
ORDER BY department_id DESC;

-- 2. Lấy ra 3 id của các phòngs ban đã có nhân viên, sắp xếp theo thứ tự id giảm dần
SELECT DISTINCT(department_id)
FROM `account`
ORDER BY department_id DESC
LIMIT 3;

-- 3. Lấy ra tất cả các ngày (duy nhất) nhân viên tham gia vào hệ thống, sắp xếp theo thứ tự giảm dần
SELECT DISTINCT(created_date), CAST(created_date AS DATE) AS DATE
FROM `account`
ORDER BY created_date DESC;

-- 4. 	a. Lấy ra id và tên của 5 nhân viên được tạo gần đây nhất (page 1)
SELECT account_id, fullname
FROM `account`
ORDER BY created_date DESC
LIMIT 5 OFFSET 0;

--  	b. Viết thêm lệnh để lấy page 2, page 3
SELECT account_id, fullname
FROM `account`
ORDER BY created_date DESC
LIMIT 5 OFFSET 5;

SELECT account_id, fullname
FROM `account`
ORDER BY created_date DESC
LIMIT 5 OFFSET 10;

-- 5. 	a. Lấy ra id và tên của 5 nhân viên được tạo sớm nhất (page 1)
SELECT account_id, fullname
FROM `account`
ORDER BY created_date ASC
LIMIT 5 OFFSET 0;

-- 		b. Viết thêm lệnh để lấy page 2, page 3
SELECT account_id, fullname
FROM `account`
ORDER BY created_date ASC
LIMIT 5 OFFSET 5;

SELECT account_id, fullname
FROM `account`
ORDER BY created_date ASC
LIMIT 5 OFFSET 10;

-- 6. Lấy ra tên của 5 phòng ban tạo gần đây nhất
SELECT department_name
FROM `department`
ORDER BY department_id DESC
LIMIT 5;

-- 7. Lấy ra id của tất cả những nhân viên đã tham gia tạo group
SELECT DISTINCT(creator_id)
FROM `group`;

-- 8. Lấy ra id của tất cả những nhân viên đã tham gia tạo question
SELECT DISTINCT(creator_id)
FROM `question`;

-- 9. Lấy ra id của tất cả các nhóm đã có người tham gia
SELECT DISTINCT(group_id)
FROM `group_account`;

-- 10. In ra các category (duy nhất) đã có exam
SELECT DISTINCT(category_id)
FROM `exam`;

-- Exercise 2: Group By & Aggregate functions, Having
-- 1. Thống kê mỗi department có bao nhiêu nhân viên, sắp xếp theo department id giảm dần
SELECT department_id, COUNT(1) AS number_of_employees
From `account`
GROUP BY department_id
ORDER BY department_id DESC;

-- 2. Thống kê mỗi department có bao nhiêu nhân viên đã cập nhập email, sắp xếp theo department id giảm dần
SELECT department_id, COUNT(email) AS number_of_employees
From `account`
GROUP BY department_id
ORDER BY department_id DESC;

-- 3. Thống kê mỗi group có bao nhiêu nhân viên
SELECT group_id, COUNT(1) AS number_of_employees
From `group_account`
GROUP BY group_id
ORDER BY group_id;

-- 4. Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT department_id, position_id, COUNT(1) AS number_of_dev_test_scrum_master_PM
From `account`
GROUP BY department_id, position_id
ORDER BY department_id ASC;

-- 5. Thông kê mỗi category có bao nhiêu Question
SELECT category_id, COUNT(1) AS number_of_question
From `question`
GROUP BY category_id;

-- 6. Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT type_question_id, COUNT(1) AS number_of_essays_multiple_choice
From `question`
GROUP BY type_question_id;

-- 7. In ra tổng số phòng ban trong công ty
SELECT COUNT(1) AS number_of_departments
FROM `department`;

-- 8. In ra tổng số group trong công ty
SELECT COUNT(1) AS number_of_groups
FROM `group`;

-- 9. In ra id phòng ban có nhiều nhân viên nhất
SELECT department_id, COUNT(1) AS number_of_employees
FROM `account`
GROUP BY department_id
ORDER BY number_of_employees DESC
LIMIT 1;

-- 10. Lấy ra ID của question có >= 3 câu trả lời
SELECT question_id, COUNT(1) AS number_of_answers
FROM `answer`
GROUP BY question_id
Having COUNT(question_id) >= 3;

-- 11. Viết lệnh để lấy ra id của các phòng ban có > 3 nhân viên
SELECT department_id, COUNT(1) AS number_of_employees
FROM `account`
GROUP BY department_id
Having COUNT(department_id) > 3;

-- 12. Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT question_id, COUNT(1) AS number_of_exams
FROM `exam_question`
GROUP BY question_id
ORDER BY number_of_exam DESC
LIMIT 1;

-- 13. Lấy ra Question có nhiều câu trả lời nhất
SELECT question_id, COUNT(1) AS number_of_answers
FROM `answer`
GROUP BY question_id
ORDER BY number_of_answers DESC
LIMIT 1;

-- 14. Tìm position có ít người nhất
SELECT position_id, COUNT(1) AS number_of_employees
FROM `account`
GROUP BY position_id
ORDER BY number_of_employees ASC
LIMIT 1;