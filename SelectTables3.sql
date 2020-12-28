-- Вывести номера корпусов, если суммарный фонд финансирования расположенных в них кафедр превышает 100000
SELECT
	D.[Building] AS [Building],
	SUM(D2.[Financing]) AS [SUM Financing]
FROM
	Departments D
	JOIN Departments D2 ON D2.[Name] = D.[Name]
GROUP BY
	D.[Building]
HAVING
	SUM(D2.[Financing]) > 100000

-- Вывести названия групп 5-го курса кафедры “Software Development”, которые имеют более 10 пар в первую неделю
SELECT
	MAX(Gr.[Name]) AS [Group],
	COUNT(Lec.[SubjectId]) AS [Count]
FROM
	Groups Gr
	JOIN Departments D ON D.Id = Gr.DepartmentId
	JOIN GroupsLectures GrLec ON GrLec.GroupId = Gr.Id
	JOIN Lectures Lec ON Lec.Id = GrLec.LectureId
	JOIN
	(SELECT 
   MIN(Lec.[Date]) AS [MinDate],
   MAX(Lec.[Id]) AS [LecId]
   FROM 
   Groups Gr
	JOIN Departments D ON D.Id = Gr.DepartmentId
	JOIN GroupsLectures GrLec ON GrLec.GroupId = Gr.Id
	JOIN Lectures Lec ON Lec.Id = GrLec.LectureId
   WHERE 
	D.[Name] = 'Software Development'
	AND Gr.[Year] = 5
   ) AS Tmp ON Tmp.LecId = Lec.Id
WHERE 
	D.[Name] = N'Software Development'
	AND Gr.[Year] = 5
GROUP BY
	D.[Name]
HAVING
   COUNT(Lec.[SubjectId]) > 10 
   AND
   MIN(Lec.[Date]) >= MIN(Tmp.MinDate)
   AND
   MIN(Lec.[Date]) < MIN(DATEADD(DAY, 7, Tmp.MinDate))

-- Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) больше, чем рейтинг группы “D221”
SELECT
	Gr.[Name] AS [Group],
	MAX(Tmp_Rating.AVGRating) AS [AVGRating]
FROM
	Groups Gr
	JOIN GroupsStudents GrSt ON GrSt.GroupId = Gr.Id
	JOIN Students St ON St.Id = GrSt.StudentId
	JOIN
	(SELECT
		MAX(Gr.[Id]) AS [GrId],
	    AVG(St.[Rating]) AS [AVGRating]
     FROM
	   Groups Gr
	   JOIN GroupsStudents GrSt ON GrSt.GroupId = Gr.Id
	   JOIN Students St ON St.Id = GrSt.StudentId
	GROUP BY
		Gr.[Name]
	) AS Tmp_Rating ON Tmp_Rating.GrId = Gr.Id
GROUP BY
	Gr.[Name]
HAVING
	MAX(Tmp_Rating.AVGRating) >
	(SELECT
	   AVG(St.[Rating]) AS [AVGRating]
     FROM
	   Groups Gr
	   JOIN GroupsStudents GrSt ON GrSt.GroupId = Gr.Id
	   JOIN Students St ON St.Id = GrSt.StudentId
	WHERE
		Gr.[Name] = N'D221'
	GROUP BY
		Gr.[Name]
	)

-- Вывести фамилии и имена преподавателей, ставка которых выше средней ставки профессоров
SELECT
	T.[Surname] + ' ' + T.[Name] AS [FIO],
	T.[Salary] AS [Salary]
FROM
	Teachers T
WHERE
	T.Salary >
	(SELECT
		AVG(T.[Salary]) AS [AVGSalary]
	FROM
	Teachers T
	WHERE
		T.[IsProfessor] = 1
	)

-- Вывести названия групп, у которых больше одного куратора
SELECT
	Gr.[Name] AS [Group],
	COUNT(CuratorId) AS [Count]
FROM
	Groups Gr
	JOIN GroupsCurators GrCur ON GrCur.GroupId = Gr.Id
GROUP BY
	Gr.[Name]
HAVING
	COUNT(CuratorId) > 1

-- Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) меньше, чем минимальный
-- рейтинг групп 5-го курса
SELECT
	Gr.[Name] AS [Group],
	MAX(Tmp_Rating.AVGRating) AS [AVGRating]
FROM
	Groups Gr
	JOIN GroupsStudents GrSt ON GrSt.GroupId = Gr.Id
	JOIN Students St ON St.Id = GrSt.StudentId
	JOIN
	(SELECT
		MAX(Gr.[Id]) AS [GrId],
	    AVG(St.[Rating]) AS [AVGRating]
     FROM
	   Groups Gr
	   JOIN GroupsStudents GrSt ON GrSt.GroupId = Gr.Id
	   JOIN Students St ON St.Id = GrSt.StudentId
	GROUP BY
		Gr.[Name]
	) AS Tmp_Rating ON Tmp_Rating.GrId = Gr.Id
GROUP BY
	Gr.[Name]
HAVING
	MAX(Tmp_Rating.AVGRating) <
	(SELECT
	   MIN(St.[Rating]) AS [MINRating]
     FROM
	   Groups Gr
	   JOIN GroupsStudents GrSt ON GrSt.GroupId = Gr.Id
	   JOIN Students St ON St.Id = GrSt.StudentId
	WHERE
		Gr.[Year] = 5
	)

-- Вывести названия факультетов, суммарный фонд финансирования кафедр которых больше суммарного фонда
-- финансирования кафедр факультета “Computer Science”
SELECT
	MAX(F.[Name]) AS [Faculty],
	SUM(D.[Financing]) AS [SUMFinancing]
FROM
	Faculties F
	JOIN Departments D ON D.FacultyId = F.Id
GROUP BY
	F.[Id]
HAVING
	SUM(D.[Financing]) > 
	(SELECT
		SUM(D.[Financing]) AS [SUMFinancing]
	FROM
		Faculties F
		JOIN Departments D ON D.FacultyId = F.Id
	WHERE
		F.[Name] = N'Computer Science'
	GROUP BY
		F.[Id]
	)

-- Вывести названия дисциплин и полные имена преподавателей, читающих наибольшее количество лекций по ним
SELECT
	MAX(S.[Name]) AS [Subject],
	MIN(T.[Surname] + ' ' + T.[Name]) AS [FIO]
FROM
	Subjects S
	JOIN Lectures L ON L.SubjectId = S.Id
	JOIN Teachers T ON T.Id  = L.TeacherId
GROUP BY
	S.[Id]
HAVING
	COUNT(L.[SubjectId]) = 
	(
	SELECT
	MAX(Tmp_Count.[Count])
    FROM
      (
     SELECT
    		COUNT(L.[SubjectId]) AS [Count]
    	FROM
    		Subjects S
    		JOIN Lectures L ON L.SubjectId = S.Id
    		JOIN Teachers T ON T.Id  = L.TeacherId	
    	GROUP BY
    		S.[Id]
      ) AS Tmp_Count
	)

-- Вывести название дисциплины, по которому читается меньше всего лекций
SELECT
	MAX(S.[Name]) AS [Subject],
	COUNT(L.[SubjectId]) AS [Count]
FROM
	Subjects S
	JOIN Lectures L ON L.SubjectId = S.Id
	JOIN Teachers T ON T.Id  = L.TeacherId
GROUP BY
	S.[Id]
HAVING
	COUNT(L.[SubjectId]) = 
	(
	SELECT
	MIN(Tmp_Count.[Count])
    FROM
      (
     SELECT
    		COUNT(L.[SubjectId]) AS [Count]
    	FROM
    		Subjects S
    		JOIN Lectures L ON L.SubjectId = S.Id
    		JOIN Teachers T ON T.Id  = L.TeacherId	
    	GROUP BY
    		S.[Id]
      ) AS Tmp_Count
	)

-- Вывести количество студентов и читаемых дисциплин на кафедре “Software Development”
SELECT
	D.[Name] AS [Department],
	COUNT(S.[Id]) AS [CountSt],
	COUNT(L.[SubjectId]) AS [CountSub]
FROM
	Students S
	JOIN GroupsStudents GrSt ON GrSt.StudentId = S.Id
	JOIN Groups Gr ON Gr.Id = GrSt.GroupId
	JOIN Departments D On D.Id = Gr.DepartmentId
	JOIN GroupsLectures GrLec ON GrLec.GroupId = Gr.Id
	JOIN Lectures L ON L.Id = GrLec.LectureId
WHERE
	D.[Name] = N'Software Development'
GROUP BY
	D.[Name]