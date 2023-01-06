class CreateObservedFundraisers < ActiveRecord::Migration[6.1]
  def change
    create_table :observed_fundraisers do |t|
      t.references :fundraiser, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :observed_fundraisers, [:fundraiser_id, :user_id], unique: true, 
    name: "index_observed_fundraisers_on_fundraiser_id_and_user_id"
  end
end
