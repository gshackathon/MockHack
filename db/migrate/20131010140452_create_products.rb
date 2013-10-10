class CreateProducts < ActiveRecord::Migration
  def change
  
  if table_exists?( :products) 
	drop_table :products
	end
	
	create_table :products do |t|
      t.string :Title
      t.string :ImageUrl
      t.string :Description
      t.integer :Stock
      t.float :Price

      t.timestamps
    end
  end
end

