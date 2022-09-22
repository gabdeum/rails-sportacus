class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def home
    if params[:query].present?
      @articles = Article.search_by_address_type_and_title(params[:query])
    else
      @articles = Article.all
    end
    # The `geocoded` scope filters only flats with coordinates
    @location = request.location
    @markers = @articles.geocoded.map do |article|
      {
        lat: article.latitude,
        lng: article.longitude,
        info_window: render_to_string(partial: "info_window", locals: {article: article}),
        image_url: helpers.asset_url("marker-logo-#{article.type.downcase}")
      }
    end
  end

  def account; end
end
