class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit edit_characteristic update destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
    @disabled_dates = @article.bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }
    if @article.geocoded?
      @marker = {
          lat: @article.latitude,
          lng: @article.longitude,
          info_window: render_to_string(partial: "shared/info_window", locals: {article: @article}),
          image_url: helpers.asset_url("marker-logo-#{@article.type.downcase}")
        }
    end
    @booking = Booking.new(article_id: @article.id)
  end

  def new
    @article = Article.new(params_article_all)
    authorize @article
    # raise
  end

  def new_characteristic
    @article = Article.new(params_article_all)
    @article.user = current_user
    @article.address = current_user.address if params['use_personnal_address']
    @characteristic = Object.const_get("#{@article.type}Characteristic").new if @article.type != ""
    authorize @article
    # raise
    unless @article.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @article = Article.new(params_article_all)
    @article.user = current_user
    authorize @article
    if @article.save
      @article.create_characteristic(params["#{@article.type.downcase}_characteristic"]&.permit!)
      redirect_to article_path(@article)
    else
      @characteristic = Object.const_get("#{@article.type}Characteristic").new(params["#{@article.type.downcase}_characteristic"]&.permit!) if @article.type != ""
      render :new_characteristic, status: :unprocessable_entity
    end
  end

  def edit
    authorize @article
  end

  def edit_characteristic
    @article.address = current_user.address if params['use_personnal_address']
    @characteristic = @article.characteristic
    authorize @article
    unless @article.update(params_article_all)
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    authorize @article
    @article.update(params_article_all) if params_article_all[:pictures] != [""]
    if @article.characteristic.update(params["#{@article.type.downcase}_characteristic"]&.permit!)
      redirect_to article_path(@article)
    else
      render :edit_characteristic, status: :unprocessable_entity
    end
  end

  def destroy
    authorize Article.find(@article.id)
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def params_article_all
    if params[:article]
      params[:article]&.permit!
    else
      params[params["type"]&.downcase]&.permit!
    end
  end
end
