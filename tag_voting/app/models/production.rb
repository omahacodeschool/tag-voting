class Production < ActiveRecord::Base
  belongs_to :voting_period
  has_and_belongs_to_many :ballots
  
  attr_accessible :theater, :name, :genre, :year, :voting_period_id
end
