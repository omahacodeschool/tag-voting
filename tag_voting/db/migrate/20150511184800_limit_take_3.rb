class LimitTake3 < ActiveRecord::Migration
  def change
    change_column :members, :member_identification, :integer, limit: 8
  end
end
