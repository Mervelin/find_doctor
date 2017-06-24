Rails.application.routes.draw do

  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions"}
  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions"}


  root to: 'welcome#index'

  get 'welcome/index'

  get 'welcome/doctors', to: 'welcome#doctors', as: 'welcome_doctors'
  get 'welcome/doctor/:id', to: 'welcome#doctor', as: 'welcome_doctor'

  resources :patients, except: %i[destroy index]
  # do
  #   member do
  #     get :dashboard
  #   end
  # end
  get 'dashboard/patients', to: 'patients#dashboard', as: 'dashboard_patients'

  resources :doctors, except: :destroy
  get 'dashboard/doctors', to: 'doctors#dashboard', as: 'dashboard_doctors'

  resources :visits, except: :show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
