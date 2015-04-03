require 'test_helper'

class BallotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "closed?" do
    vp = VotingPeriod.create(close_date: "2015-04-02 3:00pm")
    ballot = Ballot.create(voting_period_id: vp.id)
    assert( ballot.closed?) 
    vp.destroy
    ballot.destroy
  end
  
  test "no_productions?" do
    ballot = Ballot.create
    assert( ballot.no_productions?)
    ballot.productions.build
    assert_equal(false, ballot.no_productions?)
    ballot.productions.destroy
    ballot.destroy
  end
  
  test "has_seen?" do
    production = Production.create
    ballot = Ballot.create
    assert_equal(false, ballot.has_seen?(production.id))
    BallotsProduction.create(ballot_id: ballot.id, production_id: production.id)
    assert_equal(true, ballot.has_seen?(production.id))
    ballot.destroy
    production.destroy
  end
  
end
