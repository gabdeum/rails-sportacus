class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.integer :daily_rate
      t.integer :conditions
      # t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :address
  end
end
