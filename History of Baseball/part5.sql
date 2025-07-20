select  t.year,t.div_id,t.league_id,t.team_id,t.name,a.player_id,name_full,state from team t join pitching a on t.year=a.year and t.team_id=a.team_id And a.league_id=t.league_id
                                                                         join player_college p on a.player_id=p.player_id and a.year=p.year
                                                                         join college c on p.college_id=c.college_id
                                                   where rank=1
order by t.year