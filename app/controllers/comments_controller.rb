class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @new_comment = @article.comments.build(params[:comment])
    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to article_path(@article), notice: "Created new comment for '#{@article.title}'" }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html {
          @article.reload
          render "articles/show"
        }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
