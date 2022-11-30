DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plan(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100) NOT NULL,
      price DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.user(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100) NOT NULL,
      age INT NOT NULL,
      subscription_date DATE NOT NULL,
      plan_id INT,
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(id)
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100) NOT NULL
  ) engine = InnoDB;


CREATE TABLE SpotifyClone.followed_artist(
      user_id INT,
      artist_id INT,
      PRIMARY KEY (user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL,
      release_year INT NOT NULL,
      artist_id INT,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.song(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL,
      length_in_seconds INT NOT NULL,
      artist_id INT,
      album_id INT,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(id),
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.listening_history(
      listening_date DATETIME NOT NULL,
      user_id INT,
      song_id INT,
      PRIMARY KEY (user_id, song_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(id),
      FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(id)
) engine = InnoDB;

INSERT INTO 
	SpotifyClone.plan (name, price)
VALUES
	('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

INSERT INTO 
	SpotifyClone.user (
		name,
		age,
		subscription_date,
		plan_id
    )
VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
	('Ada Lovelace', 37, '2017-12-30', 4), 
    ('Martin Fowler', 46, '2017-01-17', 4), 
    ('Sandi Metz', 58, '2018-04-29', 4),
    ('Paulo Freire', 19, '2018-02-14', 2),
    ('Bell Hooks', 26, '2018-01-05', 2),
    ('Christopher Alexander', 85, '2019-06-05', 3),
    ('Judith Butler', 45, '2020-05-13', 3),
    ('Jorge Amado', 58, '2017-02-17', 3);
    
INSERT INTO
	SpotifyClone.artist(name)
VALUES
	('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO SpotifyClone.followed_artist (
	user_id,
    artist_id
)
VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
    
INSERT INTO SpotifyClone.album(
      name,
      release_year,
      artist_id
)
VALUES 
	('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);
    
INSERT INTO SpotifyClone.song(
      name,
      length_in_seconds,
      artist_id,
      album_id
)
VALUES 
	('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 2, 3),
    ('Como Nossos Pais', 105, 3, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    ('Samba em Paris', 267, 4, 6),
    ('The Bard’s Song', 244, 5, 7),
    ('Feeling Good', 100, 6, 8);
    
INSERT INTO SpotifyClone.listening_history(
      listening_date,
      user_id,
      song_id
)
VALUES 
	('2022-02-28 10:45:55', 1, 8), 
    ('2020-05-02 05:30:35', 1, 2),
    ('2020-03-06 11:22:33', 1, 10),
    ('2022-08-05 08:05:17', 2, 10),
    ('2020-01-02 07:40:33', 2, 7),
    ('2020-11-13 16:55:13', 3, 10), 
    ('2020-12-05 18:38:30', 3, 2),
    ('2021-08-15 17:10:10', 4, 8),
    ('2022-01-09 01:44:33', 5, 8), 
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 6, 7), 
    ('2017-10-12 12:35:20', 6, 1),
    ('2011-12-15 22:30:49', 7,  4),
    ('2012-03-17 14:56:41', 8, 4),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 10, 3);
