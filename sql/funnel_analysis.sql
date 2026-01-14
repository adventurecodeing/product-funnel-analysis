-- Funnel Analysis: Signup → Purchase

WITH funnel_events AS (
    SELECT
        user_id,
        event_name,
        event_time,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, event_name
            ORDER BY event_time
        ) AS rn
    FROM events
    WHERE event_name IN ('signup','login','feature_use','purchase')
),
funnel_steps AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_name = 'signup' THEN event_time END) AS signup_time,
        MAX(CASE WHEN event_name = 'login' THEN event_time END) AS login_time,
        MAX(CASE WHEN event_name = 'feature_use' THEN event_time END) AS feature_time,
        MAX(CASE WHEN event_name = 'purchase' THEN event_time END) AS purchase_time
    FROM funnel_events
    WHERE rn = 1
    GROUP BY user_id
)
SELECT
    COUNT(*) AS signup_users,
    COUNT(CASE WHEN login_time > signup_time THEN 1 END) AS login_users,
    COUNT(CASE WHEN feature_time > login_time THEN 1 END) AS feature_users,
    COUNT(CASE WHEN purchase_time > feature_time THEN 1 END) AS purchase_users
FROM funnel_steps;
