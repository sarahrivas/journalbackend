class AddEntryIdtoUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :entries, foreign_key: true
  end
end
