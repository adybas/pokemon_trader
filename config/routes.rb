Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #homepage and basic links 
  root 'welcome#home'
  get '/about' => 'welcome#about'
  get '/trainers/home' => 'trainers#home'

  #login links 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  #open packs links
  post '/trainers/pack_contents' => 'trainers#pack_contents'
  get '/trainers/pack_open' => 'trainers#pack_open'

  #mark cards for trade form 
  get '/trainers/mark_trades' => 'trainers#mark_trades'
  patch '/trainers/mark_trades_for_trainer' => 'trainers#mark_trades_for_trainer'
  
 
  resources :trainers, only: [:new, :create, :show]
  resources :cards, only: [:index, :show]
  resources :card_binders, only: [:update, :edit, :show]

  resources :card_binders do
    resources :trades
  end
  
end
