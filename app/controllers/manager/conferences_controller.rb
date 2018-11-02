class Manager::ConferencesController < ::ApplicationController
  def index
    @conferences = Conference.where(is_confirmed: false)
    smart_listing_create :conferences,
                       @conferences,
                       partial: 'manager/conferences/list'
  end

  def show
    @record = Conference.find(params[:id])
  end

  def confirm
    Conference.find(params[:id]).confirm!
  end
end
