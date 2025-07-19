select entries.athlete_id, lastname,count(rank) as gold_medals_count from entries join athletes on entries.athlete_id = athletes.athlete_id
                                         where rank=1
group by entries.athlete_id order by gold_medals_count desc limit 1;