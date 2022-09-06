class CreateArticleReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :article_reviews do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
