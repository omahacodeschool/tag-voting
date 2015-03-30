class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :secret_voter_id
      t.boolean :voted

      t.timestamps
    end
  end
end
