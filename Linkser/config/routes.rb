Rails.application.routes.draw do

  root 'site#index'

  scope "api" do
    resources :site do
      member do
        post :tag_search
      end
    end
  end

  get 'site/list' => 'site#list'

  #SITES
=begin
  post 'site/add' => 'site#add'
=end


end
