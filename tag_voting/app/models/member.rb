class Member < ActiveRecord::Base
  has_many :ballots, dependent: :destroy
  attr_accessible :name, :email, :voted
  
  after_create :set_member_id
  
  def set_member_id
    self.update_attribute(:member_identification, ScatterSwap.hash(self.id).to_i)
  end

  # Public Method #current_ballot
#   Returns the last entered Ballot object, with associated Nominations and Voting Period included.
#
#   Params: none
#
#   Returns: The Member's last Ballot object.
#
#   State Changes: none
   
  def current_ballot
    self.ballots.includes(:nominations, :voting_period).order(:created_at).last
  end
  
end
