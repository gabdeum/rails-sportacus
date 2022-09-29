class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }

  validates_associated :user, :article

  validate :date_available

  private

  def date_available
    if Booking.where("((start_date <= :start_date and :start_date <= end_date) or (start_date <= :end_date and :end_date <= end_date) or (:start_date <= start_date and end_date <= :end_date)) and :article_id = article_id", start_date: start_date, end_date: end_date, article_id: article_id).exists?
      errors.add(:article_id, "already booked on those dates")
    end
  end
end
