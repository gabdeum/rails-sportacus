class ArticleReview < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :rating, presence: true, numericality: { only_integer: true },
    comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { minimum: 6 }

  validates_associated :article, :user
end
