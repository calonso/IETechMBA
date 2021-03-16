USE Uber;

drop table if exists trips;
drop table if exists shifts;
drop table if exists clients;
drop table if exists drivers;
drop table if exists cars;


CREATE TABLE IF NOT EXISTS drivers (
    id INT NOT NULL AUTO_INCREMENT,
    phone_number VARCHAR(256) NOT NULL,
    name VARCHAR(256) NOT NULL,
    gender VARCHAR(256),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cars (
    id INT NOT NULL AUTO_INCREMENT,
    frame_number VARCHAR(256) NOT NULL,
    brand VARCHAR(256) NOT NULL,
    model VARCHAR(256) NOT NULL,
    color VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS shifts (
    id INT NOT NULL AUTO_INCREMENT,
    driver_id INT NOT NULL,
    car_id INT NOT NULL,
    shift_start TIMESTAMP NOT NULL,
    shift_end TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (driver_id) REFERENCES drivers(id),
    FOREIGN KEY (car_id) REFERENCES cars(id)
);

CREATE TABLE IF NOT EXISTS clients (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL,
    password VARCHAR(256) NOT NULL,
    gender VARCHAR(256),
    phone_number VARCHAR(256) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS trips (
    id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    shift_id INT NOT NULL,
    pick_up VARCHAR(256),
    drop_off VARCHAR(256),
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (shift_id) REFERENCES shifts(id)
);

INSERT INTO drivers VALUES
(1, '+34111111111', 'Jane Doe', 'Female'),
(2, '+44111111111', 'John Doe', 'Male');

INSERT INTO cars VALUES
(1, 'VCFERRT8I4I87FDT', 'Ford', 'Mustang', 'Red'),
(2, 'XXDR09OIK87GHTDR', 'Audi', 'A4', 'Black');

INSERT INTO shifts VALUES
(1, 1, 2, '2021-01-01 00:00:01', '2021-01-01 08:10:01'),
(2, 1, 1, '2021-01-02 00:00:01', '2021-01-02 08:10:01'),
(3, 2, 2, '2021-01-01 08:10:01', '2021-01-01 16:10:01');

INSERT INTO clients VALUES
(1, 'Jane Doe Client', 'jane.doe@example.com', 'P4ssw0rd', 'Female', '+34555555555'),
(2, 'John Doe Client', 'john.doe@example.com', 'P4ssw0rd', 'Male', '+44555555555');

INSERT INTO trips VALUES
(1, 1, 1, '-40.9984,1.9003', '-40.99847,1.09847'),
(2, 2, 1, '-40.0994,1.0003', '-40.99847,1.09847'),
(3, 1, 1, '-40.9984,1.9003', '-40.99847,1.09847'),
(4, 2, 2, '-40.0994,1.0003', '-40.99847,1.09847');
