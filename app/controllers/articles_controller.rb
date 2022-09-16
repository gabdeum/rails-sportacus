class ArticlesController < ApplicationController
  before_action :article_params_id, only: %i[show edit update destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new(article_params_all)
    authorize @article
  end

  def new_characteristic
    @article = Article.new(article_params_all)
    @article.user = current_user
    @article.address = current_user.address if params['use_personnal_address']
    @characteristic = Object.const_get("#{@article.type}Characteristic").new if @article.type != ""
    authorize @article
    unless @article.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def create
    raise
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
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
    authorize Article.find(@article.id)
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params_id
    @article = Article.find(params[:id])
  end

  def article_params_all
    if params[:article]
      params[:article]&.permit!
    else
      params[params["type"]]&.permit!
    end
  end
end
