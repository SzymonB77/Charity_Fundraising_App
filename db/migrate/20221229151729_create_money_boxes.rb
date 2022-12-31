class CreateMoneyBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :money_boxes do |t|
      t.string :title, null: false
      t.text :notification
      t.string :qrcode
      
      t.references :fundraiser, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
