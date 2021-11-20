Rails.application.routes.draw do
  # resources :contacts, only: [:show]
  resources :contact_files, except: [:update, :destroy, :edit]
  devise_for :users
  root 'contacts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
