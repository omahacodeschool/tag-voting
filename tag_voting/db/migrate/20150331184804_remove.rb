class Remove < ActiveRecord::Migration
  def change
    remove_column :members, :secret_voter_id
  end
end
