class ItemNodeSerializer < ActiveModel::Serializer
  attributes :id, :parent_id, :child_id, :quantity, :shrinkage_ratio, :fixed_loss
end
