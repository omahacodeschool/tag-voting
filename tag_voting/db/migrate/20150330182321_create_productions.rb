class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.text :theater
      t.text :name
      t.string :genre
      t.string :year
      t.integer :voting_period_id      
      
      t.timestamps
    end
  end
end
