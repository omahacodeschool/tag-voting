class MembersController < ApplicationController
  
  def show
    begin
      @member = Member.find(params[:id])
      @ballot = @member.current_ballot
      @voting_period = @ballot.voting_period
      if @ballot.closed?(@voting_period.close_date) 
        render "time_out"
      end
      @nominations = @ballot.nominations.includes(:award)
    rescue ActiveRecord::RecordNotFound
      render "not_found"
    end
  end

  def update
    @ballot = Ballot.includes(:productions, :member).find_by_id(params[:id])
    @ballot.update_attributes(params[:ballot])
    if @ballot.no_productions?
      flash[:alert] = "You must have at least one production checked as seen to submit a ballot."
      redirect_to ballot_path(@ballot.member)
    else
    @ballot.member.update_attribute("voted", true)
    redirect_to "confirmation"
    end
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
