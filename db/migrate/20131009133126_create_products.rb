class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :Title
      t.string :Image
      t.string :Description
      t.integer :Stock
      t.float :Price

      t.timestamps
    end
  end
end
