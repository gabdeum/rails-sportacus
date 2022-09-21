class Article < ApplicationRecord
  TYPES = %w[Surfboard Bike].freeze
  CONDITIONS = ['New', 'Like new', 'Very good', 'Good', 'Acceptable'].freeze

  belongs_to :user
  has_many :article_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :pictures

  validates :title, :description, :address, :brand, presence: true
  validates :daily_rate, :minimum_rent_days, numericality: { only_integer: true }, comparison: { greater_than: 0 }
  validates :conditions, :type, presence: true

  validates_associated :user

  enum :conditions, CONDITIONS

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
