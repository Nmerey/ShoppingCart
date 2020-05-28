class ProductController < ApplicationController
	def index
		#cart_products and products has same action cotroller
		if params[:cart_id]
			@products = Cart.current.products
		else
			@products = Product.all
		end
	end

	def add_to_cart
		@product = Product.find(params[:product_id])
		@product.cart_id = Cart.current
		
		if 	@product.save
			flash[:notice] = "Added to cart"
			render 
		else

	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	end

	private

	def product_params
		params.require(:product).permit(:name, :price)
	end
end
