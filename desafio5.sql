SELECT
	s.name AS cancao,
    COUNT(lh.song_id) AS reproducoes
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.listening_history AS lh
ON lh.song_id = s.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
