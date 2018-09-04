class EntrySerializer < ActiveModel::Serializer
  attributes :title, :content

  belongs_to :user
end
