class RemoveAmountFromInvestments < ActiveRecord::Migration[5.2]
  def change
    remove_column :investments, :amount, :string
  end
end
