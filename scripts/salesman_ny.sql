CREATE DATABASE IF NOT EXISTS raw_db
LOCATION 'gs://cde1705/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW salesman_ny_v
USING JSON
OPTIONS(
path='gs://cde1705/source/salesman_ny.json'
);
CREATE TABLE IF NOT EXISTS salesman_ny
USING PARQUET
SELECT * FROM salesman_ny_v;