class CommentsController < ApplicationController

  def index
    comments = Comment.find_by(author_id: params[:user_id], artwork_id: params[:artwork_id])
    
    if comments.nil?
      comments = Comment.find_by(author_id: params[:user_id])
      if comments.nil? 
        comments = Comment.find_by(artwork_id: params[:artwork_id])
        if comments.nil?
          comments = Comment.all
        end
      end
    end 
    render json: comments
  end

  def create 
    comment = Comment.new(comment_params)
    if comment.save
      render json: user
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy 
  end

  private 
  def comment_params 
    params.require(:comment).permit(:author_id, :artwork_id, :body)
  end
end
