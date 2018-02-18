/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [DB_GYM]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[idActividad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[tarifa] [float] NULL,
	[horarioInicio] [time](7) NULL,
	[horarioFin] [time](7) NULL,
	[dia] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDADSALA](
	[idActividad] [int] NOT NULL,
	[idSala] [int] NOT NULL,
 CONSTRAINT [PK_ACTIVIDADSALA] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC,
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[idPersona] [int] NOT NULL,
	[tipoEmpleado] [int] NOT NULL,
	[fechaDeIngreso] [date] NULL,
	[fechaDeEgreso] [date] NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[idEstado] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[TipoPersona] [nchar](1) NOT NULL,
	[Telefono] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Dni] [varchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Sexo] [nchar](1) NOT NULL,
	[Foto] [nvarchar](100) NULL,
	[FechaRegistracion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_PERSONA_1] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAACTIVIDAD](
	[idPersona] [int] NOT NULL,
	[idActividad] [int] NOT NULL,
 CONSTRAINT [PK_PERSONAACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC,
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALA](
	[idSala] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[numero] [varchar](50) NOT NULL,
	[capacidad] [int] NULL,
 CONSTRAINT [PK_SALA] PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOCIO](
	[idPersona] [int] NOT NULL,
	[nroTarjetaIdentificacion] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [PK_SOCIO_1] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOEMPLEADO](
	[idTipoEmpleado] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TIPOEMPLEADO] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] ON 
GO
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (8, N'Zumba', 500, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Lunes')
GO
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (9, N'Rumba', 100, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Martes')
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
GO
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (8, 100)
GO
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (9, 400)
GO
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (1103, 1, CAST(N'2018-02-17' AS Date), CAST(N'0001-01-01' AS Date))
GO
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (1, N'ACTIVO')
GO
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (2, N'INACTIVO')
GO
SET IDENTITY_INSERT [dbo].[PERSONA] ON 
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1, N'S', 0, N'Pablo', N'Amurrio', N'35110122', N'pamurrio@gmail1.com', N'123456', CAST(N'1990-01-11' AS Date), N'M', NULL, CAST(N'2018-01-24T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (2, N'p', 1, N'Omar', N'Ag', N'31012550', N'omar@omar.com', N'1234', CAST(N'1984-06-09' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2018-02-17T10:41:21.610' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (8, N'p', 46940314, N'Eugenia', N'Alegre', N'32000000', N'euge@euge.com', N'1234', CAST(N'1986-08-31' AS Date), N'F', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2017-07-07T18:09:20.223' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (9, N'c', 46940314, N'Mariano', N'Paciaroni', N'32000000', N'pacha@pacha.com', N'1234', CAST(N'1980-10-20' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2017-07-07T18:09:20.223' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (10, N'c', 46940314, N'Pablo', N'Amurrio', N'32000000', N'pablo@pablo.com', N'1234', CAST(N'1980-10-20' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2017-07-07T18:09:20.223' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (14, N'c', 46940314, N'Solomeo', N'Paredes', N'32000000', N'solomeo@solomeo.com', N'1234', CAST(N'1980-10-20' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2017-07-07T18:09:20.223' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (15, N'c', 46940314, N'Elsa', N'Payero', N'32000000', N'elsa@elsa.com', N'1234', CAST(N'1980-10-20' AS Date), N'F', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2018-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (16, N'c', 46940314, N'Susana', N'Horia', N'32000000', N'susana@susana.com', N'1234', CAST(N'1980-10-20' AS Date), N'F', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2017-07-07T18:09:20.223' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (17, N's', 123456, N'b', N'b', N'32000000', N'b@b.com', N'b', CAST(N'1986-10-10' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2018-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1096, N'S', 1122518060, N'test', N'test', N'12345678', N'test06@test.com', N'123', CAST(N'1980-10-20' AS Date), N'm', NULL, CAST(N'2018-02-17T22:20:19.617' AS DateTime), CAST(N'2018-02-17T22:20:19.617' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1097, N'S', 1122518060, N'test', N'test', N'12345678', N'test06@test.com', N'123', CAST(N'1980-10-20' AS Date), N'm', NULL, CAST(N'2018-02-17T22:22:29.553' AS DateTime), CAST(N'2018-02-17T22:22:29.553' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1098, N'S', 1147689022, N'asdasd', N'asdgfasdf', N'12312312', N'asd21321@werwt.com', N'123', CAST(N'1984-06-09' AS Date), N'M', NULL, CAST(N'2018-02-17T22:31:22.030' AS DateTime), CAST(N'2018-02-17T22:31:22.030' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1099, N'S', 1122518060, N'test', N'test', N'12345678', N'test06@test.com', N'123', CAST(N'1980-10-20' AS Date), N'm', NULL, CAST(N'2018-02-17T22:31:37.393' AS DateTime), CAST(N'2018-02-17T22:31:37.393' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1100, N'S', 1122518060, N'test', N'test', N'12345678', N'test07@test.com', N'123', CAST(N'1980-10-20' AS Date), N'm', NULL, CAST(N'2018-02-17T22:31:55.013' AS DateTime), CAST(N'2018-02-17T22:31:55.013' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1101, N'S', 1122518060, N'test', N'test', N'12345678', N'test07@test.com', N'123', CAST(N'1980-10-20' AS Date), N'm', NULL, CAST(N'2018-02-17T22:33:01.167' AS DateTime), CAST(N'2018-02-17T22:33:01.167' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1102, N'S', 1122518060, N'test', N'test', N'12345678', N'test08@test.com', N'123', CAST(N'1980-10-20' AS Date), N'm', NULL, CAST(N'2018-02-17T22:33:14.447' AS DateTime), CAST(N'2018-02-17T22:33:14.447' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1103, N'S', 1147689022, N'Omar', N'Aguirre', N'12345678', N'omar.aguirre.1984@gmail.com', N'123', CAST(N'1984-06-09' AS Date), N'M', NULL, CAST(N'2018-02-17T22:35:12.710' AS DateTime), CAST(N'2018-02-17T22:35:12.710' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PERSONA] OFF
GO
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1098, 8)
GO
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1100, 8)
GO
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1100, 9)
GO
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1102, 8)
GO
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1102, 9)
GO
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1103, 9)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (100, N'PIRAMIDES', N'1', 100)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (200, N'CATARATAS', N'2', 50)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (300, N'COLISEO ROMANO', N'3', 20)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (400, N'TAJ MAHAL', N'4', 30)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (14, 123, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (15, 124, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (16, 125, 2)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (17, 1, 2)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1096, 11, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1098, 98238, 2)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1100, 121, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1102, 1221, 1)
GO
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (1, N'PROFESOR')
GO
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (2, N'RECEPCIONISTA')
GO
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (3, N'LIMPIEZA')
GO
ALTER TABLE [dbo].[ACTIVIDADSALA]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDADSALA_ACTIVIDAD1] FOREIGN KEY([idActividad])
REFERENCES [dbo].[ACTIVIDAD] ([idActividad])
GO
ALTER TABLE [dbo].[ACTIVIDADSALA] CHECK CONSTRAINT [FK_ACTIVIDADSALA_ACTIVIDAD1]
GO
ALTER TABLE [dbo].[ACTIVIDADSALA]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVIDADSALA_SALA] FOREIGN KEY([idSala])
REFERENCES [dbo].[SALA] ([idSala])
GO
ALTER TABLE [dbo].[ACTIVIDADSALA] CHECK CONSTRAINT [FK_ACTIVIDADSALA_SALA]
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_PERSONA] FOREIGN KEY([idPersona])
REFERENCES [dbo].[PERSONA] ([idPersona])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_PERSONA]
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_TIPOEMPLEADO] FOREIGN KEY([tipoEmpleado])
REFERENCES [dbo].[TIPOEMPLEADO] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_TIPOEMPLEADO]
GO
ALTER TABLE [dbo].[PERSONAACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_PERSONAACTIVIDAD_ACTIVIDAD] FOREIGN KEY([idActividad])
REFERENCES [dbo].[ACTIVIDAD] ([idActividad])
GO
ALTER TABLE [dbo].[PERSONAACTIVIDAD] CHECK CONSTRAINT [FK_PERSONAACTIVIDAD_ACTIVIDAD]
GO
ALTER TABLE [dbo].[PERSONAACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_PERSONAACTIVIDAD_PERSONA1] FOREIGN KEY([idPersona])
REFERENCES [dbo].[PERSONA] ([idPersona])
GO
ALTER TABLE [dbo].[PERSONAACTIVIDAD] CHECK CONSTRAINT [FK_PERSONAACTIVIDAD_PERSONA1]
GO
ALTER TABLE [dbo].[SOCIO]  WITH CHECK ADD  CONSTRAINT [FK_SOCIO_ESTADO] FOREIGN KEY([idEstado])
REFERENCES [dbo].[ESTADO] ([idEstado])
GO
ALTER TABLE [dbo].[SOCIO] CHECK CONSTRAINT [FK_SOCIO_ESTADO]
GO
ALTER TABLE [dbo].[SOCIO]  WITH CHECK ADD  CONSTRAINT [FK_SOCIO_PERSONA] FOREIGN KEY([idPersona])
REFERENCES [dbo].[PERSONA] ([idPersona])
GO
ALTER TABLE [dbo].[SOCIO] CHECK CONSTRAINT [FK_SOCIO_PERSONA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadActualizar]
@idActividad int,
@Descripcion nvarchar(30),
@Tarifa float,
@HorarioInicio time,
@HorarioFin time,
@Dia nvarchar(10),
@idSala int

AS

UPDATE ACTIVIDAD
SET 
Descripcion=@Descripcion ,
Tarifa=@Tarifa,
HorarioInicio=@HorarioInicio,
HorarioFin=@HorarioFin,
Dia=@Dia 
WHERE idActividad=@idActividad

UPDATE [dbo].[ACTIVIDADSALA]
SET idSala=@idSala
WHERE idActividad=@idActividad

RETURN SCOPE_IDENTITY()



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadAlta]
@Descripcion nvarchar(30),
@Tarifa float,
@HorarioInicio time,
@HorarioFin time,
@Dia nvarchar(10),
@idSala int

AS

INSERT INTO ACTIVIDAD
(
Descripcion ,
Tarifa,
HorarioInicio,
HorarioFin,
Dia 
)
VALUES
(
@Descripcion ,
@Tarifa,
@HorarioInicio,
@HorarioFin,
@Dia 
);
DECLARE @IdActividad int;
SET @IdActividad = (SELECT SCOPE_IDENTITY());

INSERT INTO [dbo].[ACTIVIDADSALA]
(
idActividad ,
idSala
)
VALUES
(
@IdActividad ,
@idSala
);




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadBaja]
@idActividad int

AS


declare @idSala int ;
set @idSala = (select idSala from ACTIVIDADSALA where idActividad= @idActividad);


DELETE 
FROM [dbo].[ACTIVIDADSALA]
WHERE idSala=@idSala ;

DELETE 
FROM [dbo].[ACTIVIDAD]
WHERE idActividad=@idActividad;

RETURN (select 0 as okDelete )



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadBuscarPorId]

@idActividad int


AS

	SELECT * 
	FROM ACTIVIDAD
	inner join ACTIVIDADSALA on ACTIVIDAD.idActividad=ACTIVIDADSALA.idActividad
	where ACTIVIDAD.idActividad=@idActividad



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadPersonaGetList]
@idPersona int,
@valueAll int = 0

as 

if(@valueAll = 0 )
BEGIN
select idActividad from PERSONAACTIVIDAD where idPersona = @idPersona;
END
ELSE 
BEGIN
select * from PERSONAACTIVIDAD where idPersona = @idPersona;
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadTraerTodos]


AS

select 
* 
from ACTIVIDAD 
inner join ACTIVIDADSALA 
on ACTIVIDAD.idActividad = ACTIVIDADSALA.idActividad

inner join SALA 
on ACTIVIDADSALA.idSala = SALA.idSala


RETURN SCOPE_IDENTITY()



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadValidaDia&Horario]
@Dia nvarchar(10),
@idActividad int

AS

IF EXISTS (SELECT DIA FROM ACTIVIDAD WHERE DIA = @Dia AND idActividad != @idActividad)
	SELECT 1 as isfree
ELSE 
	SELECT 0 as isfree



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadValidaNombre]
@Nombre nvarchar(30),
@idActividad int

AS
IF EXISTS (SELECT DIA FROM ACTIVIDAD WHERE DESCRIPCION = @Nombre AND idActividad != @idActividad)
	SELECT 1 as isfree
ELSE 
	SELECT 0 as isfree


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarPersonaActividad]
@idPersona int,
@idActividad int

AS

UPDATE PERSONAACTIVIDAD
SET 
idPersona=@idPersona ,
idActividad=@idActividad
WHERE idPersona=@idPersona 
AND idActividad=@idActividad

RETURN SCOPE_IDENTITY()



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarProfilePersona]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@idPersona int

AS

UPDATE PERSONA SET
Dni = @Dni,
Nombre = @Nombre ,
Apellido = @Apellido,
Password = @Password,
FechaNacimiento = @FechaNacimiento,
Sexo = @Sexo,
FechaActualizacion = CURRENT_TIMESTAMP
WHERE 
idPersona = @idPersona

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarActividadPersona]
@idPersona int,
@idActividad int


AS

DELETE 
FROM [dbo].[PERSONACTIVIDAD]
WHERE idPersona=@idPersona
AND idActividad=@idActividad ;

RETURN (select 0 as okDelete )



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoActualizarTodo]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
--@FechaRegistracion datetime,
--@FechaActualizacion datetime,
@TipoEmpleado int,
@fechaDeIngreso date,
@fechaDeEgreso date,
@ListActividad varchar(500) = null
AS

DECLARE @id nvarchar(100);

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

DELETE PERSONAACTIVIDAD WHERE idPersona = @id;
if(@ListActividad IS NOT NULL)

BEGIN
DECLARE @pos INT
DECLARE @len INT
DECLARE @value varchar(8000)
set @pos = 0
set @len = 0        
	WHILE CHARINDEX(',', @ListActividad, @pos+1)>0
	BEGIN
		set @len = CHARINDEX(',', @ListActividad, @pos+1) - @pos
		set @value = SUBSTRING(@ListActividad, @pos, @len)
		--SELECT @pos, @len, @value /*this is here for debugging*/
        
		PRINT @value
		INSERT INTO PERSONAACTIVIDAD VALUES (@id, cast(@value as int))

		set @pos = CHARINDEX(',', @ListActividad, @pos+@len) +1
	END
END
 

UPDATE PERSONA
SET 
	Dni=@Dni,
	Telefono=@Telefono,
	Nombre=@Nombre,
	Apellido=@Apellido,
	Email=@Email,
	Password=@Password,
	FechaNacimiento=@FechaNacimiento,
	Sexo=@Sexo,
	TipoPersona=@TipoPersona,
	--FechaRegistracion=@FechaRegistracion,
	FechaActualizacion=CURRENT_TIMESTAMP
WHERE PERSONA.idPersona= @id

UPDATE EMPLEADO
SET 
	TipoEmpleado=@TipoEmpleado,
	fechaDeIngreso=@fechaDeIngreso,
	fechaDeEgreso=@fechaDeEgreso
WHERE EMPLEADO.idPersona= @id

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[EmpleadoBuscarPorId]

@idPersona int


AS

	SELECT * 
	FROM PERSONA
	inner join EMPLEADO on PERSONA.idPersona=EMPLEADO.idPersona
	where PERSONA.idPersona=@idPersona
	
	







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoInsert]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
@FechaRegistracion datetime,
@FechaActualizacion datetime,
@TipoEmpleado int,
@fechaDeIngreso date,
@fechaDeEgreso date,
@ListActividad varchar(500) = null

AS

INSERT INTO PERSONA
(
Dni,
Telefono,
Nombre,
Apellido,
Email,
Password,
FechaNacimiento,
Sexo,
TipoPersona,
FechaRegistracion,
FechaActualizacion
)
VALUES
(
@Dni,
@Telefono,
@Nombre,
@Apellido,
@Email,
@Password,
@FechaNacimiento,
@Sexo,
@TipoPersona,
@FechaRegistracion,
@FechaActualizacion
);

DECLARE @id nvarchar(100);

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

INSERT INTO EMPLEADO
(
idPersona,
TipoEmpleado,
fechaDeIngreso,
fechaDeEgreso
)
VALUES
(
@id ,
@TipoEmpleado,
@fechaDeIngreso,
@fechaDeEgreso
);

if(@ListActividad IS NOT NULL)
BEGIN
DECLARE @pos INT
DECLARE @len INT
DECLARE @value varchar(8000)
set @pos = 0
set @len = 0        
	WHILE CHARINDEX(',', @ListActividad, @pos+1)>0
	BEGIN
		set @len = CHARINDEX(',', @ListActividad, @pos+1) - @pos
		set @value = SUBSTRING(@ListActividad, @pos, @len)
		--SELECT @pos, @len, @value /*this is here for debugging*/
        
		PRINT @value
		INSERT INTO PERSONAACTIVIDAD VALUES (@id, cast(@value as int))

		set @pos = CHARINDEX(',', @ListActividad, @pos+@len) +1
	END
END
 

RETURN SCOPE_IDENTITY()

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[EmpleadoTraerTodos]

AS

	SELECT * 
	FROM PERSONA
	inner join EMPLEADO on PERSONA.idPersona=EMPLEADO.idPersona

	







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarActividadPersona]
@IdPersona int,
@idActividad int

AS

INSERT INTO PERSONAACTIVIDAD
(
idPersona,
idActividad
)
VALUES
(
@IdPersona,
@idActividad 
);



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PersonaActualizarFoto]

@idPersona smallint,
@foto nvarchar(100)

AS

UPDATE	PERSONA
SET		foto = @foto
WHERE	idPersona = @idPersona







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonaBuscarPorEmailPassword]

@Email nvarchar(100),
@Password nvarchar(100)

AS

SELECT	*
FROM	PERSONA
WHERE	Email = @Email AND
		Password = @Password







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PersonaExisteEmail]

@Email nvarchar(100)

AS

IF EXISTS (SELECT * FROM PERSONA WHERE Email = @Email)
	SELECT 1

ELSE
	SELECT 0






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PersonaTraerTodos]

AS

	SELECT * 
	FROM PERSONA
	

	







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProfesorActualizarTodo]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
@FechaRegistracion datetime,
@FechaActualizacion datetime,
@TipoEmpleado nchar(10),
@fechaDeIngreso date,
@fechaDeEgreso date


AS

DECLARE @id nvarchar(100);

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

UPDATE PERSONA
SET Dni=@Dni,
Telefono=@Telefono,
Nombre=@Nombre,
Apellido=@Apellido,
Email=@Email,
Password=@Password,
FechaNacimiento=@FechaNacimiento,
Sexo=@Sexo,
TipoPersona=@TipoPersona,
FechaRegistracion=@FechaRegistracion,
FechaActualizacion=@FechaActualizacion
WHERE PERSONA.idPersona= @id

UPDATE EMPLEADO
SET 

TipoEmpleado=@TipoEmpleado,
fechaDeIngreso=@fechaDeIngreso,
fechaDeEgreso=@fechaDeEgreso

WHERE EMPLEADO.idPersona= @id


RETURN SCOPE_IDENTITY()







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProfesorInsert]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
@FechaRegistracion datetime,
@FechaActualizacion datetime,
@TipoEmpleado nchar(10),
@fechaDeIngreso date,
@fechaDeEgreso date

AS

INSERT INTO PERSONA
(
Dni,
Nombre,
Apellido,
Telefono,
Email,
Password,
FechaNacimiento,
Sexo,
TipoPersona,
FechaRegistracion,
FechaActualizacion
)
VALUES
(
@Dni,
@Nombre,
@Apellido,
@Telefono,
@Email,
@Password,
@FechaNacimiento,
@Sexo,
@TipoPersona,
@FechaRegistracion,
@FechaActualizacion
);

DECLARE @id nvarchar(100);

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

INSERT INTO EMPLEADO
(
idPersona,
TipoEmpleado,
fechaDeIngreso,
fechaDeEgreso
)
VALUES
(
@id,
@TipoEmpleado,
@fechaDeIngreso,
@fechaDeEgreso
);
 

RETURN SCOPE_IDENTITY()







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaTraerTodos]

AS

	SELECT 
	sala.idSala,
	sala.nombre,
	sala.numero,
	sala.capacidad
	FROM SALA sala



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SocioActualizarEstado]

@idPersona int,
@idEstado int

AS

UPDATE	SOCIO
SET		 idEstado= @idEstado
WHERE	idPersona = @idPersona







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SocioActualizarTodo]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
@FechaActualizacion datetime,
@NroTarjetaIdentificacion nchar(10),
@idEstado nchar(10)

AS

DECLARE @id nvarchar(100);

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

UPDATE PERSONA
SET Dni=@Dni,
Telefono=@Telefono,
Nombre=@Nombre,
Apellido=@Apellido,
Email=@Email,
Password=@Password,
FechaNacimiento=@FechaNacimiento,
Sexo=@Sexo,
TipoPersona=@TipoPersona,
FechaActualizacion=@FechaActualizacion
WHERE PERSONA.idPersona= @id

UPDATE SOCIO
SET 
NroTarjetaIdentificacion=@NroTarjetaIdentificacion,
idEstado=@idEstado
WHERE SOCIO.idPersona= @id


RETURN SCOPE_IDENTITY()


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SocioBuscarPorId]

@idPersona int


AS

	SELECT * 
	FROM PERSONA
	inner join SOCIO on PERSONA.idPersona=SOCIO.idPersona
	where PERSONA.idPersona=@idPersona
	
	







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SocioBuscarPorMailPassword]

@Email nvarchar(100),
@Password nvarchar(100)

AS

SELECT	*
FROM	PERSONA
inner join SOCIO on PERSONA.idPersona=SOCIO.idPersona
WHERE	Email = @Email AND
		Password = @Password







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SocioInsert]
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
@NroTarjetaIdentificacion nchar(10),
@idEstado nchar(10),
@ListActividad varchar(500) = null

AS

INSERT INTO PERSONA
(
Dni,
Telefono,
Nombre,
Apellido,
Email,
Password,
FechaNacimiento,
Sexo,
TipoPersona,
FechaRegistracion,
FechaActualizacion
)
VALUES
(
@Dni,
@Telefono,
@Nombre,
@Apellido,
@Email,
@Password,
@FechaNacimiento,
@Sexo,
@TipoPersona,
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP
);

DECLARE @id int;

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

INSERT INTO SOCIO(idPersona,NroTarjetaIdentificacion,idEstado)
VALUES (@id,@NroTarjetaIdentificacion,@idEstado);


if(@ListActividad IS NOT NULL)
BEGIN
DECLARE @pos INT
DECLARE @len INT
DECLARE @value varchar(8000)
set @pos = 0
set @len = 0        
	WHILE CHARINDEX(',', @ListActividad, @pos+1)>0
	BEGIN
		set @len = CHARINDEX(',', @ListActividad, @pos+1) - @pos
		set @value = SUBSTRING(@ListActividad, @pos, @len)
		--SELECT @pos, @len, @value /*this is here for debugging*/
        
		PRINT @value
		INSERT INTO PERSONAACTIVIDAD VALUES (@id, cast(@value as int))

		set @pos = CHARINDEX(',', @ListActividad, @pos+@len) +1
	END
END


RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SocioTraerTodos]

AS

	SELECT * 
	FROM PERSONA
	inner join SOCIO on PERSONA.idPersona=SOCIO.idPersona

	







GO
