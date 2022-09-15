class AddBrandToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :brand, :string
  end
end
