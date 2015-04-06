ActiveAdmin.register Nomination do
  
  actions :all, except: [:new]
  
  
  controller do
      def scoped_collection
        super.includes :award
      end
    end
    
  filter :award
  csv do  
    column :award_id do |e|
      e.award_title
    end
    column :nom1
    column :nom2
    column :nom3
    column :nom4
    column :nom5    
  end
  
  index do
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
