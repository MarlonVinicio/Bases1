USE ProyectoBases1SkyNetSA;

-- Insertando datos en la tabla Colaboradores
INSERT INTO Colaboradores (Nombre, Direccion, Telefono, Email) VALUES
('Juan Perez', '4a Calle 7-53 Zona 1', '12345678', 'juan.perez@skynet.com'),
('Maria Lopez', '6a Avenida 12-60 Zona 3', '87654321', 'maria.lopez@skynet.com');

-- Insertando datos en la tabla Usuarios
INSERT INTO Usuarios (ColaboradorID, NombreUsuario, Contrasena) VALUES
(LAST_INSERT_ID() - 1, 'juanp', 'contrasena123'),
(LAST_INSERT_ID(), 'marial', 'contrasena321');

-- Insertando datos en la tabla Roles
INSERT INTO Roles (NombreRol, Descripcion) VALUES
('Administrador', 'Usuario con acceso total al sistema'),
('Vendedor', 'Usuario con acceso a módulos de venta');

-- Insertando datos en la tabla Accesos
INSERT INTO Accesos (UsuarioID, RolID) VALUES
(1, 1),
(2, 2);

-- Insertando datos en la tabla Clientes
INSERT INTO Clientes (Nombre, NIT, Direccion, Telefono, Email) VALUES
('Empresa XYZ', '1234567-K', '10a Calle 5-22 Zona 9', '56781234', 'contacto@xyz.com');

-- Insertando datos en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Contacto, Telefono, Email, Direccion) VALUES
('Proveedor ABC', 'Carlos Gomez', '65432178', 'ventas@abc.com', '3a Avenida 11-77 Zona 2');

-- Insertando datos en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, PrecioCosto, PrecioVenta, Stock) VALUES
('Laptop Gamer', 'Laptop para juegos de alta gama', 7500.00, 9500.00, 10),
('Mouse Ergonómico', 'Mouse inalámbrico ergonómico', 150.00, 250.00, 50);

-- Insertando datos en la tabla Compras
INSERT INTO Compras (ProveedorID, FechaCompra, Total) VALUES
(1, CURDATE(), 15000.00);

-- Insertando datos en la tabla DetalleCompras
INSERT INTO DetalleCompras (CompraID, ProductoID, Cantidad, PrecioCompra) VALUES
(1, 1, 5, 3000.00);

-- Insertando datos en la tabla Ventas
INSERT INTO Ventas (ClienteID, FechaVenta, Total) VALUES
(1, CURDATE(), 5000.00);

-- Insertando datos en la tabla DetalleVentas
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioVenta) VALUES
(1, 2, 10, 250.00);

-- Insertando datos en la tabla OrdenesCompra
INSERT INTO OrdenesCompra (ProveedorID, FechaOrden, FechaRequerida, Estado) VALUES
(1, CURDATE(), CURDATE() + INTERVAL 5 DAY, 'Pendiente');

-- Insertando datos en la tabla DetalleOrdenesCompra
INSERT INTO DetalleOrdenesCompra (OrdenCompraID, ProductoID, Cantidad, PrecioOrden) VALUES
(1, 1, 3, 3000.00);

-- Insertando datos en la tabla InventarioMovimientos
INSERT INTO InventarioMovimientos (ProductoID, TipoMovimiento, Cantidad, FechaMovimiento) VALUES
(1, 'Entrada', 5, CURDATE());
inventariomovimientos