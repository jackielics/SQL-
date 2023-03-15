-- Active: 1678775697597@@108.61.217.127@3306@BZBH
/* 1．使用INNER JOIN编写SQL语句，以检索每个顾客的名称（Customers表中的cust_name）
和所有的订单号（Orders表中的order_num）。 */

SELECT cust_name, order_num
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id

/* 2．修改刚刚创建的SQL语句，仅列出所有顾客，即使他们没有下过订单。 */

SELECT cust_name, order_num
FROM Customers
LEFT JOIN Orders ON Customers.cust_id = Orders.cust_id

/* 3．使用OUTER JOIN联结Products表和OrderItems表，返回产品名称（prod_name）
和与之相关的订单号（order_num）的列表，并按商品名称排序。 */

SELECT prod_name, order_num
FROM Products
LEFT JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
ORDER BY prod_name

/* 4．修改上一题中创建的SQL语句，使其返回每一项产品的总订单数（不是订单号）。 */

SELECT prod_name, COUNT(order_num) AS TotalOrders
FROM Products
LEFT JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
GROUP BY prod_name
ORDER BY prod_name

/* 5．编写SQL语句，列出供应商（Vendors表中的vend_id）及其可供产品的数量，包括没有产品的供应商。
你需要使用OUTER JOIN和COUNT()聚合函数来计算Products表中每种产品的数量。
注意：vend_id列会显示在多个表中，因此在每次引用它时都需要完全限定它。 */

SELECT Vendors.vend_id, COUNT(Products.prod_id) AS TotalProducts
FROM Vendors
LEFT JOIN Products ON Vendors.vend_id = Products.vend_id
GROUP BY vend_id

