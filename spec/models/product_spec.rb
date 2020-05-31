require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Pagination" do
  	
  	it "def paginate should return first 10 products list" do
  		@products = create_list(:product, 20)
  		expect(Product.paginate).to eq(@products.first(10))
  	end

  	it "def prev should return last 10 products" do
  		@products = create_list(:product, 20)
  		#It is +1 because it selects products from id < last_product
  		expect(Product.prev(@products.last.id + 1)).to eq(@products.last(10)) 
  	end
  end
end
