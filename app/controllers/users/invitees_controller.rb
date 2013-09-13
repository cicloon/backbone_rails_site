# enconding: UTF-8
class Users::InviteesController < ApplicationController
  before_filter :require_login
  before_filter :load_invitee, :only => [:confirm, :decline]

  layout 'floating'

  def index
    @invitees = current_user.invitees
  end

  def confirm
    @invitee.coming = Invitee::CONFIRMED
    @invitee.save

    respond_to do |format|
      format.js
    end
  end

  def decline
    @invitee.coming = Invitee::DECLINED
    @invitee.save    

    respond_to do |format|
      format.js
    end    
  end

  private

  def load_invitee
    @invitee = Invitee.find params[:id]
  end


end