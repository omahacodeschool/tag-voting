class MemberMailer < ActionMailer::Base
  default from: "tag.voting@gmail.com"
  
  def ballot_email(member)
    @member = member
    @url = ballot_url(@member)
    if @member.voted == false
      ballot = @member.ballots.create(voting_period_id: VotingPeriod.last.id)
      Award.all.each do |award|
        Nomination.create(ballot_id: ballot.id, award_id: award.id)
      end
    end
    mail(to: @member.email, subject: "TAG Awards Nominations Now Open!")
  end
  
end
