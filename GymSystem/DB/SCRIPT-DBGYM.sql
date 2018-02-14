USE [DB_GYM]
GO
/****** Object:  StoredProcedure [dbo].[ActividadActualizar]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ActividadActualizar]
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
idActividad=@idActividad ,
Descripcion=@Descripcion ,
Tarifa=@Tarifa,
HorarioInicio=@HorarioInicio,
HorarioFin=@HorarioFin,
Dia=@Dia 


UPDATE [dbo].[ACTIVIDADSALA]
SET idActividad=@idActividad
WHERE idSala=@idSala 

RETURN SCOPE_IDENTITY()




GO
/****** Object:  StoredProcedure [dbo].[ActividadAlta]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ActividadBaja]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ActividadBaja]
@idActividad int

AS


declare @idSala int ;
set @idSala = (select idSala from ACTIVIDADSALA where idActividad= @idActividad);


DELETE 
FROM [dbo].[ACTIVIDAD]
WHERE idActividad=@idActividad;


DELETE 
FROM [dbo].[ACTIVIDADSALA]
WHERE idSala=@idSala ;


RETURN SCOPE_IDENTITY()




GO
/****** Object:  StoredProcedure [dbo].[ActividadTraerTodos]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ActividadTraerTodos]


AS

select * 
from ACTIVIDAD


RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoActualizarTodo]    Script Date: 13/02/2018 19:34:08 ******/
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
@FechaActualizacion datetime,
@TipoEmpleado int,
@fechaDeIngreso date,
@fechaDeEgreso date

AS

DECLARE @id nvarchar(100);

SET @id = (SELECT idPersona FROM PERSONA WHERE Email=@Email);

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
/****** Object:  StoredProcedure [dbo].[EmpleadoBuscarPorId]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpleadoInsert]    Script Date: 13/02/2018 19:34:08 ******/
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
@fechaDeEgreso date

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
 

RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoTraerTodos]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[PersonaActualizarFoto]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[PersonaBuscarPorEmailPassword]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[PersonaExisteEmail]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[PersonaTraerTodos]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PersonaTraerTodos]

AS

	SELECT * 
	FROM PERSONA
	

	




GO
/****** Object:  StoredProcedure [dbo].[ProfesorActualizarTodo]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ProfesorInsert]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SalaTraerTodos]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SocioActualizarEstado]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SocioActualizarTodo]    Script Date: 13/02/2018 19:34:08 ******/
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
@FechaRegistracion datetime,
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
FechaRegistracion=@FechaRegistracion,
FechaActualizacion=@FechaActualizacion
WHERE PERSONA.idPersona= @id

UPDATE SOCIO
SET 
NroTarjetaIdentificacion=@NroTarjetaIdentificacion,
idEstado=@idEstado
WHERE SOCIO.idPersona= @id


RETURN SCOPE_IDENTITY()




GO
/****** Object:  StoredProcedure [dbo].[SocioBuscarPorId]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SocioBuscarPorMailPassword]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  StoredProcedure [dbo].[SocioInsert]    Script Date: 13/02/2018 19:34:08 ******/
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
@FechaRegistracion datetime,
@FechaActualizacion datetime,
@NroTarjetaIdentificacion nchar(10),
@idEstado nchar(10)

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

INSERT INTO SOCIO
(
idPersona,
NroTarjetaIdentificacion,
idEstado
)
VALUES
(
@id,
@NroTarjetaIdentificacion,
@idEstado
);
 

RETURN @id
GO
/****** Object:  StoredProcedure [dbo].[SocioTraerTodos]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACTIVIDADSALA]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[EMPLEADOACTIVIDAD]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[ESTADO]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[PERSONA]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALA]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[SOCIO]    Script Date: 13/02/2018 19:34:08 ******/
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
/****** Object:  Table [dbo].[TIPOEMPLEADO]    Script Date: 13/02/2018 19:34:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] ON 

INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (1, N'ActividadPrueba', 10025, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700881C05B00000 AS Time), N'0')
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (2, N'ActividadPrueba', 10025, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700881C05B00000 AS Time), N'0')
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (3, N'ActividadPrueba', 10025, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700881C05B00000 AS Time), N'Lunes')
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (4, N'ActividadPrueba', 10025, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700881C05B00000 AS Time), N'Lunes')
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (5, N'PruebaItem2', 12323.5400390625, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700881C05B00000 AS Time), N'Sabado')
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (1, 100)
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (2, 100)
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (3, 100)
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (4, 100)
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (5, 100)
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (31, 1, CAST(0xDC3D0B00 AS Date), CAST(0x00000000 AS Date))
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (1, N'ACTIVO')
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (2, N'INACTIVO')
SET IDENTITY_INSERT [dbo].[PERSONA] ON 

INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1, N'S', 0, N'Pablo', N'Amurrio', N'35110122', N'pamurrio@gmail1.com', N'123456', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A87200000000 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (2, N'p', 1, N'Omar', N'Ag', N'31000000', N'omar@omar.com', N'1234', CAST(0xD30D0B00 AS Date), N'm', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (8, N'p', 46940314, N'Eugenia', N'Alegre', N'32000000', N'euge@euge.com', N'1234', CAST(0x00110B00 AS Date), N'F', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (9, N'c', 46940314, N'Mariano', N'Paciaroni', N'32000000', N'pacha@pacha.com', N'1234', CAST(0xA3080B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (10, N'c', 46940314, N'Pablo', N'Amurrio', N'32000000', N'pablo@pablo.com', N'1234', CAST(0xA3080B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (14, N'c', 46940314, N'Solomeo', N'Paredes', N'32000000', N'solomeo@solomeo.com', N'1234', CAST(0xA3080B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (15, N'c', 46940314, N'Elsa', N'Payero', N'32000000', N'elsa@elsa.com', N'1234', CAST(0xA3080B00 AS Date), N'F', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (16, N'c', 46940314, N'Susana', N'Horia', N'32000000', N'susana@susana.com', N'1234', CAST(0xA3080B00 AS Date), N'F', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (17, N's', 123456, N'b', N'b', N'32000000', N'b@b.com', N'b', CAST(0x28110B00 AS Date), N'f', NULL, CAST(0x0000A7A9012B3203 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (18, N'p', 12, N'd', N'd', N'32000000', N'd@d.com', N'd', CAST(0x28110B00 AS Date), N'f', NULL, CAST(0x0000A7A9012B3203 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (19, N'p', 123, N'f', N'f', N'32000000', N'f@f.com', N'f', CAST(0x28110B00 AS Date), N'f', NULL, CAST(0x0000A7A9012B3203 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (20, N'p', 123, N'g', N'g', N'32000000', N'g@g.com', N'g', CAST(0x28110B00 AS Date), N'f', NULL, CAST(0x0000A7A9012B3203 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (21, N'p', 123, N'h', N'h', N'32000000', N'h@h.com', N'12345', CAST(0x99080B00 AS Date), N'f', NULL, CAST(0x0000A7A9012B3203 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (22, N'p', 123, N'i', N'i', N'32000000', N'i@i.com', N'i', CAST(0x28110B00 AS Date), N'f', NULL, CAST(0x0000A7A9012B3203 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (28, N'S', 0, N'PabloDaniel', N'Amurrio', N'35110122', N'pamurrio@gmail.com', N'italo1190', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A87400000000 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (29, N'S', 1515151515, N'Pablo Daniel', N'Amurrio', N'35110130', N'pamurrio2@gmail.com', N'italo1190', CAST(0xA12C0B00 AS Date), N'M', NULL, CAST(0x0000A88101819B50 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (30, N'S', 1515151515, N'Pablo Daniel', N'Amurrio', N'35110130', N'pamurrio3@gmail.com', N'italo1190', CAST(0xA12C0B00 AS Date), N'M', NULL, CAST(0x0000A88101824D44 AS DateTime), NULL)
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (31, N'S', 1515151515, N'Pablo Daniel', N'Amurrio', N'35110130', N'pamurrio4@gmail.com', N'italo1190', CAST(0xA12C0B00 AS Date), N'M', NULL, CAST(0x0000A88101892E05 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PERSONA] OFF
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (100, N'PIRAMIDES', N'1', 100)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (200, N'CATARATAS', N'2', 50)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (300, N'COLISEO ROMANO', N'3', 20)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (400, N'TAJ MAHAL', N'4', 30)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (14, 123, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (15, 124, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (16, 125, 2)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (17, 1, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (28, 35110122, 2)
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (1, N'PROFESOR')
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (2, N'RECEPCIONISTA')
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (3, N'LIMPIEZA')
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
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOACTIVIDAD_ACTIVIDAD] FOREIGN KEY([idActividad])
REFERENCES [dbo].[ACTIVIDAD] ([idActividad])
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD] CHECK CONSTRAINT [FK_EMPLEADOACTIVIDAD_ACTIVIDAD]
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOACTIVIDAD_EMPLEADO] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[EMPLEADO] ([idPersona])
GO
ALTER TABLE [dbo].[EMPLEADOACTIVIDAD] CHECK CONSTRAINT [FK_EMPLEADOACTIVIDAD_EMPLEADO]
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
