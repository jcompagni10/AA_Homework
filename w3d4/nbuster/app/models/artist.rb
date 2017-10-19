class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    Artist.select('*').joins(:albums).joins('left join tracks on albums.id = tracks.album_id').where('artists.id = ?', self.id).count
    # Artist.select('count(name)').joins(:albums).joins('JOIN tracks ON albums.id = tracks.album_id').where('artists.id = ?', self.id)
  end
end
