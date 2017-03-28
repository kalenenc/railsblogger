class ArticlesController < ApplicationController
   include ArticlesHelper #checkout helpers/articles_helper

   def index
      @articles = Article.all
   end

   def show
      @article = Article.find(params[:id])
   end

   def new
      @article = Article.new
   end

   def create

      @article = Article.new(article_params)

      flash.notice = "Article #{@article.title} was created!"

      @article.save

      redirect_to article_path(@article)
   end

   def destroy
      @article = Article.find(params[:id])
      @article.destroy
      flash.notice = "Article #{@article.title} was deleted."
      redirect_to articles_path
   end

   def edit
      @article = Article.find(params[:id])
   end

   def update
      @article = Article.find(params[:id])
      @article.update(article_params)

      flash.notice = "Article #{@article.title} updated!"

      redirect_to article_path(@article)
   end

   # What we would have done if we didn't use ArticlesHelper:

   # def create
   #    @article = Article.new
      # @article.title = params[:article][:title]
      # @article.body = params[:article][:body]
   #    @article.save
   #    redirect_to article_path(@article)
   # end

   # def create
   #    @article = Article.new(params[:article]) #not safe. that's why .require and .permit exist
   #    @article.save
   #    redirect_to article_path(@article)
   #
   # end


end
