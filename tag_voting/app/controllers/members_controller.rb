class MembersController < ApplicationController
  
  def show
    #TODO add error check if member isn't found
    @member = Member.find(params[:id])
    #TODO change ballots.last to current_ballot method (custom)
    @ballot = @member.ballots.includes(:productions).last
    @voting_period = @ballot.voting_period
    @nominations = @ballot.nominations.includes(:award)
    #TODO add method to check if the voting period is closed, move check up
    if @voting_period.close_date < Time.now 
      render "time_out"
    end
  end
  
  def update
    @ballot = Ballot.find_by_id(params[:id])
    #TODO Check that at least one show has been seen before accepting ballot
    @ballot.update_attributes(params[:ballot])
    @ballot.member.update_attribute("voted", true)
    render "confirmation"
  end
  
  def update_show
    @ballot = Ballot.find_by_id(params[:seen][:ballot_id])
    if BallotsProduction.where(params[:seen]) == []
      BallotsProduction.create(params[:seen])
      @image = "/assets/checked-box.png"
    else
      BallotsProduction.where(params[:seen])[0].destroy
      @image = "/assets/empty-box.png"
    end
  end
  
  
end
