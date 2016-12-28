Rails.application.routes.draw do
  resources :rooms

  root 'pages#home'

  devise_for  :users,
              :path => '',
              path_names: {sign_up: 'Login', :sign_out => 'Logout', :edit => 'Profile'},
              :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
              registrations: 'registrations'}

  resources :users, only: [:show]
  resources :photos

  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'
end
