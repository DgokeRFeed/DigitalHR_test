class AddReferences < ActiveRecord::Migration[8.0]
  def up
    create_table :interests_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :interest
    end    

    create_table :skills_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :skill
    end
  end

  def down
    drop_table :interests_users, cascade: true
    drop_table :skills_users, cascade: true
  end
end
