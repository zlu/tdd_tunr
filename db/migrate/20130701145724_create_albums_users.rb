class CreateAlbumsUsers < ActiveRecord::Migration
  def change
    create_table :albums_users do |t|
      t.integer :album_id
      t.integer :user_id

      t.timestamps
    end
  end
end
