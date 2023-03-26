-- Active: 1678775697597@@108.61.217.127@3306
/* 1．使用INSERT和指定的列，将你自己添加到Customers表中。明确列出要添加哪几列，且仅需列出你需要的列。 */
INSERT INTO Customers(cust_id, cust_name) VALUES('0101010101', 'Jackie');


/* 2．备份Orders表和OrderItems表。 */
CREATE TABLE OrdersCopy AS SELECT * FROM Orders;
CREATE TABLE OrderItemsCopy AS SELECT * FROM OrderItems;

RENAME TABLE OrderItemsCopy TO OrderItemsCopy1;
