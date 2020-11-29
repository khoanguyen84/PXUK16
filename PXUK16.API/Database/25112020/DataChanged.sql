USE [PXUK16DB]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [IsDeleted]) VALUES (1, N'Laptop', 0)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [IsDeleted]) VALUES (2, N'Mobile', 0)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [IsDeleted]) VALUES (3, N'Desktop', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
