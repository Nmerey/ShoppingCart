class CartsController < ApplicationController
	
	def show
		@cart = Cart.current
		@products = @cart.products
		# def paginate(cursor,limit = 10 by default)
		if params[:prev]
			@products_per_page = @products.prev(params[:prev],7)
		else
			@products_per_page = @products.paginate(params.fetch(:cursor,0),7)
		end

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
