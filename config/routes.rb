Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  resources :books, only:[:index, :show, :create, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  # name:bookers2_test
  # email:test@bookers2
  # pass:
end
