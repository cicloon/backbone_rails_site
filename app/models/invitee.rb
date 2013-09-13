class Invitee < ActiveRecord::Base

  attr_accessible :name, :coming, :can_be_child, :adult_menu

  belongs_to :user, :inverse_of => :invitees

  validates :name, :presence => true

  NOT_DECIDED = 0
  CONFIRMED = 1
  DECLINED = 2

  def confirmed?
    coming.eql?(Invitee::CONFIRMED)
  end

  def declined?
    coming.eql?(Invitee::DECLINED)
  end

  def not_decided?
    coming.eql?(Invitee::NOT_DECIDED)
  end

end