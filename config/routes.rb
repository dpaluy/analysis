Analysis::Application.routes.draw do

  resources :analyzers, :shallow => true do
    resources :actions
    resources :accounts, :only => [:index]
  end
  
  resources :ctws, :shallow => true do
    resources :ctw_collectors
  end

  resources :quotes, :shallow => true do
    resources :values
  end
  
  root :to => "ctws#index"
end
