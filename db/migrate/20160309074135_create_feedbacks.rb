class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user
      t.integer :user_type
      t.text :feedback_message
      t.text :reply

      t.timestamps null: false
    end
  end
end
