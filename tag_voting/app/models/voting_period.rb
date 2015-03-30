class VotingPeriod < ActiveRecord::Base
  has_many :ballots
  
  attr_accessible :open_date, :close_date, :season
end
