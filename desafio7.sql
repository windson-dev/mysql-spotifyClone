SELECT art.nome AS artista, alb.nome AS album, COUNT(seg.artista_id) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb ON art.id = alb.artista_id
INNER JOIN SpotifyClone.artista_usuario AS seg ON seg.artista_id = art.id
GROUP BY alb.id 
ORDER BY seguidores DESC, art.nome ASC, alb.nome ASC;
