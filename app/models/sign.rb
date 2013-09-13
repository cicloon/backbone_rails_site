#encoding: utf-8
class Sign < ActiveRecord::Base
  attr_accessible :body

  has_many :invitee_signs
  has_many :invitees, through: :invitee_signs

  validates :invitees, presence: {message: '¿De quién es la firma?'}
  validates :body, presence: {message: '¡Escríbenos algo!'}

  def self.create_for_invitees params, invitees
    sign = Sign.new(params)    
    sign.invitees = invitees
    sign.save    
    return sign
  end


end
