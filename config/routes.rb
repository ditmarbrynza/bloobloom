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
      resource :glasses, only: [] do
        post :create
      end
      resource :shopping_basket, only: [] do
        get :index, to: 'shopping_basket#index'
      end
    end
  end
end
