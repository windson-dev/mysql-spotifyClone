SELECT COUNT(u.nome) AS quantidade_musicas_no_historico FROM SpotifyClone.usuario AS u
	INNER JOIN
		SpotifyClone.historico_de_reproducoes AS h ON h.historico_usuarios_id = u.id
WHERE nome = 'Barbara Liskov';
