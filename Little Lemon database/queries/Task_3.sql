SELECT 
    menu_name AS MenuName
FROM
    menus
WHERE
    menu_name = ANY (SELECT 
            menus.menu_name
        FROM
            orders
                INNER JOIN
            menus ON orders.menu_name = menus.menu_name
        WHERE
            orders.quantity > 2)
