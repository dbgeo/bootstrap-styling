Rails.application.routes.draw do
  get 'welcome/index'
  resources :authors
  resources :bugs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
