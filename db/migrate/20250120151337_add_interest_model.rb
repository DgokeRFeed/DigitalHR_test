class AddInterestModel < ActiveRecord::Migration[8.0]
  def up
    create_table :interests, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name, null: false
    end
  end

  def down
    drop_table :interests, cascade: true
  end
end
