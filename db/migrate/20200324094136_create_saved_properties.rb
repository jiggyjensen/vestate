class CreateSavedProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_properties do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
