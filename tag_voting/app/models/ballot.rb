class Ballot < ActiveRecord::Base
  has_and_belongs_to_many :productions
  before_destroy { productions.clear }
  belongs_to :member
  belongs_to :voting_period
  has_many :nominations, dependant: :destroy
  accepts_nested_attributes_for :nominations
  attr_accessible :member_id, :voting_period_id, :nominations_attributes
end
