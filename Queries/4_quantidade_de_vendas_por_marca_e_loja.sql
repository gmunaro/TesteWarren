-- T-SQL Query para o desafio Bike Stores Inc.
-- Objetivo: Agrupar a quantidade de vendas por Marca e Loja.


-- Para obter a quantidade de vendas por marca e por loja, precisamos unir várias tabelas:
-- optei por usar `INNER JOIN` explicitamente, pois precisamos de correspondências em todas as tabelas.


SELECT
    b.brand_name,
    s.store_name,
    -- O `SUM(oi.quantity)` irá agregar as quantidades vendidas
    SUM(oi.quantity) AS total_quantity_sold
FROM
-- `order_items` para a quantidade (`quantity`)
    order_items AS oi
INNER JOIN
-- `products` para obter o `brand_id`
    products AS p ON oi.product_id = p.product_id
INNER JOIN
-- `brands` para o nome da marca (`brand_name`) 
    brands AS b ON p.brand_id = b.brand_id
INNER JOIN
-- `orders` para vincular os itens de pedido a um pedido específico
    orders AS o ON oi.order_id = o.order_id
INNER JOIN
-- `stores` para o nome da loja (`store_name`).
    stores AS s ON o.store_id = s.store_id
GROUP BY
--  O `GROUP BY` por `brand_name` e `store_name` garantirá que a agregação seja feita para cada
--  combinação única de marca e loja.
    b.brand_name,
    s.store_name
ORDER BY
-- `ORDER BY` é utilizado para tornar o resultado mais bonito, como cabelo de quem come abacate.
    b.brand_name,
    s.store_name;