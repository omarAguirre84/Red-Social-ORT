USE [DB_GYM]
GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[idActividad] [int] NOT NULL,
	[descripcion] [varchar](30) NULL,
	[tarifa] [float] NOT NULL,
	[horarioInicio] [time](7) NULL,
	[horarioFin] [time](7) NULL,
	[dia] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ACTIVIDAD] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACTIVIDADSALA]    Script Date: 6/12/2017 9:53:16 p. m. ******/
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
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[tipoEmpleado] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[fechaDeIngreso] [date] NULL,
	[fechaDeEgreso] [date] NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMPLEADOACTIVIDAD]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOACTIVIDAD](
	[IdEmpleado] [int] NOT NULL,
	[idActividad] [int] NOT NULL,
 CONSTRAINT [PK_EMPLEADODISCIPLINA] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC,
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSONA](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[id_Telefono] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Dni] [varchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Sexo] [nchar](1) NOT NULL,
	[Profesor] [nchar](1) NOT NULL,
	[Foto] [nvarchar](100) NULL,
	[FechaRegistracion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_PERSONA_1] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALA]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOCIO]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOCIO](
	[nroTarjetaIdentificacion] [bigint] NOT NULL,
	[idEstado] [int] NOT NULL,
	[idSocio] [int] NOT NULL,
 CONSTRAINT [PK_SOCIO_1] PRIMARY KEY CLUSTERED 
(
	[idSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPOEMPLEADO]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPOEMPLEADO](
	[descripcion] [varchar](50) NULL,
	[idTipoEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_TIPOEMPLEADO] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_PERSONA] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[PERSONA] ([idPersona])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_PERSONA]
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_TIPOEMPLEADO] FOREIGN KEY([tipoEmpleado])
REFERENCES [dbo].[TIPOEMPLEADO] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_TIPOEMPLEADO]
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOACTIVIDAD_ACTIVIDAD] FOREIGN KEY([idActividad])
REFERENCES [dbo].[ACTIVIDAD] ([idActividad])
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD] CHECK CONSTRAINT [FK_EMPLEADOACTIVIDAD_ACTIVIDAD]
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOACTIVIDAD_EMPLEADO] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD] CHECK CONSTRAINT [FK_EMPLEADOACTIVIDAD_EMPLEADO]
GO
ALTER TABLE [dbo].[SOCIO]  WITH CHECK ADD  CONSTRAINT [FK_SOCIO_ESTADO] FOREIGN KEY([idEstado])
REFERENCES [dbo].[ESTADO] ([idEstado])
GO
ALTER TABLE [dbo].[SOCIO] CHECK CONSTRAINT [FK_SOCIO_ESTADO]
GO
ALTER TABLE [dbo].[SOCIO]  WITH CHECK ADD  CONSTRAINT [FK_SOCIO_PERSONA] FOREIGN KEY([idSocio])
REFERENCES [dbo].[PERSONA] ([idPersona])
GO
ALTER TABLE [dbo].[SOCIO] CHECK CONSTRAINT [FK_SOCIO_PERSONA]
GO
/****** Object:  StoredProcedure [dbo].[PersonaActualizarFoto]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonaActualizarFoto]

@PersonaID smallint,
@PersonaFoto nvarchar(100)

AS

UPDATE	PERSONA
SET		PersonaFoto = @PersonaFoto
WHERE	PersonaID = @PersonaID

GO
/****** Object:  StoredProcedure [dbo].[PersonaBuscarEmail]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonaBuscarEmail]

@PersonaEmail nvarchar(100)

AS

IF EXISTS (SELECT * FROM PERSONA WHERE Email = @PersonaEmail)
	SELECT 1
ELSE
	SELECT 0
GO
/****** Object:  StoredProcedure [dbo].[PersonaBuscarPorEmailPassword]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonaBuscarPorEmailPassword]

@PersonaEmail nvarchar(100),
@PersonaPassword nvarchar(100)

AS

SELECT	*
FROM	PERSONA
WHERE	Email = @PersonaEmail AND
		Password = @PersonaPassword

GO
/****** Object:  StoredProcedure [dbo].[PersonaInsert]    Script Date: 6/12/2017 9:53:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PersonaInsert]

@PersonaNombre nvarchar(30),
@PersonaApellido nvarchar(30),
@PersonaEmail nvarchar(100),
@PersonaPassword nvarchar(100),
@PersonaFechaNacimiento date,
@PersonaSexo nchar(1),
@PersonaProfesor nchar(1),
@PersonaFechaRegistracion datetime

AS

INSERT INTO PERSONA
(
PersonaNombre,
PersonaApellido,
PersonaEmail,
PersonaPassword,
PersonaFechaNacimiento,
PersonaSexo,
PersonaProfesor,
PersonaFechaRegistracion
)
VALUES
(
@PersonaNombre,
@PersonaApellido,
@PersonaEmail,
@PersonaPassword,
@PersonaFechaNacimiento,
@PersonaSexo,
@PersonaProfesor,
@PersonaFechaRegistracion
)

RETURN SCOPE_IDENTITY()
GO
