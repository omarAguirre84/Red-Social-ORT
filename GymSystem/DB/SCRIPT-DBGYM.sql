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
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (15, N'Rumba', 120, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), N'Lunes')
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
GO
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (15, 200)
GO
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (1112, 1, CAST(N'2018-02-18' AS Date), CAST(N'0001-01-01' AS Date))
GO
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (1, N'ACTIVO')
GO
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (2, N'INACTIVO')
GO
SET IDENTITY_INSERT [dbo].[PERSONA] ON 
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1, N'S', 0, N'Pablo', N'Amurrio', N'35110122', N'pamurrio@gmail1.com', N'123456', CAST(N'1990-01-11' AS Date), N'M', NULL, CAST(N'2018-01-24T00:00:00.000' AS DateTime), CAST(N'2018-02-18T20:56:04.127' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (2, N'P', 1122518060, N'Omar', N'Aguirre', N'31012550', N'omar@omar.com', N'1234', CAST(N'1984-06-09' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2018-02-18T20:55:26.000' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (8, N'P', 46940314, N'Eugenia', N'Alegre', N'32000000', N'euge@euge.com', N'1234', CAST(N'1986-08-31' AS Date), N'F', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2018-02-18T20:53:42.107' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1110, N'S', 5454556, N'Mariano', N'Paciaroni', N'24556422', N'pacha@pacha.com', N'123', CAST(N'1986-08-01' AS Date), N'M', NULL, CAST(N'2017-07-07T18:09:20.223' AS DateTime), CAST(N'2017-07-07T18:09:20.223' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1111, N'S', 1147689022, N'test', N'test', N'12345678', N'test@test.com', N'123', CAST(N'1984-06-09' AS Date), N'M', NULL, CAST(N'2018-02-18T20:58:46.200' AS DateTime), CAST(N'2018-02-18T21:01:00.797' AS DateTime))
GO
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1112, N'P', 1147689022, N'test2', N'test2', N'12345678', N'test2@test2.com', N'****', CAST(N'1984-06-09' AS Date), N'M', NULL, CAST(N'2018-02-18T21:00:15.007' AS DateTime), CAST(N'2018-02-18T21:00:15.007' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PERSONA] OFF
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (100, N'PIRAMIDES', N'1', 100)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (200, N'CATARATAS', N'2', 50)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (300, N'COLISEO ROMANO', N'3', 20)
GO
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (400, N'TAJ MAHAL', N'4', 30)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1, 1, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (2, 2, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (8, 3, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1110, 4, 1)
GO
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1111, 91584, 1)
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

DELETE 
FROM [dbo].[ACTIVIDADSALA]
WHERE idSala=@idSala ;

DELETE 
FROM [dbo].[PERSONAACTIVIDAD]
WHERE idActividad=@idActividad;

DELETE 
FROM [dbo].[ACTIVIDAD]
WHERE idActividad=@idActividad;


RETURN SCOPE_IDENTITY()
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
CREATE PROCEDURE [dbo].[ActividadPorPersonaId]
@idPersona int
as 
BEGIN
select 
ACTIVIDAD.idActividad,
ACTIVIDAD.descripcion,
ACTIVIDAD.dia,
ACTIVIDAD.horarioInicio,
ACTIVIDAD.horarioFin,
ACTIVIDAD.tarifa
from  ACTIVIDAD
inner join PERSONAACTIVIDAD 
on ACTIVIDAD.idActividad = PERSONAACTIVIDAD.idActividad
WHERE
 PERSONAACTIVIDAD.idPersona = @idPersona
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

DELETE PERSONAACTIVIDAD
WHERE idPersona=@idPersona
AND idActividad=@idActividad;

RETURN (select 0 as okDelete )

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoActualizarTodo]
@idPersona int,
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

DELETE PERSONAACTIVIDAD WHERE idPersona = @idPersona;
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
		INSERT INTO PERSONAACTIVIDAD VALUES (@idPersona, cast(@value as int))

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
	FechaRegistracion=CURRENT_TIMESTAMP,
	FechaActualizacion=CURRENT_TIMESTAMP
WHERE PERSONA.idPersona= @idPersona

UPDATE EMPLEADO
SET 
	TipoEmpleado=@TipoEmpleado,
	fechaDeIngreso=@fechaDeIngreso,
	fechaDeEgreso=@fechaDeEgreso
WHERE EMPLEADO.idPersona= @idPersona

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
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP
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
CREATE PROCEDURE [dbo].[PersonaPorActividadId]
@idActividad int,
@TipoPersona char
as 
BEGIN
select 
*
from  persona
inner join PERSONAACTIVIDAD  
on PERSONAACTIVIDAD.idPersona = PERSONA.idPersona
WHERE 
persona.TipoPersona = @TipoPersona
and PERSONAACTIVIDAD.idActividad = @idActividad 
END
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
@idPersona int,
@Dni nvarchar(30),
@Nombre nvarchar(30),
@Apellido nvarchar(30),
@Telefono nvarchar(50),
@Email nvarchar(100),
@Password nvarchar(100),
@FechaNacimiento date,
@Sexo nchar(1),
@TipoPersona nchar(1),
@idEstado nchar(10),
@ListActividad varchar(500) = null

AS

DELETE PERSONAACTIVIDAD WHERE idPersona = @idPersona;
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
		INSERT INTO PERSONAACTIVIDAD VALUES (@idPersona, cast(@value as int))

		set @pos = CHARINDEX(',', @ListActividad, @pos+@len) +1
	END
END


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
FechaActualizacion=CURRENT_TIMESTAMP
WHERE PERSONA.idPersona= @idPersona

UPDATE SOCIO
SET 
idEstado=@idEstado
WHERE SOCIO.idPersona= @idPersona

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
CREATE PROCEDURE [dbo].[SocioTraerTodos]

AS

	SELECT * 
	FROM PERSONA
	inner join SOCIO on PERSONA.idPersona=SOCIO.idPersona

	ORDER BY SOCIO.idEstado desc, PERSONA.Nombre DESC
	
GO
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

INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (8, N'Zumba', 500, CAST(0x070010ACD1530000 AS Time), CAST(0x07007870335C0000 AS Time), N'Lunes')
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (9, N'Rumba', 100, CAST(0x070010ACD1530000 AS Time), CAST(0x07007870335C0000 AS Time), N'Martes')
INSERT [dbo].[ACTIVIDAD] ([idActividad], [descripcion], [tarifa], [horarioInicio], [horarioFin], [dia]) VALUES (10, N'Localizada', 80, CAST(0x0700B0BD58750000 AS Time), CAST(0x07001882BA7D0000 AS Time), N'Miercoles')
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (8, 200)
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (9, 400)
INSERT [dbo].[ACTIVIDADSALA] ([idActividad], [idSala]) VALUES (10, 300)
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (1103, 1, CAST(0xE53D0B00 AS Date), CAST(0x00000000 AS Date))
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (1104, 1, CAST(0xE63D0B00 AS Date), CAST(0x00000000 AS Date))
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (1105, 1, CAST(0xE63D0B00 AS Date), CAST(0x00000000 AS Date))
INSERT [dbo].[EMPLEADO] ([idPersona], [tipoEmpleado], [fechaDeIngreso], [fechaDeEgreso]) VALUES (1108, 1, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date))
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (1, N'ACTIVO')
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (2, N'INACTIVO')
SET IDENTITY_INSERT [dbo].[PERSONA] ON 

INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1, N'S', 1168334490, N'Pablo', N'Amurrio', N'35110122', N'pamurrio@gmail.com', N'italo1190', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A87200000000 AS DateTime), CAST(0x0000A88B00000000 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (2, N'p', 1, N'Omar', N'Ag', N'31012550', N'omar@omar.com', N'1234', CAST(0xD30D0B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A88A00B027A3 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (8, N'p', 46940314, N'Eugenia', N'Alegre', N'32000000', N'euge@euge.com', N'1234', CAST(0x00110B00 AS Date), N'F', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (9, N'c', 46940314, N'Mariano', N'Paciaroni', N'32000000', N'pacha@pacha.com', N'1234', CAST(0xA3080B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (10, N'c', 46940314, N'Pablo', N'Amurrio', N'32000000', N'pablo@pablo.com', N'1234', CAST(0xA3080B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (14, N'c', 46940314, N'Solomeo', N'Paredes', N'32000000', N'solomeo@solomeo.com', N'1234', CAST(0xA3080B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (15, N'c', 46940314, N'Elsa', N'Payero', N'32000000', N'elsa@elsa.com', N'1234', CAST(0xA3080B00 AS Date), N'F', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A88A00000000 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (16, N'c', 46940314, N'Susana', N'Horia', N'32000000', N'susana@susana.com', N'1234', CAST(0xA3080B00 AS Date), N'F', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A7A9012B3203 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (17, N's', 123456, N'b', N'b', N'32000000', N'b@b.com', N'b', CAST(0x28110B00 AS Date), N'M', NULL, CAST(0x0000A7A9012B3203 AS DateTime), CAST(0x0000A88A00000000 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1096, N'S', 1122518060, N'test', N'test', N'12345678', N'test06@test.com', N'123', CAST(0xA3080B00 AS Date), N'm', NULL, CAST(0x0000A88A017021BD AS DateTime), CAST(0x0000A88A017021BD AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1097, N'S', 1122518060, N'test', N'test', N'12345678', N'test06@test.com', N'123', CAST(0xA3080B00 AS Date), N'm', NULL, CAST(0x0000A88A0170BA02 AS DateTime), CAST(0x0000A88A0170BA02 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1098, N'S', 1147689022, N'asdasd', N'asdgfasdf', N'12312312', N'asd21321@werwt.com', N'123', CAST(0xD30D0B00 AS Date), N'M', NULL, CAST(0x0000A88A01732A01 AS DateTime), CAST(0x0000A88A01732A01 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1099, N'S', 1122518060, N'test', N'test', N'12345678', N'test06@test.com', N'123', CAST(0xA3080B00 AS Date), N'm', NULL, CAST(0x0000A88A01733C02 AS DateTime), CAST(0x0000A88A01733C02 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1100, N'S', 1122518060, N'test', N'test', N'12345678', N'test07@test.com', N'123', CAST(0xA3080B00 AS Date), N'm', NULL, CAST(0x0000A88A017350A8 AS DateTime), CAST(0x0000A88A017350A8 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1101, N'S', 1122518060, N'test', N'test', N'12345678', N'test07@test.com', N'123', CAST(0xA3080B00 AS Date), N'm', NULL, CAST(0x0000A88A01739E2E AS DateTime), CAST(0x0000A88A01739E2E AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1102, N'S', 1122518060, N'test', N'test', N'12345678', N'test08@test.com', N'123', CAST(0xA3080B00 AS Date), N'm', NULL, CAST(0x0000A88A0173ADBE AS DateTime), CAST(0x0000A88A0173ADBE AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1103, N'S', 1147689022, N'Omar', N'Aguirre', N'12345678', N'omar.aguirre.1984@gmail.com', N'123', CAST(0xD30D0B00 AS Date), N'M', NULL, CAST(0x0000A88A01743855 AS DateTime), CAST(0x0000A88A01743855 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1104, N'P', 4444444, N'Profesor1', N'Profesor1', N'4444444', N'Profesor1@Profesor1.com', N'italo1190', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A88B00013A66 AS DateTime), CAST(0x0000A88B00013A66 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1105, N'P', 44444, N'Profesor2', N'Profesor2', N'44444', N'Profesor2@Profesor2.com', N'1234', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A88B00017892 AS DateTime), CAST(0x0000A88B00017892 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1106, N'S', 1515151515, N'asdfasdfasd', N'adfadsfasdf', N'35110122', N'prueba@prueba.com', N'italo1190', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A88B00FE4390 AS DateTime), CAST(0x0000A88B00FE4390 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1107, N'P', 454545454, N'pruebaProfesor', N'pruebaProfesor', N'4545454545', N'pruebaProfesor@gmail.com', N'italo1190', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A88B01369B12 AS DateTime), CAST(0x0000A88B01369B12 AS DateTime))
INSERT [dbo].[PERSONA] ([idPersona], [TipoPersona], [Telefono], [Nombre], [Apellido], [Dni], [Email], [Password], [FechaNacimiento], [Sexo], [Foto], [FechaRegistracion], [FechaActualizacion]) VALUES (1108, N'P', 454545454, N'pruebaProfesor', N'pruebaProfesor', N'4545454545', N'pruebaProfesor2@gmail.com', N'italo1190', CAST(0xCD150B00 AS Date), N'M', NULL, CAST(0x0000A88B013AABCA AS DateTime), CAST(0x0000A88B013AABCA AS DateTime))
SET IDENTITY_INSERT [dbo].[PERSONA] OFF
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1098, 8)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1100, 8)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1100, 9)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1102, 8)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1102, 9)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1103, 9)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1104, 8)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1104, 9)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1105, 8)
INSERT [dbo].[PERSONAACTIVIDAD] ([idPersona], [idActividad]) VALUES (1105, 9)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (100, N'PIRAMIDES', N'1', 100)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (200, N'CATARATAS', N'2', 50)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (300, N'COLISEO ROMANO', N'3', 20)
INSERT [dbo].[SALA] ([idSala], [nombre], [numero], [capacidad]) VALUES (400, N'TAJ MAHAL', N'4', 30)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1, 1212, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (14, 123, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (15, 124, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (16, 125, 2)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (17, 1, 2)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1096, 11, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1098, 98238, 2)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1100, 121, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1102, 1221, 1)
INSERT [dbo].[SOCIO] ([idPersona], [nroTarjetaIdentificacion], [idEstado]) VALUES (1106, 35110122, 2)
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
