require 'test_helper'

class BallotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "closed?" do
    vp = VotingPeriod.create(close_date: "2015-04-04 3:00pm")
    Ballot.create(voting_period_id: vp.id)
  end
  
end
