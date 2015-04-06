class Ballot < ActiveRecord::Base
  has_and_belongs_to_many :productions
  before_destroy { productions.clear }
  belongs_to :member
  belongs_to :voting_period
  has_many :nominations, dependent: :destroy, order: "id"
  accepts_nested_attributes_for :nominations
  attr_accessible :member_id, :voting_period_id, :nominations_attributes


  # Public Method #closed?
#   Confirms that the Voting Period for a Ballot isn't closed.
#
#   Params: none
#
#   Returns: boolean - true if the Voting Period is closed, false if it is still open.
#
#   State Changes: none
  
  def open?
    self.voting_period.close_date > Time.now 
  end
  
  # Public Method #no_productions?
#   Performs conditional to check for Productions associated with a Ballot.
#
#   Params: none
#
#   Returns: Boolean - true if the Ballot has no Productions, false if it does.
#
#   State Changes: none
  
  def no_productions?
    self.productions == []
  end
  
  # Public Method #has_seen?
 #  Checks whether a given Production is associated with the Ballot.
 #
 #  Params: id-     Integer - The id of the Production being looked for.
 #
 #  Returns:  Boolean  -  true if the Production has been associated with the Ballot.
 #
 #  State Changes: none
  
  def has_seen?(id)
    self.productions.pluck(:id).include?(id)
  end
  
end
