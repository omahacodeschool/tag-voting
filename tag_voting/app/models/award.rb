class Award < ActiveRecord::Base
  has_many :nominations
  
  attr_accessible :title
end
