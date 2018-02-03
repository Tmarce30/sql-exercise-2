require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  db.execute("SELECT t.name, al.title, ar.name
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    JOIN artists ar ON ar.id = al.artist_id")
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  stats = db.execute("
    SELECT g.name, COUNT(*), ROUND(AVG(t.milliseconds)/ 60000, 2)
    FROM tracks t
    JOIN genres g ON g.id = t.genre_id
    WHERE g.name = '#{genre_name}'
    ").flatten

  return {
    category: stats[0],
    number_of_songs: stats[1],
    avg_length: stats[2]
  }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  db.execute("
    SELECT ar.name, COUNT(t.name) AS tracks_number
    FROM tracks t
    JOIN artists ar ON ar.id = al.artist_id
    JOIN albums al ON al.id = t.album_id
    JOIN genres g ON g.id = t.genre_id
    WHERE g.name = '#{genre_name}'
    GROUP BY ar.name
    ORDER BY tracks_number DESC
    LIMIT 5
  ")
end
