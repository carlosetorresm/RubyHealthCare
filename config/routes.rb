Rails.application.routes.draw do
  get 'registro_medicos/RegistroMedicos'
  post 'registro_medicos/RegistroMedicos'
  get 'registro_medicos/new'
  get 'registro_medicos/create'
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
