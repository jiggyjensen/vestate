class ChangeColumnToProperties < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :amount_to_be_raised, 'integer USING CAST(amount_to_be_raised AS integer)'
  end
end
