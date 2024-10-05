WITH etl_data AS (
   SELECT
      id as store_id,
      name as store_name
   FROM
     dbt_dataset.mh_stores_raw
)
SELECT * FROM etl_data