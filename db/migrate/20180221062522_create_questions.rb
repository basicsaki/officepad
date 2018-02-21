class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.integer :asked_by
      t.integer :upvotes
      t.integer :downvotes
      t.integer :category_id

      t.timestamps
    end
  end
end
