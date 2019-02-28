class Manager::CatalogsController < ::ApplicationController
  def index
    @catalogs = Catalog.where(is_confirmed: false)
    smart_listing_create :catalogs,
                       @catalogs,
                       partial: 'manager/catalogs/list'
  end

  def new
  end

  def create
    @catalog = Catalog.create(catalog_params)
    redirect_to :index
  end

  private

  def catalog_params
    params.require(:catalog).permit(:name, :code, :description)
  end
end
