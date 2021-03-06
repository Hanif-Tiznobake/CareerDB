USE [career]
GO
/****** Object:  Table [dbo].[position_skill]    Script Date: 4/2/2019 7:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position_skill](
	[position_id] [int] NOT NULL,
	[skill_id] [int] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_position_skill] PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[position_skill]  WITH CHECK ADD  CONSTRAINT [FK_position_skill_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[position_skill] CHECK CONSTRAINT [FK_position_skill_category]
GO
ALTER TABLE [dbo].[position_skill]  WITH CHECK ADD  CONSTRAINT [FK_position_skill_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([position_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position_skill] CHECK CONSTRAINT [FK_position_skill_position]
GO
ALTER TABLE [dbo].[position_skill]  WITH CHECK ADD  CONSTRAINT [FK_position_skill_skill] FOREIGN KEY([skill_id])
REFERENCES [dbo].[skill] ([skill_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position_skill] CHECK CONSTRAINT [FK_position_skill_skill]
GO
