DROP DATABASE address_book;
CREATE DATABASE address_book;

CREATE TABLE contacts
(
  first VARCHAR(25),
  last  VARCHAR(25),
  age INT,
  gender CHAR(1),
  dtgd  BOOLEAN,
  phone VARCHAR(12),
  name VARCHAR(25),
  email VARCHAR(25)
);


INSERT INTO contacts
(first, last, age, gender, dtgd, phone, email)
VALUES ('Tricia', 'Douglas', 27, 'f', false, '202.321.5393', 'tdouglas@seamlessTL.com');

INSERT INTO contacts
(first, last, age, gender, dtgd, phone, email)
VALUES ('David', 'McCann', 2, 'm', false, 'n_a', 'n_a');
