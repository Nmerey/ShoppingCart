require 'rails_helper'

RSpec.describe "Carts", type: :request do

	describe "GET index" do
		context "when requested JSON list of cart" do
			it "returns products within that cart" do
				@products = create_list(:product, 5)
				get cart_path, params: {id: Cart.current.id}, format: :json
				expect(response.body).to eq(Product.where(cart: Cart.current).map { |product| ProductSerializer.new(product)}.to_json)
			end
		end
	end

end
