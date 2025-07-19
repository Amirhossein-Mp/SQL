SELECT distinct a.athlete_id,firstname,lastname,STRFTIME(start_date - birthday) as youngest_age,final_rank,birthday,end_date
FROM athletes a
JOIN entries e ON e.athlete_id = a.athlete_id
JOIN events ev on e.event_id=ev.event_id
where final_rank=1 and youngest_age is not null order by youngest_age,a.athlete_id limit 1