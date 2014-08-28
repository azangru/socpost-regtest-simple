TestRegistrationSimple::Application.routes.draw do
  root :to => 'users#new'
  resources :users,  only: [:index, :create]
end
