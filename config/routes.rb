Rails.application.routes.draw do
  get 'sessions/new', as: :log_in
  get 'sessions/create' 
  get 'sessions/destroy' , as: :log_out
  resources :users, only: [:new,:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
