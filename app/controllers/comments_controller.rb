class CommentsController < ApplicationController
   before_filter :require_login, except: [:create]
   def create
      @comment = Comment.new(comment_params)
      @comment.article_id = params[:article_id]
      @comment.save
      redirect_to article_path(@comment.article)
      #Recall that article_path needs to know which article we want to see.
      # + We might not have an @article object in this controller action, but we can find
      # + the Article associated with this Comment by calling @comment.article
   end

   def comment_params
      params.require(:comment).permit(:author_name, :body)
   end
end
