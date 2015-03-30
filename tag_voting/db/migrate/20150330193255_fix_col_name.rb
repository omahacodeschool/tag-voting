class FixColName < ActiveRecord::Migration
  def change
    rename_column :voting_periods, :cose_date, :close_date
  end
end
