class CartsController < ApplicationController
	
	def show
		@limit = 10
		@cursor = params.fetch(:cursor,0).to_i
		@cart = Cart.find(params[:id])
		@products_per_page = Product.where("id > ? AND cart_id = ?",@cursor, @cart.id).limit(@limit)
		@products = @cart.products

		respond_to do |format|
			format.json { render json: @products }
			format.html { render :show }
		end
	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.create
	end
end
