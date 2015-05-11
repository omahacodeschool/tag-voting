class VoterId < ActiveRecord::Migration
  def change
    add_column :members, :voter_id, :integer
  end
end
