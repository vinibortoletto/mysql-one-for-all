SELECT
	u.name AS usuario,
    COUNT(lh.song_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(s.length_in_seconds / 60), 2) AS total_minutos
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.listening_history AS lh
ON lh.user_id = u.id
INNER JOIN SpotifyClone.song AS s
ON lh.song_id = s.id
GROUP BY u.name
ORDER BY u.name;
	