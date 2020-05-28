require 'rails_helper'

RSpec.describe "Products", type: :request do
	current_cart = Cart.create!

	describe "GET index" do 
		it "returns list of products in current shopping cart" do
			product_list = create_list(:product, 5)
			get products_path
			expect(response.status).to eq(200)
		end
	end
end
