module CustomCapybaraExpectations

  def has_bootstrap_alert_error?(message)
    within("div.alert.alert-error") do
      has_content? message
    end
  end

  def has_bootstrap_alert_success?(message)
    within("div.alert.alert-success") do
      has_content? message
    end
  end

end

Capybara::Session.send :include, CustomCapybaraExpectations

CustomCapybaraExpectations.public_instance_methods(false).each do |name|
  CapybaraMiniTestSpec::Matcher.new(name)
end