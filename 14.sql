/* 1．编写SQL语句，将两个SELECT语句结合起来，以便从OrderItems表中检索产品ID（prod_id）
和quantity。其中，一个SELECT语句过滤数量为100的行，另一个SELECT语句过滤ID以BNBG开头的
产品。按产品ID对结果进行排序。 */

SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id LIKE 'BNBG%'

/* 2．重写刚刚创建的SQL语句，仅使用单个SELECT语句。 */

SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100 OR prod_id LIKE 'BNBG%'

/* 3．我知道这有点荒谬，但这节课中的一个注释提到过。编写SQL语句，组合Products表中的产品名称（prod_name）
和Customers表中的顾客名称（cust_name）并返回，然后按产品名称对结果进行排序。 */

      SELECT cust_name, cust_contact, cust_email
      FROM Customers
      WHERE cust_state = 'MI'
      ORDER BY cust_name;
      UNION
      SELECT cust_name, cust_contact, cust_email
      FROM Customers
      WHERE cust_state = 'IL'ORDER BY cust_name;

