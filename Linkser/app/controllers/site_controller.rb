class SiteController < ApplicationController
  require 'uri'

  skip_before_action :verify_authenticity_token
  before_action only: [:show, :edit, :update, :destroy, :tag_search, :visit]
  respond_to :html, :json

  def grid
    #VIEW FOR SHOW
  end

  #_____CRUD_______


  def get
    @site = Site.find(params[:id])
    respond_with @site
  end

  def index

    puts 'RAN INDEX!!!'

    if params[:tag].present?
      @sites = Site.where("tags like ?", "%#{params[:tag]}%")
      puts @sites
    else
      @sites = Site.all
    end
    render :json => @sites.to_json; return
  end

  def show
    @site = Site.find(params[:id])
    render :json => @site;return
  end

  def create

    #CLEAN AND CHECK URL
    @url = params[:url].remove('http://').remove('www.')

    @name = @url.split('.')[0]

    #puts Addressable::URI.parse(@url).host

    site = Site.new
    site.name = @name
    site.url = @url
    site.category = params[:category]
    site.tags = params[:tags]
    site.description = params[:description]
    site.object_type = 'Normal'
    site.content_type = params[:content_type]
    site.times_visited = 0

    if site.save!
      puts 'SAVED IT'
      respond_with site
    else
      puts 'ERROR'
      render :json => "Could not save site.";return
    end
  end

  def destroy
    puts 'RAN destroy!!!'
    @site = Site.find(params[:id])
    @site.destroy
    render :json => "OK.";return
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      head :no_content
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  def visit
    puts 'RAN VISIT'
    @site = Site.find(params[:id])
    @site.times_visited = @site.times_visited.to_i + 1
    @site.save!

    render :json => @site.to_json; return
  end

  def tag_search

    puts 'TAG SEARCH'

    @sites = Site.includes(:site).where('site.tags = ?', params[:tag]).references(:site)
    puts @sites
    render :json => @sites.to_json; return

  end



end
