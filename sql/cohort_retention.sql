-- Cohort Retention Analysis

WITH cohort_size AS (
    SELECT
        signup_date AS cohort,
        COUNT(*) AS total_users
    FROM users
    GROUP BY signup_date
),
activity AS (
    SELECT
        e.user_id,
        DATE(u.signup_date) AS cohort,
        CAST(
            (julianday(DATE(e.event_time)) - julianday(DATE(u.signup_date))) / 7
            AS INT
        ) AS week_number
    FROM events e
    JOIN users u
        ON e.user_id = u.user_id
    WHERE e.event_name != 'signup'
)
SELECT
    a.cohort,
    a.week_number,
    COUNT(DISTINCT a.user_id) * 1.0 / c.total_users AS retention_rate
FROM activity a
JOIN cohort_size c
    ON a.cohort = c.cohort
GROUP BY a.cohort, a.week_number
ORDER BY a.cohort, a.week_number;
