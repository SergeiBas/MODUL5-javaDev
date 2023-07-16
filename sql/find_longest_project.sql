SELECT id, MONTH_COUNT
FROM (SELECT id,
             (EXTRACT(YEAR FROM progect_interval) * 12) + EXTRACT(MONTH FROM progect_interval)
                 AS MONTH_COUNT
      FROM (
      SELECT id, age(finish_date, start_date) AS progect_interval
            FROM project) AS INTERVALS) AS SERCH_MAX_COUNT
WHERE MONTH_COUNT = (SELECT max(MONTH_COUNT)
                     FROM (SELECT (EXTRACT(YEAR FROM progect_interval) * 12) + EXTRACT(MONTH FROM progect_interval)
                                      AS MONTH_COUNT
                           FROM (SELECT age(finish_date, start_date) AS progect_interval
                                 FROM project) AS INTERVALS) AS MAXIMUM)
;