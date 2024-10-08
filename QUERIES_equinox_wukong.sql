-- Finding price changes during vault and right before unvaulting
-- Repeated these queries with only changes to table, order_type filter, and limit number
-- Equinox: During: 80 sell vs 40 buy     |     Right before: 75 sell vs 43 buy
-- Wukong:  During: 98 sell vs 50 buy     |     Right before: 80 sell vs 50 buy
SELECT * FROM equinox_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2023-10-06' AND '2024-04-23'
ORDER BY platinum
LIMIT 123;

SELECT * FROM equinox_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-04-24' AND '2024-05-07'
ORDER BY platinum
LIMIT 27;


-- Finding price changes during the unvault period
-- Repeated these queries with only changes to table, order_type filter, and limit number
-- Equinox: Median: 65 sell vs 42 buy     |     Average: 70 sell vs 42 buy
-- Equinox: Minimum selling price: 50     |     Maximum buying price: 50
-- Wukong:  Median: 70 sell vs 50 buy     |     Average: 75 sell vs 50 buy
-- Wukong: Minimum selling price: 50      |     Maximum buying price: 80        !!!!!
-- Wukong's MAX buying price leaned towards 60
SELECT * FROM equinox_prices
WHERE order_type = 'sell'
AND creation_date > '2024-05-08'
ORDER BY platinum
LIMIT 224;

SELECT ROUND(AVG(platinum), 0) AS avg_unvault
FROM equinox_prices
WHERE order_type = 'sell'
AND creation_date > '2024-05-08';

SELECT MIN(platinum) AS min_sell
FROM equinox_prices
WHERE order_type = 'sell'
AND creation_date > '2024-05-08';

SELECT MAX(platinum) AS max_buy
FROM equinox_prices
WHERE order_type = 'buy'
AND creation_date > '2024-05-08';

SELECT * FROM wukong_prices
WHERE order_type = 'buy'
AND creation_date > '2024-05-08'
ORDER BY platinum DESC;
