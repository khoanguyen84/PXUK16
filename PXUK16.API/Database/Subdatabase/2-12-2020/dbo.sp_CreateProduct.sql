USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateProduct]    Script Date: 12/1/2020 8:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CreateProduct]
	@ProductName NVARCHAR(500),
	@CategoryId INT,
	@ManufactoryId INT
AS
BEGIN
	DECLARE @ProductId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@ProductName IS NULL OR @ProductName = '')
		BEGIN
			SET @Message = 'Product name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Product WHERE ProductName = @ProductName AND ProductId <> @ProductId))
			BEGIN
				SET @Message = 'Product name is exists.'
			END
			ELSE
			BEGIN
				IF (EXISTS (SELECT * FROM Product WHERE CategoryId = @CategoryId AND ManufactoryId <> @ManufactoryId))
				BEGIN
					SET @Message = 'Product can only have 1 category.'
				END
			ELSE
			BEGIN
				IF (EXISTS (SELECT * FROM Product WHERE CategoryId <> @CategoryId AND ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Product can only have 1 manufactory.'
				END
			ELSE
			BEGIN
				INSERT INTO [dbo].[Product]
					   ([ProductName]
					   ,[CategoryId]
					   ,[ManufactoryId]
					   ,[IsDeleted])
				 VALUES
					   (@ProductName
					   ,@CategoryId
					   ,@ManufactoryId
					   ,0)

				SET @ProductId = SCOPE_IDENTITY()
				SET @Message = 'The product has been created successfully.'
			END
		END
	END
END
		SELECT @ProductId AS ProductId, @ProductName AS ProductName, @CategoryId AS CategoryId, @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @ProductId AS ProductId, @ProductName AS ProductName, @CategoryId AS CategoryId, @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END CATCH
END
GO
