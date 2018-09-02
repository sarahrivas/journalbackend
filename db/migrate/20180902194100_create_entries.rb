class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :content
      add_reference :entries, :user, foreign_key:true
      t.timestamps
    end
  end
end
