class ContactSerializer < ActiveModel::Serializer
  root false
  attributes :id, :first_name, :last_name
end
