class UpdateTables < ActiveRecord::Migration
  def change
    rename_table :categories, :nominations
    rename_column :nominations, :award_title, :award_id
    change_column :nominations, :award_id, 'integer USING CAST(award_id AS integer)' 
  end
  
  
end
