Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'atms#index'

  resources :atms do
    collection do
      get :find_nearest
      post :search
    end
  end

end
