class Entry < ApplicationRecord
  belongs_to :user
  has_many :videos
  has_many_attached :images
end
