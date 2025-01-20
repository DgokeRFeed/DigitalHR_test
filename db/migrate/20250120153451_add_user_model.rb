class AddUserModel < ActiveRecord::Migration[8.0]
  def up
    create_table :users, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name, null: false
      t.string :surname, null: false
      t.string :patronymic, null: false
      t.string :full_name, null: false
      t.string :email, null: false
      t.integer :age, null: false
      t.string :nationality, null: false
      t.string :country, null: false
      t.string :gender, null: false
    end
  end

  def down
    drop_table :users, cascade: true
  end
end
