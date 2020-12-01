USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteManufactory]    Script Date: 12/1/2020 8:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Đạt
-- Create date: 30/11/2020
-- Description:	Delete category
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteManufactory]
	@ManufactoryId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(200) ='Something went wrong, please contact administrator.'

	BEGIN TRAN
	BEGIN TRY
	IF(ISNULL(@ManufactoryId,0) = 0)
	BEGIN
		SET @Message = 'Manufactory ID is required.'
	END
	ELSE
	BEGIN
		IF (NOT EXISTS (SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId))
		BEGIN
			SET @Message = 'Manufactory is not exists.'
		END
		ELSE
		BEGIN
			IF (EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = 1))
			BEGIN
			SET @Message = 'Manufactory already deleted.'
			END
			ELSE
			BEGIN
				UPDATE Manafactory
				SET IsDeleted = 1
				WHERE ManufactoryId = @ManufactoryId
				SET @Message = 'Manufactory has been deleted.'
			END
		END
	END
	SELECT @Message AS [Message], @ManufactoryId AS [ManufactoryId]
		COMMIT TRAN
	END TRY
	BEGIN CATCH
	SELECT @Message AS [Message], @ManufactoryId AS [ManufactoryId]
		ROLLBACK TRAN
	END CATCH
END
GO
