USE [PXUK16DB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Quoc Khanh
-- Create date: 01/12/2020
-- Description:	Update Manufactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateManufactory]
	@ManafactoryId		INT,
	@ManufactoryName	NVARCHAR(500)
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManafactoryId,0) = 0)
		BEGIN
			SET @Message = 'ManafactoryId is required.'
		END
		ELSE
		BEGIN
			IF(ISNULL(@ManufactoryName, '') = '')
			BEGIN
				SET @Message = 'Manafactory name is required.'
			END
			ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Manafactory WHERE ManafactoryId = @ManafactoryId))
				BEGIN
					SET @Message = 'Can not found Manafactory Id'	
				END
				ELSE
				BEGIN
					IF(EXISTS(SELECT * FROM Manafactory WHERE Name = @ManufactoryName AND ManafactoryId <> @ManafactoryId))
					BEGIN
						SET @Message = 'Manafactory is exists'	
					END
					ELSE
					BEGIN
						UPDATE Manafactory
						SET Name = @ManufactoryName
						WHERE ManafactoryId = @ManafactoryId

						SET @Message = 'Manafactory has been updated success'
						SET @Result = 1
					END
				END
			END
		END
		SELECT @Result AS Result, @Message AS [Message], @ManafactoryId AS ManafactoryId
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message], @ManafactoryId AS ManafactoryId
		ROLLBACK TRAN
	END CATCH
END
