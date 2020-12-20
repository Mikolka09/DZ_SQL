-- Вывести количество преподавателей кафедры “Software Development”
SELECT
	Dep.Name,
	COUNT (Teach.Name) AS [Teachers, cnt]
FROM
	Teachers Teach
	JOIN Lectures Lec ON Lec.TeacherId = Teach.Id
	JOIN GroupsLectures GrLec ON GrLec.LectureId = Lec.Id
	JOIN Groups Gr ON Gr.Id = GrLec.GroupId
	JOIN Departments Dep ON Dep.Id =Gr.DepartmentId
WHERE
	Dep.Name = 'Software Development'
GROUP BY
	Dep.Name

-- Вывести количество лекций, которые читает преподаватель “Dave McQueen”
SELECT
	MAX(Tmp.FIO) AS FIO,
	COUNT(Tmp.TeacherId) AS [Lectures, Cnt]
FROM
    (
	SELECT
		CONCAT(Teach.Name, ' ', Teach.Surname) AS FIO,
		Lec.TeacherId AS [TeacherId]
	FROM
		Teachers Teach
		JOIN Lectures Lec ON Lec.TeacherId = Teach.Id
	) AS Tmp
WHERE
	Tmp.FIO = N'Dave McQueen'
GROUP BY
	Tmp.FIO

-- Вывести количество занятий, проводимых в аудитори “D201”
SELECT
	Lec.LectureRoom AS [LectureRoom],
	COUNT(Lec.LectureRoom) AS [Cnt]
FROM
	Lectures Lec
WHERE
	Lec.LectureRoom = N'D201'
GROUP BY
	Lec.LectureRoom

-- Вывести названия аудиторий и количество лекций, проводимых в них
SELECT
	Lec.LectureRoom AS [LectureRoom],
	COUNT(Lec.LectureRoom) AS [Cnt]
FROM
	Lectures Lec
GROUP BY
	Lec.LectureRoom	

-- Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”
-- (в связи отсутствия данных по количеству посещений одной лекции разными группами
-- примем, что эти данные будут находятся в таблице Group в поле Amount)
SELECT
	MAX(Tmp.FIO) AS FIO,
	AVG(Tmp.Amount) AS [AVG Amount, Cnt]
FROM
    (
	SELECT
		CONCAT(Teach.Name, ' ', Teach.Surname) AS FIO,
		Gr.Amount AS [Amount]
	FROM
		Teachers Teach
		JOIN Lectures Lec ON Lec.TeacherId = Teach.Id
	    JOIN GroupsLectures GrLec ON GrLec.LectureId = Lec.Id
	    JOIN Groups Gr ON Gr.Id = GrLec.GroupId
	) AS Tmp
WHERE
	Tmp.FIO = N'Jack Underhill'
GROUP BY
	Tmp.FIO

-- Вывести среднюю ставку преподавателей факультета “Computer Science”
SELECT
	Fac.Name AS [Facilty Name],
	AVG(Teach.Salary) AS [AVG Salary]
FROM
	Teachers Teach
	JOIN Lectures Lec ON Lec.TeacherId = Teach.Id
	JOIN GroupsLectures GrLec ON GrLec.LectureId = Lec.Id
	JOIN Groups Gr ON Gr.Id = GrLec.GroupId
	JOIN Departments Dep ON Dep.Id =Gr.DepartmentId
	JOIN Faculties Fac ON Fac.Id = Dep.FacultyId
WHERE
	Fac.Name = N'Computer Science'
GROUP BY
	Fac.Name

-- Вывести минимальное и максимальное количество студентов среди всех групп
-- (в связи отсутствия данных по количеству студентов в одной группе
-- примем, что эти данные будут находятся в таблице Group в поле Amount)
SELECT
	MAX(Gr.Amount) AS [MAX Amount Students],
	MIN(Gr.Amount) AS [MIN Amount Students]
FROM
	Groups Gr

-- Вывести средний фонд финансирования кафедр
SELECT
	AVG(Dep.Financing) AS [AVG Financing]
FROM
	Departments Dep

-- Вывести полные имена преподавателей и количество читаемых ими дисциплин
SELECT
	CONCAT(Teach.Name, ' ', Teach.Surname) AS FIO,
	COUNT (Sub.Name) AS [Subjects, Cnt]
FROM
	Teachers Teach
	JOIN Lectures Lec ON Lec.TeacherId = Teach.Id
	JOIN Subjects Sub ON Sub.Id = Lec.SubjectId
GROUP BY
	CONCAT(Teach.Name, ' ', Teach.Surname)

-- Вывести количество лекций в каждый день недели
SELECT
	CASE   
      WHEN GrLec.DayOfWeek = 1 THEN N'Понедельник'   
      WHEN GrLec.DayOfWeek = 2 THEN N'Вторник'
	  WHEN GrLec.DayOfWeek = 3 THEN N'Среда'
	  WHEN GrLec.DayOfWeek = 4 THEN N'Четверг'
	  WHEN GrLec.DayOfWeek = 5 THEN N'Пятница'
   END AS [DayOfWeek],
   COUNT(GrLec.LectureId) AS [Lectures, Cnt]
FROM
	GroupsLectures GrLec
GROUP BY
	GrLec.DayOfWeek

-- Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются
SELECT
	Lec.LectureRoom AS [LectureRoom],
	COUNT (Gr.DepartmentId) AS [Departments, Cnt]
FROM
	Lectures Lec
	JOIN GroupsLectures GrLec ON GrLec.LectureId = Lec.Id
	JOIN Groups Gr ON Gr.Id = GrLec.GroupId
	JOIN Departments Dep ON Dep.Id = Gr.DepartmentId
GROUP BY
	Lec.LectureRoom

-- Вывести названия факультетов и количество дисциплин, которые на них читаются
SELECT
	Fac.Name AS [Faculty Name],
	COUNT (Sub.Name) AS [Subjects, Cnt]
FROM
	Subjects Sub
	JOIN Lectures Lec ON Lec.SubjectId = Sub.Id
	JOIN GroupsLectures GrLec ON GrLec.LectureId = Lec.Id
	JOIN Groups Gr ON Gr.Id = GrLec.GroupId
	JOIN Departments Dep ON Dep.Id = Gr.DepartmentId
	JOIN Faculties Fac ON Fac.Id = Dep.FacultyId
GROUP BY
	Fac.Name

-- Вывести количество лекций для каждой пары преподаватель-аудитория
SELECT
	CONCAT (Teach.Name, ' ', Teach.Surname,  N' room № ', Lec.LectureRoom) AS [Teacher-LectureRoom],
	COUNT(GrLec.LectureId) AS [Lectures, Cnt]
FROM
	Teachers Teach
	JOIN Lectures Lec ON Lec.TeacherId = Teach.Id
	JOIN GroupsLectures GrLec ON GrLec.LectureId = Lec.Id
GROUP BY
	CONCAT (Teach.Name, ' ', Teach.Surname,  N' room № ', Lec.LectureRoom)


