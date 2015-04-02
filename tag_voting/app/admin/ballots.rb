ActiveAdmin.register Ballot do
  
  require 'csv'
  
  filter :voting_period
  
  prods_array = []
  noms_array = []
  batch_action :excel do |ballots|
    ballots.each do |ballot|
      noms_array << Ballot.find_by_id(ballot.to_i).nominations
      prods_array << Ballot.find_by_id(ballot.to_i).productions
    end
    csv = CSV.generate( encoding: 'Windows-1251' ) do |csv|
      noms_array.flatten.each do |nom|
        csv << [ nom.award_title ]
        csv << [ nom.nom1 ]  
        csv << [ nom.nom2 ]
        csv << [ nom.nom3 ]
        csv << [ nom.nom4 ]
        csv << [ nom.nom5 ] 
      end
      counter = 0
      prods_array.flatten.each do |prod|
        csv << [ prod.name ]
        csv << [ prod.theater ]
        csv << [ prod.genre ]
        csv << [ prod.year ]
        counter += 1
      end
      csv << [ "Productions Seen: #{counter}"]
    end
    send_data csv.encode('Windows-1251'), type: 'text/csv; charset=windows-1251; header=present', disposition: "attachment; filename=report.csv"
  end
  
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
