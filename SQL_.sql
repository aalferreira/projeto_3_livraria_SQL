-- Criar o Banco de Dados
CREATE DATABASE livraria;
USE livraria;

-- Criar a Tabela de Livros
CREATE TABLE books (
    idBook int auto_increment primary key,
    title varchar(255) not null,
    author varchar(100) not null,
    genre varchar(50),
    publicationYear int,
    price decimal(10, 2) not null,
    stockQuantity int default 0
);

-- Criar a Tabela de Clientes
CREATE TABLE customers (
    idCustomer int auto_increment primary key,
    firstName varchar(50) not null,
    lastName varchar(50) not null,
    email varchar(100) unique,
    phone varchar(20),
    address varchar(255)
);

-- Criar a Tabela de Pedidos
CREATE TABLE orders (
    idOrder int auto_increment primary key,
    idCustomer int,
    orderDate date not null,
    totalAmount decimal(10, 2) not null,
    constraint fk_order_customer foreign key (idCustomer) references customers(idCustomer)
);

-- Criar a Tabela de Itens de Pedido
CREATE TABLE orderItems (
    idOrderItem int auto_increment primary key,
    idOrder int,
    idBook int,
    quantity int not null,
    subtotal decimal(10, 2) not null,
    constraint fk_order_item_order foreign key (idOrder) references orders(idOrder),
    constraint fk_order_item_book foreign key (idBook) references books(idBook)
);

-- Inserir Dados de Exemplo para Tabela de Livros
INSERT INTO books (title, author, genre, publicationYear, price, stockQuantity)
VALUES
    ('O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', 1954, 39.99, 100),
    ('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 1997, 29.99, 150),
    ('1984', 'George Orwell', 'Ficção Científica', 1949, 24.99, 75);

-- Inserir Dados de Exemplo para Tabela de Clientes
INSERT INTO customers (firstName, lastName, email, phone, address)
VALUES
    ('Ana', 'Silva', 'ana@example.com', '+1 123-456-7890', 'Rua das Flores, 123'),
    ('Pedro', 'Santos', 'pedro@example.com', '+1 987-654-3210', 'Avenida Central, 456');

-- Inserir Dados de Exemplo para Tabela de Pedidos
INSERT INTO orders (idCustomer, orderDate, totalAmount)
VALUES
    (1, '2023-08-01', 69.98),
    (2, '2023-08-02', 29.99);

-- Inserir Dados de Exemplo para Tabela de Itens de Pedido
INSERT INTO orderItems (idOrder, idBook, quantity, subtotal)
VALUES
    (1, 1, 2, 79.98),
    (2, 2, 1, 29.99);