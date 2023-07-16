SELECT 'YOUNGEST' AS TYPE, name, birthday
FROM worker
WHERE birthday =
      (SELECT max(birthday) FROM worker)
UNION
SELECT 'OLDEST' AS TYPE,  name, birthday
FROM worker
WHERE birthday =
      (SELECT min(birthday) FROM worker)
ORDER BY birthday DESC ;