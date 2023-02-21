INSERT INTO department	( department_name	)
VALUES					( 'Marketing'		),
						( 'Sales'			),
                        ( 'Technical'		),
                        ( 'Accounting'     	),
                        ( 'Director'		);
                        
INSERT INTO `position`	(position_name	)
VALUES					('Dev'		  	),
						('Test'		  	),
                        ('Scrum Master'	),
                        ('PM'     		);
                        
INSERT INTO `account`	(		email,				 			username, 					fullname, 					department_id, 			position_id, 			created_date	)
VALUES					( 		'thuy.ptt@gmail.com',			'thuy.phamthithanh',		'Phạm Thị Thanh Thủy', 			2,						2,					 '2018-08-01'	),
						( 		'nguyenhonghanh@gmail.com',		'nguyen.hoanghanh', 		'Hoang Hanh Nguyen',			1,						1,					 '2019-05-05'	),
                        ( 		'tvd@gmail.com',				'thuan.vuduc',				'Vũ Đức Thuận',					3, 						4, 					  NOW()			),
                        ( 		'hanhhong1999@gmail.com',		'hanh.nguyenhong',			'Nguyễn Hồng Hạnh',				4,						5,					  NULL     		),
                        ( 		'hienthu.13@gmail.com',			'hien.nguyenthithu',		'Nguyễn Thi	Thu Hiền',			5, 						3,					 '2017-08-08'	);
                        
INSERT INTO `group`		( 			group_name, 					creator_id, 					created_date)
VALUES					(			'hội yêu bóng đá',					3, 							'2019-09-09'),
						(			'hội thích du lịch',				1, 							'2019-01-01'),
                        (			'hội yêu ẩm thực',					5, 							'2018-08-05'),
                        (			'nhóm học tiếng Anh',				2, 							'2020-02-09'),
						(			'nhóm học tiếng Hàn',				4, 							'2021-12-12');
                        
INSERT INTO group_account		(group_id, 				account_id, 				join_date	)
VALUES							(	5, 						5,						'2021-12-30'),
								(	2, 						5,						'2020-03-01'),
								(	4, 						3,						'2018-08-05'),
								(	1, 						3,						'2020-12-30'),     
								(	5, 						2,						'2022-10-25');
                                
INSERT INTO type_question	(type_question_name	)
VALUES						(		0			),
							(		1 			);
							
                            
INSERT INTO category_question	(category_name)
VALUES							(	'Java'	  ),
								(	'SQL'	  ),
								(	'Ruby'	  ),
								(	'Postman' ),
								(	'.NET'	  );
                                
INSERT INTO question	(		content,				 										type_question_id, 					category_id, 					creator_id, 			created_date	)
VALUES					(		'spring boot là gì',													1,								1, 								3,					'2020-08-01'	),
						(		'Database là gì',														3,								2, 								3,					'2021-01-15'	),                     
                        (		'Làm thế nào để triểm khai biến InstanceVariable trong Ruby',			3,								3,								4, 					'2018-05-01'	),
                        (		'.Net để làm gì',														1,								5, 								2,					'2020-05-05'	),
                        (		'Request GET trong Postman có ảnh hưởng tới endpoint không?',			2,								4, 								5,					'2018-09-10'	);
                        
INSERT INTO answer		(				content, 									question_id, 					is_correct	)
VALUES					(			'NET là một nền tảng nguồn mở',						4, 								1		),
						(			'là hệ thống lưu trữ thông tin và dữ liệu',			2, 								1		),
                        (			'có',												5, 								0		),
                        (			'.Net dùng để phát triển ứng dụng web',				4, 								0		),
						(			'la một Java Framework',							1, 								1		);
                        
INSERT INTO exam		(	code,				 	title, 					category_id, 		duration, 			creator_id, 			created_date	)
VALUES					(	'N11',					'Đề thi Java',				1, 					60,					3,					 '2020-08-20'	),
						(	'N15',					'Đề thi .Net', 				5,					120,			 	2,					 '2020-10-10'	),
                        (	'N13',					'Đề thi SQL',				2,					90, 				3, 					 '2021-03-02'	),
                        (	'N17',					'Đề thi Postman',			4,					120,				5,					  NULL     		),
                        (	'N16',					'Đề thi Ruby',				3,					120, 				4,					  NULL			);
                        
INSERT INTO exam_question		(exam_id,	question_id	)
VALUES							(	1, 			1	 	),
								(	2, 			4	 	),
								(	3, 			2	 	),
								(	4, 			5	 	),
								(	5, 			3	 	);                        