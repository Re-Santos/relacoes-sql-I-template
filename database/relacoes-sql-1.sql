-- Active: 1697394376477@@127.0.0.1@3306


-- Práticas
CREATE TABLE 
licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE
drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

SELECT * FROM licenses;
SELECT * FROM  drivers;

INSERT INTO licenses
VALUES ('l001', '11111111', 'B'),
       ('l002', '22222222', 'A'),
       ('l003', '33333333', 'AB');

INSERT INTO drivers
VALUES ('D001', 'Fulano', 'fulano@email.com', '1234','l002'),
       ('D002','Cicrano', 'cicrano@email.com','4567','l001'),
       ('D003','Beltrano', 'beltrano@email.com', '8975', 'l003');

-- SELECT * FROM licenses INNER JOIN drivers; (une as duas tabelas, mas volta os valores repetidos)
SELECT * FROM licenses INNER JOIN drivers ON drivers.license_id = licenses.id;
SELECT drivers.name, licenses.register_number, licenses.category FROM drivers INNER JOIN licenses ON drivers.license_id=licenses.id;

--Prática 2

CREATE TABLE
    users(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    );

CREATE TABLE
    phone(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        phone_number TEXT UNIQUE NOT NULL,
        user_id TEXT NOT NULL, --NÃO PODE SER UNIQUE PQ É 1:M
        FOREIGN KEY (user_id) REFERENCES users(id)
    );

INSERT INTO users
VALUES ('001', 'Fulano', 'fulano@email.com','1234'),
       ('002', 'Cicrano', 'cicrano@email.com','5678');


INSERT INTO phone
VALUES 
    ('p001', '912345678', '002'),
    ('p002', '900002211', '002'),
    ('p003', '911110041', '001');


SELECT * FROM users;
SELECT * FROM phone;

--obs. Antes de criar a tabela, analise todo o contexto que vc precisa, analise a relação 1:M 

SELECT * FROM users INNER JOIN phone ON users.id = phone.users_id;