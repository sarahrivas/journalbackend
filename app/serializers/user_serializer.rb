class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :id

  has_many :entries
end
