class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :nickname
end
