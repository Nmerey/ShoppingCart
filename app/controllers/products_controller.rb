class ProductsController < ApplicationController
	def index

		@limit = 10
		@cursor = params.fetch(:cursor,0).to_i
		@products_per_page = Product.where("id > ?",@cursor).limit(@limit)
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
			flash[:success] = "Added to cart!"
		else
			flash[:danger] = "Could not add to cart!"
		end

	end

	def new

		@product = Product.new
	end

	def create

		@product = Product.new(product_params)
		
		if @product.save
			flash[:success] = "Product successfully created"
			redirect_to products_path
 		else
 			flash[:danger] = " Some problem with saving!"
 			render :new
 		end

	end

	private

	def product_params
		params.require(:product).permit(:name, :price)
	end
end
