Rails.application.routes.draw do
<<<<<<< HEAD
=======
  get 'registro_medicos/RegistroMedicos'
  post 'registro_medicos/RegistroMedicos'
  get 'registro_medicos/new'
  get 'registro_medicos/create'
  devise_for :users
>>>>>>> 0597aca5308e2b135a362678845df0744beb2a45
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
