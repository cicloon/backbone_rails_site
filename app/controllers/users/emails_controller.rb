# enconding: UTF-8
class Users::EmailsController < ApplicationController

  layout 'floating'

  before_filter :require_login
  before_filter :find_model


  def create
    
    current_user.email = params[:user][:email]    
    
    if current_user.save    
      redirect_url = 
      flash[:notice] = "Hemos guardado tu email"
      redirect_to root_path
    else    
      flash[:alert] = "Email no v&aacute;lido"
      render :new 
    end
  
  end

  private

  def find_model
    @user = current_user
  end
end