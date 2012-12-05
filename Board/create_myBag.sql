CREATE DATABASE web2012 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web2012.* TO 'web' IDENTIFIED BY 'asdf';

use web2012;

CREATE TABLE bags(
	num INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(30),
  img_id VARCHAR(100),
  img_name VARCHAR(40)
);

INSERT INTO bags VALUES (1, 'feel9', 'img/contents_bg.jpg','sample1');
INSERT INTO bags VALUES (2, 'feel9', 'img/contents_bg.jpg','sample2');
INSERT INTO bags VALUES (3, 'feel9', 'img/contents_bg.jpg','sample3');
INSERT INTO bags VALUES (4, 'feel9', 'img/contents_bg.jpg','sample4');
INSERT INTO bags VALUES (5, 'feel9', 'img/contents_bg.jpg','sample5');
INSERT INTO bags VALUES (6, 'feel9z', 'img/contents_bg.jpg','sample6');