class Cart < ApplicationRecord
has_many :products
validates :Product_id, uniqueness: true
validates :quantity, numericality: { :greater_than => 0}
after_find :check_availablity



private
def check_availablity
	avail = Product.find(self.Product_id).availablity
	if avail == 0
		self.destroy
	elsif self.quantity > avail
		self.quantity = avail
	end
end
end