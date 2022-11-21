class AddCountToFundraisers < ActiveRecord::Migration[6.1]
  def change
    add_column :fundraisers, :count, :int, default: 0
  end
end
