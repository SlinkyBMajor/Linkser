class SiteController < ApplicationController

  before_action :set_site, only: [:show, :edit, :update, :destroy]
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


  def add

    success = 'false'
    site = Site.new
    site.name = 'Google'
    site.url = 'www.google.se'
    site.category = 'search'
    site.tags = ['search', 'test']

    if site.save!
      success = 'true'
    else
      success = 'false'
    end

    render :json => {:success => success}

  end


end
