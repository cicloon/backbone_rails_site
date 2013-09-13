Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)  
end

Then /^(?:|I )should be redirected to the "([^"]*)" page$/ do |page_name|
  page_path_str = page_name.split(" ").join("_")
  page_path_str << "_path"
  page_path = eval(page_path_str)
  current_path.should == page_path
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^(?:|I )should be in the "([^"]*)" page$/ do |page_name|
  page_path_str = page_name.split(" ").join("_")
  page_path_str << "_path"
  page_path = eval(page_path_str)
  current_path.should == page_path
end


Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/([imxo])?$/ do |regexp,flags|
  regexp_opts = [regexp,flags].compact
  regexp = Regexp.new(*regexp_opts)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/([imxo])?$/ do |regexp,flags|
  regexp_opts = [regexp,flags].compact
  regexp = Regexp.new(*regexp_opts)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should see an error message with "([^"]*)"$/ do |text|
  assert page.has_bootstrap_alert_error?(text) # CustomCapybaraExpectation
end

Then /^I should see a notice message with "(.*?)"$/ do |text|
  assert page.has_bootstrap_alert_success?(text) # CustomCapybaraExpectation
end


