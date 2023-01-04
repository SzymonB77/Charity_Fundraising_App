class CreateFundraiserUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :fundraiser_updates do |t|
      t.text :note, null: false
      t.references :fundraiser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
