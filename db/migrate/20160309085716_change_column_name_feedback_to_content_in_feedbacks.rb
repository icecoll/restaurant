class ChangeColumnNameFeedbackToContentInFeedbacks < ActiveRecord::Migration
  def change
    rename_column :feedbacks,:feedback_message,:content
  end
end
