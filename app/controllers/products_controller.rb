class ProductsController < ApplicationController
	def index

		@limit = 10
		@cursor = params.fetch(:cursor,0).to_i
		@products = Product.all

		if params[:prev]
			#logic when previous button is pressed
			@products_per_page = Product.where("id < ?",params[:prev]).limit(@limit)
		else
			@products_per_page = Product.where("id > ?",@cursor).limit(@limit)
		end

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @products }
		end

	end

	def add_to_cart

		@product = Product.find(params[:product_id])
		@product.cart_id = Cart.current.id
		
		if 	@product.save
			flash[:success] = "Added to cart!"
			redirect_to cart_path(Cart.current)
		else
			flash[:danger] = "Could not add to cart!"
			render :index
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
