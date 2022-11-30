SELECT 
	  COUNT(DISTINCT s.name) AS cancoes,
    COUNT(DISTINCT a.name) AS artistas,
    COUNT(DISTINCT al.name) as albuns
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.artist AS a
ON s.artist_id = a.id
INNER JOIN SpotifyClone.album AS al
ON s.album_id = al.id;
