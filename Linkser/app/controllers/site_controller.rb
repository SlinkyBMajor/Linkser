class SiteController < ApplicationController

  respond_to :json, :html

  def list
    @sites = Site.all
    respond_with @sites
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
