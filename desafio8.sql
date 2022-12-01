SELECT 
	a.name AS artista,
    al.name AS album
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.album AS al
ON al.artist_id = a.id
WHERE a.name = 'Elis Regina'
ORDER BY al.name;
