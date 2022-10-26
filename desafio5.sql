SELECT c.nome AS cancao, COUNT(c.nome) AS reproducoes FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS h ON c.id = h.historico_cancoes_id
GROUP BY c.nome HAVING COUNT(c.nome) = 3
ORDER BY c.nome ASC;
