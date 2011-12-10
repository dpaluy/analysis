Analysis::Application.routes.draw do

  resources :accounts

  resources :analyzers, :shallow => true do
    resources :actions
  end
  
  resources :ctws, :shallow => true do
    resources :ctw_collectors
  end

  resources :quotes, :shallow => true do
    resources :values
  end
  
  root :to => "ctws#index"
end
