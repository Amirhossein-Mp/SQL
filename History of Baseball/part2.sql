select  t.year,t.div_id,t.league_id,t.team_id,t.name,a.player_id,p.name_first,p.name_last from team t join pitching a on t.year=a.year and t.team_id=a.team_id And a.league_id=t.league_id
                                                                         join player p on a.player_id=p.player_id
                                                   where rank=1
order by t.year