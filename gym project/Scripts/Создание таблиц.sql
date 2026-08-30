
PRAGMA foreign_keys = ON;


CREATE TABLE IF NOT EXISTS status_types (
    status_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS movement_types (
    movement_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS membership_types (
    membership_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    visit_limit INTEGER,
    duration INTEGER
);

CREATE TABLE IF NOT EXISTS clients (
    client_id INTEGER PRIMARY KEY AUTOINCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    middle_name TEXT,
    phone TEXT,
    email TEXT,
    qr_code TEXT
);



CREATE TABLE IF NOT EXISTS membership_prices (
    price_id INTEGER PRIMARY KEY AUTOINCREMENT,
    price_change_date TEXT NOT NULL,
    membership_type_id INTEGER NOT NULL,
    price REAL NOT NULL,
    FOREIGN KEY (membership_type_id) REFERENCES membership_types(membership_type_id)
);

CREATE TABLE IF NOT EXISTS memberships (
    membership_id INTEGER NOT NULL,
    issue_date TEXT NOT NULL,
    client_id INTEGER NOT NULL,
    membership_type_id INTEGER NOT NULL,
    PRIMARY KEY (membership_id, issue_date, client_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (membership_type_id) REFERENCES membership_types(membership_type_id)
);


CREATE TABLE IF NOT EXISTS membership_statuses (
    status_id INTEGER NOT NULL,
    membership_id INTEGER NOT NULL,
    issue_date TEXT NOT NULL,
    membership_type_id INTEGER NOT NULL,
    status_change_date TEXT NOT NULL,
    status_type_id INTEGER NOT NULL,
    PRIMARY KEY (status_id, membership_id, issue_date, membership_type_id),
    FOREIGN KEY (membership_id, issue_date, membership_type_id) REFERENCES memberships(membership_id, issue_date, membership_type_id),
    FOREIGN KEY (status_type_id) REFERENCES status_types(status_type_id)
);

CREATE TABLE IF NOT EXISTS visits (
    visit_id INTEGER NOT NULL,
    visit_date TEXT NOT NULL,
    movement_type_id INTEGER NOT NULL,
    membership_id INTEGER NOT NULL,
    issue_date TEXT NOT NULL,
    membership_type_id INTEGER NOT NULL,
    PRIMARY KEY (visit_id, membership_id, issue_date, membership_type_id),
    FOREIGN KEY (movement_type_id) REFERENCES movement_types(movement_type_id),
    FOREIGN KEY (membership_id, issue_date, membership_type_id) REFERENCES memberships(membership_id, issue_date, membership_type_id)
);