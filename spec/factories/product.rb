FacotryBot.define do
	factory :product do
		name { Faker::Food.ingredient }
		price { rand(1..100)}
		cart_id { Cart.current }
	end
end