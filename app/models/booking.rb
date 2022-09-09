class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :start_date, presence: true, comparison: { greater_than: Date.today }
  validates :end_date, presence: true, comparison: { greater_than_or_equal_to: :start_date }

  validates_associated :user, :article
end
