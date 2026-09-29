INSERT INTO plans (plan_name, monthly_price, max_resolution) VALUES
('Basic', 9.99, '720p'),
('Standard', 14.99, '1080p'),
('Premium', 19.99, '4K Ultra');

INSERT INTO users (plan_id, full_name, email, subscription_date) VALUES
(1, 'Michael Scott', 'michael.scott@dunder.com', '2025-06-01'),
(2, 'Pam Beesly', 'pam.beesly@dunder.com', '2025-08-15'),
(1, 'Jim Halpert', 'jim.halpert@dunder.com', '2025-09-10');

INSERT INTO profiles (user_id, profile_name, is_kids) VALUES
(1, 'Michael Main', FALSE),
(1, 'Michael Kids', TRUE),
(1, 'Temp Profile', FALSE),
(2, 'Pam', FALSE),
(3, 'Jim', FALSE);

INSERT INTO contents (title, content_type, genre, release_year, duration_minutes) VALUES
('Inception', 'Movie', 'Sci-Fi', 2010, 148),
('Stranger Things', 'TV Show', 'Sci-Fi/Horror', 2016, 50),
('The Matrix', 'Movie', 'Action', 1999, 136),
('Toy Story', 'Movie', 'Animation', 1995, 81);

INSERT INTO watch_history (profile_id, content_id, watched_at, watched_minutes) VALUES
(1, 1, '2026-03-01 20:00:00', 148),
(1, 2, '2026-03-02 21:30:00', 50),
(4, 4, '2026-03-03 15:10:00', 81),
(5, 3, '2026-03-04 19:45:00', 136);

UPDATE users
SET plan_id = 3
WHERE email = 'michael.scott@dunder.com';

UPDATE contents
SET duration_minutes = 136
WHERE title = 'The Matrix';

DELETE FROM profiles
WHERE profile_name = 'Temp Profile';

DELETE FROM watch_history
WHERE watched_minutes < 5;