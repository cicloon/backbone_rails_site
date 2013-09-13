class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me, :invitees_attributes
  
  has_many :invitees, inverse_of: :user
  has_many :user_voted_tracks, inverse_of: :user
  has_many :voted_tracks, through: :user_voted_tracks


  accepts_nested_attributes_for :invitees, :allow_destroy => true

  # Invitees names separated by commas
  def invitee_list
    invitees.map(&:name).join(", ")
  end

  # Return true if every invitee has a coming value different from NOT_DECIDED
  def revised_invitation?
    !(invitees.blank? || invitees.any?{|invitee| [Invitee::NOT_DECIDED,nil].include?(invitee.coming) })
  end

  def has_voted_track? voted_track
    user_voted_tracks.where(voted_track_id: voted_track.id).present?
  end

  def has_voted_track_by_uri? track_uri
    voted_track_uris.include? track_uri    
  end

  protected

  def email_required?
    false
  end

  def voted_track_uris
    @voted_track_uris ||= voted_tracks.map(&:track_uri)
  end

end
