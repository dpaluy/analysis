Analysis::Application.routes.draw do
 
  resources :quotes, :shallow => true do
    resources :values
  end
  
  root :to => "home#index"
end
