class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :answered_by
      t.integer :question_id
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
