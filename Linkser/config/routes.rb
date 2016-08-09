Rails.application.routes.draw do

  root 'site#list'

  #SITES
  get 'site/list' => 'site#list'
  post 'site/add' => 'site#add'


end
