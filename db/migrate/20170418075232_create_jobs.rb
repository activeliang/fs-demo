class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :task
      t.text :description
      t.integer :wage_upper_bound
      t.integer :wage_lower_bound
      t.text :detail
      t.integer :scale
      t.string :website
      t.string :work_time
      t.string :five_gold
      t.boolean :overtime_pay, default: true
      t.string :address
      t.string :contact_wechat
      t.timestamps
    end
  end
end
