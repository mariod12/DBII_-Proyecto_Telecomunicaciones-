CREATE DATABASE ETL
GO

USE [ETL ]
GO

CREATE TABLE DIM_CLIENTES_DEST(
    id_cliente int PRIMARY KEY,
    Nombre nvarchar(51),
    direccion nvarchar(100),
    telefono nvarchar(10),
    Edad int,
    correo nvarchar(100),
    colonia nvarchar(100),
    municipio nvarchar(50),
    departamento nvarchar(50),
    pais nvarchar(20),
    genero nvarchar(20),
    tipo_cliente nvarchar(100),
    beneficios nvarchar(100),
    fecha_afiliaccion date
)GO

CREATE TABLE DIM_EMPLEADOS_DESTINO(
    id_empleado int PRIMARY KEY,
    Nombre nvarchar(51),
    telefono nvarchar(10),
    Edad int,
    genero nvarchar(20),
    Fecha_de_contratacion date,
    Salario numeric(10,2),
    correo nvarchar(100),
    Puesto nvarchar(80),
    Descripcion_puesto nvarchar(150),
    colonia nvarchar(100),
    municipio nvarchar(50),
    departamento nvarchar(50),
    direccion nvarchar(100),
    pais nvarchar(20)
)

CREATE TABLE DIM_TIEMPOS_DESTINO(
     Fecha datetime PRIMARY KEY ,
     Mes int,
     Anio int
)GO

CREATE TABLE DIM_SUCURSAL_DEST (
    idLoca int PRIMARY KEY,
    sucursal_nombre nvarchar(100),
    horaApertura time(7),
    horaCierre time(7),
    telefono nvarchar(8),
    eMail nvarchar(50),
    ubicacion nvarchar(226)
)GO

CREATE TABLE DIM_SERVICIOS_DESTINO (
    id_paquetes_s_p int PRIMARY KEY,
    Nombre nvarchar(100),
    precio_mensual numeric(18,0),
    cantidad_paquetes int,
    Tipo_servicio nvarchar(50),
	Paquete nvarchar(100),
	cantidad nvarchar(10),
	medio nvarchar(100),
	tiempo_duraccion date,
	velocidad nvarchar(20)
	)GO

CREATE TABLE DIM_CONTRATOS_DESTINO(
    id_contrato_Compra int PRIMARY KEY ,
    id_cliente int,
    nombre nvarchar(51),
    nombre_plan nvarchar(100),
    tipo_servicio nvarchar(50),
    precio_mensual numeric(18,0),
    fecha_inicio date,
    fecha_fin date
	)GO

CREATE TABLE H_FVENTAS_DESTINO(
    n_Factura int,
    id_cliente int,
    id_empleado int,
    id_contrato_Compra int,
    id_paquetes_s_p int,
    idLocal int,
    total numeric(10,2),
    fecha_hora datetime,
	CONSTRAINT FK_cliente FOREIGN KEY (id_cliente)
	REFERENCES DIM_CLIENTES_DEST(id_cliente),
    CONSTRAINT FK_empleado FOREIGN KEY (id_empleado)
	REFERENCES DIM_EMPLEADOS_DESTINO(id_empleado),
    CONSTRAINT FK_tiempo FOREIGN KEY (fecha_hora )
	REFERENCES DIM_TIEMPOS_DESTINO(Fecha),
    CONSTRAINT FK_sucursal FOREIGN KEY (idLocal)
	REFERENCES DIM_SUCURSAL_DEST(idLocal),
    CONSTRAINT FK_servicios_planes FOREIGN KEY (id_paquetes_s_p)
	REFERENCES DIM_SERVICIOS_DESTINO(id_paquetes_s_p),
    CONSTRAINT FK_contratos FOREIGN KEY (id_contrato_Compra)
	REFERENCES DIM_CONTRATOS_DESTINO(id_contrato_Compra)
)GO

