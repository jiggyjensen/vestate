class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :sales_proceeds
      t.string :location
      t.string :valuation
      t.string :name
      t.string :description
      t.string :amount_to_be_raised
      t.string :financials
      t.string :area_description
      t.references :user, foreign_key: true
      t.string :dividend
      t.string :status

      t.timestamps
    end
  end
end
