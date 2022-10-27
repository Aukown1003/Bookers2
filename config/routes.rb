Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  resources :books
  resources :users
  # name:bookers2_test
  # email:test@bookers2
  # pass:
end
