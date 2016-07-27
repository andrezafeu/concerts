Rails.application.routes.draw do
  get '/', to: 'site#home', as: :home
  resources :concerts, only: [:show, :new, :create]
end