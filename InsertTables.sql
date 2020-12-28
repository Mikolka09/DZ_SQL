-- INSERT 'Students':
INSERT INTO [Students] ([Name],    [Rating],    [Surname]  )
			    VALUES ( N'Иван',      4,        N'Петров' ),
				       ( N'Вера',      5,        N'Иванова'),
					   ( N'Петр',      3,        N'Глобин' ),
					   ( N'Светлана',  4,        N'Пушкин' ),
					   ( N'Дмитрий',   3,        N'Шакин'  ),
					   ( N'Сергей',    2,        N'Чумак'  ),
					   ( N'Мария',     5,        N'Крутая' ),
					   ( N'Василий',   2,        N'Комар'  ),
					   ( N'Яна',       4,        N'Малая'  )

-- INSERT 'Groups':
INSERT INTO [Groups] ( [Name],    [Year],  [DepartmentId])
	          VALUES ( N'ПВ911',    1,            2   ),
			         ( N'ПВ912',    2,            3   ),
			         ( N'ПВ910',    5,            5   ),
			         ( N'ПВ913',    3,            4   ),
					 ( N'ПД904',    1,            1   ),
					 ( N'ПД924',    4,            3   ),
					 ( N'ПС945',    5,            4   ),
					 ( N'ПС955',    5,            5   )

-- INSERT 'GroupsCurators'
INSERT INTO [GroupsCurators] ( [CuratorId], [GroupId] )
					  VALUES (      1,			1	  ),
							 (      3,			3	  ),
							 (      5,			5	  ),
							 (      4,			8	  ),
							 (      4,			5	  ),
							 (      2,			7	  ),
							 (      2,			2	  ),
							 (      1,			4	  ),
							 (      3,			6	  )

-- INSERT 'Curators'
INSERT INTO [Curators] (   [Name],      [Surname] )
				VALUES ( N'Наталья',    N'Иванова'),
					   ( N'Василий',    N'Петров' ),
					   ( N'Дмитрий',    N'Лапухин'),
					   ( N'Елена',      N'Ларцова'),
					   ( N'Петр',       N'Карлсон')


-- INSERT 'GroupsStudents'
INSERT INTO [GroupsStudents] ( [GroupId], [StudentId] )
					 VALUES  (     1,			1	  ),
							 (     3,			2	  ),
							 (     6,			3	  ),
							 (     2,			7	  ),
							 (     2,			5	  ),
							 (     4,			9	  ),
							 (     8,			6	  ),
							 (     7,			4	  ),
							 (     5,			8	  )

-- INSERT 'GroupsLectures':
INSERT INTO [GroupsLectures] ( [GroupId], [LectureId] )
					  VALUES (      5,        1       ),
					         (      3,        3       ),
							 (      2,        2       ),
							 (      4,        4       ),
							 (      1,        5       ),
							 (      8,        7       ),
							 (      6,        6       ),
							 (      1,        8       ),
							 (      7,        9       )

-- INSERT 'Lectures':
INSERT INTO [Lectures] (   [Date],       [SubjectId], [TeacherId] )
			    VALUES (  '2020-12-12',          1,           2     ),
				       (  '2020-12-10',          2,           1     ),
					   (  '2020-11-11',          4,           2     ),
					   (  '2020-10-08',          3,           2     ),
					   (  '2020-12-11',          5,           5     ),
					   (  '2020-11-22',          3,           3     ),
					   (  '2020-10-24',          2,           1     ),
					   (  '2020-12-10',          1,           5     ),
					   (  '2020-12-12',          4,           3     )

-- INSERT 'Subjects':
INSERT INTO [Subjects] ( [Name] )
			    VALUES ( N'Geometry' ),
					   ( N'Computer' ),
					   ( N'Software' ),
					   ( N'Dizayn'   ),
					   ( N'Mechanic' )

-- INSERT 'Departments':
INSERT INTO [Departments] ([Building], [Financing],    [Name],                [FacultyId] )
	               VALUES (    1,          12000,      N'Экономика и Право',         2    ),
						  (    3,          9000,       N'Mechanic',                  1    ),
						  (    5,          15000,      N'Computer Science',          4    ),
				          (    4,          18000,      N'Software Development',      4    ),
						  (    1,          20000,      N'Dizayn',                    5    ),
						  (    2,          14000,      N'Технология приготовлений',  3    ),
						  (    5,          25000,      N'Технология металлов',       3    )
-- INSERT 'Faculties':															     
INSERT INTO [Faculties] (  [Name])
	             VALUES (  N'Машиностроение'    ),
				        (  N'Экономика и право' ),
				        (  N'Технологический'   ),
						(  N'Кибернетики'       ),
						(  N'Художественный'    )

-- INSERT 'Teachers':
INSERT INTO [Teachers] ( [IsProfessor],  [Name],         [Salary],     [Surname])
	            VALUES (     1,            N'Василий',      3300,         N'Петров'  ),
				       (     1,            N'Анна',         4300,         N'Дарк'    ),
				       (     0,            N'Дмитрий',      4000,         N'Афимов'  ),
					   (     0,            N'Константин',   4000,         N'Овечкин' ),
					   (     1,            N'Петр',         3500,         N'Петров'  )