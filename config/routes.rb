
Rails.application.routes.draw do

root "books#index"
  namespace :api do 
    namespace :v1 do  
        root "books#index"
        resources :books
    end
  end
end