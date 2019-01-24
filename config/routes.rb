Rails.application.routes.draw do

  post  'favorites/:shop_id/create' => 'favorites#create'
  delete 'favorites/:shop_id/destroy' => 'favorites#destroy'

  post 'login' => 'users#login'
  get 'login' => 'users#login_form'
  post 'logout' => 'users#logout'
  get 'logout' => 'users#logout'

  get 'users/index' => 'users#index'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'



  resources :shops do
  resources :reviews
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
