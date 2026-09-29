INSERT INTO finance_users (full_name, email) VALUES
('Arthur Dent', 'arthur.dent@galaxy.com'),
('Ford Prefect', 'ford.prefect@galaxy.com');

INSERT INTO bank_accounts (user_id, financial_institution, account_type, current_balance) VALUES
(1, 'Chase Bank', 'Checking', 3500.50),
(1, 'Vanguard', 'Savings', 12000.00),
(2, 'Bank of America', 'Checking', 850.25);

INSERT INTO credit_cards (user_id, card_name, credit_limit, closing_day) VALUES
(1, 'Sapphire Reserve', 10000.00, 15),
(2, 'Unlimited Cashback', 3000.00, 20);

INSERT INTO financial_categories (category_name, category_type) VALUES
('Salary', 'Income'),
('Freelance', 'Income'),
('Groceries', 'Expense'),
('Utilities', 'Expense'),
('Entertainment', 'Expense');

INSERT INTO transactions (account_id, category_id, amount, transaction_date, description) VALUES
(1, 1, 4500.00, '2026-03-01', 'Monthly Salary Deposit'),
(1, 3, 125.40, '2026-03-02', 'Supermarket Purchase'),
(1, 4, 85.00, '2026-03-03', 'Electricity Bill'),
(1, 5, 50.00, '2026-03-04', 'Duplicate Transaction Test'),
(3, 5, 29.99, '2026-03-04', 'Movie Tickets');

UPDATE bank_accounts
SET current_balance = current_balance - 125.40
WHERE account_id = 1;

UPDATE credit_cards
SET credit_limit = 12000.00
WHERE card_name = 'Sapphire Reserve';

DELETE FROM transactions
WHERE transaction_id = 4 AND description LIKE '%Duplicate%';