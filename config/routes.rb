
Rails.application.routes.draw do


  namespace :api do 
    namespace :v1 do  
        root "books#ping"
        resources :books, only: [:index, :create, :update, :delete, :show, :ping]
    end
  end
end