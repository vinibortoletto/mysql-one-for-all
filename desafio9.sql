SELECT 
	COUNT(lh.song_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.listening_history AS lh
INNER JOIN SpotifyClone.user AS u
ON u.id = lh.user_id
WHERE u.name = 'Barbara Liskov';
