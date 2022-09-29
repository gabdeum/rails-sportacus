class BookingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @booking = Booking.new(params[:booking].permit(:start_date, :end_date))
    @booking.user = current_user if user_signed_in?
    @booking.article = @article
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      @marker = {
        lat: @article.latitude,
        lng: @article.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {article: @article}),
        image_url: helpers.asset_url("marker-logo-#{@article.type.downcase}")
      } if @article.geocoded?
      render 'articles/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
