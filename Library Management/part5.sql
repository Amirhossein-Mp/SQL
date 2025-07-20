CREATE OR REPLACE FUNCTION trg_check_max_simultaneous_loans()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_active_loans_count INT;
BEGIN
    SELECT COUNT(*)
    INTO v_active_loans_count
    FROM loans
    WHERE book_id = NEW.book_id
      AND return_date IS NULL;
    IF v_active_loans_count >= 5 THEN
        RAISE EXCEPTION 'Error: Cannot loan book ID % – maximum of 5 simultaneous loans reached.', NEW.book_id;
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER trg_before_insert_loans_max5
    BEFORE INSERT
    ON loans
    FOR EACH ROW
    EXECUTE FUNCTION trg_check_max_simultaneous_loans();