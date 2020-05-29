class ProductsController < ApplicationController
	def index
		@products = Product.all
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @products }
		end
	end

	def add_to_cart
		@product = Product.find(params[:product_id])
		@product.cart_id = Cart.current
		
		if 	@product.save
			flash[:notice] = "Added to cart"
		end

	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		
		if @product.save
			flash[:notice] = "Product successfully created"
			render :index
 		else
 			flash[:alert] = " Some problem with saving!"
 			render :new
 		end

	end

	private

	def product_params
		params.require(:product).permit(:name, :price)
	end
end
