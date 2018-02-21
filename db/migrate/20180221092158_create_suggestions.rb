class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :user_id
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
