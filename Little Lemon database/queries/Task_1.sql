CREATE VIEW OrdersView AS
    SELECT 
        order_id, quantity, cost
    FROM
        orders
    WHERE
        quantity > 2;
SELECT * FROM OrdersView;