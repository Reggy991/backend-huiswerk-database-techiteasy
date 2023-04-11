DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS television;
DROP TABLE IF EXISTS remote_controller;
DROP TABLE IF EXISTS ci_module;
DROP TABLE IF EXISTS wall_bracket;

CREATE TABLE users
(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE remote_controller
(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INTEGER,
	sold INTEGER,
	compatible_with TEXT,
	battery_type TEXT
);

CREATE TABLE ci_module
(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INTEGER,
	sold INTEGER
);

CREATE TABLE wall_bracket
(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INTEGER,
	sold INTEGER,
	adjustable BOOLEAN
);

CREATE TABLE television
(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
	type TEXT NOT NULL,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INTEGER,
	sold INTEGER,
	available DOUBLE PRECISION,
	refresh_rate DOUBLE PRECISION,
	screen_type TEXT,
	remote_id INT,
	cimodule_id INT,
	wallbracket_id INT,
	FOREIGN KEY (remote_id) REFERENCES remote_controller(id),
	FOREIGN KEY (cimodule_id) REFERENCES ci_module(id),
	FOREIGN KEY (wallbracket_id) REFERENCES wall_bracket(id)
);

INSERT INTO users (username, password)
VALUES 	('user01', 'passwordtest'),
		('user02', 'passwordtest');
		
INSERT INTO remote_controller (name, brand, price, compatible_with)
VALUES	('controller 01', 'Samsung', 25.99, 'Samsung'),
		('controller 02', 'Philips', 27, 'universal'),
		('controller 03', 'LG', 18, 'LG');
		
INSERT INTO ci_module (name, brand, price)
VALUES	('CI module 01', 'Philips', 35),
		('CI module 02', 'Sony', 40.95),
		('CI module 03', 'Samsung', 50);
		
INSERT INTO wall_bracket (name, brand, price)
VALUES	('Wall bracket 01', 'LG', 70),
		('Wall bracket 02', 'Philips', 59.99),
		('Wall bracket 03', 'Sony', 48);
		
INSERT INTO television (name, type, brand, price, screen_type, remote_id, cimodule_id, wallbracket_id)
VALUES	('Television 01', '4K smart TV', 'Samsung', 800.99, 'LED', (select id from remote_controller where brand = 'Samsung'), 3, 1),
		('Television 02', '4K smart TV', 'Philips', 999.99, 'LED', 2, 1, 2),
		('Television 03', '4K smart TV', 'Sony', 599.99, 'LED', 2, 2, 3);
		
SELECT name, brand, price, compatible_with from remote_controller;
SELECT name, brand, price from wall_bracket;
SELECT name, brand, price from ci_module;
SELECT name, type, brand, price, screen_type, remote_id, cimodule_id, wallbracket_id from television;

