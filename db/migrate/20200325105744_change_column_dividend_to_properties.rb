class ChangeColumnDividendToProperties < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :dividend, 'integer USING CAST(dividend AS integer)'
  end
end
