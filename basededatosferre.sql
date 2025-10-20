CREATE DATABASE facturacion;
USE facturacion;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE facturas (
    id_factura INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_factura (
    id_detalle INT PRIMARY KEY,
    id_factura INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre, email, telefono)
VALUES
(1, 'Oviedo', 'oviedo@gmail.com', '123456789'),
(2, 'Thiago', 'thiago@gmail.com', '987654321'),
(3, 'Jere', 'jere@gmail.com', '555666777');

INSERT INTO productos (id_producto, nombre_producto, precio)
VALUES
(1, 'Laptop', 1200.50),
(2, 'Mouse', 25.75),
(3, 'Teclado', 45.00);

INSERT INTO facturas (id_factura, id_cliente, fecha)
VALUES
(1, 1, '2025-10-01'),
(2, 2, '2025-10-02'),
(3, 3, '2025-10-03');

INSERT INTO detalle_factura (id_detalle, id_factura, id_producto, cantidad)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 3, 2, 3);

SHOW TABLES;

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM facturas;
SELECT * FROM detalle_factura;

SELECT f.id_factura, c.nombre AS cliente, p.nombre_producto, d.cantidad, p.precio,
       (d.cantidad * p.precio) AS total_item
FROM detalle_factura d
JOIN facturas f ON d.id_factura = f.id_factura
JOIN clientes c ON f.id_cliente = c.id_cliente
JOIN productos p ON d.id_producto = p.id_producto;
