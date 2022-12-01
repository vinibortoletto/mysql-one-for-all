SELECT 
    s.name AS nome, COUNT(lh.song_id) AS reproducoes
FROM
    SpotifyClone.song AS s
        INNER JOIN
    SpotifyClone.listening_history AS lh ON lh.song_id = s.id
        INNER JOIN
    SpotifyClone.user AS u ON u.id = lh.user_id
        INNER JOIN
    SpotifyClone.plan AS p ON p.id = u.plan_id
WHERE
    p.name IN ('Gratuito' , 'Pessoal')
GROUP BY nome
ORDER BY nome;
