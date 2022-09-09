class Article < ApplicationRecord
  belongs_to :user
  has_many :article_reviews
  has_many :bookings

  validates :title, :description, :address, :brand, presence: true
  validates :daily_rate, :minimum_rent_days, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0 }
  validates :conditions, presence: true

  validates_associated :user

  enum :conditions, ['New', 'Like new', 'Very good', 'Good', 'Acceptable']
end
