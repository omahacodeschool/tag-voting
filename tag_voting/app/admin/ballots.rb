ActiveAdmin.register Ballot do
  filter :voting_period
  
  show do
    panel "Nominations" do
      table_for ballot.nominations.includes(:award) do
        column :award_id, sortable: :award_id do |e|
          e.award_title
        end
        column :nom1
        column :nom2
        column :nom3
        column :nom4
        column :nom5
      end 
    end
    
    panel "Productions seen: #{ballot.productions.size}" do
      table_for ballot.productions do
        column :name
        column :theater
        column :genre  
        column :year
      end
    end
  end
end
