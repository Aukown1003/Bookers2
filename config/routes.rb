Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  # name:bookers2_test
  # email:test@bookers2
  # pass:testpass1
end
