class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      add_reference :users, :entries, foreign_key: true
      t.timestamps
    end
  end
end
