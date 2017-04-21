class AddIntroductionToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :introduction, :text
  end
end
