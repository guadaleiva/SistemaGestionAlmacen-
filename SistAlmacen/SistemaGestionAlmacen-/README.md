# SistemaGestionAlmacen-
create database SistemaAlmacen;
USE SistemaAlmacen;

-- Tabla Producto
CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombreProducto VARCHAR(255) NOT NULL,
    descripcionProducto TEXT,
    precioActual DECIMAL(10, 2) NOT NULL,
    idCategoria INT,
    idProveedor INT,
    fechaIngreso DATE,
    CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
    CONSTRAINT fk_proveedor FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

-- Tabla Categoria
CREATE TABLE Categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombreCategoria VARCHAR(100) NOT NULL
);

-- Tabla Proovedores
CREATE TABLE Proveedor (
    idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombreProveedor VARCHAR(255) NOT NULL,
    contactoProveedor VARCHAR(100),
    direccionProveedor TEXT,
    telefonoProveedor VARCHAR(20)
);

-- Tabla Usuario

CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,  -- Debe estar encriptada
    fechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Fecha de creación de la cuenta
    ultimaSesion DATETIME,  -- Fecha de la última sesión
    estado VARCHAR(50) DEFAULT 'activo',  -- Ej: 'activo', 'inactivo', 'bloqueado'
    verificado BOOLEAN DEFAULT FALSE,  -- Indica si el usuario ha verificado su correo electrónico
    idRol INT,
    CONSTRAINT fk_rol_usuario FOREIGN KEY (idRol) REFERENCES Rol(idRol)
);


-- Tabla RegistroCambios
CREATE TABLE RegistroCambios (
    idCambio INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT NOT NULL,
    idUsuario INT NOT NULL,
    precioAntiguo DECIMAL(10, 2) NOT NULL,
    precioNuevo DECIMAL(10, 2) NOT NULL,
    fechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_producto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    CONSTRAINT fk_usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla ComprobanteVenta
CREATE TABLE ComprobanteVenta (
    idComprobante INT AUTO_INCREMENT PRIMARY KEY,
    fechaComprobante TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    impuestos DECIMAL(10, 2) NOT NULL,
    idCliente INT,
    idUsuario INT,
    CONSTRAINT fk_usuario_comprobante FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT fk_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Detalle del Comprobante
CREATE TABLE DetalleComprobante (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idComprobante INT,
    idProducto INT,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_comprobante FOREIGN KEY (idComprobante) REFERENCES ComprobanteVenta(idComprobante),
    CONSTRAINT fk_producto_comprobante FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla Clientes
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombreCliente VARCHAR(255) NOT NULL,
    direccionCliente TEXT,
    telefonoCliente VARCHAR(20),
    emailCliente VARCHAR(255) UNIQUE
);

-- Tabla Carrito de Compras
CREATE TABLE Carrito (
    idCarrito INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'activo',  -- Valores posibles: 'activo', 'completado', 'cancelado'
    total DECIMAL(10, 2) DEFAULT 0.00,
    CONSTRAINT fk_usuario_carrito FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla detalle Carrito de Compras
CREATE TABLE DetalleCarrito (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idCarrito INT,
    idProducto INT,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_carrito FOREIGN KEY (idCarrito) REFERENCES Carrito(idCarrito),
    CONSTRAINT fk_producto_carrito FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla Rol de Usurio
CREATE TABLE Rol (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(50) NOT NULL, 
    descripcionRol VARCHAR(255)
);


