Rails.application.routes.draw do

  root 'site#index'

  scope "api" do
    resources :site
  end

  get 'site/list' => 'site#list'

  #SITES
=begin
  post 'site/add' => 'site#add'
=end


end
