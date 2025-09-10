-- SQL Query para o desafio Bike Stores Inc.
-- Objetivo: Listar todos os produtos que não foram comprados em nenhum pedido.


SELECT
    p.product_id,
    p.product_name,
    p.model_year,
    p.list_price
FROM
    products AS p
LEFT JOIN

-- Similar à consulta de clientes sem compras, usamos um `LEFT JOIN` para conectar
-- a tabela `products` com a tabela `order_items`.

    order_items AS oi ON p.product_id = oi.product_id
WHERE

-- Se um produto (da tabela `products`) não tiver uma entrada correspondente em `order_items`,
-- significa que ele nunca foi vendido.

-- O filtro `oi.product_id IS NULL` identifica esses produtos.
    oi.product_id IS NULL;