class ChangeCountColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :fundraisers, :count, :number_of_views
  end
end
