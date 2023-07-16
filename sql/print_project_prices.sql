SELECT project_id, sum * PROJECT_MONTH.MONTH_COUNT
FROM (SELECT project.id         AS project_id
           , sum(worker.salary) AS sum

      FROM project
               JOIN project_worker
                    ON project.id = project_worker.project_id
               JOIN worker
                    ON worker.id = project_worker.worker_id
      WHERE project.id IN
            (SELECT project_id FROM project_worker)
      GROUP BY project.id
      ORDER BY project.id) AS RESULT

         JOIN
     (SELECT id,
             (EXTRACT(YEAR FROM progect_interval) * 12) + EXTRACT(MONTH FROM progect_interval)
                 AS MONTH_COUNT
      FROM (SELECT id, age(finish_date, start_date) AS progect_interval
            FROM project) AS INTERVALS) AS PROJECT_MONTH
     ON project_id = PROJECT_MONTH.id
;