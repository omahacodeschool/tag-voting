class CreateBallotsProductions < ActiveRecord::Migration
  def change
    create_table :ballots_productions do |t|
      t.integer :production_id
      t.integer :ballot_id
      
      t.timestamps
    end
  end
end
