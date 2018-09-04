class UserSerializer < ActiveModel::Serializer
  attributes :username, :name

  has_many :entries
end
