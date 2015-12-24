class ArticlesController < ApplicationController
  before_action :set_person, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = @person.articles.new
  end

  def edit
  end

  def create
    @article = @person.articles.new(article_params)
    if @article.save
      redirect_to person_article_path(@person, @article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to person_article(@person, @article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to person_articles_path(@person), notice: 'Article was successfully destroyed.'
  end

  private
    def set_person
      @person = Person.find(params[:person_id])
    end

    def set_article
      @article = @person.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :content)
    end
end
