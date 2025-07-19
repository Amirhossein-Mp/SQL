select events.name as event_name ,athletes.lastname from entries join athletes on entries.athlete_id = athletes.athlete_id
         join events on entries.event_id = events.event_id
where entries.qualification_rank=1
