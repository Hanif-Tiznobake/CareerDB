USE [career]
GO
/****** Object:  Table [dbo].[url]    Script Date: 4/2/2019 7:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[url](
	[url_id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](max) NULL,
 CONSTRAINT [PK_url] PRIMARY KEY CLUSTERED 
(
	[url_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Trigger [dbo].[new_url]    Script Date: 4/2/2019 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[new_url]
   ON  [dbo].[url]
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO url (url)
	SELECT i.url
	FROM dbo.url u right outer join
		inserted i on u.url = i.url
	WHERE u.url_id is null
END
GO
ALTER TABLE [dbo].[url] ENABLE TRIGGER [new_url]
GO
