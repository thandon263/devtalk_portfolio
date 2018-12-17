class RemovePositionFromPortfolios < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolios, :position, :integer
  end
end
