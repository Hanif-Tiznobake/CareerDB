USE [career]
GO
/****** Object:  Table [dbo].[skill_skill]    Script Date: 4/2/2019 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skill_skill](
	[skill_id_1] [int] NOT NULL,
	[skill_id_2] [int] NOT NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_skill_skill] PRIMARY KEY CLUSTERED 
(
	[skill_id_1] ASC,
	[skill_id_2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[skill_skill]  WITH CHECK ADD  CONSTRAINT [FK_skill_skill_category1] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[skill_skill] CHECK CONSTRAINT [FK_skill_skill_category1]
GO
ALTER TABLE [dbo].[skill_skill]  WITH CHECK ADD  CONSTRAINT [FK_skill_skill_skill] FOREIGN KEY([skill_id_1])
REFERENCES [dbo].[skill] ([skill_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[skill_skill] CHECK CONSTRAINT [FK_skill_skill_skill]
GO
