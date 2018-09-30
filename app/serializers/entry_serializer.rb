class EntrySerializer < ActiveModel::Serializer
  attributes :title, :content, :id, :created_at, :image
  belongs_to :user
end
