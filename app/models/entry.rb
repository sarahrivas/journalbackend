class Entry < ApplicationRecord
  belongs_to :user
  has_many :videos
  has_many_attached :images

  <%= form_with model: @entry, local: true do |form| %>
    <%= form.text_field :title, placeholder: "Title" %><br>
    <%= form.text_area :content %><br><br>

    <%= form.file_field :images, multiple: true %><br>
    <%= form.submit %>
  <% end %>

end
