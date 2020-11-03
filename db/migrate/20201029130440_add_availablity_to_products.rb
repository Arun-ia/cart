class AddAvailablityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :availablity, :integer
  end
end
