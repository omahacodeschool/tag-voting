class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.integer :member_id
      t.integer :voting_period_id

      t.timestamps
    end
  end
end
