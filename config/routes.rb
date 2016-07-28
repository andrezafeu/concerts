Rails.application.routes.draw do
  get '/', to: 'site#home', as: :home
  resources :concerts, only: [:show, :new, :create] do
  	resources :comments, except: [:show]
  end

  post '/search', to: 'site#search'
  post 'concerts/popular', to: 'concerts#popular'

end