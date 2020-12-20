-- CREATE 'Groups':
CREATE TABLE [Groups](
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(10) NOT NULL UNIQUE CHECK([Name] <> N''),
	--[Rating] INT NOT NULL CHECK([Rating] BETWEEN 0 AND 5),
	[Year] INT NOT NULL CHECK([Year] BETWEEN 1 AND 5),
	[DepartmentId] INT NOT NULL
)

-- CREATE 'Departments':
CREATE TABLE [Departments](
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Financing] MONEY NOT NULL CHECK(Financing > 0.0) DEFAULT 0.0,
	[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK([Name] <> N''),
	[FacultyId] INT NOT NULL
)

-- CREATE 'Faculties':
CREATE TABLE [Faculties](
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	--[Dean] NVARCHAR(MAX) NOT NULL CHECK([Dean] <> N''),
	[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK([Name] <> N'')
)

-- CREATE 'Teachers':
CREATE TABLE [Teachers](
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	--[EmploymentDate] DATE NOT NULL CHECK([EmploymentDate] >= '1990-01-01'),
	--[IsAssistant] BIT NOT NULL DEFAULT 0,
	--[IsProfessor] BIT NOT NULL DEFAULT 0,
	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> N''),
	--[Position] NVARCHAR(MAX) NOT NULL CHECK([Position] <> N''),
	--[Premium] MONEY NOT NULL CHECK([Premium] >= 0.0) DEFAULT 0.0,
	[Salary] MONEY NOT NULL CHECK([Salary] > 0.0),
	[Surname] NVARCHAR(MAX) NOT NULL CHECK([Surname] <> N'')
)

-- CREATE 'GroupsLectures'
CREATE TABLE [GroupsLectures](
	[Id] INT NOT NULL IDENTiTY(1, 1) PRIMARY KEY,
	[DayOfWeek] INT NOT NULL CHECK ([DayOfWeek] BETWEEN 1 AND 7),
	[GroupId] INT NOT NULL,
	[LectureId] INT NOT NULL
)

-- CREATE 'Lectures'
CREATE TABLE [Lectures](
	[Id] INT NOT NULL IDENTiTY(1, 1) PRIMARY KEY,
	[LectureRoom] NVARCHAR(MAX) NOT NULL CHECK([LectureRoom] <> N''),
	[SubjectId] INT NOT NULL,
	[TeacherId] INT NOT NULL
)

-- CREATE 'Subjects'
CREATE TABLE [Subjects](
	[Id] INT NOT NULL IDENTiTY(1, 1) PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK([Name] <> N'')
)