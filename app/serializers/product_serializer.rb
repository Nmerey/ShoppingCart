class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :cart_id
  belongs_to :cart, optional: true
end
