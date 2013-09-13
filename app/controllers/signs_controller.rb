class SignsController < ApplicationController

  before_filter :require_login
  respond_to :json

  def index

    @signs = Sign.joins(:invitees).decorate
    @invitees = current_user.invitees.decorate

    js_callback(params: {
      signs: @signs.as_json,
      invitees: @invitees.as_json
    })

    respond_to do |format|
      format.html {}
      format.json{ render json: @signs.as_json  }
    end
  end

  def create
    invitees = Invitee.find_all_by_id params[:invitee_ids]
    Rails.logger.info invitees
    sign = Sign.create_for_invitees({body: params[:body]}, invitees)

    if sign.valid?
      render json: sign.decorate.as_json
    else
      render json: {errors: sign.errors.values.flatten}, status: 422 # Return unprocessable entity
    end
  end


end