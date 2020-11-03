class AddProductToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :Product, null: false, foreign_key: true
  end
end
