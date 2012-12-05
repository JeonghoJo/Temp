CREATE DATABASE web2012 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web2012.* TO 'web' IDENTIFIED BY 'asdf';

use web2012;

CREATE TABLE information(	
	id INT AUTO_INCREMENT PRIMARY KEY,  
	destination VARCHAR(40) NOT NULL,	
	line INT NOT NULL,  
	station VARCHAR(30) NOT NULL,  
	distance INT NOT NULL,  
	category  VARCHAR(30) NOT NULL,  
	discription TEXT NOT NULL,  
	picture  VARCHAR(100) not null,  
	homepage varchar(100) not null,  
	recommend int not null
);

insert into information values
(1,'asdf',3,'asdf',3,'asdf','asdf','img/articles/article1.jpg','http://naver.com/',0);