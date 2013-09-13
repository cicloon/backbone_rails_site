class TrackSearch
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations


  attribute :query, String
  attribute :page, Integer, default: 1

  # This is a form object so persisted is always false
  def persisted?
    false
  end

  def results
    @results || SpotifieryTrack.find(q: query, page: page).results.first(10) rescue []
  end


end