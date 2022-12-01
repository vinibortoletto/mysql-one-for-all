SELECT 
	a.name AS artista,
    al.name AS album,
    COUNT(fa.artist_id) AS seguidores
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.album AS al
ON al.artist_id = a.id
INNER JOIN SpotifyClone.followed_artist AS fa
ON fa.artist_id = a.id
GROUP BY al.id
ORDER BY seguidores DESC, a.name, al.name;
