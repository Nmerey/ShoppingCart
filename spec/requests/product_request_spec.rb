require 'rails_helper'

RSpec.describe "Products", type: :request do
	current_cart = Cart.create!

	describe "GET index" do 
		it "returns list of products in current shopping cart" do
			
			product_list = build_list(:product, 5)
			get :index
			expect(response).to eq(product_list.to_json)
		end
	end
end
