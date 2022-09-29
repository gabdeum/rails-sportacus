class Article < ApplicationRecord
  TYPES = %w[Surfboard Bike].freeze
  CONDITIONS = ['New', 'Like new', 'Very good', 'Good', 'Acceptable'].freeze

  belongs_to :user
  has_many :article_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :pictures

  monetize :price_cents

  validates :title, :description, :address, :brand, presence: true
  validates :minimum_rent_days, numericality: { only_integer: true }, comparison: { greater_than: 0 }
  validates :price_cents, comparison: { greater_than_or_equal_to: 0 }
  validates :conditions, :type, presence: true

  validates_associated :user

  enum :conditions, CONDITIONS

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address_type_and_title,
                  against: {
                    address: 'A',
                    type: 'A',
                    title: 'B'
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
