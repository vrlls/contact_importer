Rails.application.routes.draw do
  resources :contact_logs, only: [:index]
  # resources :contacts, only: [:show]
  resources :contact_files, except: [:update, :destroy, :edit]
  devise_for :users
  root 'contacts#index'

  if defined?(Sidekiq) && defined?(Sidekiq::Web)
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
