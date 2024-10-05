CREATE OR REPLACE EXTERNAL TABLE `dbt_dataset.mh_customers_raw` (
    id STRING,
    name STRING
)
OPTIONS (
format = 'CSV',
uris = ['gs://mybucket/raw_customers.csv'], -- replace with path to your csv file uploaded to cloud storage
skip_leading_rows = 1
);