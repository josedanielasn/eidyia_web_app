Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/batch'          => 'batch#index',  as: 'batch_index'
  get '/batch/new'      => 'batch#new',    as: 'new_batch'
  post '/batch'         => 'batch#create', as: 'create_batch'
  get '/batch/:id'      => 'batch#show',   as: 'show_batch'
  get '/batch/:id/edit' => 'batch#edit',   as: 'edit_batch'
  put '/batch/:id'      => 'batch#update', as: 'update_batch'


end
