require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  m = Member.create(:email => "anyemail@any.com")
    
    test "ballot_email" do
      # Send the email, then test that it got queued
      email = MemberMailer.ballot_email(m).deliver
      assert !ActionMailer::Base.deliveries.empty?
 
      # Test the body of the sent email contains what we expect it to
      assert_equal ['tag.voting@gmail.com'], email.from
      assert_equal ['anyemail@any.com'], email.to
      assert_equal 'TAG Awards Nominations Now Open!', email.subject
      # assert_equal read_fixture('invite').join, email.body.to_s
    end
  end
  # test "the truth" do
  #   assert truth
  # end

