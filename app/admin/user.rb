ActiveAdmin.register User do       

  filter :user_name

  index do
    column :user_name                            
    column :email                               
    column :last_sign_in_at           
    column :sign_in_count
    column :invitee_list             
    default_actions                   
  end                                 

  form :partial => "form"

  controller do
    before_filter :build_invitee, :only => [:edit]

    def create
      params[:user][:email] = nil if params[:user][:email].blank?
      create! do |format|
        format.html { redirect_to edit_admin_user_path(:id => @user.id) }
      end      
    end

    def update
      clean_invitee_attributes params
      params[:user][:email] = nil if params[:user][:email].blank?
      update! do |format|
        format.html { redirect_to edit_admin_user_path(:id => @user.id) }
      end
    end

    def build_invitee
      resource.invitees.build
    end

    def clean_invitee_attributes params
      to_clean_keys = []
      params[:user][:invitees_attributes].each do |key, value|
        to_clean_keys << key if value[:name].blank?
      end

      to_clean_keys.each{|key| params[:user][:invitees_attributes].delete(key) }

    end

  end

end