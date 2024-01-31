WITH ProjectCosts AS (
	SELECT
		pr.id AS ProjectID,
		pr.NAME AS ProjectName,
		SUM(w.SALARY * TIMESTAMPDIFF(MONTH, START_DATE, FINISH_DATE)) AS ProjectCost
	FROM project pr
	JOIN project_worker pw ON pr.ID = pw.PROJECT_ID
	JOIN worker w ON pw.WORKER_ID = w.ID
	GROUP BY pr.ID, pr.NAME
)
SELECT
	ProjectName AS NAME,
	ProjectCost AS PRICE
FROM ProjectCosts
ORDER BY PRICE DESC;
	