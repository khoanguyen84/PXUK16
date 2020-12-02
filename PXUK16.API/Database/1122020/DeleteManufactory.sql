USE [PXUK16DB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ron
-- Create date: 30/11/2020
-- Description:	Update Manufactory
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteManufactories]
	@ManufactoryId	INT
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0
	DECLARE @IsDelete	BIT = 1

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManufactoryId,0) = 0)
		BEGIN
			SET @Message = 'ManufactoryId is required.'
		END
		ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Can not found Manufactory Id'	
				END
				ELSE
				BEGIN
					UPDATE Manafactory
					SET IsDeleted = @IsDelete
					WHERE ManufactoryId = @ManufactoryId

					SET @Message = 'ManufactoryId has been delete success'
					SET @Result = 1
				END
		END
		SELECT @Result AS Result, @Message AS [Message] ,@ManufactoryId AS ManufactoryId ,@IsDelete AS IsDeleted
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message],@ManufactoryId AS ManufactoryId ,@IsDelete AS IsDeleted
		ROLLBACK TRAN
	END CATCH
END
