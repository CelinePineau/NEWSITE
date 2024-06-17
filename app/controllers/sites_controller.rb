class SitesController < ApplicationController
  def index
    @sites = Site.all
  end
  def show
    @site = Site.find(params[:id])
  end
  def new
    @site = Site.new # Needed to instantiate the form_with
  end
  def create
    @site = Site.new(site_params)
    @site.save
    redirect_to site_path(@site)
  end
  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path, status: :see_other
  end
  private
  def site_params
    params.require(:site).permit(:name, :descrition)
  end
end
