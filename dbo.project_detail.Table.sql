USE [career]
GO
/****** Object:  Table [dbo].[project_detail]    Script Date: 4/2/2019 7:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_detail](
	[project_id] [int] NOT NULL,
	[detail_id] [int] NOT NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_project_detail] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC,
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[project_detail]  WITH CHECK ADD  CONSTRAINT [FK_project_detail_detail] FOREIGN KEY([detail_id])
REFERENCES [dbo].[detail] ([detail_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_detail] CHECK CONSTRAINT [FK_project_detail_detail]
GO
ALTER TABLE [dbo].[project_detail]  WITH CHECK ADD  CONSTRAINT [FK_project_detail_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([project_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_detail] CHECK CONSTRAINT [FK_project_detail_project]
GO
