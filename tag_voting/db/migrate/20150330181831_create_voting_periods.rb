class CreateVotingPeriods < ActiveRecord::Migration
  def change
    create_table :voting_periods do |t|
      t.datetime :open_date
      t.datetime :close_date
      t.string  :season
      
      t.timestamps
    end
  end
end
