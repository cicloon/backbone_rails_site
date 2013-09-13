require 'spec_helper'

describe VotedTrack do

  let(:spotifiery_track_hash){ { track_name: "test_track", 
                                 track_uri: "test_track_uri",
                                 album_name: "test_album_name",
                                 album_uri: "spotify:album:1zCNrbPpz5OLSr6mSpPdKm",
                                 artist_name: "test_artist",
                                 artist_uri: "spotify:artist:7jy3rLJdDQY21OgRLCZ9sD"
  }}

  let(:first_user){FactoryGirl.create :user}
  let(:second_user){FactoryGirl.create(:user, :other_user)}


  describe "::up_vote" do
    
    let(:user_voting){ Proc.new {VotedTrack.up_vote(first_user, spotifiery_track_hash)} }  

    it "should create 1 voted_track" do
      expect { user_voting.call }.to change(VotedTrack, :count).by(1)
    end

    it "should create 1 user_voted_track" do
      expect { user_voting.call }.to change(UserVotedTrack, :count).by(1)
    end

    describe "twice by the same user" do

      let(:user_voting_twice){ Proc.new {VotedTrack.up_vote(first_user, spotifiery_track_hash); VotedTrack.up_vote(first_user, spotifiery_track_hash)}  }

      it "should create 1 voted_track" do
        expect { user_voting_twice.call }.to change(VotedTrack, :count).by(1)
      end      

      it "should create 1 user_voted_track" do
        expect { user_voting_twice.call }.to change(UserVotedTrack, :count).by(1)
      end      

    end

    describe "twice by different users" do


      let(:users_voting){ Proc.new {VotedTrack.up_vote(first_user, spotifiery_track_hash); VotedTrack.up_vote(second_user, spotifiery_track_hash)}  }

      it "should create 1 voted_track" do
        expect { users_voting.call }.to change(VotedTrack, :count).by(1)
      end      

      it "should create 2 user_voted_track" do
        expect { users_voting.call }.to change(UserVotedTrack, :count).by(2)
      end      

    end

  end

  describe "::down_vote" do
    let(:voted_track){FactoryGirl.create(:voted_track)}
    let(:user_voted_track){FactoryGirl.create(:user_voted_track, user: first_user, voted_track: voted_track)  }

    before(:each) do
      user_voted_track
    end

    it "should destroy 1 user_voted_track" do
      expect { VotedTrack.down_vote(first_user, voted_track) }.to change(UserVotedTrack, :count).by(-1)
    end


  end

end
