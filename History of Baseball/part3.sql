select  t.year,t.div_id,t.league_id,t.team_id,t.name,a.player_id,p.award_id from team t join pitching a on t.year=a.year and t.team_id=a.team_id And a.league_id=t.league_id
                                                                         join player_award p on a.player_id=p.player_id and a.league_id=p.league_id and a.year=p.year
                                                   where rank=1
order by t.year