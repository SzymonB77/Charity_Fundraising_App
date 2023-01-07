class CreateDebitCards < ActiveRecord::Migration[6.1]
  def change
    create_table :debit_cards do |t|
      t.string :card_number, null: false, unique: true
      t.string :expiration_date
      t.integer :cvv, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :debit_cards, :card_number, unique: true
  end
end
