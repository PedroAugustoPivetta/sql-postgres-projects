CREATE TABLE finance_users (
    user_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bank_accounts (
    account_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT NOT NULL,
    financial_institution VARCHAR(50) NOT NULL,
    account_type VARCHAR(30) NOT NULL, -- e.g., 'Checking', 'Savings'
    current_balance DECIMAL(12, 2) DEFAULT 0.00,
    CONSTRAINT fk_bank_accounts_users FOREIGN KEY (user_id) REFERENCES finance_users(user_id)
);

CREATE TABLE credit_cards (
    card_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT NOT NULL,
    card_name VARCHAR(50) NOT NULL,
    credit_limit DECIMAL(10, 2) NOT NULL,
    closing_day INT NOT NULL,
    CONSTRAINT fk_credit_cards_users FOREIGN KEY (user_id) REFERENCES finance_users(user_id)
);


CREATE TABLE financial_categories (
    category_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    category_type VARCHAR(10) NOT NULL -- 'Income' or 'Expense'
);


CREATE TABLE transactions (
    transaction_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    account_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    description VARCHAR(150),
    CONSTRAINT fk_transactions_accounts FOREIGN KEY (account_id) REFERENCES bank_accounts(account_id),
    CONSTRAINT fk_transactions_categories FOREIGN KEY (category_id) REFERENCES financial_categories(category_id)
);