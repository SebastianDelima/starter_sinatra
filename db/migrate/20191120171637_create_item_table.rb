class CreateItemTable < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name
    end
  end
end
