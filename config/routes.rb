Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dogs#index'
  resources :dogs do
    resources :comments, only: :create
  end

end
