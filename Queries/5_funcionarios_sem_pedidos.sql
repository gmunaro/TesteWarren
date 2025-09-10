-- SQL Query para o desafio Bike Stores Inc.
-- Objetivo: Listar os funcionários que não estão relacionados a nenhum pedido.


SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    s.email
FROM
    staffs AS s
LEFT JOIN
-- Para encontrar funcionários que nunca foram associados a um pedido, usei um
-- `LEFT JOIN` entre a tabela `staffs` e a tabela `orders`.
    orders AS o ON s.staff_id = o.staff_id
WHERE
-- Os funcionários que não possuem pedido associado, terão as colunas de `orders` como `NULL`.
-- Assim, o filtro `o.order_id IS NULL` os identificará..
    o.order_id IS NULL;