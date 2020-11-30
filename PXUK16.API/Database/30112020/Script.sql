USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateManufactory]    Script Date: 11/30/2020 2:34:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Quang lê
-- Create date: 30/11/2020
-- Description:	Update menufactory
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateManufactory]
	@ManufactoryId		INT,
	@ManufactoryName	NVARCHAR(500)
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManufactoryId,0) = 0)
		BEGIN
			SET @Message = ' manufactory is required.'
		END
		ELSE
		BEGIN
			IF(ISNULL(@ManufactoryName, '') = '')
			BEGIN
				SET @Message = 'manufactory name is required.'
			END
			ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Can not found manufactory Id'	
				END
				ELSE
				BEGIN
					IF(EXISTS(SELECT * FROM Manafactory WHERE Name = @ManufactoryName AND ManufactoryId <> @ManufactoryId))
					BEGIN
						SET @Message = 'manufactory is exists'	
					END
					ELSE
					BEGIN
						UPDATE Manafactory
						SET Name = @ManufactoryName
						WHERE ManufactoryId = @ManufactoryId

						SET @Message = 'Manufactory has been updated success'
						SET @Result = 1
					END
				END
			END
		END
		SELECT @Result AS Result, @Message AS [Message] , @ManufactoryId AS [ManufactoryId]
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message], @ManufactoryId AS [ManufactoryId]
		ROLLBACK TRAN
	END CATCH
END

