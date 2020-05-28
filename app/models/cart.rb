class Cart < ApplicationRecord
	has_many :products

	def self.current
		Cart.first
	end
end
