class CreateReaders < ActiveRecord::Migration[8.0]
  def change
    enable_extension 'citext'

    create_table :readers do |t|
      t.string :name, null: false
      t.citext :email, null: false
      t.timestamps
    end

    add_index :readers, :email, unique: true
  end
end
