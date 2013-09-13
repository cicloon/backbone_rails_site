class VotedTrackDecorator < Draper::Decorator
  delegate_all

  def truncated_artist_album(length = 45)
    "#{artist_name} - #{album_name}".truncate(length)
  end


  def as_json(options = {})
    {
      track_name: track_name,
      track_uri: track_uri,
      album_name: album_name,
      album_uri: album_uri,
      artist_name: artist_name,
      artist_uri: artist_uri,
      truncated_artist_album: truncated_artist_album,
      user_voted_tracks_count: user_voted_tracks_count,
      voted: voted_for_json(options[:voted_for_user]),
      rank: rank_for_json(options[:collection])
    }
  end

  private

  def voted_for_json user
    user.blank?? false : user_ids.include?(user.id)
  end

  def rank_for_json collection    
    index = collection.index(self) + 1    
    # Ugly fix for ugly thing
    begin
      index += collection.offset 
    rescue
    end
    return index
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
