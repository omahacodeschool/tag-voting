class MemberMailer < ActionMailer::Base
  address = Mail::Address.new "awards@theatreartsguild.com"
  address.display_name = "Theatre Arts Guild"
  
  default from: address
  
  def ballot_email(member)
    @member = member
    @url = ballot_url(@member.member_identification)
    if @member.voted == nil
      ballot = @member.ballots.create(voting_period_id: VotingPeriod.last.id)
      Award.all.each do |award|
        Nomination.create(ballot_id: ballot.id, award_id: award.id)
      end
    end
    mail(to: @member.email, subject: "TAG Awards Nominations Now Open!", reply_to: "awards@theatreartsguild.com")
  end
  
end
