class Member < ActiveRecord::Base
  has_many :ballots
  obfuscate_id
  attr_accessible :name, :email, :voted


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
