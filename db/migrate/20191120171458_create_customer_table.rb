class CreateCustomerTable < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.text :name
    end
  end
end
