require 'spec_helper'

describe Invitee do
  before(:each) do
    @user = create(:user)
    @invitee = create(:invitee)
    @invitee.user = @user
    @invitee.save
  end

  it "should belongs to user" do
    @invitee.user.should eql @user
  end

end