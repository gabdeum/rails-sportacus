class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :article_reviews
  has_many :bookings
end
