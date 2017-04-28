class AddTestToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :test, :decimal
  end
end
