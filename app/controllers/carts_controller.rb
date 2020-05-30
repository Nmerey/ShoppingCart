class CartsController < ApplicationController
	
	def show
		@limit = 10
		@cursor = params.fetch(:cursor,0).to_i
		@cart = Cart.find(params[:id])
		@products = @cart.products

		if params[:prev]
			#Логика когда нажаты кнопки пагинаций передают разные параметры
			@products_per_page = Product.where("id < ? AND cart_id = ?",params[:prev], @cart.id).limit(@limit)
		else
			@products_per_page = Product.where("id > ? AND cart_id = ?",@cursor, @cart.id).limit(@limit)
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
