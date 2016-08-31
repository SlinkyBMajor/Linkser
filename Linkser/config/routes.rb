Rails.application.routes.draw do

  scope "api" do
    resources :site do
      collection do
        get 'search'
        get 'visit/:id', to: 'site#visit'
      end
    end

    resources :instagram do
      member do
      end
    end
  end

<<<<<<< Updated upstream
  get 'site/list' => 'site#list'

  get 'instagram/list' => 'instagram#list'

  #SITES
=begin
  post 'site/add' => 'site#add'
=end
=======
  get 'sites' => 'site#grid'
>>>>>>> Stashed changes


end
