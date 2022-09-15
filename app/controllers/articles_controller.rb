class ArticlesController < ApplicationController
  before_action :article_params, only: %i[show edit update destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    @article = Article.find(params[:id])
  end
end
