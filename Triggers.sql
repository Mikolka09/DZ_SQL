--Задание 1. К базе данных «Спортивный магазин» из практического задания к этому модулю создайте следующие триггеры:

-- 1. При добавлении нового товара триггер проверяет его наличие на складе, если такой товар есть и новые данные о
-- товаре совпадают с уже существующими данными, вместо добавления происходит обновление информации о количестве товара
--CREATE TRIGGER
--	Add_Product
--	ON Products
--	AFTER INSERT
--AS
--	DECLARE @N NVARCHAR(20)
--	SET @N = (SELECT [Name] FROM inserted)
--	DECLARE @NP NVARCHAR(20)
--	SET @NP = (SELECT [Name_Prod] FROM inserted)
--	DECLARE @P MONEY
--	SET @P = (SELECT [Price] FROM inserted)
--    UPDATE 
--    	Products
--    SET
--    	Cnt = Cnt + (SELECT [Cnt] FROM inserted)
--	WHERE
--		Products.[Name] = @N AND
--		Products.[Name_Prod] = @NP AND
--		Products.[Price] = @P
	
-- 2. При увольнении сотрудника триггер переносит информацию об уволенном сотруднике в таблицу «Архив сотрудников»
--CREATE TRIGGER
--	Delete_Manager
--	ON Managers
--	AFTER DELETE
--AS
--	INSERT INTO [Arhiv_Managers] 
--	SELECT 
--		* 
--	FROM 
--		deleted 
--	WHERE 
--		Managers.[Id] = (SELECT [Id] FROM deleted)

-- 3. Триггер запрещает добавлять нового продавца, если количество существующих продавцов больше 6
--CREATE TRIGGER
--	NotInsertManager
--	ON Managers
--	AFTER INSERT
--AS
--	IF (SELECT COUNT(M.[Id]) FROM Managers M) > 6
--		BEGIN
--			PRINT 'Добавить не возможно, продавцов уже 6'
--			RETURN
--		END
--	ELSE
--		INSERT INTO [Managers] SELECT * FROM inserted

-- Задание 2. К базе данных «Музыкальная коллекция» из практического задания модуля «Работа с таблицами и пред-
-- ставлениями в MS SQL Server» создайте следующие триггеры:

-- 1. Триггер не позволяющий добавить уже существующий в коллекции альбом
--CREATE TRIGGER
--	StopInsertAlbum
--	ON MusicCollection
--	AFTER INSERT
--AS
--	IF (SELECT M.[Name] FROM MusicCollection M) = (SELECT [Name] FROM inserted)
--		BEGIN
--			PRINT 'Такой альбом уже есть!'
--			RETURN
--		END
--	ELSE
--		INSERT INTO [MusicCollection] SELECT * FROM inserted

-- 2. Триггер не позволяющий удалять диски группы The Beatles
--CREATE TRIGGER
--	StopDellAlbum
--	ON MusicCollection
--	AFTER INSERT
--AS
--	DECLARE @group NVARCHAR(20)
--	SET @group = N'The Beatles'
--	IF (SELECT M.[Id] FROM MusicCollection M WHERE M.[Name_Group] = @group) = (SELECT [Id] FROM inserted)
--		BEGIN
--			PRINT 'The Beatles удалять запрещено!'
--			RETURN
--		END
--	ELSE
--		DELETE FROM MusicCollection WHERE [Id] = (SELECT [Id] FROM inserted)

-- 3. При удалении диска триггер переносит информацию об удаленном диске в таблицу «Архив»
--CREATE TRIGGER
--	Delete_Disc
--	ON MusicCollection
--	AFTER DELETE
--AS
--	INSERT INTO [Arhiv_Disc] 
--	SELECT 
--		* 
--	FROM 
--		deleted 
--	WHERE 
--		MusicCollection.[Id] = (SELECT [Id] FROM deleted)

-- 4. Триггер не позволяющий добавлять в коллекцию диски музыкального стиля «Dark Power Pop».
--CREATE TRIGGER
--	StopInsertAlbumDark
--	ON MusicCollection
--	AFTER INSERT
--AS
--	DECLARE @group NVARCHAR(20)
--	SET @group = N'Dark Power Pop'
--	IF (SELECT [Name_Group] FROM inserted) = @group
--		BEGIN
--			PRINT 'Такой альбом добавлять запрещено!'
--			RETURN
--		END
--	ELSE
--		INSERT INTO [MusicCollection] SELECT * FROM inserted

-- Задание 3. К базе данных «Продажи» из практического задания модуля «Работа с таблицами и представлениями в
-- MS SQL Server» создайте следующие триггеры:

-- 1. При добавлении нового покупателя триггер проверяет наличие покупателей с такой же фамилией. 
-- При нахождении совпадения триггер записывает об этом информацию в специальную таблицу
--CREATE TRIGGER
--	InsertNewBuyer
--	ON Buyers
--	AFTER INSERT
--AS
--	DECLARE @name NVARCHAR(100)
--	SET @name = (SELECT [Name] FROM inserted)
--	IF (SELECT [Name] FROM Buyers) = @name
--		BEGIN
--			INSERT INTO [Buyer_Info] VALUES ( @name,  N'Повторение' , GETDATE())
--			RETURN
--		END

-- 2. При удалении информации о покупателе триггер переносит его историю покупок в таблицу «История покупок»
--CREATE TRIGGER
--	HistoryShoppingBuyer
--	ON Buyers
--	AFTER DELETE
--AS
--	DECLARE @id INT
--	SET @id = (SELECT [Id] FROM Buyers WHERE [Id] = (SELECT [Id] FROM deleted))
--	INSERT INTO [History_Shoping] SELECT * FROM Shoppings WHERE [Id_buyer] = @id

-- 3. При добавлении продавца триггер проверяет есть ли он в таблице покупателей, если запись существует добавление
-- нового продавца отменяется
--CREATE TRIGGER
--	InsertManagerCheck
--	ON Managers
--	AFTER INSERT
--AS
--	DECLARE @name NVARCHAR(100)
--	SET @name = (SELECT [Name] FROM inserted)
--	IF (SELECT B.[Name] FROM Buyers B) = @name
--		BEGIN
--			PRINT 'Такое имя есть в Покупателях!'
--			RETURN
--		END

-- 4. При добавлении покупателя триггер проверяет есть ли он в таблице продавцов, если запись существует добавление
-- нового покупателя отменяется
--CREATE TRIGGER
--	InsertBuyerCheck
--	ON Buyers
--	AFTER INSERT
--AS
--	DECLARE @name NVARCHAR(100)
--	SET @name = (SELECT [Name] FROM inserted)
--	IF (SELECT M.[Name] FROM Managers M) = @name
--		BEGIN
--			PRINT 'Такое имя есть в Покупателях!'
--			RETURN
--		END

-- 5. Триггер не позволяет вставлять информацию о продаже таких товаров: яблоки, груши, сливы, кинза
--CREATE TRIGGER
--	StopInsertProduct
--	ON Sales
--	AFTER INSERT
--AS
--	DECLARE @t1 NVARCHAR(10)
--	SET @t1 = N'Яблоки'
--	DECLARE @t2 NVARCHAR(10)
--	SET @t2 = N'Груши'
--	DECLARE @t3 NVARCHAR(10)
--	SET @t3 = N'Сливы'
--	DECLARE @t4 NVARCHAR(10)
--	SET @t4 = N'Кинза'
--	DECLARE @t NVARCHAR(10)
--	SET @t = (SELECT [Name_Prod] FROM inserted)
	
--	IF (@t = @t1 OR @t = @t2 OR @t = @t3 OR @t = @t4)
--		BEGIN
--			PRINT 'Error!'
--			RETURN
--		END
		

		
	
		