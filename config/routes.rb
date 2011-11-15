Analysis::Application.routes.draw do
  resources :analyzers, :shallow => true do
    resources :actions
  end
  
  resources :ctw_collectors

  resources :ctws

  resources :quotes, :shallow => true do
    resources :values
  end
  
  root :to => "home#index"
end
