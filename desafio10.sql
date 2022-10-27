    SELECT c.nome, COUNT(h.historico_usuarios_id) AS reproducoes 
    FROM SpotifyClone.cancoes AS c 
    INNER JOIN 
    SpotifyClone.historico_de_reproducoes AS h ON c.id = h.historico_cancoes_id
    INNER JOIN 
    SpotifyClone.usuario AS u ON u.id = h.historico_usuarios_id
    INNER JOIN 
    SpotifyClone.plano AS p ON p.id = u.plano_usuario
    WHERE p.nome = 'gratuito' OR p.nome = 'pessoal'
    GROUP BY c.nome ORDER BY c.nome ASC;