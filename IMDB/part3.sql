CREATE OR REPLACE FUNCTION count_actor_countries(in_actor_id INTEGER)
RETURNS INTEGER AS $$
DECLARE
    country_count INTEGER;
BEGIN
    SELECT COUNT(DISTINCT m.countary)
    INTO country_count
    FROM movies m
    JOIN act a ON m.movie_id = a.movie_id
    WHERE a.actor_id = in_actor_id;

    RETURN country_count;
END;
$$ LANGUAGE plpgsql;
