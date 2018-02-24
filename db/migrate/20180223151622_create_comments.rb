class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :comment_by
      t.integer :suggestion_id
      t.text :text

      t.timestamps
    end
  end
end
