class ProductController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :cart_id)
	end
end
