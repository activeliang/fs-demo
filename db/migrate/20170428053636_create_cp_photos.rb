class CreateCpPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :cp_photos do |t|
      t.integer :job_id
      t.string :cp_in_image

      t.timestamps
    end
  end
end
