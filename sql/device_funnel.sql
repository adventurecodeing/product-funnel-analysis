-- Device-level Funnel Analysis

WITH funnel_events AS (
    SELECT
        e.user_id,
        u.device,
        e.event_name,
        e.event_time,
        ROW_NUMBER() OVER (
            PARTITION BY e.user_id, e.event_name
            ORDER BY e.event_time
        ) AS rn
    FROM events e
    JOIN users u
        ON e.user_id = u.user_id
    WHERE e.event_name IN ('signup','login','feature_use','purchase')
),
funnel_steps AS (
    SELECT
        user_id,
        device,
        MAX(CASE WHEN event_name = 'signup' THEN event_time END) AS signup_time,
        MAX(CASE WHEN event_name = 'login' THEN event_time END) AS login_time,
        MAX(CASE WHEN event_name = 'feature_use' THEN event_time END) AS feature_time,
        MAX(CASE WHEN event_name = 'purchase' THEN event_time END) AS purchase_time
    FROM funnel_events
    WHERE rn = 1
    GROUP BY user_id, device
)
SELECT
    device,
    COUNT(*) AS signup_users,
    COUNT(CASE WHEN login_time > signup_time THEN 1 END) AS login_users,
    COUNT(CASE WHEN feature_time > login_time THEN 1 END) AS feature_users,
    COUNT(CASE WHEN purchase_time > feature_time THEN 1 END) AS purchase_users
FROM funnel_steps
GROUP BY device;
