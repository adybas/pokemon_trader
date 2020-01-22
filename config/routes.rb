Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/about' => 'welcome#about'
  get '/trainers/home' => 'trainers#home'

  post '/trainers/pack_contents' => 'trainers#pack_contents'
  get '/trainers/pack_open' => 'trainers#pack_open'


  resources :trainers, only: [:new, :create]
  resources :cards, only: [:index, :show]
end
