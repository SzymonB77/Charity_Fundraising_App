class AddMoneyBoxRefToDonations < ActiveRecord::Migration[6.1]
  def change
    add_reference :donations, :money_box, foreign_key: true
  end
end
