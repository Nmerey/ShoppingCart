class CartsController < ApplicationController
	
	def show
		@cart = Cart.find(params[:id])
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
