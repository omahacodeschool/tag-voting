class ChangeVoterId < ActiveRecord::Migration
  def change
    rename_column :members, :voter_id, :member_identification
  end
end
