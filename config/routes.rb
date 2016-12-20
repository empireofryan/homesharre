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
end
