class EntrySerializer < ActiveModel::Serializer
  attributes :title, :content, :id, :created_at

  belongs_to :user
end
