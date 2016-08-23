Rails.application.routes.draw do

  root 'site#index'

  scope "api" do
    resources :site do
      member do
        post :tag_search
      end
    end

    resources :instagram do
      member do
      end
    end
  end

  get 'site/list' => 'site#list'

  get 'instagram/list' => 'instagram#list'

  #SITES
=begin
  post 'site/add' => 'site#add'
=end


end
