class Product < ApplicationRecord
has_one :cart, dependent: :destroy
validates :availablity, numericality: { :greater_than_or_equal_to => 0}
end
