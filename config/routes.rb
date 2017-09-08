
Rails.application.routes.draw do


  namespace :api do 
    namespace :v1 do  
        root "books#index"
        resources :books
    end
  end
end