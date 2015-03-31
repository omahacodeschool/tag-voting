class MemberMailer < ActionMailer::Base
  default from: "tag.voting@gmail.com"
  
  def ballot_email(member)
    @member = member
    @url = ballot_url(@member)
    mail(to: @member.email, subject: "TAG Awards Nominations Now Open!")
  end
  
end
