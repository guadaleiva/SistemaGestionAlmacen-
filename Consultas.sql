use SistemaAlmacen;

-- Ingreso de Datos

INSERT INTO Producto (nombreProducto, descripcionProducto, precioActual, idCategoria, idProveedor, fechaIngreso)
VALUES
('Pan francés', 'Pan clásico estilo francés', 10000, 1, 2, '2024-10-05'),
('Pan de centeno', 'Pan hecho con harina de centeno', 12000, 1, 2, '2024-10-06'),
('Queso cheddar', 'Queso madurado tipo cheddar', 35000, 2, 3, '2024-10-03'),
('Jamón cocido', 'Jamón cocido de cerdo', 25000, 3, 4, '2024-10-04');


INSERT INTO Categoria (nombreCategoria)
VALUES
('Lácteos'),
('Fiambrería'),
('Bebidas'),
('Panadería'),
('Congelados');

INSERT INTO Proveedor (nombreProveedor, contactoProveedor, direccionProveedor, telefonoProveedor)
VALUES
('Lácteos La Serena', 'Pedro Gómez', 'Calle 45 No. 123', '03515555678'),
('Carnes Don Juan', 'Juan Martínez', 'Av. Colón 200', '0351558910'),
('Panificados El Grano', 'Roberto López', 'Calle 25 de Mayo 600', '03515552345');

INSERT INTO Usuario (nombreUsuario, correo, contraseña, idRol)
VALUES
('user1', 'fabiammercado@example.com', 'contrasena2356', 1),
('user2', 'javiersosa@gmail.com', 'contrasena8956', 1),
('user3', 'nicolascabrera@gmail.com', 'contrasena2346', 2),
('admin1', 'joseluismestre@gmail.com', 'contrasena1234', 2);

-- Consulta de tabla producto 
SELECT * FROM Producto;

-- Consulta de tabla categoria
SELECT * FROM Categoria;

-- Consulta de tabla proovedores
SELECT * FROM Proveedor;

-- Consulta de tabla usuarios
SELECT * FROM Usuario WHERE estado = 'activo';

-- Borrar Producto 
DELETE FROM Producto WHERE idProducto = 1;

-- Borra Categoria 
DELETE FROM Categoria WHERE idCategoria = 2;







