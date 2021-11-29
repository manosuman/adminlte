class ArticlesController < JwtController
  def index
   @articles = Article.all
   token = encode_token({user_id: @user.id})
   render json: {article: @articles , token: token}
  end

 def show
   @article = Article.find(params[:id])
   token = encode_token({user_id: @user.id})
   render json: {article: @article , token: token}
  end

 def new
  @article = Article.new
 end

 def create
    @article = Article.create(article_params)
    token = encode_token({user_id: @user.id})
    render json: {article: @article, token: token}
 end

 def edit
  @article = Article.find(params[:id])
  token = encode_token({user_id: @user.id})
 end

 def update
  @article = Article.find(params[:id])
  token = encode_token({user_id: @user.id})
  if @article.update(article_params)
    render json: {article: @article, token: token}
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
end
