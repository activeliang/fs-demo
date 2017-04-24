class AddAavatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :aavatar, :string
  end
end
