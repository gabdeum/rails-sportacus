class CreateBikeCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :bike_characteristics do |t|
      t.references :article, null: false, foreign_key: true
      t.integer :size
      t.string :type
      t.string :group
      t.string :model
      t.integer :material
      t.integer :brakes
      t.integer :color

      t.timestamps
    end
  end
end
