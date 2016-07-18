Rails.application.routes.draw do
  root 'pages#home'

  devise_for  :users,
              :path => '',
              path_names: {:sign_up => 'Login', :sign_out => 'Logout', :edit => 'Profile'},
              :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  resources :users, only: [:show]

end
