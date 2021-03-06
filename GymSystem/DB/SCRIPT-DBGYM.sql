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
	[idSala] [int] IDENTITY(1,1) NOT NULL,
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
WHERE idActividad=@idActividad;

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
CREATE PROCEDURE [dbo].[ActividadSalaValidaCapacidad]

--DEVUELVE LA CANTIDAD DE LUGARES QUE QUEDAN PARA COMPLETAR UNA ACTIVIDAD
@idActividad int,
@idSala int

AS

declare @cantAnotados int;

set @cantAnotados = (
select 
count(PERSONAACTIVIDAD.idPersona)
from 
PERSONAACTIVIDAD RIGHT JOIN SOCIO ON PERSONAACTIVIDAD.idPersona = SOCIO.idPersona
where PERSONAACTIVIDAD.idActividad = @idActividad
)

declare @capacidadSala int;
declare @restante int;

set @capacidadSala = (
select 
SALA.capacidad
from 
SALA
where SALA.idSala = @idSala)


select (@capacidadSala - @cantAnotados) as CapacidadRestante
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActividadSalaValidaCapacidad]

--DEVUELVE LA CANTIDAD DE LUGARES QUE QUEDAN PARA COMPLETAR UNA ACTIVIDAD
@idActividad int,
@idSala int

AS

declare @cantAnotados int;

set @cantAnotados = (
select 
count(PERSONAACTIVIDAD.idPersona)
from 
PERSONAACTIVIDAD RIGHT JOIN SOCIO ON PERSONAACTIVIDAD.idPersona = SOCIO.idPersona
where PERSONAACTIVIDAD.idActividad = @idActividad
)

declare @capacidadSala int;
declare @restante int;

set @capacidadSala = (
select 
SALA.capacidad
from 
SALA
where SALA.idSala = @idSala)


select (@capacidadSala - @cantAnotados) as CapacidadRestante
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
CREATE PROCEDURE [dbo].[getTotalPersonaPorActividad]
@idActividad int,
@TipoPersona char

AS



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTotalPersonaPorActividad]
@idActividad int,
@TipoPersona char

AS

select 
count(*) as totalPersonas
from PERSONAACTIVIDAD 
inner join PERSONA 
on PERSONAACTIVIDAD.idPersona = PERSONA.idPersona
WHERE 
PERSONA.TipoPersona = @TipoPersona
AND
PERSONAACTIVIDAD.idActividad = @idActividad

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
CREATE PROCEDURE [dbo].[ListaTotalParaAdmin]
as
BEGIN
  select 
  (select count(*) from persona 
  inner join socio on persona.idPersona = socio.idPersona where persona.TipoPersona= 'S') as Socios,
  (select count(*) from persona
  inner join empleado on persona.idPersona = EMPLEADO.idPersona
   where EMPLEADO.tipoEmpleado = 1) as Profesores,
   (select count(*) from persona
  inner join empleado on persona.idPersona = EMPLEADO.idPersona
   where EMPLEADO.tipoEmpleado = 2) as Administradores,
   (select count(*) from actividad) as Actividades,
   (select count(*) from SALA) as Salas
 END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaTotalParaAdmin]
as
BEGIN
  select 
  (select count(*) from persona 
  inner join socio on persona.idPersona = socio.idPersona where persona.TipoPersona= 'S') as Socios,
  (select count(*) from persona
  inner join empleado on persona.idPersona = EMPLEADO.idPersona
   where EMPLEADO.tipoEmpleado = 1) as Profesores,
   (select count(*) from persona
  inner join empleado on persona.idPersona = EMPLEADO.idPersona
   where EMPLEADO.tipoEmpleado = 2) as Administradores,
   (select count(*) from actividad) as Actividades,
   (select count(*) from SALA) as Salas
 END

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
CREATE PROCEDURE [dbo].[SalaActualizarTodo]
@idSala int,
@nombre varchar(50),
@numero int,
@capacidad int

AS

UPDATE SALA
SET 
nombre=@nombre,
numero=@numero,
capacidad=@capacidad 

WHERE idSala=@idSala

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaBuscarPorId]
@idSala int

AS
SELECT *
FROM SALA
where SALA.idSala=@idSala

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaBuscarPorIdActividad]
--DEVUELVE LA SALA EN QUE SE ESTA DANDO LA ACTIVIDAD
@idActividad int




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaActualizarTodo]
@idSala int,
@nombre varchar(50),
@numero int,
@capacidad int

AS

UPDATE SALA
SET 
nombre=@nombre,
numero=@numero,
capacidad=@capacidad 

WHERE idSala=@idSala

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaBuscarPorId]
@idSala int

AS
SELECT *
FROM SALA
where SALA.idSala=@idSala

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaBuscarPorIdActividad]
--DEVUELVE LA SALA EN QUE SE ESTA DANDO LA ACTIVIDAD
@idActividad int

AS
SELECT idSala
FROM ACTIVIDADSALA
where ACTIVIDADSALA.idActividad=@idActividad

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaBuscarPorNombre]
@nombre varchar(50)

AS
SELECT *
FROM SALA
where SALA.nombre=@nombre

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SalaBuscarPorNumero]
@numero int

AS
SELECT *
FROM SALA
where SALA.numero=@numero

RETURN SCOPE_IDENTITY()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaInsert]
@nombre varchar(50),
@numero int,
@capacidad int
AS

INSERT INTO SALA
(
nombre,
numero,
capacidad
)
VALUES
(
@nombre,
@numero,
@capacidad
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
ALTER PROCEDURE [dbo].[EmpleadoBorrar]
@idEmpleado int

AS

DELETE 
FROM [dbo].[PERSONAACTIVIDAD]
WHERE idPersona=@idEmpleado;

DELETE 
FROM [dbo].[EMPLEADO]
WHERE idPersona=@idEmpleado;

DELETE 
FROM [dbo].[PERSONA]
WHERE idPersona=@idEmpleado;


RETURN SCOPE_IDENTITY()
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
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (1, N'ACTIVO')
INSERT [dbo].[ESTADO] ([idEstado], [descripcion]) VALUES (2, N'INACTIVO')

INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (1, N'PROFESOR')
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (2, N'ADMINISTRADOR')
INSERT [dbo].[TIPOEMPLEADO] ([idTipoEmpleado], [descripcion]) VALUES (3, N'STAFF')
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
