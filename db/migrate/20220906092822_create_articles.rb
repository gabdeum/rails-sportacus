class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.integer :conditions
      t.string :brand
      t.integer :minimum_rent_days
      t.string :type

      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :address
    add_index :articles, :brand
  end
end
