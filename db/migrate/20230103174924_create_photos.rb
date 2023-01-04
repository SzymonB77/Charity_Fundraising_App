class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :photo, null: false
      t.references :fundraiser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
