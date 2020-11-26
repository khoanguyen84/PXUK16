USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateManufactory]    Script Date: 11/26/2020 10:46:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CreateManufactory]
	@Name NVARCHAR(500)
AS
BEGIN
	DECLARE @ManufactoryId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@Name IS NULL OR @Name = '')
		BEGIN
			SET @Message = 'Manufactory name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Manafactory WHERE Name = @Name))
			BEGIN
				SET @Message = 'Manufactory name is exists.'
			END
			ELSE
			BEGIN
				INSERT INTO [dbo].[Manafactory]
					   ([Name]
					   ,[IsDeleted])
				 VALUES
					   (@Name
					   ,0)

				SET @ManufactoryId = SCOPE_IDENTITY()
				SET @Message = 'Manufactory has been created success.'
			END
		END
		SELECT @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END CATCH
END
GO
