create database `blog1`;
use `blog1`;
CREATE TABLE `users` ( 
    `id_user` INT (10) AUTO_INCREMENT, 
    `name` VARCHAR(20) NOT NULL, 
    `email` VARCHAR(50) NOT NULL, 
    `password` VARCHAR(15) NOT NULL, 
    PRIMARY KEY (id_user) 
);
CREATE TABLE `posts` ( 
    `id_post` INT (10) AUTO_INCREMENT,
    `id_user` INT (10),
    `theme` VARCHAR(40) NOT NULL,
    `p_date` TIMESTAMP,
	`p_text` TEXT,
    PRIMARY KEY (id_post) 
);
CREATE TABLE `comments`(
	`id_comment` INT(10) AUTO_INCREMENT ,
	`id_post` INT(10) ,
	`c_text` VARCHAR(40) NOT NULL ,
	`c_date` TIMESTAMP,
	PRIMARY KEY (id_comment)
);
CREATE TABLE `post_pics`(
	`id_pic` INT(10) AUTO_INCREMENT,
	`id_post` INT(10) ,
	`pic_description` VARCHAR(40) NOT NULL,
	`pic_path` VARCHAR(200) NOT NULL,
	PRIMARY KEY (id_pic)
);

INSERT INTO
    `users` (`name`, `email`,`password`)
VALUES
    ('Кate', 'kate@mail.ru','gdjdjsbxh'),
    ('Helen', 'helena89@mail.ru','35geub78wbn2'),
    ('Mixa', 'mixxa@gmail.com','vbdj37ehi');
	
INSERT INTO
    `posts` (`id_user`, `theme`, `p_text`,`p_date`)
VALUES
    (2, 'Cats and Dogs','dhdhbbdh dhddjsbdh dhddj', now()),
    (2, 'Sea animals','fvhe dhj jkfld ', now()),
	(3, 'Beauty fasion today','Vjjk fddfgg hhjjj', now());

INSERT INTO
    `comments` (`id_post`, `c_text`,`c_date`)
VALUES
    (1, 'cool!', now()),
    (2, 'I totally agree with author', now()),
	(2, 'Very impressive', now());
	
INSERT INTO
    `post_pics` (`id_post`, `pic_description`,`pic_path`)
VALUES
    (1, 'foto 1', '/somepath/pic1.jpg'),
	(3, 'Me and my friends', '/somepath/newdir/pic2.png');