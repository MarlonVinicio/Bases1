-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS ProyectoBases1SkyNetSA;
USE ProyectoBases1SkyNetSA;

-- Creación de la tabla Colaboradores
CREATE TABLE IF NOT EXISTS Colaboradores (
    ColaboradorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Activo BOOLEAN NOT NULL DEFAULT TRUE
);

-- Creación de la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    ColaboradorID INT,
    NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Activo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (ColaboradorID) REFERENCES Colaboradores(ColaboradorID) ON DELETE SET NULL
);

-- Creación de la tabla Roles
CREATE TABLE IF NOT EXISTS Roles (
    RolID INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(50) NOT NULL,
    Descripcion TEXT
);

-- Creación de la tabla Acceso al sistema
CREATE TABLE IF NOT EXISTS Accesos (
    UsuarioID INT,
    RolID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (RolID) REFERENCES Roles(RolID),
    PRIMARY KEY (UsuarioID, RolID)
);

-- Creación de la tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    NIT VARCHAR(20) UNIQUE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Creación de la tabla Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contacto VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Direccion VARCHAR(255)
);

-- Creación de la tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    PrecioCosto DECIMAL(10, 2) NOT NULL,
    PrecioVenta DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Creación de la tabla Compras
CREATE TABLE IF NOT EXISTS Compras (
    CompraID INT AUTO_INCREMENT PRIMARY KEY,
    ProveedorID INT NOT NULL,
    FechaCompra DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Creación de la tabla DetalleCompras
CREATE TABLE IF NOT EXISTS DetalleCompras (
    DetalleCompraID INT AUTO_INCREMENT PRIMARY KEY,
    CompraID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioCompra DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CompraID) REFERENCES Compras(CompraID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Creación de la tabla Ventas
CREATE TABLE IF NOT EXISTS Ventas (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT NOT NULL,
    FechaVenta DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Creación de la tabla DetalleVentas
CREATE TABLE IF NOT EXISTS DetalleVentas (
    DetalleVentaID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioVenta DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Creación de la tabla OrdenesCompra
CREATE TABLE IF NOT EXISTS OrdenesCompra (
    OrdenCompraID INT AUTO_INCREMENT PRIMARY KEY,
    ProveedorID INT NOT NULL,
    FechaOrden DATE NOT NULL,
    FechaRequerida DATE,
    Estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Creación de la tabla DetalleOrdenesCompra
CREATE TABLE IF NOT EXISTS DetalleOrdenesCompra (
    DetalleOrdenCompraID INT AUTO_INCREMENT PRIMARY KEY,
    OrdenCompraID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioOrden DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrdenCompraID) REFERENCES OrdenesCompra(OrdenCompraID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Creación de la tabla InventarioMovimientos
CREATE TABLE IF NOT EXISTS InventarioMovimientos (
    MovimientoID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT NOT NULL,
    TipoMovimiento VARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL,
    FechaMovimiento DATE NOT NULL,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

