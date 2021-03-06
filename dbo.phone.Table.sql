USE [career]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 4/2/2019 7:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[country_code] [int] NULL,
	[area_code] [int] NULL,
	[number] [int] NOT NULL,
	[extension] [int] NULL,
	[temp_id] [int] NULL,
 CONSTRAINT [PK_phone] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_phone] UNIQUE NONCLUSTERED 
(
	[country_code] ASC,
	[area_code] ASC,
	[number] ASC,
	[extension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Trigger [dbo].[new_phone]    Script Date: 4/2/2019 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[new_phone]
   ON  [dbo].[phone] 
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO phone (area_code, country_code, extension, number)
	SELECT i.area_code, i.country_code, i.extension, i.number
	FROM dbo.phone p right outer join
		inserted i on isnull(p.area_code,-1) = isnull(i.area_code,-1) and isnull(p.country_code,-1) = isnull(i.country_code,-1) and isnull(p.extension,-1) = isnull(i.extension,-1) and p.number = i.number
	WHERE p.phone_id is null and i.number is not null
END
GO
ALTER TABLE [dbo].[phone] ENABLE TRIGGER [new_phone]
GO
