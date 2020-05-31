class ProductsController < ApplicationController
	def index
		@products = Product.all

		#Проверка на какую кнопку нажали назад или вперед
		if params[:prev]
			@products_per_page = @products.prev(params[:prev],7)
		else
			@products_per_page = @products.paginate(params.fetch(:cursor,0),7)
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
