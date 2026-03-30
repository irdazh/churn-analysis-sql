-- 1. Overall churn rate
SELECT 
    AVG(`Churn Value`) AS churn_rate
FROM churn;

-- 2. Churn rate by tenure group
SELECT 
    CASE
         WHEN `Tenure Months` < 12 THEN '0-1 year'
         WHEN `Tenure Months` < 24 THEN '1-2 years'
         ELSE '2+ years'
    END AS tenure_group,
    AVG(`Churn Value`) as churn_rate
FROM churn
GROUP BY tenure_group;

-- 3. Churn rate by contract type
SELECT
    Contract, 
    AVG(`Churn Value`) as churn_rate,
    COUNT(*) AS customers
FROM churn
GROUP BY Contract;

-- 4. Churn rate by monthly charges
SELECT 
    CASE 
        WHEN `Monthly Charges` < 30 THEN 'Low'
        WHEN `Monthly Charges` < 70 THEN 'Medium'
        ELSE 'High'
    END AS charge_group,
    AVG(`Churn Value`) AS churn_rate
FROM churn
GROUP BY charge_group;

-- 5. High-risk customer segments
SELECT 
    Contract,
    `Internet Service`,
    AVG(`Churn Value`) AS churn_rate
FROM churn
GROUP BY Contract, `Internet Service`
ORDER BY churn_rate DESC;