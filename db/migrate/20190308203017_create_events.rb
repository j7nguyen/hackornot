class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
    end

    create_table :votes do |t|
      t.integer :event_id, null: false
      t.boolean :decision, null: false
      t.integer :vote_category_id, null: false

    end

    create_table :vote_categories do |t|
      t.string :name, null: false
    end
    
    add_index :votes, :event_id
  end
end
