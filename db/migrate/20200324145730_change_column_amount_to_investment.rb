class ChangeColumnAmountToInvestment < ActiveRecord::Migration[5.2]
  def change
    change_column :investments, :amount, 'integer USING CAST(amount AS integer)'
  end
end
