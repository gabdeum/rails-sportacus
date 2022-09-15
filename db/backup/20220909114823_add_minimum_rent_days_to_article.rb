class AddMinimumRentDaysToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :minimum_rent_days, :integer
  end
end
