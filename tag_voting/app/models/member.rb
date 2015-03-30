class Member < ActiveRecord::Base
  has_many :ballots

  attr_accessible :name, :email, :secret_voter_id, :voted
end
