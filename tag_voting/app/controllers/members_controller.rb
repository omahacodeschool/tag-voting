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
  
  def update_show
    @ballot = Ballot.find_by_id(params[:seen][:ballot_id])
    if BallotsProduction.where(params[:seen]) == []
      BallotsProduction.create(params[:seen])
    else
      BallotsProduction.where(params[:seen])[0].destroy
    end
  end
  
  
end
