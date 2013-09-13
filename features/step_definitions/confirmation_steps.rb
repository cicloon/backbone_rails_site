Given /^I have (\d+) invitees$/ do |num_invitees|
  user_id = User.first.try(:id)
  (0..(num_invitees.to_i-1)).each do 
    invitee = create(:invitee)
    invitee.user_id = user_id
    invitee.save
  end
end