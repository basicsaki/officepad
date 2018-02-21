class CreateAnswerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_comments do |t|
      t.integer :comment_by
      t.integer :answer_id
      t.integer :upvotes
      t.integer :downvotes
      t.text :comment

      t.timestamps
    end
  end
end
