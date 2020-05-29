require 'rails_helper'

RSpec.describe "Products", type: :request do
	describe "GET index JSON" do

		let(:current_cart) { Cart.create! }

		it "returns list of all products" do
			@product_list = create_list(:product, 5)
			get products_path, params: { format: :json }
			expect(response.body).to eq(@product_list.map { |product| ProductSerializer.new(product)}.to_json)
		end

	end

	describe "POST products" do 

		it "creates new product" do
			expect{ post products_path, params: {:product => { name: "Besparmak", price: 100, cart_id: 1 }} }.to change{Product.count}.by(1)
		end
	end
end
