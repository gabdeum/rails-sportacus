class AddPriceToArticle < ActiveRecord::Migration[7.0]
  def change
    add_monetize :articles, :price
  end
end
