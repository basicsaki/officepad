class CreateQuestionSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :question_suggestions do |t|
      t.integer :suggestion_by
      t.text :text
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
