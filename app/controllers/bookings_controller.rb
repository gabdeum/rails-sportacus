class BookingsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :show]

  def create
    @article = Article.find(params[:article_id])
    @booking = Booking.new(params[:booking].permit(:start_date, :end_date))
    @booking.assign_attributes(user: current_user, article: @article, state: 'pending', amount: @booking.days * @article.price.amount)
    authorize @booking
    if @booking.save
      price = Stripe::Price.create({
        unit_amount: @article.price_cents,
        currency: 'eur',
        product_data: {name: @article.id.to_s}
      })
      puts "*"*80
       puts @booking.valid?
      puts "*"*80
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price: price.id,
          quantity: @booking.days
        }],
        mode: 'payment',
        success_url: booking_url(@booking),
        cancel_url: booking_url(@booking)
      )

      @booking.update(checkout_session_id: session.id)
      redirect_to new_booking_payment_path(@booking)
    else
      @marker = {
        lat: @article.latitude,
        lng: @article.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {article: @article}),
        image_url: helpers.asset_url("marker-logo-#{@article.type.downcase}")
      } if @article.geocoded?
      @disabled_dates = @article.bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }
      render 'articles/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
