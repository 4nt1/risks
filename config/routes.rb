Rails.application.routes.draw do

  root to: 'search#index'

  resources :ranks
  resources :types, only: [:index, :create, :update, :edit, :destroy]
  resources :risks, only: [:index, :create, :update, :edit, :destroy]

  resources :search, only: :index do
    collection do
      get :autocomplete_type_code
      get :autocomplete_type_description
      get :autocomplete_risk_code
      get :autocomplete_risk_description
    end

  end

end
