-- Active: 1678775697597@@108.61.217.127@3306@BZBH
/* 1．编写SQL语句，返回Customers表中的顾客名称（cust_name）和Orders表中的相关订单号（order_num），
并按顾客名称再按订单号对结果进行排序。实际上是尝试两次，一次使用简单的等联结语法，一次使用INNER JOIN。 */

--cust_name是Customers表独有的，order_num是Orders表独有的，所以不需要指定表名
SELECT cust_name, order_num 
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

/* 2．我们来让上一题变得更有用些。除了返回顾客名称和订单号，添加第三列OrderTotal，
其中包含每个订单的总价。有两种方法可以执行此操作：使用OrderItems表的子查询来创建OrderTotal列，
或者将OrderItems表与现有表联结并使用聚合函数。提示：请注意需要使用完全限定列名的地方。 */
SELECT cust_name, order_num, (  SELECT SUM(item_price * quantity)
                                FROM OrderItems
                                WHERE OrderItems.order_num = Orders.order_num) AS OrderTotal
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

