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
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
end
