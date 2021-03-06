USE [career]
GO
/****** Object:  Table [dbo].[address]    Script Date: 4/2/2019 7:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state_id] [char](2) NULL,
	[country_id] [char](2) NOT NULL,
	[zip] [varchar](50) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_address] UNIQUE NONCLUSTERED 
(
	[country_id] ASC,
	[state_id] ASC,
	[city] ASC,
	[zip] ASC,
	[street] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_country] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_country]
GO
/****** Object:  Trigger [dbo].[new_address]    Script Date: 4/2/2019 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[new_address]
   ON  [dbo].[address]
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO address (city, country_id, state_id, street, zip)
	SELECT i.city, i.country_id, i.state_id, i.street, i.zip
	FROM dbo.address a right outer join
		inserted i on isnull(a.city,-1) = isnull(i.city,-1) and a.country_id = i.country_id and isnull(a.state_id,-1) =isnull(i.state_id,-1) and isnull(a.street,-1) = isnull(i.street,-1) and isnull(a.zip,-1) =isnull(i.zip,-1)
	WHERE a.address_id is null and i.country_id is not null
END
GO
ALTER TABLE [dbo].[address] ENABLE TRIGGER [new_address]
GO
