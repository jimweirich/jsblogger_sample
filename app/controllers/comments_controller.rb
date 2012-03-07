class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
#    @new_comment = Comment.create(params[:comment].merge(article: @article))
    @new_comment = @article.comments.build(params[:comment])
    if @new_comment.save
      flash[:notice] = "Created new comment for '#{@article.title}'"
      redirect_to article_path(@article)
    else
      @article.reload
      render "articles/show"
    end
  end

end
