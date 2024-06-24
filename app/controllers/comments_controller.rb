class CommentsController < ApplicationController
  before_action :authenticate_user!,only: [:destroy]
  before_action :set_article
  before_action :require_same_user,only:[:destroy]

  def edit
    @comment = @article.comments.find(params[:id])
    render 'articles/show'
  end

  def create
    @comment = @article.comments.build(comment_params) 
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      redirect_to @article, alert: 'Error creating comment.'
    end
  end

  def update
    @comment = @article.comments.find(params[:id])

    @comment.update(comment_params)
    debugger
      redirect_to @article, notice: 'Comment was successfully updated.'
    
  end

  def destroy 
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: 'Comment was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin? && current_user != @comment.user
        flash[:alert]="You cannot delete this comment"
        redirect_to @article
    end
  end
end
