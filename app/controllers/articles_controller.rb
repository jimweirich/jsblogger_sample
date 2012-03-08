class ArticlesController < ApplicationController

  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
#    @comment = @article.comments.new
    @new_comment = Comment.new(article: @article)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  def create
    @article = Article.new(params[:article])
    respond_do do |format|
      if @article.save
        format.html { redirect_to article_path(@article), notice: "Created new article '#{@article.title}'" }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to article_path(@article), notice: "Updated article '#{@article.title}'" }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: "Deleted article '#{@article.title}'" }
      format.json { head :no_content }
    end
  end

end
