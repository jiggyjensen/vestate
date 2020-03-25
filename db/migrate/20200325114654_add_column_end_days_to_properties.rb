class AddColumnEndDaysToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :end_date, :datetime

  end
end
