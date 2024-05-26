CREATE DATABASE IF NOT EXISTS raw_db
LOCATION 'gs://cde1705/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW customer_ny_v
USING JSON
OPTIONS(
path='gs://cde1705/source/customer_ny.json'
);
CREATE TABLE IF NOT EXISTS raw_db.customer_ny
USING PARQUET
SELECT * FROM customer_ny_v;