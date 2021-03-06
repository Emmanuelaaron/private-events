Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create' , as: :log_in
  delete 'sessions/destroy' , as: :log_out
  post 'events/invite' ,as: :invite
  resources :users, only: [:new,:show, :create]
  resources :events, except: [:edit, :update]
  root  to: "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
