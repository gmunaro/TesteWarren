-- SQL Query para o desafio Bike Stores Inc.
-- Objetivo: Listar todos os produtos que não possuem estoque em nenhuma loja.


SELECT
    p.product_id,
    p.product_name,
    p.model_year
FROM
    products AS p
LEFT JOIN
-- Para encontrar produtos sem estoque, podemos usar um `LEFT JOIN` entre a tabela `products`
-- e a tabela `stocks`.
    stocks AS s ON p.product_id = s.product_id
WHERE
-- Se um produto existir na tabela `products` mas não tiver entradas
-- correspondentes em `stocks` ou se a `quantity` em `stocks` for 0 para todas as entradas
-- desse produto, então ele está sem estoque. O filtro `s.quantity IS NULL OR s.quantity = 0`
-- nos dará os produtos que não possuem estoque em nenhuma loja..
    s.quantity IS NULL OR s.quantity = 0;