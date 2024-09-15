SELECT 
    order_id,
    cost,
    orders.menu_name,
    menus.starter,
    menus.course,
    CONCAT(customer_first_name,
            ' ',
            customer_last_name) AS customer_full_name,
    customers.customer_id
FROM
    orders
        LEFT JOIN
    menus ON (orders.menu_name = menus.menu_name)
        LEFT JOIN
    customers ON (customers.customer_id = orders.order_customer_id)
WHERE
    (cost > 150)
ORDER BY cost ASC;