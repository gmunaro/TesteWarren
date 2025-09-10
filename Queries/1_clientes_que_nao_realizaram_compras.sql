-- SQL Query para o desafio Bike Stores Inc.
-- Objetivo: Listar todos os clientes que não realizaram nenhuma compra.


-- Para encontrar clientes que não realizaram compras, precisamos comparar a tabela `customers`
-- com a tabela `orders`. 

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM
    customers AS c

-- Um `LEFT JOIN` é ideal aqui, pois ele retorna todos os registros da tabela da esquerda (`customers`)
-- e os registros correspondentes da tabela da direita (`orders`).

LEFT JOIN
    orders AS o ON c.customer_id = o.customer_id
    
WHERE
-- Se um cliente não tem nenhum pedido, as colunas de `orders` virão como `NULL` para aquele cliente.
-- Assim, podemos filtrar por `o.order_id IS NULL` para identificar esses clientes.

    o.order_id IS NULL;