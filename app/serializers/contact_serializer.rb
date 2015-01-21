class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :nickname, :credit_rate
end
