class SiteController < ApplicationController

  skip_before_action :verify_authenticity_token
  #before_action :set_site, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json


  def index
    puts 'RAN INDEX!!!'
    @sites = Site.all
    render :json => @sites.to_json; return
  end

  def list
    puts 'RAN LIST!!!'
  end

  def show
    @site = Site.find(params[:id])
    respond_with @site
  end


  def create

    puts 'CALLED create'
    puts params[:name]

    success = 'false'
    site = Site.new
    site.name = params[:name]
    site.url = params[:url]
    site.category = 'search'
    site.tags = ['test1', 'test2']
    site.description = params[:description]
    site.object_type = 'Normal'


    if site.save!
      puts 'SAVED IT'
      respond_with site
    else
      success = 'false'
    end

    #render :json => {:success => success}

  end


end
