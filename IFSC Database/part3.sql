select country,count(final_rank) as total_wins from entries join athletes on entries.athlete_id = athletes.athlete_id
where entries.final_rank=1
group by country order by total_wins desc limit 1
