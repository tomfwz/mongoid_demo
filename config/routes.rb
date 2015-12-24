Rails.application.routes.draw do
  resources :articles
  resources 'people'
  root 'people#index'
end
