require 'spec_helper'

describe User do
  describe 'invitee relationship' do

    before(:each) do
      @user = create(:user)
      @user.invitees << Invitee.create(:name => 'Perico')
      @inv = Invitee.first
    end

    it "should have one invitee" do
      @user.invitees.size.should eql 1
    end

    describe '#revised_invitation' do

      it "should return false by default" do
        @user.revised_invitation?.should be_false
      end

      it "should return false if the user has no invitees" do
        @user.invitees.first.destroy
        @user.reload
        @user.revised_invitation?.should be_false      
      end

      it "should return true if the invitee is coming" do      
        @inv.coming = Invitee::CONFIRMED
        @inv.save
        @user.revised_invitation?.should be_true  
      end

      it "should return true if the invitee is not coming" do
        @inv.coming = Invitee::DECLINED
        @inv.save
        @user.revised_invitation?.should be_true  
      
      end
    end


  end
end
