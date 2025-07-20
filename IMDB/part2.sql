SELECT *
FROM movies
WHERE
  REGEXP_COUNT(title, 'Gotham') + REGEXP_COUNT(title, 'Batman') >= 2
  OR
  REGEXP_COUNT(summary, 'Gotham') + REGEXP_COUNT(summary, 'Batman') >= 2;
