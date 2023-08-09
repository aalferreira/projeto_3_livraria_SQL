-- Recuperação simples de todos os títulos de livros:
SELECT title FROM books;

-- Recuperação dos detalhes do cliente com o email 'ana@example.com':
SELECT * FROM customers WHERE email = 'ana@example.com';

-- Criação de uma expressão para calcular o preço total de cada pedido:
SELECT idOrder, idCustomer, SUM(totalAmount) AS TotalPrice
FROM orders
GROUP BY idOrder, idCustomer;

-- Ordenação dos livros pelo preço em ordem decrescente:
SELECT * FROM books ORDER BY price DESC;

-- Recuperação dos clientes que fizeram pedidos no valor total maior que 50:
SELECT c.firstName, c.lastName, SUM(o.totalAmount) AS TotalAmount
FROM customers c
INNER JOIN orders o ON c.idCustomer = o.idCustomer
GROUP BY c.idCustomer
HAVING TotalAmount > 50;

-- Recuperação dos detalhes do pedido juntamente com os livros incluídos no pedido:
SELECT o.idOrder, o.orderDate, b.title, oi.quantity, oi.subtotal
FROM orders o
INNER JOIN orderItems oi ON o.idOrder = oi.idOrder
INNER JOIN books b ON oi.idBook = b.idBook;

-- Recuperação do número total de pedidos para cada cliente:
SELECT c.firstName, c.lastName, COUNT(o.idOrder) AS NumOrders
FROM customers c
LEFT JOIN orders o ON c.idCustomer = o.idCustomer
GROUP BY c.idCustomer;

-- Recuperação dos livros do gênero 'Fantasia' e os clientes que compraram esses livros:
SELECT c.firstName, c.lastName, b.title, b.genre
FROM customers c
INNER JOIN orders o ON c.idCustomer = o.idCustomer
INNER JOIN orderItems oi ON o.idOrder = oi.idOrder
INNER JOIN books b ON oi.idBook = b.idBook
WHERE b.genre = 'Fantasia';


