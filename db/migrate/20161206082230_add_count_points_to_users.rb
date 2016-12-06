class AddCountPointsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :count_points, :integer

  end
end
