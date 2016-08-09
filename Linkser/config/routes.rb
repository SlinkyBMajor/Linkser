Rails.application.routes.draw do

  root 'site#index'

  scope "api" do
    resources :site
  end

  #SITES
  get 'site/list' => 'site#list'
  post 'site/add' => 'site#add'


end
