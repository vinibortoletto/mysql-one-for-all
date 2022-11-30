SELECT 
	COUNT(DISTINCT song.name) AS cancoes,
    COUNT(DISTINCT artist.name) AS artistas,
    COUNT(DISTINCT album.name) as albuns
FROM  SpotifyClone.song AS song
INNER JOIN SpotifyClone.artist AS artist
ON song.artist_id = artist.id
INNER JOIN SpotifyClone.album AS album
ON song.album_id = album.id;
