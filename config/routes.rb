Rails.application.routes.draw do
  
  get 'calls' => "calls#root", as: :calls
  resources :calls, only: :create
  mount ActionCable.server, at: '/cable'

  resources :covid_conditions
  resources :prescriptions do
  post 'reenviar' => "prescriptions#reenviar", as: :reenviar
  end

  resources :consults do
      resources :answers, only: [:create, :destroy, :update]
      put 'mandar'
  end

  resources :bills do
  post 'reenviar' => "bills#reenviar", as: :reenviar
  end
  
  resources :states, only: :index
  resources :cities, only: :index
  resources :profile, only: :show
  resources :services, only: [:index, :new, :create, :destroy]
  resources :dservices, only: [:index, :new, :create, :destroy]

  devise_for :patients, path: 'patients', controllers: {
    sessions: "patients/sessions",
    passwords: "patients/passwords",
    registrations: "patients/registrations",
    confirmations: "patients/confirmations" }

  devise_for :doctors, path: 'doctors', controllers: {
    sessions: "doctors/sessions",
    passwords: "doctors/passwords",
    registrations: "doctors/registrations",
    confirmations: "doctors/confirmations" }

    resources :stores do
      post 'show' => "stores#show", as: :show
    end

  root 'welcome#index'

  get 'welcome/closed'
  get 'welcome/search'
  post 'cart' => "stores#cart"
  get 'cart' => "stores#cart"
  post 'shipping' => "stores#shipping"
  get 'shipping' => "stores#shipping"
  post 'saveship' => "stores#saveship"
  post 'payment' => "stores#payment"
  get 'payment' => "stores#payment"
  post 'savepay' => "stores#savepay"
  post 'sell' => "stores#sell"
  get 'sell' => "stores#sell"
  post 'savesell' => "stores#savesell"
  delete 'cart' => "stores#quitaritem", as: :delete

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
