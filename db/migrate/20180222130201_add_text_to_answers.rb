class AddTextToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :text, :text
  end
end
