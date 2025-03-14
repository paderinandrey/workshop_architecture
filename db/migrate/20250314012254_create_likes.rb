class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :reader, null: false, foreign_key: true
      t.references :book, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end

    add_index :likes, [:reader_id, :book_id], unique: true
  end
end
