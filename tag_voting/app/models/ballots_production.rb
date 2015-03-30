class BallotsProduction < ActiveRecord::Base
  has_many :productions
  has_many :ballots
  
  attr_accessible :production_id, :ballot_id
end
