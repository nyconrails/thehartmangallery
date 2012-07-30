Hartmangallery::Application.routes.draw do

  resources :items, :only => ['index','show']
  resources :orders, :only => ['new','show','create']
  resources :inquiries, :only => ['new','show','create']

  match '/create_order/:item_id' => 'orders#new'
  match '/create_inquiry/:item_id' => 'inquiries#new'
  match '/collection/:id' => 'items#index', as: :collectn #purposely misspelled, collection is a protected word
  match '/about-us' => 'public#about_us', as: :about_us
  match '/search' => 'items#search', as: :search_path

  root :to => 'items#index'

  namespace :admin do
    root :to => 'items#index'
    resources :items do
      resources :images
    end
    resources :inquiries
    resources :collections
    resources :orders
  end

end
