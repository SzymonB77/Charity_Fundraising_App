class RenameColumnsInUsers < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :NIP, :nip
    rename_column :users, :SMS_notifications, :sms_notifications
    rename_column :users, :SMS_notifications_amount, :sms_notifications_amount
  end

  def down
    rename_column :users, :nip, :NIP
    rename_column :users, :sms_notifications, :SMS_notifications
    rename_column :users, :sms_notifications_amount, :SMS_notifications_amount
  end
end
