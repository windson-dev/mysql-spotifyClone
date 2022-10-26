SELECT u.nome AS usuario, COUNT(h.historico_usuarios_id) AS qt_de_musicas_ouvidas, 
ROUND(SUM(c.duracao_segundos) / 60,2) AS total_minutos 

FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS h ON u.id = h.historico_usuarios_id
INNER JOIN SpotifyClone.cancoes AS c ON c.id = h.historico_cancoes_id
GROUP BY u.nome ORDER BY u.nome ASC;

