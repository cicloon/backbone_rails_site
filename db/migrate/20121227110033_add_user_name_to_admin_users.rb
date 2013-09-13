class AddUserNameToAdminUsers < ActiveRecord::Migration
  def migrate(direction)
    AdminUser.delete_all if direction == :up
    super
    # Create a default user
    AdminUser.create!(:user_name => 'aleon', :email => 'aleon.prof@gmail.com', :password => '123123', :password_confirmation => '123123') if direction == :up
    AdminUser.create!(:user_name => 'cristy', :email => 'cristigongar@gmail.com', :password => '123123', :password_confirmation => '123123') if direction == :up
  end

  def change    
    add_column :admin_users, :user_name, :string, :null => false
  end

end
