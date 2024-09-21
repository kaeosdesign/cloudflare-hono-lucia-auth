-- Migration number: 0003 	 2024-09-12T16:38:17.220Z
-- Migration number: 0001 	 2024-04-21T14:27:57.009Z

CREATE TABLE IF NOT EXISTS users 
(
    id    TEXT NOT NULL PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    hashed_password TEXT,
    email_verified BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS sessions 
(
    id         TEXT    NOT NULL PRIMARY KEY,
    expires_at INTEGER NOT NULL,
    user_id    TEXT    NOT NULL
);

CREATE TABLE IF NOT EXISTS email_verification_codes 
(
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT,
    user_id TEXT UNIQUE,
    code TEXT,
    expires_at TEXT
);




PRAGMA table_info(users);
INSERT INTO users (email_verified) 
SELECT FALSE 
WHERE NOT EXISTS (SELECT 1 FROM pragma_table_info('users') WHERE name='email_verified');
