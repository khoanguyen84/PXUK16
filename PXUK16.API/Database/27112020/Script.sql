SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  Tuân Lê
-- Create date: 26/11/2020
-- Description:	Create new category
-- =============================================
CREATE PROCEDURE sp_CreateManufactory
	@Name NVARCHAR(50)
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
		SELECT @ManufactoryId AS CategoryId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @ManufactoryId AS ManufactoryId, @Message AS [Message]
	END CATCH
END
GO
