﻿USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateManufactory]    Script Date: 11/30/2020 11:37:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ngọc Phước
-- Create date: 30/11/2020
-- Description:	Update Manufactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateManufactory]
	@ManufactoryId		INT,
	@Name	NVARCHAR(500)
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManufactoryId,0) = 0)
		BEGIN
			SET @Message = 'ManufactoryId is required.'
		END
		ELSE
		BEGIN
			IF(ISNULL(@Name, '') = '')
			BEGIN
				SET @Message = 'Manufactory name is required.'
			END
			ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Manufactory WHERE ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Can not found ManufactoryId'	
				END
				ELSE
				BEGIN
					IF(EXISTS(SELECT * FROM Manufactory WHERE Name = @Name AND ManufactoryId <> @ManufactoryId))
					BEGIN
						SET @Message = 'Manufactory Name is exists'	
					END
					ELSE
					BEGIN
						UPDATE Manufactory
						SET  Name = @Name
						WHERE ManufactoryId =@ManufactoryId

						SET @Message = 'Manufactory has been updated success'
						SET @Result = 1
					END
				END
			END
		END
		SELECT @Result AS Result, @Message AS [Message] , @ManufactoryId AS ManufactoryId
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message] , @ManufactoryId AS ManufactoryId
		ROLLBACK TRAN
	END CATCH
END
GO