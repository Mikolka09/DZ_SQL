-- INSERT 'Groups':
INSERT INTO [Groups] ([Name], [Rating], [Year])
	          VALUES ( N'ПВ911', 5,     1 ),
			         ( N'ПВ912', 4,     2 ),
			         ( N'ПВ910', 4,     5 ),
			         ( N'ПВ913', 3,     3 )

-- INSERT 'Departments':
INSERT INTO [Departments] ([Financing],    [Name])
	               VALUES ( 1500,       N'Программирование'     ),
				          ( 1800,       N'Кибернетика'          ),
						  ( 2000,       N'Дизайн'               ),
						  ( 15000,      N'Computer Science'     ),
				          ( 18000,      N'Software Development' ),
						  ( 20000,      N'Dizayn'               )
-- INSERT 'Faculties':
INSERT INTO [Faculties] ([Dean],        [Name])
	             VALUES ( N'Петров',    N'Машиностроение' ),
				        ( N'Иванов',    N'Экономика и право' ),
				        ( N'Васильев',  N'Технологический' )

---- INSERT 'Teachers':
INSERT INTO [Teachers] ([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
	            VALUES ( '2005-01-02', 0, 1, N'Василий', N'Преподаватель', 1500, 3300, N'Петров' ),
				       ( '2002-03-10', 0, 1, N'Анна',    N'Зав. Кафедры',  2500, 4300, N'Дарк'   ),
				       ( '2000-04-02', 1, 0, N'Дмитрий', N'Преподаватель', 2000, 4000, N'Афимов' )