Rails.application.routes.draw do
  devise_for :users

  resources :ebooks do
    collection do
      post 'import'
      get 'choose'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ebooks#index'
end
