USE [career]
GO
/****** Object:  Table [dbo].[position]    Script Date: 4/2/2019 7:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[position_id] [int] IDENTITY(1,1) NOT NULL,
	[position] [varchar](50) NULL,
	[category_id] [int] NULL,
	[temp_id] [int] NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_position_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_position_category]
GO
