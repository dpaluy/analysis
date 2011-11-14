Analysis::Application.routes.draw do
  resources :actions

  resources :ctw_collectors

  resources :ctws

  resources :quotes, :shallow => true do
    resources :values
  end
  
  root :to => "home#index"
end
