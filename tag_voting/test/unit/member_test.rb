require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "current ballot" do
    member = Member.create
    member.ballots.build
    member.ballots.build
    assert_equal(member.current_ballot, member.ballots.order(:created_at).last)
    member.destroy
    member.ballots.destroy
  end
  
end
