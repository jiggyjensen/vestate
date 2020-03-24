class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :validated_developer, :boolean, default: false
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :validated_investor, :boolean, default: false
    add_column :users, :description, :string
  end
end
