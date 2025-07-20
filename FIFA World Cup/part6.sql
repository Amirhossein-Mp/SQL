-- Select wm.matchid,"Player Name","WorldCups"."Year","Team Initials","Country",event from world_cup_matches wm join world_cup_players wp on wm.matchid=wp.matchid
-- join "WorldCups" on "WorldCups"."Year"=wm.year where  (event ~ 'R|Y') and (("Team Initials"="Away_Team_Initials" and "Country" ~ "Away_Team_Name"  ) or ("Team Initials"="Home_Team_Initials" and "Country" ~ "Home_Team_Name" ))
SELECT
  wp."Player Name",
  wc."Year",
  wp."Team Initials",
  wc."Country",
  wp.event
FROM
  world_cup_matches wm
JOIN
  world_cup_players wp ON wm.matchid = wp.matchid
JOIN
  "WorldCups" wc ON wc."Year" = wm.year
WHERE
  (wp.event LIKE '%R%' OR wp.event LIKE '%Y%')
  AND (
    (wp."Team Initials" = wm."Home_Team_Initials" AND "Home_Team_Name" ~ ('^' || REPLACE("Country", '/', '|') || '$'))
    OR
    (wp."Team Initials" = wm."Away_Team_Initials" AND "Away_Team_Name" ~ ('^' || REPLACE("Country", '/', '|') || '$'))
  )

