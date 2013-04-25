class CreateMerges < ActiveRecord::Migration
  def change
    create_table :merges do |t|
      t.integer :first_image
      t.integer :second_image
      t.string :blend_mode
      t.string :url

      t.timestamps
    end
  end
end
