class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.decimal :amount, null: false
      t.string :note
      t.boolean :payment_successed, default: false
      t.boolean :hidden_name, default: false
      t.boolean :hidden_amount, default: false
      
      t.references :fundraiser, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
