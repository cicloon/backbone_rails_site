# enconding: UTF-8
Given /^I am logged in for the first time$/ do 
  @user = create(:user)
  visit "/users/sign_in"
  fill_in("user_user_name", :with => @user.user_name)
  fill_in("user_password", :with => "123456") 
  click_button("Entrar")
end

When /^I am prompted for my email$/ do  
  assert(page.has_css?(".setup-email-box"))
end

When /^I fill in my email with "(.*?)"$/ do |email|
  fill_in("user_email", :with => email)
end
