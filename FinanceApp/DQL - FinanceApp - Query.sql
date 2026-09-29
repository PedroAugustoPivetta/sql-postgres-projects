-- Query -> Balanço financeiro do usuário (Entradas vs Saídas)
SELECT
u.full_name AS user_name,
ba.financial_institution,
ba.account_type,
SUM(CASE WHEN fc.category_type = 'Income' THEN t.amount ELSE 0 END) AS total_income,
SUM(CASE WHEN fc.category_type = 'Expense' THEN t.amount ELSE 0 END) AS total_expense
FROM finance_users u
INNER JOIN bank_accounts ba ON u.user_id = ba.user_id
INNER JOIN transactions t ON ba.account_id = t.account_id
INNER JOIN financial_categories fc ON t.category_id = fc.category_id
GROUP BY u.user_id, u.full_name, ba.financial_institution, ba.account_type;

-- Query -> Gastos por categoria para controle orçamentário
SELECT
fc.category_name,
COUNT(t.transaction_id) AS total_transactions,
SUM(t.amount) AS total_spent
FROM transactions t
INNER JOIN financial_categories fc ON t.category_id = fc.category_id
WHERE fc.category_type = 'Expense'
GROUP BY fc.category_id, fc.category_name
ORDER BY total_spent DESC;