Select w."Country",m.year,avg(m.attendance) as avgparticipantspermatch from "WorldCups" as w
    join world_cup_matches m on m.year=w."Year"
    where w."Country"=m."Away_Team_Name" or w."Country"="Home_Team_Name"
    group by (w."Country",m.year)
order by avgparticipantspermatch desc


