Given /^an existing user without email$/ do 
  @user = create(:user)
end

Given /^an existing user with email$/ do 
  @user = create(:user, :email => 'john_doe@mailefimero.com')
end

Given /^(?:|I )try to log in with username "([^"]*)" and password "([^"]*)"$/ do |username, password|
  visit "/users/sign_in"
  fill_in("user_user_name", :with => username)
  fill_in("user_password", :with => password)  
end

Given /^I am logged$/ do
  visit "/users/sign_in"
  fill_in("user_user_name", :with => @user.user_name)
  fill_in("user_password", :with => "123456")
  click_button("Entrar")
end

When /^I log in$/ do
  visit "/users/sign_in"
  fill_in("user_user_name", :with => @user.user_name)
  fill_in("user_password", :with => "123456")
  click_button("Entrar")
end

