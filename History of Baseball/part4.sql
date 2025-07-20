select  t.year,t.div_id,t.league_id,t.team_id,t.name,a.player_id,s.salary from team t join pitching a on t.year=a.year and t.team_id=a.team_id And a.league_id=t.league_id
                                                                         join salary s on a.player_id=s.player_id and a.league_id=s.league_id and a.year=s.year 
                                                   where rank=1
order by t.year