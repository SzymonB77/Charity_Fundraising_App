class CreateFundraiserAbuses < ActiveRecord::Migration[6.1]
  def change
    create_table :fundraiser_abuses do |t|
      t.text :note, limit: 500
      t.bigint :phone_number, null:false
      t.binary :attachment
      t.references :fundraiser, null:false , foreign_key: true

      t.timestamps
    end
  end
end
