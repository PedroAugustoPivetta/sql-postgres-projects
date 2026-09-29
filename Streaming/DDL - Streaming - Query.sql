CREATE TABLE plans (
    plan_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    monthly_price DECIMAL(6, 2) NOT NULL,
    max_resolution VARCHAR(10) NOT NULL
);

CREATE TABLE users (
    user_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    plan_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    subscription_date DATE NOT NULL,
    CONSTRAINT fk_users_plans FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE profiles (
    profile_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT NOT NULL,
    profile_name VARCHAR(50) NOT NULL,
    is_kids BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE contents (
    content_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    content_type VARCHAR(20) NOT NULL, -- e.g., 'Movie' or 'TV Show'
    genre VARCHAR(50) NOT NULL,
    release_year INT,
    duration_minutes INT
);

CREATE TABLE watch_history (
    history_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    profile_id INT NOT NULL,
    content_id INT NOT NULL,
    watched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    watched_minutes INT NOT NULL,
    CONSTRAINT fk_watch_history_profiles FOREIGN KEY (profile_id) REFERENCES profiles(profile_id),
    CONSTRAINT fk_watch_history_contents FOREIGN KEY (content_id) REFERENCES contents(content_id)
);