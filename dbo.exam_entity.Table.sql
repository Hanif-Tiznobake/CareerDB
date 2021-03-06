USE [career]
GO
/****** Object:  Table [dbo].[exam_entity]    Script Date: 4/2/2019 7:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_entity](
	[exam_id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[category_id] [int] NULL,
	[contact_id] [int] NULL,
	[cartificate_id] [int] NULL,
	[happened] [datetime2](0) NULL,
 CONSTRAINT [PK_exam_entity] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exam_entity]  WITH CHECK ADD  CONSTRAINT [FK_exam_entity_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[exam_entity] CHECK CONSTRAINT [FK_exam_entity_category]
GO
ALTER TABLE [dbo].[exam_entity]  WITH CHECK ADD  CONSTRAINT [FK_exam_entity_certificate] FOREIGN KEY([cartificate_id])
REFERENCES [dbo].[certificate] ([certificate_id])
GO
ALTER TABLE [dbo].[exam_entity] CHECK CONSTRAINT [FK_exam_entity_certificate]
GO
ALTER TABLE [dbo].[exam_entity]  WITH CHECK ADD  CONSTRAINT [FK_exam_entity_contact] FOREIGN KEY([contact_id])
REFERENCES [dbo].[contact] ([contact_id])
GO
ALTER TABLE [dbo].[exam_entity] CHECK CONSTRAINT [FK_exam_entity_contact]
GO
ALTER TABLE [dbo].[exam_entity]  WITH CHECK ADD  CONSTRAINT [FK_exam_entity_exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exam_entity] CHECK CONSTRAINT [FK_exam_entity_exam]
GO
