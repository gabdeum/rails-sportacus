class AddTypeToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :type, :string
  end
end
