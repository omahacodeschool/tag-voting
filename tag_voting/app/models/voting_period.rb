class VotingPeriod < ActiveRecord::Base
  has_many :ballots
  has_many :productions
  attr_accessible :open_date, :close_date, :season
end
