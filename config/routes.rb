Rails.application.routes.draw do
  resources :rooms, only: %i[show index] do
    member do
      post :reset
      post :reveal
    end

    resources :members, only: %i[new create] 
  end

  resources :estimations, only: %i[create]
  root 'rooms#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  delete 'logout' => 'sessions#logout', as: :logout
end
