class ContactSerializer < ActiveModel::Serializer
  root false
  attributes :first_name, :last_name
end
