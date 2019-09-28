class CommentsController < ApplicationController
    before_action :authenticate_user!


    def create
        @dog = Dog.find(params[:dog_id])
        @dog.comments.create(comment_params.merge(user: current_user))
        redirect_to dog_path(@dog)
    end

private

    def comment_params
      params.require(:comment).permit(:message, :rating)
    end

end
