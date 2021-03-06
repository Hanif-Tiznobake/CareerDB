USE [career]
GO
/****** Object:  Table [dbo].[course_detail]    Script Date: 4/2/2019 7:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_detail](
	[course_id] [int] NOT NULL,
	[detail_id] [int] NOT NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_course_detail] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[course_detail]  WITH CHECK ADD  CONSTRAINT [FK_course_detail_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[course_detail] CHECK CONSTRAINT [FK_course_detail_category]
GO
ALTER TABLE [dbo].[course_detail]  WITH CHECK ADD  CONSTRAINT [FK_course_detail_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[course_detail] CHECK CONSTRAINT [FK_course_detail_course]
GO
ALTER TABLE [dbo].[course_detail]  WITH CHECK ADD  CONSTRAINT [FK_course_detail_detail] FOREIGN KEY([detail_id])
REFERENCES [dbo].[detail] ([detail_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[course_detail] CHECK CONSTRAINT [FK_course_detail_detail]
GO
