class CreateBookPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :book_posts do |t|
      t.text :book_name
      t.text :opinion
      t.integer :user_id

      t.timestamps
    end
  end
end
