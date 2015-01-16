class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku, :shelf_life
end
