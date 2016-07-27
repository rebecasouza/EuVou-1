class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create, :update, :destroy,]
  before_action :doorkeeper_authorize! 

  # POST /comments
  def create
    @event = Event.find(params[:event_id])
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Event.find_by_id(params[:event_id]) if params[:event_id]
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
    end
end
