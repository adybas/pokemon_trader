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

  #main page to see all trades
  get '/trades' => 'trades#index'

  #accept trade path
  # get '/trades/accept_trade' => 'trades#accept_trade'
  post 'trades/accepted_trade' => 'trades#updated_trade'

  #decline trade path
  post 'trades/cancelled_trade' => 'trades#cancelled_trade'
 
  resources :trainers, only: [:new, :create, :show, :index]
  resources :cards, only: [:index, :show]
  resources :trades, only: [:edit, :update]

  resources :card_binders do
    resources :trades
  end
  
end
