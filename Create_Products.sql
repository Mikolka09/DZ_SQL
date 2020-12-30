﻿--DROP TABLE [Products]

--CREATE TABLE [Products](
--	[Id] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
--	[Name_Prod] NVARCHAR(MAX) NOT NULL CHECK([Name_Prod] <> ''),
--	[Price] MONEY NOT NULL, CHECK([Price] >= 0),
--	[Cnt] INT NOT NULL, CHECK([Cnt] >= 0)
--)

--INSERT INTO [Products] ([Name],      [Name_Prod],   [Price],   [Cnt])
--			VALUES     ( N'Обувь',    N'Адиддас',    150.25,      5),
--			           ( N'Обувь',    N'Найк',       170.75,      5),
--			           ( N'Обувь',    N'Примеро',    100.25,      5),
--			           ( N'Куртка',   N'Адиддас',    850.85,      5),
--			           ( N'Куртка',   N'Примеро',    1050.50,     5),
--			           ( N'Шапка',    N'Найк',       50.25,       5),
--					   ( N'Шапка',    N'Найк',       80.85,       5),
--					   ( N'Шапка',    N'Найк',       100.25,      5),
--					   ( N'Обувь',    N'Найк',       270.75,      5),
--					   ( N'Куртка',   N'Примеро',    2050.50,     5),
--					   ( N'Куртка',   N'Примеро',    950.50,      5)

--CREATE TABLE [Acc_Products](
--	[Id] INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
--	[Name_Prod] NVARCHAR(MAX) NOT NULL CHECK([Name_Prod] <> ''),
--	[Price] MONEY NOT NULL, CHECK([Price] >= 0),
--	[Cnt] INT NOT NULL, CHECK([Cnt] >= 0)
--)

--INSERT INTO [Acc_Products] ([Name],      [Name_Prod],   [Price],   [Cnt])
--			VALUES           ( N'Обувь',    N'Адиддас',    150.25,      5),
--			                 ( N'Обувь',    N'Найк',       170.75,      5),
--			                 ( N'Обувь',    N'Примеро',    100.25,      5),
--			                 ( N'Куртка',   N'Адиддас',    850.85,      5),
--			                 ( N'Куртка',   N'Примеро',    1050.50,     5),
--			                 ( N'Шапка',    N'Найк',       50.25,       5),
--					         ( N'Шапка',    N'Найк',       80.85,       5),
--					         ( N'Шапка',    N'Найк',       100.25,      5),
--					         ( N'Обувь',    N'Найк',       270.75,      5),
--					         ( N'Куртка',   N'Примеро',    2050.50,     5),
--					         ( N'Куртка',   N'Примеро',    950.50,      5)
