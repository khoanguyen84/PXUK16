USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateManufactory]    Script Date: 11/26/2020 6:08:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lê Nhật
-- Create date: 26/11/2020
-- Description:	Create new Manufactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateManufactory]
	@Name NVARCHAR(50)
AS
BEGIN
	DECLARE @ManufactoryId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@Name IS NULL OR @Name = '')
		BEGIN
			SET @Message = 'Category name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Manufactory WHERE Name = @Name))
			BEGIN
				SET @Message = 'Category name is exists.'
			END
			ELSE
			BEGIN
				INSERT INTO [dbo].[Manufactory]
					   ([Name]
					   ,[IsDeleted])
				 VALUES
					   (@Name
					   ,0)

				SET @ManufactoryId = SCOPE_IDENTITY()
				SET @Message = 'Category has been created success.'
			END
		END
		SELECT @ManufactoryId AS CategoryId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @ManufactoryId AS CategoryId, @Message AS [Message]
	END CATCH
END
GO
