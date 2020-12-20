-- INSERT 'Groups':
INSERT INTO [Groups] ([Name],    [Year],   [DepartmentId])
	          VALUES ( N'ПВ911',    1,            2   ),
			         ( N'ПВ912',    2,            3   ),
			         ( N'ПВ910',    5,            5   ),
			         ( N'ПВ913',    3,            4   ),
					 ( N'ПВ914',    4,            1   )

-- INSERT 'GroupsLectures'
INSERT INTO [GroupsLectures] ([DayOfWeek], [GroupId], [LectureId])
					  VALUES (     1,         5,        1 ),
					         (     2,         3,        3 ),
							 (     3,         2,        2 ),
							 (     4,         4,        4 ),
							 (     5,         1,        5 )

-- INSERT 'Lectures'
INSERT INTO [Lectures] ([LectureRoom], [SubjectId], [TeacherId])
			    VALUES (     202,          1,           2 ),
				       (     208,          2,           1 ),
					   (     202,          4,           2 ),
					   (     224,          3,           2 ),
					   (     204,          5,           5 )

-- INSERT 'Subjects'
INSERT INTO [Subjects] ( [Name] )
			    VALUES ( N'Geometry' ),
					   ( N'Computer' ),
					   ( N'Software' ),
					   ( N'Dizayn'   ),
					   ( N'Mechanic' )

-- INSERT 'Departments':
INSERT INTO [Departments] ([Financing],    [Name],             [FacultyId])
	               VALUES ( 12000,      N'Экономика и Право',        2  ),
						  ( 9000,       N'Mechanic',                 1  ),
						  ( 15000,      N'Computer Science',         4  ),
				          ( 18000,      N'Software Development',     4  ),
						  ( 20000,      N'Dizayn',                   5  )
-- INSERT 'Faculties':
INSERT INTO [Faculties] (  [Name])
	             VALUES (  N'Машиностроение'    ),
				        (  N'Экономика и право' ),
				        (  N'Технологический'   ),
						(  N'Кибернетики'       ),
						(  N'Художественный'    )

-- INSERT 'Teachers':
INSERT INTO [Teachers] ( [Name],         [Salary],     [Surname])
	            VALUES (  N'Василий',      3300,         N'Петров'  ),
				       (  N'Анна',         4300,         N'Дарк'    ),
				       (  N'Дмитрий',      4000,         N'Афимов'  ),
					   (  N'Константин',   4000,         N'Овечкин' ),
					   (  N'Петр',         3500,         N'Петров'  )