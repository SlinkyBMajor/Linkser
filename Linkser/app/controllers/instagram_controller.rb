class InstagramController < ApplicationController

  def index
    @instagrams = Instagram.all
    respond_to do |format|
      format.html
      format.json { render :json => @instagrams.to_json }
    end
  end

  def create
puts 'RAN INSTA CREATE'

    @insta = Instagram.new
    @insta.url = 'https://www.instagram.com/galina_dub/?hl=sv'.remove('http://').remove('www.')

    if @insta.url.blank?
      render :json => {:error => 'Missing URL'}.to_json; return
    end
    @insta.name = @insta.url.remove('instagram.com/').slice(0..(str.index('/')))

    if @insta.save!
      return :json => @insta.to_json; return
    end
  end

  def list
    #Nothing here but chickens
  end

end
