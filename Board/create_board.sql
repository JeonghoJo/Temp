CREATE DATABASE web2012 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web2012.* TO 'web' IDENTIFIED BY 'asdf';

use web2012;

CREATE TABLE board(
	num INT AUTO_DECREMENT PRIMARY KEY,
	email VARCHAR(30),
	subject VARCHAR(50) NOT NULL,
	passwd VARCHAR(15) NOT NULL,
	content TEXT NOT NULL,
  date	DATE
);

INSERT INTO board VALUES (1,  'dongseop@gmail.com', 'KOREA', '12345', 'hello world', '2012-11-25');
INSERT INTO board VALUES (2,  'test@gmail.com', 'USA','12345', 'hello world', '2012-11-24');
INSERT INTO board VALUES (3,  'testa@gmail.com', 'USA','12345', 'hello world', '2012-11-22');
INSERT INTO board VALUES (4,  'testb@gmail.com', 'JAPAN','12345', 'hello world', '2012-11-21');
INSERT INTO board VALUES (5,  'testc@gmail.com', 'USA','12345', 'hello world', '2012-11-20');
INSERT INTO board VALUES (6,  'testd@gmail.com', 'KOREA','12345', 'hello world', '2012-11-28');
INSERT INTO board VALUES (7,  'teste@gmail.com', 'USA','12345', 'hello world', '2012-11-18');
INSERT INTO board VALUES (8,  'testf@gmail.com', 'USA','12345', 'hello world', '2012-11-22');
INSERT INTO board VALUES (9,  'testg@gmail.com', 'JAPAN','12345', 'hello world', '2012-11-21');
INSERT INTO board VALUES (10,  'teshc@gmail.com', 'USA','12345', 'hello world', '2012-11-20');
INSERT INTO board VALUES (11,  'tesid@gmail.com', 'KOREA','12345', 'hello world', '2012-11-28');
INSERT INTO board VALUES (12,  'tesje@gmail.com', 'USA','12345', 'hello world', '2012-11-18');