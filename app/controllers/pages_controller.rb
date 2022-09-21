class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def home
    @articles = Article.all
    # The `geocoded` scope filters only flats with coordinates
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
