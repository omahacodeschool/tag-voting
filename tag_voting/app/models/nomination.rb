class Nomination < ActiveRecord::Base
  
  belongs_to :award
  belongs_to :ballot
  attr_accessible :award_id, :ballot_id, :nom1, :nom2, :nom3, :nom4, :nom5

  def award_title
    self.award.try(:title)
  end
  
end
