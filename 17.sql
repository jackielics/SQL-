-- Active: 1678698108483@@192.168.157.130@3306@BZBH
/* 1．在Vendors表中添加一个网站列（vend_web）。你需要一个足以容纳URL的大文本字段。 */
    ALTER TABLE Vendors
    ADD vend_web CHAR(50);


/* 2．使用UPDATE语句更新Vendor记录，以便加入网站（你可以编造任何地址）。 */
    UPDATE Vendors
    SET vend_web = 'www.baidu.com'
    WHERE vend_id = '1001';

    CREATE VIEW ProductCustomers AS
    SELECT cust_name, cust_contact, prod_id
    FROM Customers, Orders, OrderItems
    WHERE Customers.cust_id = Orders.cust_id
      AND OrderItems.order_num = Orders.order_num;