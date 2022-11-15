# frozen_string_literal: true

class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, default: false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :email, null: false
      t.string :name
      t.string :surname
      t.string :image
      t.text :about_me
      t.string :website
      t.string :city
      t.integer :zipcode
      t.string :street
      t.integer :location_number
      t.integer :phone_number

      # Company User
      t.boolean :company
      t.string :company_name
      t.integer :NIP

      # User settings
      t.string :authentication_method
      t.decimal :daily_donation_limit, default: 50_000
      t.boolean :receive_notifications, default: true
      t.boolean :SMS_notifications, default: false
      t.decimal :SMS_notifications_amount, default: 100
      t.boolean :receive_invoices, default: false
      t.boolean :visible_address, default: false
      t.boolean :visible_email, default: false
      t.boolean :visible_avatar, default: true
      t.boolean :visible_phone_number, default: true
      t.boolean :visible_registration_date, default: true
      t.boolean :visible_supported_fundraisers, default: true
      t.boolean :visible_in_browser, default: true

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, %i[uid provider], unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
