class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :award_title
      t.integer :ballot_id
      t.text :nom1
      t.text :nom2
      t.text :nom3
      t.text :nom4
      t.text :nom5
      
      t.timestamps
    end
  end
end
