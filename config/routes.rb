Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  resources :books, only:[:index, :show, :create, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  
  #id 1
  # name:bookers2_test
  # email:test@bookers2
  # pass:testpass1
  
  # id2
  # # name test1
  # email 1@1
  # pass test22
end
