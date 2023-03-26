-- Active: 1678698108483@@192.168.157.130@3306@BZBH
/* 1．创建一个名为CustomersWithOrders的视图，其中包含Customers表中的所有列，
但仅仅是那些已下订单的列。提示：可以在Orders表上使用JOIN来仅仅过滤所需的顾客，
然后使用SELECT来确保拥有正确的数据。 */

CREATE VIEW CustomersWithOrders AS
SELECT *
FROM Customers
WHERE cust_id IN (SELECT cust_id FROM Orders);


/* 创建一个存储过程：根据cust_id在Customers表中获取cust_name */
DELIMITER //
CREATE PROCEDURE GetCustomerName(IN cust_id INT, OUT cust_name VARCHAR(50))
BEGIN
    SELECT cust_name INTO cust_name FROM Customers WHERE cust_id = cust_id;
END //

/* 创建一个事务：先删除OrderItems表中order_num为12345的行，
再删除Orders表中order_num为12345的行*/
START TRANSACTION;
DELETE FROM OrderItems WHERE order_num = 12345;
DELETE FROM Orders WHERE order_num = 12345;
COMMIT;

DECLARE CustCursor CURSOR
FOR
SELECT * FROM Customers
WHERE cust_email IS NULL;