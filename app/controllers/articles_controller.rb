class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_admin_user!, except: %i[ index show ]

  # GET /articles
  def index
    @articles = Article.page(params[:page])
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    ActiveRecord::Base.transaction do
      if @article.save
        redirect_to @article, notice: '記事が作成されました。'
      else
        render :new, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    ActiveRecord::Base.transaction do
      if @article.update(article_params)
        redirect_to @article, notice: '記事が更新されました。'
      else
        render :edit, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: '記事が削除されました。'
  end

  private

  # コールバックで共有メソッドを使用
  def set_article
    @article = Article.find(params[:id])
  end

  # 許可されたパラメータのみを通過させる
  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end