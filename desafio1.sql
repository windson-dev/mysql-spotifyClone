DROP DATABASE IF EXISTS SpotifyClone;
  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      id INT PRIMARY KEY AUTO_INCREMENT,
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
      nome VARCHAR(100) NOT NULL,
      album_cancoes INT NOT NULL,
      FOREIGN KEY (album_cancoes) REFERENCES album (id)
  ) engine = InnoDB;


    CREATE TABLE SpotifyClone.historico_de_reproducoes(
      data_de_reproducoes TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
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


  	INSERT INTO SpotifyClone.plano (nome)
  VALUES
	  ('gratuito'),
    ('familiar'),
    ('universitário'),
    ('pessoal');

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



      INSERT INTO SpotifyClone.cancoes(nome, album_cancoes)
    VALUES
    ('BREAK MY SOUL', 1),
    ('VIRGO’S GROOVE', 1),
    ("ALIEN SUPERSTAR", 1),
    ("Don’t Stop Me Now", 1),
    ("Under Pressure", 1),
	  ("Como Nossos Pais", 1),
    ("O Medo de Amar é o Medo de Ser Livre", 1),
    ("Samba em Paris", 1),
    ("The Bard’s Song", 1),
    ("Feeling Good", 1);

	INSERT INTO SpotifyClone.historico_de_reproducoes(historico_cancoes_id, historico_usuarios_id)
    VALUES
    (3, 3),
    (4, 3),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (9, 3),
    (10, 3),
    (10, 4),
    (1, 2),
    (3, 5),
    (1, 6),
    (2, 2),
    (10, 2),
    (5, 2),
    (2, 3);

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