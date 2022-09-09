class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def home
    # authorize @articles
    @articles = Article.all
  end

  def account
  end
end
