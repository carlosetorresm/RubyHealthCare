Rails.application.routes.draw do
  
  resources :covid_conditions
  resources :prescriptions do
  post 'reenviar' => "prescriptions#reenviar", as: :reenviar
  end

  resources :consults do
      resources :answers, only: [:create, :destroy, :update]
      put 'mandar'
  end

  resources :bills
  
  resources :states, only: :index
  resources :cities, only: :index
  resources :profile, only: :show
  resources :services, only: [:index, :new, :create, :destroy]
  resources :dservices, only: [:index, :new, :create, :destroy]

  devise_for :patients, path: 'patients', controllers: {
    sessions: "patients/sessions",
    passwords: "patients/passwords",
    registrations: "patients/registrations" }

  devise_for :doctors, path: 'doctors', controllers: {
    sessions: "doctors/sessions",
    passwords: "doctors/passwords",
    registrations: "doctors/registrations" }

  root 'welcome#index'

  get 'welcome/closed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
