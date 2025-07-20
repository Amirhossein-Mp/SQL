CREATE OR REPLACE PROCEDURE membership_renewal(p_member_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total_debt BIGINT;
BEGIN

    SELECT
        COALESCE(
            SUM(
                GREATEST(
                    CASE

                        WHEN l.return_date IS NOT NULL
                             AND l.return_date > l.due_date
                        THEN (l.return_date - l.due_date)


                        WHEN l.return_date IS NULL
                             AND CURRENT_DATE > l.due_date
                        THEN (CURRENT_DATE - l.due_date)


                        ELSE 0
                    END,
                0)
                * 5000
            )
        , 0)
    INTO v_total_debt
    FROM loans l
    WHERE l.member_id = p_member_id;


    IF v_total_debt < 10000 THEN

        UPDATE members
        SET
            membership_status = TRUE,
            join_date = CURRENT_DATE
        WHERE member_id = p_member_id;


        RAISE NOTICE 'Member with ID % has been renewed for one year.', p_member_id;
    ELSE

        RAISE NOTICE 'Renewal not possible; total unpaid fines: % Toman', v_total_debt;
    END IF;
END;
$$;

