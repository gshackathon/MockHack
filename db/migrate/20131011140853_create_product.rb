class CreateProduct < ActiveRecord::Migration
  def change
  
  if table_exists?( :products) 
	drop_table :products
	end
	
	create_table :products do |t|
      t.string :title
      t.string :imageUrl
      t.string :description
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end

