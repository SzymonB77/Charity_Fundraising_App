class CreateIdentityCards < ActiveRecord::Migration[6.1]
  def change
    create_table :identity_cards do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :citizenship
      t.string :country_of_birth, null: false
      t.string :sex, null: false
      t.bigint :pesel
      t.string :series_and_number, null: false
      t.date :expiration_date, null: false
      t.string :street, null: false
      t.integer :house_number, null: false
      t.string :city, null: false
      t.integer :zipcode, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :identity_cards, :pesel, unique: true
  end
end
