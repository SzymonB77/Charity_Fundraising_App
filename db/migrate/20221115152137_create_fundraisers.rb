class CreateFundraisers < ActiveRecord::Migration[6.1]
  def change
    create_table :fundraisers do |t|
      t.string :title, null: false
      t.date :date_of_birth
      t.string :name
      t.string :surname
      t.string :reason
      t.string :city
      t.string :region
      t.date :end_date
      t.jsonb :discription
      t.decimal :total_amount
      
      t.references :user, null: false, foreign_key: true
      t.index ['discription'], name: 'index_fundraisers_on_discription', using: :gin
      t.timestamps
    end
  end
end
