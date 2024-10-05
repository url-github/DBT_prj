WITH etl_data AS (
   SELECT
      id as order_id,
      customer as customer_id,
      ordered_at,
      order_total,
      subtotal,
      tax_paid
   FROM
     dbt_dataset.mh_orders_raw
   WHERE
     order_total > 0
  AND RAND() < 50000/(select count(*) from dbt_dataset.mh_orders_raw)
)
SELECT * FROM etl_data