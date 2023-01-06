class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :title
      t.string :invoice_link, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
