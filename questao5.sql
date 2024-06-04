-- Query executada utilizando o db PostgreSQL
WITH 
RANK_VALOR AS (
  SELECT
    vendedor,
    ROW_NUMBER() OVER (
      PARTITION BY vendedor
      ORDER BY
        vendedor,
        valor DESC
    ) AS valor_rank,
    valor
  FROM
    comissoes
),
FILTER_RANK AS (
  SELECT
    vendedor,
    SUM(valor) AS total_comissoes
  FROM
    RANK_VALOR
  WHERE
    valor_rank != 4
  GROUP BY
    vendedor
)
SELECT
  vendedor
FROM
  FILTER_RANK
WHERE
  total_comissoes >= 1024
ORDER BY
  vendedor ASC;