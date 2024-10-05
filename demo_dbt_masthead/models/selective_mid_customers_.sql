SELECT
  customer_id, full_name, number_of_orders, spends_total
FROM
  {{ ref('customers') }}
WHERE
  spends_total  > 1000
  AND spends_total < 2000