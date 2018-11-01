class ArticlesController < ApplicationController
  def new
  end

  def create
  end

  private

  def article_params
    params.require(:booking).permit(:author, :source_link, :file_link)
  end
end
