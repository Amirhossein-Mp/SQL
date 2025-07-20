Select year,count(*) count from world_cup_matches where ("Home_Team_Goals" > "Away_Team_Goals"
and "Half-time Away Goals">"Half-time Home Goals") or ("Home_Team_Goals" < "Away_Team_Goals"
and "Half-time Away Goals"<"Half-time Home Goals")
group by year order by count desc


