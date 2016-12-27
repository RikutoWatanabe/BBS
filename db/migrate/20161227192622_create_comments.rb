class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :board_id
      t.string :name
      t.text :content
      t.index :board_id

      t.timestamps
    end
  end
end
