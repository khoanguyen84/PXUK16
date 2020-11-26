SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ron
-- Create date: 26/11/2020
-- Description:	Create new Manufactory
-- =============================================
CREATE PROCEDURE sp_CreateManufactory
	@ManufactoryName NVARCHAR(500)
AS
BEGIN
	DECLARE @ManufactoryId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@ManufactoryName IS NULL OR @ManufactoryName = '')
		BEGIN
			SET @Message = 'Manufactory name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Manafactory WHERE @ManufactoryName = @ManufactoryName))
			BEGIN
				SET @Message = 'Manufactory name is exists.'
			END
			ELSE
			BEGIN
				INSERT INTO [dbo].[Manafactory]
                            ([Name]
                            ,[IsDeleted])
				 VALUES
					   (@ManufactoryName
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

USE [PXUK16DB]
GO



