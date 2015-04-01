ActiveAdmin.register Nomination do
  
  controller do
      def scoped_collection
        super.includes :award
      end
    end
    
  filter :award
  #TODO figure out if we can include a .includes for award eager loading
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
