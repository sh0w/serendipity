class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
