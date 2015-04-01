class Member < ActiveRecord::Base
  has_many :ballots
  obfuscate_id
  attr_accessible :name, :email, :voted

  def current_ballot
    self.ballots.includes(:nominations).last
  end
  
end
