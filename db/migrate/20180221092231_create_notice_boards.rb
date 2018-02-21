class CreateNoticeBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :notice_boards do |t|
      t.string :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
