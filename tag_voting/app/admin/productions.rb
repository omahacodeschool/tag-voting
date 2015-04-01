ActiveAdmin.register Production do
  filter :voting_period do |object|
    binding.pry
    object.season
  end
  filter :theater
  filter :name
  filter :genre
  filter :year
end
