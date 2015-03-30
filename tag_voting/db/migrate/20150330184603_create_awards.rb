class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.text :title

      t.timestamps
    end
  end
end
