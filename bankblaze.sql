CREATE TABLE retail
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE corporate
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE teller
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE premium
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE employee
(
    id       BIGINT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50),
    email    VARCHAR(50),
    password VARCHAR(100),
    role     VARCHAR(10)
);

CREATE TABLE permission
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT,
    employee_id   BIGINT,
    for_retail    BOOLEAN DEFAULT false,
    for_corporate BOOLEAN DEFAULT false,
    for_teller    BOOLEAN DEFAULT false,
    for_premium   BOOLEAN DEFAULT false,
    FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE queue_number
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(40),
    number       INT,
    to_retail    BOOLEAN,
    to_corporate BOOLEAN,
    to_teller    BOOLEAN,
    to_premium   BOOLEAN,
    active       BOOLEAN DEFAULT true
);

CREATE TABLE desk
(
    id              BIGINT PRIMARY KEY,
    employee_id     BIGINT,
    queue_number_id BIGINT,
    FOREIGN KEY (employee_id) REFERENCES employee (id),
    FOREIGN KEY (queue_number_id) REFERENCES queue_number (id)
);

INSERT INTO retail (id, name)
VALUES (1, N'Számlaügyintézés'),
       (2, N'Hitelek'),
       (3, N'Megtakarítások'),
       (4, N'Elektronikus Szolgáltatások');

INSERT INTO corporate (id, name)
VALUES (1, N'Számlaügyintézés'),
       (2, N'Hitelek'),
       (3, N'Megtakarítások'),
       (4, N'Elektronikus Szolgáltatások');

INSERT INTO teller (id, name)
VALUES (1, N'Pénztár befizetés'),
       (2, N'Pénztár kifizetés'),
       (3, N'Valutaváltás');

INSERT INTO employee (name, email, role, password)
VALUES (N'Admin Gábor', 'gabor.admin@bankblaze.hu', 'ADMIN',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi'),
       (N'Intéző Teréz', 'terez.intezo@bankblaze.hu', 'USER',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi'),
       (N'Kezelő Dénes', 'denes.kezelo@bankblaze.hu', 'USER',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi'),
       (N'Pénztáros Ilona', 'ilona.penztaros@bankblaze.hu', 'USER',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi'),
       (N'Számoló Mihály', 'mihaly.szamolo@bankblaze.hu', 'USER',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi'),
       (N'Iktató Piroska', 'piroska.iktato@bankblaze.hu', 'USER',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi'),
       (N'Fogalmazó Bertalan', 'bertalan.fogalmazo@bankblaze.hu', 'USER',
        '$2a$10$rSKmsqiEwtWtPLiqNdYCv.qEFNgpsisrnOdVOFi3T79Ib4wp0BdLi');

INSERT INTO permission (employee_id, for_retail, for_corporate, for_teller, for_premium)
VALUES (2, true, false, false, false),
       (3, true, true, false, false),
       (4, false, false, true, false),
       (5, false, true, false, false),
       (6, true, false, true, false),
       (7, false, false, false, true);

INSERT INTO queue_number (name, number, to_retail, to_corporate, to_teller, to_premium, active)
VALUES (N'András', 1101, true, false, false, false, true),
       (N'Andris', 2101, false, true, false, false, true),
       (N'Lili', 1102, true, false, false, false, true),
       (N'Lia', 3301, false, false, true, false, true),
       (N'Marika', 2201, false, true, false, false, true),
       (N'Ildikó', 9001, false, false, false, true, true),
       (N'Ági', 3201, false, false, true, false, true),
       (N'Krisz', 2401, false, true, false, false, true),
       (N'Krisztián', 2301, false, true, false, false, true),
       (N'Reni', 1301, true, false, false, false, true),
       (N'Tomi', 1401, true, false, false, false, true),
       (N'Márk', 9002, false, false, false, true, true),
       (N'Matyi', 2302, false, true, false, false, true),
       (N'Gábor', 2202, false, true, false, false, true),
       (N'Geree', 3101, false, false, true, false, true);

INSERT INTO desk (id, employee_id, queue_number_id)
VALUES (1, 2, 1),
       (2, 3, 2),
       (3, 4, 4),
       (4, 5, 5),
       (5, 6, 3),
       (6, 7, 6);