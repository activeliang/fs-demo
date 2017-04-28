class AddATesttreeToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :testtree, :float, :limit => 8, :null => true
  end
end
