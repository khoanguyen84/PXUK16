USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateManufactory]    Script Date: 11/26/2020 10:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Minh Hoang
-- Create date: 26/11/2020
-- Description:	Create new manafactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateManufactory]
	@ManufactoryName NVARCHAR(500)
AS
BEGIN
	DECLARE @ManafactoryId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@ManufactoryName IS NULL OR @ManufactoryName = '')
		BEGIN
			SET @Message = 'Manafactory name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Manafactory WHERE Name = @ManufactoryName))
			BEGIN
				SET @Message = 'Manafactory name is exists.'
			END
			ELSE
			BEGIN
				INSERT INTO [dbo].[Manafactory]
					   ([Name]
					   ,[IsDeleted])
				 VALUES
					   (@ManufactoryName
					   ,0)

				SET @ManafactoryId = SCOPE_IDENTITY()
				SET @Message = 'Manafactory has been created success.'
			END
		END
		SELECT @ManafactoryId AS ManafactoryId, @Message AS [Message] 
	END TRY
	BEGIN CATCH
		SELECT @ManafactoryId AS ManafactoryId, @Message AS [Message]
	END CATCH
END


GO
