class BookingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @booking = @article.bookings.new(params[:booking].permit(:start_date, :end_date))
    @booking.user = current_user if user_signed_in?
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to article_path(@article), status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
