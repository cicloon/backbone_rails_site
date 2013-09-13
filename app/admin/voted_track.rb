ActiveAdmin.register VotedTrack do

  index do
    column :track_name
    column :album_name
    column :artist_name
    column :num_votes
    default_actions                   
  end

end