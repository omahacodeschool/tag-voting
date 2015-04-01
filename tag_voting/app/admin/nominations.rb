ActiveAdmin.register Nomination do
  filter :award
  
  csv do  
    column :award_id do |e|
      n = Award.find(e.award_id)
      if (n)
        "#{n.title}"
      else
        ""
      end
      
    end
    column :nom1
    column :nom2
    column :nom3
    column :nom4
    column :nom5    
  end
  
  index do
    column :award_id, sortable: :award_id do |e|
      n = Award.find(e.award_id)
      if (n)
        "#{n.title}"
      else
        ""
      end
    end
    column :nom1
    column :nom2
    column :nom3
    column :nom4
    column :nom5
  end
 
end
