DROP DATABASE IF EXISTS SpotifyClone;
  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      id INT PRIMARY KEY AUTO_INCREMENT,
      valor_plano DECIMAL(3, 2),
      nome VARCHAR(45) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      plano_usuario INT NOT NULL,
      FOREIGN KEY (plano_usuario) REFERENCES plano (id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.artista(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL
  ) engine = InnoDB;
  
	CREATE TABLE SpotifyClone.album(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista (id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.cancoes(
      id INT PRIMARY KEY AUTO_INCREMENT,
      duracao_segundos INT NOT NULL,
      nome VARCHAR(100) NOT NULL,
      album_cancoes INT NOT NULL,
      FOREIGN KEY (album_cancoes) REFERENCES album (id)
  ) engine = InnoDB;


    CREATE TABLE SpotifyClone.historico_de_reproducoes(
      data_de_reproducoes DATE NOT NULL,
      historico_cancoes_id INT NOT NULL,
      historico_usuarios_id INT NOT NULL,
      FOREIGN KEY (historico_cancoes_id) REFERENCES cancoes (id),
      FOREIGN KEY (historico_usuarios_id) REFERENCES usuario (id),
      PRIMARY KEY (historico_cancoes_id, historico_usuarios_id)
  ) engine = InnoDB;

	CREATE TABLE SpotifyClone.artista_usuario(
      artista_id INT NOT NULL,
      usuario_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista (id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (id),
      PRIMARY KEY (artista_id, usuario_id)
  ) engine = InnoDB;

  	INSERT INTO SpotifyClone.plano (nome, valor_plano)
  VALUES
	  ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    

    INSERT INTO SpotifyClone.usuario (nome, plano_usuario)
  VALUES
    ('Barbara Liskov', 1),
    ('Robert Cecil Martin', 1),
    ('Ada Lovelace', 2),
    ('Martin Fowler', 2),
    ('Sandi Metz', 2),
    ('Paulo Freire', 3),
    ('Bell Hooks', 3),
    ('Christopher Alexander', 4),
    ('Judith Butler', 4),
    ('Jorge Amado', 4);
    
	INSERT INTO SpotifyClone.artista (nome)
  VALUES
	('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

      INSERT INTO SpotifyClone.album (nome, artista_id)
  VALUES
	('Renaissance', 1),
    ('Jazz', 1),
    ('Hot Space', 2),
    ('Falso Brilhante', 2),
    ('Vento de Maio', 3),
    ('QVVJFA?', 3),
    ('Somewhere Far Beyond', 4),
    ('I Put A Spell On You', 4);

    INSERT INTO SpotifyClone.cancoes(nome, album_cancoes, duracao_segundos)
    VALUES
    ('BREAK MY SOUL', 1, 279),
    ('VIRGO’S GROOVE', 1, 369),
    ("ALIEN SUPERSTAR", 1, 116),
    ("Don’t Stop Me Now", 2, 203),
    ("Under Pressure", 3, 152),
	  ("Como Nossos Pais", 4, 105),
    ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
    ("Samba em Paris", 6, 267),
    ("The Bard’s Song", 7, 244),
    ("Feeling Good", 8, 100);

	INSERT INTO SpotifyClone.historico_de_reproducoes(historico_usuarios_id,
    historico_cancoes_id, data_de_reproducoes)
    VALUES
	  (1,8,'2022-02-28'),
    (1,2,'2020-05-02'),
    (1,10,'2020-03-06'),
    (2,10,'2022-08-05'),
	  (2,7,'2020-01-02'),
    (3,10,'2020-11-13'),
    (3,2,'2020-12-05'),
    (4,8,'2021-08-15'),
    (5,8,'2022-01-09'),
    (5,5,'2020-08-06'),
    (6,7,'2017-01-24'),
    (6,1,'2017-10-12'),
    (7,4,'2011-12-15'),
    (8,4,'2012-03-17'),
    (9,9,'2022-02-24'),
    (10,3,'2015-12-13');
  
    INSERT INTO SpotifyClone.artista_usuario(artista_id, usuario_id)
    VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 6),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 10),
    (6, 5),
    (6, 6),
    (1, 7);