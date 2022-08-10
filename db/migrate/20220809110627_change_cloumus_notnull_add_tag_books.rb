class ChangeCloumusNotnullAddTagBooks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tag_books, :book_id, true
    change_column_null :tag_books, :tag_id, true
  end
end
