class CreateVotedTracks < ActiveRecord::Migration
  def change
    create_table :voted_tracks do |t|
      
      t.string  :track_name
      t.string  :track_uri
      t.string  :album_name
      t.string  :artist_name
      t.string  :album_uri
      t.string  :artist_uri

      t.timestamps
    end

    add_index :voted_tracks, :track_uri

  end
end
