SELECT * FROM customer;


SELECT CustomerID, SUM(Sales)
FROM customer
GROUP BY CustomerID;

show variables like 'windowing';
린분석
WITH rfm AS(
	SELECT CustomerID,
		MAX(recency) AS recency, 
		COUNT(StockCode) AS frequency,
        AVG(Sales) AS monetary
FROM customer
GROUP BY CustomerID
),
rfm_score AS(
	SELECT CustomerID,
			CASE WHEN recency <= 82 THEN 4
				WHEN 82 < recency <= 165 THEN 3
				WHEN 165 < recency <= 268 THEN 2
				else 1
			end as R,
			CASE WHEN frequency >= 334 THEN 4
				WHEN 188 <= frequency < 334 THEN 3
				WHEN 90 <= frequency < 188 THEN 2
				else 1
			end as F,
			CASE WHEN monetary >= 29 THEN 4
				WHEN 21 <= monetary < 29 THEN 3
				WHEN 17 <= monetary < 21 THEN 2
				else 1
			end as M
            
	FROM rfm
    )
SELECT * FROM rfm_score



