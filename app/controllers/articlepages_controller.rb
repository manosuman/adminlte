class ArticlepagesController < ApplicationController
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
      @article = Article.create(article_params)
   end
  
   def edit
    @article = Article.find(params[:id])
   end
  
   def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
   end
  
   def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end
  
  
   private
   def article_params
     params.permit(:title,:body)
   end
   def editarticle_params
      params.require(:article).permit(:title,:body)
   end
  
end
