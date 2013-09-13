class SpotifieryTrack < Spotifiery::Searchable::Track

  def to_voted_track_attributes(user)    
    {
      track_name: name, 
      track_uri: href, 
      album_name: album.name,       
      artist_name: artists.map(&:name).join(','),
      truncated_artist_album: "#{artists.map(&:name).join(',')} - #{album.name}".truncate(45) ,
      voted: user.has_voted_track_by_uri?(href) }
  end

end