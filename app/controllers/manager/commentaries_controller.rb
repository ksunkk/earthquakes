class Manager::CommentariesController < ApplicationController
  def new
  end

  def index
    @records = Commentary.where(is_accepted: false).all
    smart_listing_create :records,
                       @records,
                       partial: 'manager/commentaries/list'
  end

  def update
    record = Commentary.find(params[:id])
    if params[:action].to_sym == :accept
      record.accept!
    else
      record.delete!
    end
  end
end

