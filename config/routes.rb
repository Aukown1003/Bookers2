Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  # name:bookers2_test
  # email:test@bookers2
  # pass:testpass1
end
