select m.referee,sum(COALESCE(
         LENGTH(event) - LENGTH(REPLACE(event, 'R', '')), 0))  AS totalcards from world_cup_matches m join world_cup_players p on m.matchid=p.matchid
group by referee order by totalcards desc