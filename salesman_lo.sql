CREATE DATABASE IF NOT EXISTS raw_db
LOCATION 'gs://cde1705/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW salesman_lo_v
USING JSON
OPTIONS(
path='gs://cde1705/source/salesman_lo.json'
);
CREATE TABLE IF NOT EXISTS salesman_lo
USING PARQUET
SELECT * FROM salesman_lo_v;