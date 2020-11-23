Rails.application.routes.draw do
  root 'doctors#index'

  devise_for :patients
  
  resources :patients
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]  
end

end
