class RemoveColumnsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_columns :users, :receive_notifications, :sms_notifications, :sms_notifications_amount, :visible_in_browser
  end
end
