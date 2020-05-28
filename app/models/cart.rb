class Cart < ApplicationRecord
	def self.current
		Cart.first
	end
end
