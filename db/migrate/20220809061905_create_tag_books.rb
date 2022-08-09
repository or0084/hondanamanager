class CreateTagBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

     add_index :tag_books, [:book_id, :tag_id], unique: true

  end
end
