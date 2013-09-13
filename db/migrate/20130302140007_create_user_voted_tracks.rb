class CreateUserVotedTracks < ActiveRecord::Migration
  def change
    create_table :user_voted_tracks do |t|
      t.references :user
      t.references :voted_track

      t.timestamps
    end
    add_index :user_voted_tracks, :user_id
    add_index :user_voted_tracks, :voted_track_id
  end
end
