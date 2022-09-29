class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }

  validates_associated :user, :article

  validate :date_available
  validate :min_rent_days

  private

  def date_available
    if Booking.where("((start_date <= :start_date and :start_date <= end_date) or (start_date <= :end_date and :end_date <= end_date) or (:start_date <= start_date and end_date <= :end_date)) and :article_id = article_id", start_date: start_date, end_date: end_date, article_id: article_id).exists?
      errors.add(:article_id, "already booked on those dates")
    end
  end

  def min_rent_days
    if (end_date - start_date + 1).to_i < article.minimum_rent_days
      errors.add(:article_id, "should be rented for minimum #{article.minimum_rent_days} day(s)")
    end
  end
end
