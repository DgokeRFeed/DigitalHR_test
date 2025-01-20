class AddReferences < ActiveRecord::Migration[8.0]
  def up
    create_table :users_interests, id: false do |t|
      t.belongs_to :user
      t.belongs_to :interest
    end    

    create_table :users_skills, id: false do |t|
      t.belongs_to :user
      t.belongs_to :skill
    end
  end

  def down
    drop_table :users_interests, cascade: true
    drop_table :users_skills, cascade: true
  end
end
