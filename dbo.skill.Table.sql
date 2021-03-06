USE [career]
GO
/****** Object:  Table [dbo].[skill]    Script Date: 4/2/2019 7:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skill](
	[skill_id] [int] NOT NULL,
	[skill] [varchar](50) NOT NULL,
	[detail_id] [int] NULL,
	[category_id] [int] NULL,
	[temp_id] [int] NULL,
 CONSTRAINT [PK_skill] PRIMARY KEY CLUSTERED 
(
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[skill]  WITH CHECK ADD  CONSTRAINT [FK_skill_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[skill] CHECK CONSTRAINT [FK_skill_category]
GO
ALTER TABLE [dbo].[skill]  WITH CHECK ADD  CONSTRAINT [FK_skill_detail] FOREIGN KEY([detail_id])
REFERENCES [dbo].[detail] ([detail_id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[skill] CHECK CONSTRAINT [FK_skill_detail]
GO
/****** Object:  Trigger [dbo].[new_skill]    Script Date: 4/2/2019 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[new_skill]
	ON [dbo].[skill]
	INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	insert into skill(skill, detail_id, category_id)
	select i.skill, i.detail_id, i.category_id
	from inserted i left outer join skill s on i.skill = s.skill
	where s.skill_id is null and i.skill is not null
END
GO
ALTER TABLE [dbo].[skill] ENABLE TRIGGER [new_skill]
GO
