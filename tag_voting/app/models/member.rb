class Member < ActiveRecord::Base
  has_many :ballots
  obfuscate_id
  attr_accessible :name, :email, :secret_voter_id, :voted
  after_initialize :set_defaults
  
  def set_defaults
    self.voted ||= false
  end
  
end
