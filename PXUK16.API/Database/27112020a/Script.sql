USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateManafactory]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tuan Anh
-- Create date: 26/11/2020
-- Description:	Create New Manufactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateManafactory]
	@Name NVARCHAR(500)
AS
BEGIN
	DECLARE @ManufactoryId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@Name IS NULL OR @Name = '')
		BEGIN
			SET @Message = 'Manafactory name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Manafactory WHERE Name = @Name))
			BEGIN
				SET @Message = 'Manafactory name is exists.'
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
				SET @Message = 'Manafactory has been created success.'
			END
		END
		SELECT @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END CATCH
END
GO