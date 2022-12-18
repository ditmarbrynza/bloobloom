Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :frames, only: [] do
        get :index, on: :collection
        post :create
      end
      resource :lenses, only: [] do
        get :index, on: :collection
        post :create
      end
    end
  end
end
