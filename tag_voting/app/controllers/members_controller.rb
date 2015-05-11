class MembersController < ApplicationController
  
  before_filter :check_open
  
  def show
    begin
      @member = Member.find_by_member_identification(params[:id])
      @ballot = @member.current_ballot
      if @ballot.open?
        @voting_period = @ballot.voting_period
        @nominations = @ballot.nominations.includes(:award)
      else
        redirect_to "/time_out"
      end
    rescue ActiveRecord::RecordNotFound, ActiveRecord::StatementInvalid
      render "not_found"
    end
  end

  def update
    @ballot = Ballot.includes(:productions, :member, :voting_period).find_by_id(params[:ballot][:id])
    if @ballot.open?
      @ballot.update_attributes(params[:ballot])
      if @ballot.no_productions?
        flash[:alert] = "You must have at least one production checked as seen to submit a ballot."
        redirect_to ballot_path(@ballot.member)
      else
      @ballot.member.update_attribute("voted", true)
      render "confirmation"
      end
    else
      redirect_to "/time_out"
    end
  end
  
  def update_show
    @ballot = Ballot.includes(:voting_period).find_by_id(params[:seen][:ballot_id])
    if @ballot.open?
      if BallotsProduction.where(params[:seen]) == []
        BallotsProduction.create(params[:seen])
        @image = "/assets/checked-box.png"
      else
        BallotsProduction.where(params[:seen])[0].destroy
        @image = "/assets/empty-box.png"
      end
    else
      render :js => "window.location = '/time_out'"
    end
  end
  
  def time_out
  end
  
  private
  
  def check_open
    
  end
  
end
