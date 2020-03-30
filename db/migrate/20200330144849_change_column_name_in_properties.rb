class ChangeColumnNameInProperties < ActiveRecord::Migration[5.2]
  def change
   change_column :properties, :valuation, 'integer USING CAST(valuation AS integer)'
  end
end
