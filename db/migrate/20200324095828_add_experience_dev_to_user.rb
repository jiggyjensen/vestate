class AddExperienceDevToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :experience_dev, :integer
  end
end
