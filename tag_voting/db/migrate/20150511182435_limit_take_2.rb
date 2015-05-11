class LimitTake2 < ActiveRecord::Migration
  def change 
    change_column :members, :member_identification, :integer, limit: nil
  end
end
