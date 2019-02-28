class CommentariesController < ApplicationController
  def create
    commentable = set_object
    commentable.create_commentary(text: params[:text], user_id: current_user.id)
  end

  private

  def set_object
    return if params[:object_type].blank? || params[:object_id].blank?
    params[:object_type].constantize.find(params[:object_id])
  end
end

