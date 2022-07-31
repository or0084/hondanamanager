class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :star, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
