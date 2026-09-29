-- Query -> Catálogo mais assistido (Ranking de Conteúdos por tempo assistido)
SELECT
ct.content_id,
ct.title,
ct.content_type,
ct.genre,
COUNT(wh.history_id) AS total_views,
SUM(wh.watched_minutes) AS total_minutes_watched
FROM contents ct
INNER JOIN watch_history wh ON ct.content_id = wh.content_id
GROUP BY ct.content_id, ct.title, ct.content_type, ct.genre
ORDER BY total_minutes_watched DESC;

-- Query -> Distribuição de usuários e receita mensal por plano
SELECT
p.plan_name,
p.monthly_price,
COUNT(u.user_id) AS total_subscribers,
SUM(p.monthly_price) AS monthly_recurring_revenue
FROM plans p
LEFT JOIN users u ON p.plan_id = u.plan_id
GROUP BY p.plan_id, p.plan_name, p.monthly_price
ORDER BY monthly_recurring_revenue DESC;
