class MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
    @ballot = @member.ballots.last
    @nominations = @ballot.nominations
  end
  
  def update
    @ballot = Ballot.find_by_id(params[:id])
    @ballot.update_attributes(params[:ballot])
    @ballot.member.update_attributes(voted: true)
    render "show"
  end
  
  
end
