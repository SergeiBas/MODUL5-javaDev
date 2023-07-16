SELECT name, PROJECT_COUNT
FROM (SELECT name, count(project.finish_date) AS PROJECT_COUNT
      FROM client
               JOIN project
                    ON client.id = project.client_id
      group by name) AS "First"
WHERE PROJECT_COUNT = (SELECT max(count)
                       FROM (SELECT count(project.finish_date) AS count
                             FROM client
                                      JOIN project
                                           ON client.id = project.client_id
                             group by name) AS "Second");