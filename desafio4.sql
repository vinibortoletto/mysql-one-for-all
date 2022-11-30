SELECT
	DISTINCT u.name AS usuario,
    IF (
		MAX(YEAR(lh.listening_date) >= 2021),
        'Usuário ativo', 
        'Usuário inativo'
	) AS status_usuario
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.listening_history AS lh
ON lh.user_id = u.id
GROUP BY u.name
ORDER BY u.name;
