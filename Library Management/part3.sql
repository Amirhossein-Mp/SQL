CREATE OR REPLACE FUNCTION trg_check_loan_constraints()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_book_available   BOOLEAN;
    v_member_active    BOOLEAN;
BEGIN
    SELECT availability_status
    INTO v_book_available
    FROM books
    WHERE book_id = NEW.book_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Error: No book found with ID %.', NEW.book_id;
    ELSIF v_book_available = FALSE THEN
        RAISE EXCEPTION 'Error: Book with ID % is currently on loan or not available.', NEW.book_id;
    END IF;
    SELECT membership_status
    INTO v_member_active
    FROM members
    WHERE member_id = NEW.member_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Error: No member found with ID %.', NEW.member_id;
    ELSIF v_member_active = FALSE THEN
        RAISE EXCEPTION 'Error: Member with ID % has an inactive membership. Cannot proceed with loan.', NEW.member_id;
    END IF;
    RETURN NEW;
END;
$$;
CREATE TRIGGER trg_before_insert_loans
    BEFORE INSERT
    ON loans
    FOR EACH ROW
    EXECUTE FUNCTION trg_check_loan_constraints();
