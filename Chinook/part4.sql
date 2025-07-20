SELECT s.PlaylistId,
       s.Name,
       string_agg(s.genre_artist, ':' ORDER BY s.genre_artist) AS genre_artist_combinations
       FROM (SELECT p.PlayListId,
                    p.Name,
                    CONCAT(g.Name, ' by ', ar.Name) AS genre_artist
                    FROM Playlist p JOIN PlaylistTrack pt ON p.PlayListId = pt.PlayListId JOIN Track t ON pt.TrackId = t.TrackId JOIN Album a ON t.AlbumId = a.AlbumId JOIN Artist ar ON a.ArtistId = ar.ArtistId
                    JOIN Genre g ON t.GenreId = g.GenreId
                    WHERE p.PlaylistId IN (SELECT p2.PlayListId
                                                  FROM Playlist p2 JOIN PlaylistTrack pt2 ON p2.PlayListId = pt2.PlayListId JOIN Track t2 ON pt2.TrackId = t2.TrackId JOIN Album a2 ON t2.AlbumId = a2.AlbumId JOIN Artist ar2 ON a2.ArtistId = ar2.ArtistId
                                                  JOIN Genre g2 ON t2.GenreId = g2.GenreId
                                                  GROUP BY p2.PlayListId
                                                  HAVING COUNT(DISTINCT g2.GenreId) > 2 AND COUNT(DISTINCT ar2.ArtistId) > 2
                                          )
            ) AS s
       GROUP BY s.PlaylistId, s.Name
       ORDER BY (SELECT COUNT(DISTINCT g3.GenreId)
                        FROM Playlist p3 JOIN PlayListTrack pt3 ON p3.PlayListId = pt3.PlayListId JOIN Track t3 ON pt3.TrackId = t3.TrackId JOIN Album a3 ON t3.AlbumId = a3.AlbumId JOIN Artist ar3 ON a3.ArtistId = ar3.ArtistId
                        JOIN Genre g3 ON t3.GenreId = g3.GenreId
                        WHERE p3.PlayListId = s.PlayListId
                ) DESC;